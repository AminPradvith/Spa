trigger ServiceAppointmentTrigger on ServiceAppointment (before update,before insert) {
    
    list<ServiceAppointment> listSA= new list<ServiceAppointment>();
    for (ServiceAppointment sa : Trigger.new) {
        if(sa.status =='Scheduled'){
            listSA.add(sa);
        }
        
       
    }
    
    if(!listSA.isEmpty()){
        AppointmentvalidationHandler.validateServiceAppointment(listSA);
    }
}