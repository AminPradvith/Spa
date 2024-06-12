trigger QuoteTrigger on SBQQ__Quote__c (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            QuoteTriggerHandler.updateProductLotQuantity(Trigger.new, Trigger.OldMap);
        }
    }
}