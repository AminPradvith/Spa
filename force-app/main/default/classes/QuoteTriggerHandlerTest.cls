@isTest
public class QuoteTriggerHandlerTest {
    @testSetup
    static void setupTestData() {

        Product2 product1 = new Product2(Name = 'Test Product 1', IsActive = true);
        Product2 product2 = new Product2(Name = 'Test Product 2', IsActive = true);
        insert new List<Product2>{product1, product2};
        
     
        Product_Lot__c productLot1 = new Product_Lot__c(Product__c = product1.Id, Quantity_Available__c = 100);
        Product_Lot__c productLot2 = new Product_Lot__c(Product__c = product2.Id, Quantity_Available__c = 50);
        insert new List<Product_Lot__c>{productLot1, productLot2};

    
        SBQQ__Quote__c quote = new SBQQ__Quote__c(SBQQ__Primary__c = false);
        insert quote;

      
        SBQQ__QuoteLine__c quoteLine1 = new SBQQ__QuoteLine__c(SBQQ__Quote__c = quote.Id, SBQQ__Product__c = product1.Id, SBQQ__Quantity__c = 20);
        SBQQ__QuoteLine__c quoteLine2 = new SBQQ__QuoteLine__c(SBQQ__Quote__c = quote.Id, SBQQ__Product__c = product2.Id, SBQQ__Quantity__c = 30);
        insert new List<SBQQ__QuoteLine__c>{quoteLine1, quoteLine2};
    }

    @isTest
    static void testUpdateProductLotQuantity_SufficientQuantity() {
   
        SBQQ__Quote__c quote = [SELECT Id FROM SBQQ__Quote__c LIMIT 1];
        
        
        quote.SBQQ__Primary__c = true;
        update quote;

       
        Product_Lot__c productLot1 = [SELECT Quantity_Available__c FROM Product_Lot__c WHERE Product__c = :[SELECT Id FROM Product2 WHERE Name = 'Test Product 1'].Id];
        Product_Lot__c productLot2 = [SELECT Quantity_Available__c FROM Product_Lot__c WHERE Product__c = :[SELECT Id FROM Product2 WHERE Name = 'Test Product 2'].Id];

        System.assertEquals(80, productLot1.Quantity_Available__c, 'Product Lot 1 quantity should be reduced by 20');
        System.assertEquals(20, productLot2.Quantity_Available__c, 'Product Lot 2 quantity should be reduced by 30');
    }

    @isTest
    static void testUpdateProductLotQuantity_InsufficientQuantity() {
       
        SBQQ__Quote__c quote = [SELECT Id FROM SBQQ__Quote__c LIMIT 1];

        
        SBQQ__QuoteLine__c quoteLine3 = new SBQQ__QuoteLine__c(SBQQ__Quote__c = quote.Id, SBQQ__Product__c = [SELECT Id FROM Product2 WHERE Name = 'Test Product 2'].Id, SBQQ__Quantity__c = 40);
        insert quoteLine3;

        
        quote.SBQQ__Primary__c = true;
        Test.startTest();
        try {
            update quote;
            System.assert(false, 'Expected an exception due to insufficient quantity');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Insufficient quantity available in Inventory'), 'Expected insufficient quantity error message');
        }
        Test.stopTest();
    }

    @isTest
    static void testUpdateProductLotQuantity_NoPrimaryChange() {
        
        SBQQ__Quote__c quote = [SELECT Id FROM SBQQ__Quote__c LIMIT 1];

        // Update the quote without changing the primary flag
      //  quote.Name = 'Test Quote Updated';
        update quote;

     
        Product_Lot__c productLot1 = [SELECT Quantity_Available__c FROM Product_Lot__c WHERE Product__c = :[SELECT Id FROM Product2 WHERE Name = 'Test Product 1'].Id];
        Product_Lot__c productLot2 = [SELECT Quantity_Available__c FROM Product_Lot__c WHERE Product__c = :[SELECT Id FROM Product2 WHERE Name = 'Test Product 2'].Id];

        System.assertEquals(100, productLot1.Quantity_Available__c, 'Product Lot 1 quantity should not be changed');
        System.assertEquals(50, productLot2.Quantity_Available__c, 'Product Lot 2 quantity should not be changed');
    }
}