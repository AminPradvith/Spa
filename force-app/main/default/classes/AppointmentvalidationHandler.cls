public class AppointmentvalidationHandler {
    
    public static void validateServiceAppointment(List<ServiceAppointment> ServiceAppointments) {
        // list<serviceResource> sr=[select id,name,IsActive from ServiceResource];
        Map<Id, String> mapWorkTypeNames = new Map<Id, String>();
        List<WorkType> workTypes = [SELECT Id, Name FROM WorkType];
        
        for (WorkType wt : workTypes) {
            mapWorkTypeNames.put(wt.Id, wt.Name);
        }
        
        Map<Id, String> mapSRNames = new Map<Id, String>();
        List<ServiceResource> srNames = [SELECT Id, Name FROM ServiceResource];
        
        for (ServiceResource srn : srNames) {
            mapSRNames.put(srn.Id, srn.Name);
        }
        
        Set<String> InjectablesRoomRules = new Set<String>{'Injectables','Complimentary Consultation','Emsculpt','Filler','B12','Non - Patient Appointment'};
            
            Set<String> IconRoomRules = new Set<String>{'Laser','Vein Removal'};
                Set<String> LaserHairRemRoomRules = new Set<String>{'Laser(Laser Hair Removal Room)'};
                    Set<String> TattooRemRoomRules = new Set<String>{'Laser (Tattoo Removal Room)'}; 
                        Set<String> EstheticianRoomRules = new Set<String>{'Facial'};
                            Set<String> VanquishRoomRules = new Set<String>{'Vanquish'};
                                Set<String> EmsculptRoomRules = new Set<String>{'Emsculpt'};
                                    
                                    
                                    for (ServiceAppointment sa : ServiceAppointments) {
                                        system.debug('sa :' + sa);
                                        
                                        string workTypeName = mapWorkTypeNames.get(sa.WorkTypeId);
                                        system.debug('workTypeName   :'+workTypeName);
                                        //  if (InjectablesRoomRules.contains(workTypeName)) {
                                        
                                        
                                        if(sa.ContactId !=null){
                                            
                                            
                                            list<ServiceAppointment> oldSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : InjectablesRoomRules];
                                            if(!oldSA.isEmpty()){
                                                
                                                
                                                for(ServiceAppointment old:oldSA){
                                                    system.debug('old :'+old);
                                                    system.debug('old.SchedStartTime :'+old.SchedStartTime);
                                                    system.debug('new.SchedStartTime :'+sa.SchedStartTime);
                                                    system.debug('old.WorkType.Name :'+old.WorkType.Name);
                                                    
                                                    if (sa.SchedStartTime !=null && old.SchedStartTime !=null && sa.SchedStartTime < old.SchedStartTime && sa.SchedStartTime > old.SchedStartTime.addHours(-48) && sa.AdditionalInformation != null && sa.AdditionalInformation.contains('SkinPen') ) {
                                                        sa.addError('No SkinPen within 48 hours prior to treatment.');
                                                        
                                                        break;
                                                    }
                                                    if (sa.SchedStartTime !=null && old.SchedStartTime !=null && sa.SchedStartTime >= old.SchedStartTime && sa.SchedStartTime < old.SchedStartTime.addHours(24) && (sa.AdditionalInformation != null && sa.AdditionalInformation.contains('SkinPen')  || workTypeName =='Laser'|| workTypeName == 'Facial' )) {
                                                        sa.addError('No facials, SkinPen, or lasers 24 hours post-treatment.');
                                                        System.debug('No facials, SkinPen, or lasers 24 hours post-treatment.');
                                                        break;
                                                    }
                                                    if (sa.SchedStartTime !=null && old.SchedStartTime !=null && sa.SchedStartTime > old.SchedStartTime && 
                                                        sa.SchedStartTime < old.SchedStartTime.addDays(14) &&
                                                        workTypeName == 'Facial' ) {
                                                            sa.addError('No Facials 2 weeks post.');
                                                            System.debug('No Facials 2 weeks post');
                                                            break;
                                                        }
                                                    if (sa.AdditionalInformation != null && sa.SchedStartTime !=null && old.SchedStartTime !=null &&
                                                        (sa.AdditionalInformation.contains('SkinPen')  || sa.AdditionalInformation.contains('Peel')) &&
                                                        (sa.SchedStartTime > old.SchedStartTime.addDays(-14) &&
                                                         sa.SchedStartTime < old.SchedStartTime.addDays(14) )) {
                                                             sa.addError('no skinpen or peels 2 weeks prior or 2 weeks post .');
                                                             System.debug('no skinpen or peels 2 weeks prior or 2 weeks post .');
                                                             break;
                                                         }
                                                    if(workTypeName== 'Laser'){
                                                        // check for Sculptra 
                                                        // Assuming textFieldValue is the value of the text field
                                                        String textFieldValue = old.AdditionalInformation;
                                                        boolean Sculptra = false;
                                                        if (textFieldValue != null && textFieldValue.contains('Sculptra')) {
                                                            Sculptra = true;
                                                            System.debug('The text field contains "Sculptra".');
                                                        } else {
                                                            System.debug('The text field does not contain "Sculptra".');
                                                        }
                                                        if (sa.SchedStartTime > old.SchedStartTime && 
                                                            sa.SchedStartTime < old.SchedStartTime.addHours(48) &&
                                                            Sculptra == true) {
                                                                sa.addError('For Sculptra: Lasers can be done 48 hours post ');
                                                                System.debug('For Sculptra: Lasers can be done 48 hours post ');
                                                                break;
                                                            } 
                                                    }
                                                    
                                                    system.debug('Start Calculation For -----------No laser on the treated area 2 weeks prior or 2 weeks post');
                                                    if ( sa.SchedStartTime !=null && old.SchedStartTime !=null && (sa.SchedStartTime > old.SchedStartTime.addDays(-14) && 
                                                                                                                   sa.SchedStartTime < old.SchedStartTime.addDays(14) )&&
                                                        workTypeName == 'Laser') {
                                                            //--------------------- for treatment area START------------------------
                                                            boolean sameTreatmentArea = false;
                                                            if(sa.Treatment_Areas__c !=null && old.Treatment_Areas__c !=null && sa.Treatment_Areas__c != old.Treatment_Areas__c  ){
                                                                String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                                String[] field2Values = old.Treatment_Areas__c.split(';'); 
                                                                Set<String> field2Set = new Set<String>(field2Values);
                                                                for(String value : field1Values) {
                                                                    if(field2Set.contains(value)) {
                                                                        sameTreatmentArea=true;
                                                                        break; // If at least one value is found, stop 
                                                                    }
                                                                } 
                                                            }
                                                            if(sa.Treatment_Areas__c == old.Treatment_Areas__c ){
                                                                sameTreatmentArea=true;
                                                            }
                                                            if(sa.Treatment_Areas__c == null){
                                                                sameTreatmentArea=False;
                                                            }
                                                            if(sameTreatmentArea == true){
                                                                sa.addError('No laser on the treated area 2 weeks prior or 2 weeks post');
                                                                System.debug('No laser on the treated area 2 weeks prior or 2 weeks post');
                                                                break;
                                                            }
                                                            
                                                        }
                                                    
                                                    
                                                    
                                                } // -----------old loop End ------------------------------
                                            }
                                            // ---------------------------------- Icon room---------------------------
                                            
                                            
                                            list<ServiceAppointment> ICSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : IconRoomRules];
                                            if(!ICSA.isEmpty()){
                                                for(ServiceAppointment oldsar: ICSA){
                                                    
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldsar.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldsar.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldsar.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldsar.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    
                                                    if (sa.SchedStartTime !=null && oldsar.SchedStartTime !=null && 
                                                        sa.SchedStartTime > oldsar.SchedStartTime.addDays(-14) &&
                                                        sa.SchedStartTime < oldsar.SchedStartTime.addDays(14) && 
                                                        ( workTypeName == 'Filler' || (sa.AdditionalInformation !=null  && sa.AdditionalInformation.contains('SkinPen')))){
                                                            sa.addError('No filler/SkinPen 2 weeks prior or post-treatment.');
                                                            System.debug('No filler/SkinPen 2 weeks prior or post-treatment.');
                                                        }
                                                    
                                                    system.debug('Start Calculation For -----------No laser on the treated area 2 weeks prior or 2 weeks post');
                                                    if ( sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        (sa.SchedStartTime > oldsar.SchedStartTime.addDays(-14) &&
                                                         sa.SchedStartTime < oldsar.SchedStartTime.addDays(14) )&&
                                                        workTypeName == 'Laser') {
                                                            
                                                            
                                                            if(sameTreatmentArea == true){
                                                                sa.addError('No laser on the treated area 2 weeks prior or 2 weeks post');
                                                                System.debug('No laser on the treated area 2 weeks prior or 2 weeks post');
                                                                break;
                                                            }
                                                            
                                                        }

 if (sa.SchedStartTime !=null && oldsar.SchedStartTime !=null && sa.AdditionalInformation !=null && oldsar.AdditionalInformation != null &&
                                                        sa.SchedStartTime > oldsar.SchedStartTime && 
                                                        sa.SchedStartTime < oldsar.SchedStartTime.addDays(28) && oldsar.AdditionalInformation.contains('Fractional') &&
                                                        sa.AdditionalInformation.contains('Fractional')  && sameTreatmentArea == true) {
                                                            sa.addError('No FX 4 weeks between the same area treatment.');
                                                            System.debug('No FX 4 weeks between the same area treatment.');
                                                        }
                                                    system.debug('sameTreatmentArea : '+sameTreatmentArea);
                                                    system.debug('oldsar.WorkType.Name :'+oldsar.WorkType.Name);
                                                    system.debug('sa.WorkType.Name :'+sa.WorkType.Name);
                                                    
 if (sa.SchedStartTime !=null && oldsar.SchedStartTime !=null && workTypeName !=null && oldsar.WorkType.Name !=null && 
oldsar.WorkType.Name =='Vein Removal' && (workTypeName =='Vein Removal' || workTypeName =='Laser') &&
                                                        sa.SchedStartTime > oldsar.SchedStartTime && 
                                                        sa.SchedStartTime < oldsar.SchedStartTime.addDays(56)  && sameTreatmentArea == true) {
                                                            sa.addError('No Vein Removal 8 weeks between the same area treatment appointments.');
                                                            System.debug('No Vein Removal 8 weeks between the same area treatment appointments.');
                                                        }

                                                    if (sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldsar.SchedStartTime && 
                                                        sa.SchedStartTime > oldsar.SchedStartTime.addHours(-24) &&
                                                        workTypeName =='Injectables'  && sameTreatmentArea == true) {
                                                            sa.addError('No Injectables 24 hours prior on the treated area.');
                                                            System.debug('No Injectables 24 hours prior on the treated area.');
                                                        }
                                                    
                                                    if ( sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        sa.AdditionalInformation != null && 
                                                        sa.SchedStartTime > oldsar.SchedStartTime.addHours(-48) &&
                                                        sa.SchedStartTime < oldsar.SchedStartTime.addHours(48) &&
                                                        sa.AdditionalInformation != null && sa.AdditionalInformation.contains('Hydrafacial') 
                                                       ) {
                                                           sa.addError('No Hydrafacial 48 hours prior or post-treatment.');
                                                           System.debug('No Hydrafacial 48 hours prior or post-treatment.');
                                                       }
                                                    
                                                    if (  sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        ( sa.SchedStartTime > oldsar.SchedStartTime &&
                                                         sameTreatmentArea == true &&
                                                         sa.SchedStartTime < oldsar.SchedStartTime.addHours(48) )&&
                                                        ( workTypeName == 'Vanquish' || workTypeName == 'Emsculpt' ) 
                                                       ) {
                                                           sa.addError('No vanquish or Emsculpt on the treated area for 48 hours post-treatment.');
                                                           System.debug('No vanquish or Emsculpt on the treated area for 48 hours post-treatment.');
                                                       }
                                                    
                                                    if (  sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        (sa.SchedStartTime > oldsar.SchedStartTime.addHours(-48) &&
                                                         sa.SchedStartTime < oldsar.SchedStartTime.addHours(48) )&&
                                                        sa.AdditionalInformation != null && sa.AdditionalInformation.contains('Hydrafacial')                        ) {
                                                            sa.addError('No Hydrafacial 48 hours prior or post-treatment.');
                                                            System.debug('No Hydrafacial 48 hours prior or post-treatment.');
                                                        }
                                                    // -----------------Room: Vein----------------------------------
                                                    if (
                                                        sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldsar.SchedStartTime && 
                                                        sa.SchedStartTime > oldsar.SchedStartTime.addDays(-14) &&
                                                        workTypeName =='Filler'  && sameTreatmentArea == true  && 
                                                        oldsar.workType.Name =='Vein Removal' ) {
                                                            sa.addError('No filler 2 weeks prior on the treated area.');
                                                            System.debug('No filler 2 weeks prior on the treated area.');
                                                        }
                                                    if (sa.SchedStartTime !=null && oldsar.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldsar.SchedStartTime && 
                                                        sa.SchedStartTime > oldsar.SchedStartTime.addHours(-24) &&
                                                        workTypeName =='Injectables'  && sameTreatmentArea == true &&
                                                        oldsar.workType.Name =='Vein Removal') {
                                                            sa.addError('No Injectables 24 hours prior on the treated area.');
                                                            System.debug('No Injectables 24 hours prior on the treated area.');
                                                        }
                                                    
                                                    
                                                }               
                                                
                                            }
                                            
                                            ///--------------------Room: LHR (Laser Hair Removal)---------------------
                                            
                                            list<ServiceAppointment> LhrSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : LaserHairRemRoomRules];
                                            system.debug('Laser HR :'+LhrSA);
                                                system.debug('sa.ContactId : '+sa.ContactId);
                                            if(!LhrSA.isEmpty()){
                                                for(ServiceAppointment oldLhrSA: LhrSA){
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldLhrSA.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldLhrSA.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldLhrSA.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldLhrSA.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    system.debug('sameTreatmentArea :'+sameTreatmentArea);
                                                    system.debug(' oldLhrSA.WorkType.Name: '+oldLhrSA.WorkType.Name);
                                                    system.debug(' workTypeName: '+workTypeName);
                                                    system.debug('sa.SchedStartTime : '+sa.SchedStartTime);
                                                    system.debug(' oldLhrSA.SchedStartTime.addDays(42): '+oldLhrSA.SchedStartTime.addDays(42));

 if (sa.SchedStartTime !=null && oldLhrSA.SchedStartTime !=null && workTypeName !=null && oldLhrSA.WorkType.Name !=null && 
oldLhrSA.WorkType.Name =='Laser(Laser Hair Removal Room)' && workTypeName =='Laser(Laser Hair Removal Room)' &&
                                                        sa.SchedStartTime > oldLhrSA.SchedStartTime && 
                                                        sa.SchedStartTime < oldLhrSA.SchedStartTime.addDays(42)  && sameTreatmentArea == true) {
                                                            sa.addError('No Laser Hair Removal Room 6 weeks between the same area treatment appointments.');
                                                            System.debug('No Laser Hair Removal Room 6 weeks between the same area treatment appointments.');
                                                        }
                                                    //-----                No IPL or FX 2 weeks prior or post-treatment on the same area.---------------
                                                    
                                                    if ( sa.SchedStartTime !=null && oldLhrSA.SchedStartTime !=null && 
                                                        (sa.SchedStartTime > oldLhrSA.SchedStartTime.addDays(-14) &&
                                                         sa.SchedStartTime < oldLhrSA.SchedStartTime.addDays(14) )&&
                                                        sameTreatmentArea == true && sa.AdditionalInformation != null &&
                                                        (sa.AdditionalInformation.contains('IPL') || sa.AdditionalInformation.contains('Fractional'))
                                                       ) {
                                                           sa.addError('No IPL or FX 2 weeks prior or post-treatment on the same area.');
                                                           System.debug('No IPL or FX 2 weeks prior or post-treatment on the same area.');
                                                           break;
                                                           
                                                           
                                                       }
                                                    system.debug('sa.SchedStartTime : '+sa.SchedStartTime );
                                                    system.debug('oldLhrSA.SchedStartTime : '+oldLhrSA.SchedStartTime);
                                                    system.debug('sameTreatmentArea == true '+sameTreatmentArea);
                                                    system.debug('sa.AdditionalInformation : '+sa.AdditionalInformation);
                                                    
                                                    if ( sa.SchedStartTime !=null && oldLhrSA.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldLhrSA.SchedStartTime.addHours(48) && 
                                                        sa.SchedStartTime > oldLhrSA.SchedStartTime.addHours(-48) && sa.AdditionalInformation != null &&
                                                        sa.AdditionalInformation.contains('Hydrafacial')  && sameTreatmentArea == true) {
                                                            
                                                            sa.addError('No Hydrafacial 48 hours prior or post-treatment.');
                                                            System.debug('No Hydrafacial 48 hours prior or post-treatment.');
                                                        }
                                                    
                                                    
                                                }
                                            }
                                            
                                            //  -----   Room: Tattoo Removal  ---------------
                                            
                                            
                                            list<ServiceAppointment> TattooSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : TattooRemRoomRules];
                                            system.debug('TattooSA HR :'+TattooSA);
                                            if(!TattooSA.isEmpty()){
                                                for(ServiceAppointment oldTattooSA: TattooSA){
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldTattooSA.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldTattooSA.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldTattooSA.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldTattooSA.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    system.debug('sameTreatmentArea');
                                                    
                                                    
                                                     if (sa.SchedStartTime !=null && oldTattooSA.SchedStartTime !=null && workTypeName !=null && oldTattooSA.WorkType.Name !=null && 
oldTattooSA.WorkType.Name =='Laser (Tattoo Removal Room)' && workTypeName =='Laser (Tattoo Removal Room)' &&
                                                        sa.SchedStartTime > oldTattooSA.SchedStartTime && 
                                                        sa.SchedStartTime < oldTattooSA.SchedStartTime.addDays(42)  && sameTreatmentArea == true) {
                                                            sa.addError('No Laser (Tattoo Removal) 6 weeks apart on the same area.');
                                                            System.debug('No Laser (Tattoo Removal) 6 weeks apart on the same area.');
                                                        }
                                                    
                                                    if ( sa.SchedStartTime !=null && oldTattooSA.SchedStartTime !=null &&
                                                        (sa.SchedStartTime > oldTattooSA.SchedStartTime.addDays(-14) &&
                                                         sa.SchedStartTime < oldTattooSA.SchedStartTime.addDays(14) )&&
                                                        sameTreatmentArea == true && sa.AdditionalInformation != null &&
                                                        (  sa.AdditionalInformation.contains('Fractional') ) ) {
                                                            sa.addError('No FX on the same area 2 weeks prior or post-treatment.');
                                                            System.debug('No FX on the same area 2 weeks prior or post-treatment.');
                                                            break;
                                                            
                                                            
                                                        }
                                                }
                                            }
                                            
                                            
                                            // --------------------    Room: Esthetician ----------------
                                            
                                            list<ServiceAppointment> EstheticSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : EstheticianRoomRules];
                                            system.debug('EstheticSA HR :'+EstheticSA);
                                            if(!EstheticSA.isEmpty()){
                                                for(ServiceAppointment oldEsthetic: EstheticSA){
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldEsthetic.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldEsthetic.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldEsthetic.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldEsthetic.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    system.debug('sameTreatmentArea');
                                                    
                                                    //                No Injectables or FX 24 hours prior.
                                                    if (sa.SchedStartTime !=null && oldEsthetic.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldEsthetic.SchedStartTime && 
                                                        sa.SchedStartTime > oldEsthetic.SchedStartTime.addHours(-24) &&
                                                        sameTreatmentArea == true && 
                                                        ( (sa.AdditionalInformation != null && sa.AdditionalInformation.contains('Fractional') ) ||  workTypeName =='Injectables' ) ) {
                                                            sa.addError('No Injectables or FX 24 hours prior.');
                                                            System.debug('No Injectables or FX 24 hours prior.');
                                                            break;      
                                                        }
                                                    
                                                    // ------------No fillers 2 weeks prior.--------------------
                                                    if (
                                                        sa.SchedStartTime !=null && oldEsthetic.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldEsthetic.SchedStartTime && 
                                                        sa.SchedStartTime > oldEsthetic.SchedStartTime.addDays(-14) && workTypeName =='Filler'  ) {
                                                            sa.addError('No fillers 2 weeks prior.');
                                                            System.debug('No fillers 2 weeks prior.');
                                                            break;      
                                                        }
                                                    
                                                    // ----------No IPL 1 week prior.-------------
                                                    
                                                    if (sa.SchedStartTime !=null && oldEsthetic.SchedStartTime !=null &&
                                                        sa.SchedStartTime < oldEsthetic.SchedStartTime && 
                                                        sa.SchedStartTime > oldEsthetic.SchedStartTime.addDays(-7)  && sa.AdditionalInformation != null &&
                                                        sa.AdditionalInformation.contains('IPL')  ) {
                                                            sa.addError('No IPL 1 week prior.');
                                                            System.debug('No IPL 1 week prior.');
                                                            break;      
                                                        }
                                                    
                                                    // -----------   For Hydrafacial, no lasers 48 hours prior or post-treatment.-----------
                                                    
                                                    if (sa.SchedStartTime !=null && oldEsthetic.SchedStartTime !=null &&
                                                        sa.SchedStartTime > oldEsthetic.SchedStartTime.addHours(-48) && 
                                                        sa.SchedStartTime < oldEsthetic.SchedStartTime.addHours(48) &&
                                                        workTypeName =='Laser' && oldEsthetic.AdditionalInformation != null &&
                                                        oldEsthetic.AdditionalInformation.contains('Hydrafacial')) {
                                                            sa.addError('For Hydrafacial, no lasers 48 hours prior or post-treatment.');
                                                            System.debug('For Hydrafacial, no lasers 48 hours prior or post-treatment.');
                                                            break;
                                                        } 
                                                    
                                                    
                                                }
                                            }
                                            
                                            // ---------------------- Room: Vanquish----------------
                                            
                                            list<ServiceAppointment> VanquishSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : VanquishRoomRules];
                                            system.debug('VanquishSA HR :'+VanquishSA);
                                            if(!VanquishSA.isEmpty()){
                                                for(ServiceAppointment oldVanquish: VanquishSA){
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldVanquish.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldVanquish.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldVanquish.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldVanquish.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    system.debug('sameTreatmentArea');
                                                    
if (sa.SchedStartTime !=null && oldVanquish.SchedStartTime !=null && workTypeName !=null && oldVanquish.WorkType.Name !=null && 
oldVanquish.WorkType.Name =='Vanquish' && workTypeName =='Vanquish' &&
                                                        sa.SchedStartTime > oldVanquish.SchedStartTime && 
                                                        sa.SchedStartTime < oldVanquish.SchedStartTime.addDays(7)  && sameTreatmentArea == true) {
                                                            sa.addError('No Vanquish 7 days in between the same area treatment.');
                                                            System.debug('No Vanquish 7 days in between the same area treatment.');
                                                        }                                                    
                                                    //------------No FX on the same area 48 hours prior or post-treatment.--------------
                                                    
                                                    if (  sa.SchedStartTime !=null && oldVanquish.SchedStartTime !=null &&  sa.AdditionalInformation != null && 
                                                        sa.SchedStartTime > oldVanquish.SchedStartTime.addHours(-48) &&
                                                        sa.SchedStartTime < oldVanquish.SchedStartTime.addHours(48) &&
                                                        sa.AdditionalInformation.contains('Fractional')  && sameTreatmentArea == true
                                                       ) {
                                                           sa.addError('No FX on the same area 48 hours prior or post-treatment.');
                                                           System.debug('No FX on the same area 48 hours prior or post-treatment.');
                                                       }
                                                    
                                                    
                                                    
                                                }
                                            }
                                            
                                            
                                            // -------------------Room: Emsculpt-----------------------------
                                            
                                            list<ServiceAppointment> EmsculptSA = [select id,ContactId,Treatment_Areas__c,SchedStartTime,AdditionalInformation, WorkType.Name from ServiceAppointment where ContactId =:sa.ContactId AND id != :sa.Id AND WorkType.Name IN : EmsculptRoomRules];
                                            system.debug('EmsculptSA HR :'+EmsculptSA);
                                            if(!EmsculptSA.isEmpty()){
                                                for(ServiceAppointment oldEmsculpt: EmsculptSA){
                                                    
                                                    system.debug('oldEmsculpt :'+oldEmsculpt);
                                                    //--------------------- for treatment area START------------------------
                                                    boolean sameTreatmentArea = false;
                                                    if(sa.Treatment_Areas__c !=null && oldEmsculpt.Treatment_Areas__c !=null && sa.Treatment_Areas__c != oldEmsculpt.Treatment_Areas__c  ){
                                                        String[] field1Values = sa.Treatment_Areas__c.split(';'); 
                                                        String[] field2Values = oldEmsculpt.Treatment_Areas__c.split(';'); 
                                                        Set<String> field2Set = new Set<String>(field2Values);
                                                        for(String value : field1Values) {
                                                            if(field2Set.contains(value)) {
                                                                sameTreatmentArea=true;
                                                                break; // If at least one value is found, stop 
                                                            }
                                                        } 
                                                    }
                                                    if(sa.Treatment_Areas__c == oldEmsculpt.Treatment_Areas__c ){
                                                        sameTreatmentArea=true;
                                                    }
                                                    if(sa.Treatment_Areas__c == null){
                                                        sameTreatmentArea=False;
                                                    }
                                                    system.debug('sameTreatmentArea');
                                                    
                                                    if (sa.SchedStartTime !=null && oldEmsculpt.SchedStartTime !=null && workTypeName !=null && oldEmsculpt.WorkType.Name !=null && 
oldEmsculpt.WorkType.Name =='Emsculpt' && workTypeName =='Emsculpt' &&
                                                        sa.SchedStartTime > oldEmsculpt.SchedStartTime && 
                                                        sa.SchedStartTime < oldEmsculpt.SchedStartTime.addDays(3)  && sameTreatmentArea == true) {
                                                            sa.addError('No Emsculpt 3 days in between the same area treatment.');
                                                            System.debug('No Emsculpt 3 days in between the same area treatment.');
                                                        } 
                                                    
                                                    // --------------  No FX on the same area 48 hours prior.------------------
                                                    
                                                    if (sa.AdditionalInformation != null && sa.SchedStartTime !=null && oldEmsculpt.SchedStartTime !=null &&
                                                        sa.SchedStartTime > oldEmsculpt.SchedStartTime.addHours(-48) &&
                                                        sa.SchedStartTime < oldEmsculpt.SchedStartTime &&
                                                        sa.AdditionalInformation.contains('Fractional')  && sameTreatmentArea == true
                                                       ) {
                                                           sa.addError('No FX on the same area 48 hours prior.');
                                                           System.debug('No FX on the same area 48 hours prior.');
                                                       }
                                                    
                                                    
                                                }
                                            }
                                            
                                        }  ///   ------------------------if(sa.ContactId !=null){ ----------------end
                                        
                                        
                                        // }
                                        
                                        
                                    }  //------------------- loop sa end -------------------
        
    }
}