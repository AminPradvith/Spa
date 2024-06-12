trigger LeadConvertTrigger on Lead (after update) {
    list<id> leadIdsToUpdate=new list<id>();
for (Lead updatedLead : Trigger.new) {
    if (updatedLead.Status == 'Schedule - Service/Appt Scheduled' && Trigger.oldMap.get(updatedLead.Id).Status != 'Schedule - Service/Appt Scheduled') {
        // Lead status is updated to 'xyz'
        leadIdsToUpdate.add(updatedLead.Id);
    }
}
 
// Call handler method if there are Leads updated to 'xyz'
if (!leadIdsToUpdate.isEmpty()) {
    LeadStatusUpdateHandler.handleLeadStatusUpdate(leadIdsToUpdate,Trigger.oldMap);
}

}