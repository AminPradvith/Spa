@isTest
   private class LeadConvertTest {
    @isTest
    static void testLeadConversion() {
        // Create Test Data
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Status = 'New' // Initial status before trigger action
        );
        insert testLead;

        // Set up Trigger.new and Trigger.oldMap
        testLead.Status = 'Schedule - Service/Appt Scheduled';
        Test.startTest();
        update testLead;
        Test.stopTest();

        // Retrieve the converted Account and Contact
        List<Account> convertedAccounts = [SELECT Id FROM Account WHERE Id = :testLead.ConvertedAccountId];
        List<Contact> convertedContacts = [SELECT Id FROM Contact WHERE Id = :testLead.ConvertedContactId];

        // Verify conversion
        System.assertNotEquals(0, convertedAccounts.size(), 'Lead not converted to Account');
        System.assertNotEquals(0, convertedContacts.size(), 'Lead not converted to Contact');

        // Clean up
        delete convertedAccounts;
        delete convertedContacts;
        delete testLead;
    }
}