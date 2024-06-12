public class QuoteTriggerHandler {
    public static void updateProductLotQuantity(List<SBQQ__Quote__c> newQuotes, Map<Id, SBQQ__Quote__c> oldQuoteMap) {
        Map<Id, Decimal> productLotUpdates = new Map<Id, Decimal>();
        Set<Id> quoteIds = new Set<Id>();

        for(SBQQ__Quote__c newQuote : newQuotes) {
            SBQQ__Quote__c oldQuote = oldQuoteMap.get(newQuote.Id);
            if(newQuote.SBQQ__Primary__c && (oldQuote == null || !oldQuote.SBQQ__Primary__c)) {
                quoteIds.add(newQuote.Id);
            }
        }

        List<SBQQ__QuoteLine__c> qlilist = [SELECT Id, SBQQ__Quantity__c, SBQQ__Quote__c, SBQQ__Product__c 
                                            FROM SBQQ__QuoteLine__c 
                                            WHERE SBQQ__Quote__c IN :quoteIds];

        for (SBQQ__QuoteLine__c qli : qlilist) {
            if (!productLotUpdates.containsKey(qli.SBQQ__Product__c)) {
                productLotUpdates.put(qli.SBQQ__Product__c, 0);
            }
            productLotUpdates.put(qli.SBQQ__Product__c, productLotUpdates.get(qli.SBQQ__Product__c) + qli.SBQQ__Quantity__c);
        }

        List<Product_Lot__c> productLotsToUpdate = new List<Product_Lot__c>();
        Map<Id, Decimal> productLotAvailableQuantities = new Map<Id, Decimal>();
        Boolean hasInsufficientQuantity = false;
        String errorMessage = '';
        String allProducts = '';
	
        for (Id productId : productLotUpdates.keySet()) {
            List<Product_Lot__c> productLots = [SELECT Id, Quantity_Available__c, Product__r.Name 
                                                FROM Product_Lot__c 
                                                WHERE Product__c = :productId];

            
            for (Product_Lot__c productLot : productLots) {
                Decimal newAvailableQuantity = productLot.Quantity_Available__c - productLotUpdates.get(productId);
                system.debug('newAvailableQuantity  '+newAvailableQuantity);
                system.debug('productLot.Quantity_Available__c  '+productLot.Quantity_Available__c);
                system.debug('productLotUpdates.get(productId)  '+newAvailableQuantity);
                if (newAvailableQuantity < 0) {
                    hasInsufficientQuantity = true;
                    if (allProducts != ''){
                        allProducts += ', ';
                    }
                    allProducts += productLot.Product__r.Name;
                    //errorMessage = 'Insufficient quantity available in Inventory: ' + productLot.Product__r.Name;
                } else {
                    productLotAvailableQuantities.put(productLot.Id, newAvailableQuantity);
                }
            }
        }
        

        if (hasInsufficientQuantity) {
            for (SBQQ__Quote__c newQuote : newQuotes) {
                newQuote.addError('Insufficient quantity available in Inventory: '+ allProducts);
            }
        } else {
            for (Id productLotId : productLotAvailableQuantities.keySet()) {
                Product_Lot__c productLotToUpdate = new Product_Lot__c(Id = productLotId, 
                                                                       Quantity_Available__c = productLotAvailableQuantities.get(productLotId));
                productLotsToUpdate.add(productLotToUpdate);
            }
            if (!productLotsToUpdate.isEmpty()) {
                try {
                    update productLotsToUpdate;
                } catch (DmlException e) {
                    System.debug('Error updating product lots: ' + e.getMessage());
                }
            }
        }
    }
}