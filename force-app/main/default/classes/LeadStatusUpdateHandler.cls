public class LeadStatusUpdateHandler {
    public static void handleLeadStatusUpdate(List<Id> leadIds, Map<id,Lead> oldMapValue) {
		Set<String> locationList =new Set<String>();
        Map<String,Id> mapofLoactionLead = new Map<String,Id>();
        List<Lead> leadList = [SELECT Id,Address,FirstName, Status,Location__c FROM Lead WHERE Id = :leadIds];
        
        for (Lead leadId : leadList) 
        {
            if(leadId.FirstName != '' && leadId.FirstName != Null)
            {
                if (leadId.Status == 'Schedule - Service/Appt Scheduled' && oldMapValue.get(leadId.Id).Status != 'Schedule - Service/Appt Scheduled') {
                    locationList.add(leadId.Location__c);
                    mapofLoactionLead.put(leadId.Location__c,leadId.Id);
                }
            }
            
            
        }

        
        List<Account> matchingAccounts = [SELECT Id,Name FROM Account WHERE Name =:mapofLoactionLead.keySet()];
        List<Client_Location_Relationship__c> acrRecords = new List<Client_Location_Relationship__c>();

        for(Account ac : matchingAccounts)
        {
            
                Database.LeadConvert leadConvert = new Database.LeadConvert();
                leadConvert.setLeadId(mapofLoactionLead.get(ac.Name));
                leadConvert.setAccountId(ac.Id); // Set the Account Id
                leadConvert.setDoNotCreateOpportunity(true);
                leadConvert.setConvertedStatus('Member'); // Set the appropriate converted status
                
                Database.LeadConvertResult leadConvertResult = Database.convertLead(leadConvert);
                
                if (leadConvertResult.isSuccess()) {
                    System.debug('Lead converted successfully!');
                    Client_Location_Relationship__c acr = new Client_Location_Relationship__c();
                    acr.Name = ac.Name;
                    acr.CMS_Location__c = leadConvertResult.getAccountId();
                    acr.Client__c = leadConvertResult.getContactId();
                    acrRecords.add(acr);
                } else {
                    System.debug('Lead conversion failed: ' + leadConvertResult.getErrors()[0].getMessage());
                }
           
            
        }
        if (!acrRecords.isEmpty()) {
            insert acrRecords;
        }

        
        
        
        /*for(id i:leadIds){
            
            String leadId = i; 
            
            
            Database.LeadConvert leadConvert = new Database.LeadConvert();
            leadConvert.setLeadId(leadId);
            
            
            leadConvert.setDoNotCreateOpportunity(false); 
            
            leadConvert.setConvertedStatus('Member'); // Set the appropriate converted status
            
            Database.LeadConvertResult leadConvertResult = Database.convertLead(leadConvert);
            
            
            if (leadConvertResult.isSuccess()) {
                
                System.debug('Lead converted successfully!');
                
            } else {
                
                System.debug('Lead conversion failed: ' + leadConvertResult.getErrors()[0].getMessage());
            }
        }*/
        
        
    }
}