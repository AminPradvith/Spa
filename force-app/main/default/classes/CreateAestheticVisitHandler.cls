public class CreateAestheticVisitHandler {
    
    public class FlowOutput {
        @InvocableVariable
        public Id recordId;
        
        public FlowOutput(Id recId) {
            this.recordId = recId;
        }
    }
    
    
    @InvocableMethod(label='Get list of Aesthetic Vist from flow')
    public static List<FlowOutput> genericRecordsList(List<SObject>recordsList){
        try{
            List<Sobject> recordListToSend = new List<Sobject>();
            List<FlowOutput> results = new List<FlowOutput>();
            
            for (SObject record : recordsList) {
                String objectType = record.getSObjectType().getDescribe().getName();
                System.debug('objectType=====>'+objectType);
                if (objectType == 'Medical_Hist__c') {
                    recordListToSend.add(record);
                    String recId =  CreateMedicalHistory(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                    
                }
                if (objectType == 'Aesthetician_Consult__c') {
                    recordListToSend.add(record);
                    String recId = CreateAestheticConsult(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                    
                }
                if (objectType == 'Follow_up__c') {
                    recordListToSend.add(record);
                    string recId =  CreateFolloup(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                if (objectType == 'Aesthetician_Coolsculpting__c') {
                    recordListToSend.add(record);
                    String recId = createCoolSculpting(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                if (objectType == 'Thermage_Treatment__c') {
                    recordListToSend.add(record);
                    String recId =   createThermage(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                if (objectType == 'Sculpsure_Treatment__c') {
                    recordListToSend.add(record);
                    String recId =   createSculpsureTreatment(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                if (objectType == 'Medication_and_Allergies__c') {
                    recordListToSend.add(record);
                    String recId=  createMedicationAndAllergies(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                if (objectType == 'IPL_Treatment__c') {
                    recordListToSend.add(record);
                    String recId = createIPLTreatment(recordListToSend); 
                    System.debug('recId==>'+recId);
                    FlowOutput output = new FlowOutput(recId);
                    results.add(output);
                }
                
            }
            
            return results;                
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
        
    }
    
    public static String returnRecordId(List<Sobject> genericRecordList){
        
        if(genericRecordList != null && !genericRecordList.isEmpty()) {
            SObject firstRecord = genericRecordList.get(0);
            System.debug('recordId===>'+(String)firstRecord.get('Id'));
            return (String)firstRecord.get('Id');
        }
        return null;   
    }
    
    public static string CreateMedicalHistory(List<Medical_Hist__c> medicalRecord){
        try{
            List<Medical_Hist__c> listToCreateRecords = new List<Medical_Hist__c>();
            String recId;
            for(Medical_Hist__c md : medicalRecord){
                System.debug('Client Id==>'+md.Chart__c);
                
                if(md.Latex_Allergies__c == true || md.Latex_Allergiesc__c != ''|| md.Seizures_and_or_Epilepsy__c == true || md.Seizures_and_or_Epilepsyc__c != '' || md.Asthma__c == true || md.Asthmac__c != ''|| md.Numbness_in_the_area__c == true || md.Numbness_in_the_areac__c != '' || md.Autoimmune_Disorders__c == true || md.Autoimmune_Disordersc__c != '' || md.Sarcoidosis__c == true || md.Sarcoidosisc__c != '' || md.Lupus__c == true || md.Lupusc__c != '' || md.Scleroderma__c == true || md.Sclerodermac__c != '' || md.Skin_Disorders__c == true || md.Skin_Disordersc__c != '' || md.Vitiligo__c == true || md.Vitiligoc__c != '' || md.Keliod_Hypertrophic_Scarring__c == true || md.Keliod_Hypertrophic_Scarringc__c != '' || md.Present_Scarring__c == true || md.Present_Scarringc__c != '' || md.Herpes_Virus_Cold_Sore__c == true || md.Herpes_Virus_Cold_Sorec__c != '' || md.Polycystic_Ovarian_Syndrome__c == true || md.Polycystic_Ovarian_Syndromec__c != '' || md.Blood_clots_Phlebitis_Bleeding_Disorders__c == true || md.Blood_clots_Phlebitis_Bleeding_Disorderc__c != '' || md.HIV__c == true || md.HIVc__c != '' || md.Lymphedemia__c == true || md.Lymphedemiac__c != '' || md.Varicose_Veins__c == true || md.Varicose_Veinsc__c != '' || md.Pregnant_Actively_trying_to_get_pregnant__c == true || md.Pregnant_Actively_trying_to_get_pregnanc__c != '' || md.Currently_Breastfeeding__c == true || md.Currently_Breastfeedingc__c != '' || md.Cancer_and_or_precancerous_lesions__c == true || md.Cancer_and_or_precancerous_lesionsc__c != '' || md.Pacemakers_internal_pacing_devices__c == true || md.Pacemakers_internal_pacing_devicesc__c != '' || md.Internal_Metal_Devices__c == true || md.Internal_Metal_Devicesc__c != '' || md.Hip_Replacement__c == true || md.Hip_Replacementc__c != '' || md.Lymph_Node_Removal__c == true || md.Lymph_Node_Removals__c != '' || md.Hernias__c == true || md.Herniasc__c != '' || md.Past_Surgeries__c == true || md.Past_Surgeriesc__c != '' || md.Multiple_Sclerosis__c == true || md.Multiple_Sclerosisc__c != '' || md.Chemotherapy_radiation_therapy__c == true || md.Over_the_counter_medications__c == true || md.Over_the_counter_medicationsc__c != '' || md.Chemotherapy_radiation_therapyc__c != '' || md.Herbal_Supplements__c == true || md.Herbal_Supplementsc__c != '' || md.Retin_A_or_Generics__c == true || md.Retin_A_or_Genericsc__c != '' || md.Diabetes_Type_1__c == true || md.Diabetes_Type_1c__c != '' || md.Medullary_thyroid_carcinoma__c == true || md.Medullary_thyroid_carcinomac__c != '' || md.Multiple_endocrine_neoplastic__c == true || md.Multiple_endocrine_neoplasticc__c !='' || md.Blood_Thinner__c == true || md.Blood_Thinnerc__c != '' || md.Acne_Medication__c == true || md.Acne_Medicationc__c != '' || md.Oral_Contraceptives__c == true || md.Oral_Contraceptivesc__c != '' || md.Accutane__c == true || md.Accutanec__c != '' || md.Antibiotics__c == true || md.Antibioticsc__c != '' || md.Latex_Allergies__c == true || md.Latex_Allergiesc__c != '' || md.Permanent_Make_up__c == true || md.Permanent_Make_upc__c != '' || md.MessageCheckbox1__c == true || md.None__c == true || md.Areas_of_Interest_Nonec__c != '' ||md.Areas_of_Interest_Spider_Veins__c == true || md.Areas_Of_Interest_TruSculpt_Body_Contour__c == true ||md.Areas_Of_Interest_TruSculpt_Body_Contouc__c != '' || md.Areas_of_Interest_Spider_Veinsc__c != '' || md.Areas_of_Interest_Skin_Rejuvenation__c == true || md.Areas_of_Interest_Skin_Rejuvenationc__c != '' || md.Botox_Restylane_Dermal_Fillers__c == true || md.Botox_Restylane_Dermal_Fillerc__c != '' || md.Areas_of_Interest_Brown_Spots__c == true || md.Areas_of_Interest_Brown_Spotsc__c != '' || md.Areas_of_Interest_Dermal_Fillers__c == true || md.Areas_of_Interest_Dermal_Fillersc__c != '' || md.Areas_of_Interest_Facials__c == true || md.Areas_of_Interest_Facialsc__c != '' || md.Areas_of_Interest_Anti_Aging__c == true || md.Areas_of_Interest_Anti_Agingc__c != '' || md.Areas_of_Interest_Weight_Management__c == true || md.Areas_of_Interest_Weight_Managementc__c != '' || md.Areas_of_InterestLaser_Hair_Removal__c == true || md.Areas_of_InterestLaser_Hair_Removalc__c != '' || md.Areas_of_Interest_Other__c == true || md.Areas_of_Interest_Otherc__c != '' || md.Areas_of_Interest_Tattoo_Removal__c == true || md.Areas_of_Interest_Tattoo_Removalc__c != '' || md.Arbitration_Acknowledgement_CheckBox_1__c == true || md.Arbitration_Acknowledgement_CheckBox_2__c == true || md.Arbitration_Verification_Patient_Name__c != '' || md.Arbitration_Verification_Parent_or_Guard__c != '' || md.Arbitration_Verification_Date__c != null || md.Return_Policy_Acknowledgement_CheckBox_1__c == true || md.Return_Policy_Acknowledgement_CheckBox_2__c == true || md.Photo_Consent_Acknowledgement_CheckBox_1__c == true || md.Photo_Consent_Acknowledgement_CheckBox_2__c == true || md.Return_Policy_Verification_Patient_Name__c != '' || md.Photo_Consent_Verification_Parent_Guard__c != '' || md.Photo_Consent_Verification_Date__c != null )
                {
                    Medical_Hist__c ms = new Medical_Hist__c();
                    ms.Id = md.Id;
                    ms.Chart__c = md.Chart__c;
                    ms.Latex_Allergies__c = md.Latex_Allergies__c;
                    ms.Latex_Allergiesc__c = md.Latex_Allergiesc__c;
                    ms.Seizures_and_or_Epilepsy__c = md.Seizures_and_or_Epilepsy__c;
                    ms.Seizures_and_or_Epilepsyc__c = md.Seizures_and_or_Epilepsyc__c;
                    ms.Asthma__c = md.Asthma__c;
                    ms.Asthmac__c = md.Asthmac__c;
                    ms.Numbness_in_the_area__c = md.Numbness_in_the_area__c;
                    ms.Numbness_in_the_areac__c = md.Numbness_in_the_areac__c;
                    ms.Autoimmune_Disorders__c = md.Autoimmune_Disorders__c;
                    ms.Autoimmune_Disordersc__c = md.Autoimmune_Disordersc__c;
                    ms.Sarcoidosis__c = md.Sarcoidosis__c;
                    ms.Sarcoidosisc__c = md.Sarcoidosisc__c;
                    ms.Lupus__c = md.Lupus__c;
                    ms.Lupusc__c = md.Lupusc__c;
                    ms.Scleroderma__c = md.Scleroderma__c;
                    ms.Sclerodermac__c = md.Sclerodermac__c;
                    ms.Skin_Disorders__c = md.Skin_Disorders__c;
                    ms.Skin_Disordersc__c = md.Skin_Disordersc__c;
                    ms.Vitiligo__c = md.Vitiligo__c;
                    ms.Vitiligoc__c = md.Vitiligoc__c;
                    ms.Keliod_Hypertrophic_Scarring__c = md.Keliod_Hypertrophic_Scarring__c;
                    ms.Keliod_Hypertrophic_Scarringc__c = md.Keliod_Hypertrophic_Scarringc__c;
                    ms.Present_Scarring__c = md.Present_Scarring__c;
                    ms.Present_Scarringc__c = md.Present_Scarringc__c;
                    ms.Herpes_Virus_Cold_Sore__c = md.Herpes_Virus_Cold_Sore__c;
                    ms.Herpes_Virus_Cold_Sorec__c = md.Herpes_Virus_Cold_Sorec__c;
                    ms.Polycystic_Ovarian_Syndrome__c = md.Polycystic_Ovarian_Syndrome__c;
                    ms.Polycystic_Ovarian_Syndromec__c = md.Polycystic_Ovarian_Syndromec__c;
                    ms.Blood_clots_Phlebitis_Bleeding_Disorders__c = md.Blood_clots_Phlebitis_Bleeding_Disorders__c;
                    ms.Blood_clots_Phlebitis_Bleeding_Disorderc__c = md.Blood_clots_Phlebitis_Bleeding_Disorderc__c;
                    ms.HIV__c = md.HIV__c;
                    ms.HIVc__c = md.HIVc__c;
                    ms.Lymphedemia__c = md.Lymphedemia__c;
                    ms.Lymphedemiac__c = md.Lymphedemiac__c;
                    ms.Varicose_Veins__c = md.Varicose_Veins__c;
                    ms.Varicose_Veinsc__c = md.Varicose_Veinsc__c;
                    ms.Pregnant_Actively_trying_to_get_pregnant__c = md.Pregnant_Actively_trying_to_get_pregnant__c;
                    ms.Pregnant_Actively_trying_to_get_pregnanc__c = md.Pregnant_Actively_trying_to_get_pregnanc__c;
                    ms.Currently_Breastfeeding__c = md.Currently_Breastfeeding__c;
                    ms.Currently_Breastfeedingc__c = md.Currently_Breastfeedingc__c;
                    ms.Cancer_and_or_precancerous_lesions__c = md.Cancer_and_or_precancerous_lesions__c;
                    ms.Cancer_and_or_precancerous_lesionsc__c = md.Cancer_and_or_precancerous_lesionsc__c;
                    ms.Pacemakers_internal_pacing_devices__c = md.Pacemakers_internal_pacing_devices__c;
                    ms.Pacemakers_internal_pacing_devicesc__c = md.Pacemakers_internal_pacing_devicesc__c;
                    ms.Internal_Metal_Devices__c = md.Internal_Metal_Devices__c;
                    ms.Internal_Metal_Devicesc__c = md.Internal_Metal_Devicesc__c;
                    ms.Hip_Replacement__c = md.Hip_Replacement__c;
                    ms.Hip_Replacementc__c = md.Hip_Replacementc__c;
                    ms.Lymph_Node_Removal__c = md.Lymph_Node_Removal__c;
                    ms.Lymph_Node_Removals__c = md.Lymph_Node_Removals__c;
                    ms.Hernias__c = md.Hernias__c;
                    ms.Herniasc__c = md.Herniasc__c;
                    ms.Past_Surgeries__c = md.Past_Surgeries__c;
                    ms.Past_Surgeriesc__c = md.Past_Surgeriesc__c;
                    ms.Multiple_Sclerosis__c = md.Multiple_Sclerosis__c;
                    ms.Multiple_Sclerosisc__c = md.Multiple_Sclerosisc__c;
                    ms.Chemotherapy_radiation_therapy__c = md.Chemotherapy_radiation_therapy__c;
                    ms.Over_the_counter_medications__c = md.Over_the_counter_medications__c;
                    ms.Over_the_counter_medicationsc__c = md.Over_the_counter_medicationsc__c;
                    ms.Chemotherapy_radiation_therapyc__c = md.Chemotherapy_radiation_therapyc__c;
                    ms.Herbal_Supplements__c = md.Herbal_Supplements__c;
                    ms.Herbal_Supplementsc__c = md.Herbal_Supplementsc__c;
                    ms.Retin_A_or_Generics__c = md.Retin_A_or_Generics__c;
                    ms.Retin_A_or_Genericsc__c = md.Retin_A_or_Genericsc__c;
                    ms.Diabetes_Type_1__c = md.Diabetes_Type_1__c;
                    ms.Diabetes_Type_1c__c = md.Diabetes_Type_1c__c;
                    ms.Medullary_thyroid_carcinoma__c = md.Medullary_thyroid_carcinoma__c;
                    ms.Medullary_thyroid_carcinomac__c = md.Medullary_thyroid_carcinomac__c;
                    ms.Multiple_endocrine_neoplastic__c = md.Multiple_endocrine_neoplastic__c;
                    ms.Multiple_endocrine_neoplasticc__c = md.Multiple_endocrine_neoplasticc__c;
                    ms.Blood_Thinner__c = md.Blood_Thinner__c;
                    ms.Blood_Thinnerc__c = md.Blood_Thinnerc__c;
                    ms.Acne_Medication__c = md.Acne_Medication__c;
                    ms.Acne_Medicationc__c = md.Acne_Medicationc__c;
                    ms.Oral_Contraceptives__c = md.Oral_Contraceptives__c;
                    ms.Oral_Contraceptivesc__c = md.Oral_Contraceptivesc__c;
                    ms.Accutane__c = md.Accutane__c;
                    ms.Accutanec__c = md.Accutanec__c;
                    ms.Antibiotics__c = md.Antibiotics__c;
                    ms.Antibioticsc__c = md.Antibioticsc__c;
                    ms.Latex_Allergies__c = md.Latex_Allergies__c;
                    ms.Latex_Allergiesc__c = md.Latex_Allergiesc__c;
                    ms.Permanent_Make_up__c = md.Permanent_Make_up__c;
                    ms.Permanent_Make_upc__c = md.Permanent_Make_upc__c;
                    ms.MessageCheckbox1__c = md.MessageCheckbox1__c;
                    ms.None__c = md.None__c;
                    ms.Areas_of_Interest_Nonec__c = md.Areas_of_Interest_Nonec__c;
                    ms.Areas_of_Interest_Spider_Veins__c = md.Areas_of_Interest_Spider_Veins__c;
                    ms.Areas_Of_Interest_TruSculpt_Body_Contour__c = md.Areas_Of_Interest_TruSculpt_Body_Contour__c;
                    ms.Areas_Of_Interest_TruSculpt_Body_Contouc__c = md.Areas_Of_Interest_TruSculpt_Body_Contouc__c;
                    ms.Areas_of_Interest_Spider_Veinsc__c = md.Areas_of_Interest_Spider_Veinsc__c;
                    ms.Areas_of_Interest_Skin_Rejuvenation__c = md.Areas_of_Interest_Skin_Rejuvenation__c;
                    ms.Areas_of_Interest_Skin_Rejuvenationc__c = md.Areas_of_Interest_Skin_Rejuvenationc__c;
                    ms.Botox_Restylane_Dermal_Fillers__c = md.Botox_Restylane_Dermal_Fillers__c;
                    ms.Botox_Restylane_Dermal_Fillerc__c = md.Botox_Restylane_Dermal_Fillerc__c;
                    ms.Areas_of_Interest_Brown_Spots__c = md.Areas_of_Interest_Brown_Spots__c;
                    ms.Areas_of_Interest_Brown_Spotsc__c = md.Areas_of_Interest_Brown_Spotsc__c;
                    ms.Areas_of_Interest_Dermal_Fillers__c = md.Areas_of_Interest_Dermal_Fillers__c;
                    ms.Areas_of_Interest_Dermal_Fillersc__c = md.Areas_of_Interest_Dermal_Fillersc__c;
                    ms.Areas_of_Interest_Facials__c = md.Areas_of_Interest_Facials__c;
                    ms.Areas_of_Interest_Facialsc__c = md.Areas_of_Interest_Facialsc__c;
                    ms.Areas_of_Interest_Anti_Aging__c = md.Areas_of_Interest_Anti_Aging__c;
                    ms.Areas_of_Interest_Anti_Agingc__c = md.Areas_of_Interest_Anti_Agingc__c;
                    ms.Areas_of_Interest_Weight_Management__c = md.Areas_of_Interest_Weight_Management__c;
                    ms.Areas_of_Interest_Weight_Managementc__c = md.Areas_of_Interest_Weight_Managementc__c;
                    ms.Areas_of_InterestLaser_Hair_Removal__c = md.Areas_of_InterestLaser_Hair_Removal__c;
                    ms.Areas_of_InterestLaser_Hair_Removalc__c = md.Areas_of_InterestLaser_Hair_Removalc__c;
                    ms.Areas_of_Interest_Other__c = md.Areas_of_Interest_Other__c;
                    ms.Areas_of_Interest_Otherc__c = md.Areas_of_Interest_Otherc__c;
                    ms.Areas_of_Interest_Tattoo_Removal__c = md.Areas_of_Interest_Tattoo_Removal__c;
                    ms.Areas_of_Interest_Tattoo_Removalc__c = md.Areas_of_Interest_Tattoo_Removalc__c;
                    ms.Arbitration_Acknowledgement_CheckBox_1__c = md.Arbitration_Acknowledgement_CheckBox_1__c;
                    ms.Arbitration_Acknowledgement_CheckBox_2__c = md.Arbitration_Acknowledgement_CheckBox_2__c;
                    ms.Arbitration_Verification_Patient_Name__c = md.Arbitration_Verification_Patient_Name__c;
                    ms.Arbitration_Verification_Parent_or_Guard__c = md.Arbitration_Verification_Parent_or_Guard__c;
                    ms.Arbitration_Verification_Date__c = md.Arbitration_Verification_Date__c;
                    ms.Return_Policy_Acknowledgement_CheckBox_1__c = md.Return_Policy_Acknowledgement_CheckBox_1__c;
                    ms.Return_Policy_Acknowledgement_CheckBox_2__c = md.Return_Policy_Acknowledgement_CheckBox_2__c;
                    ms.Photo_Consent_Acknowledgement_CheckBox_1__c = md.Photo_Consent_Acknowledgement_CheckBox_1__c;
                    ms.Photo_Consent_Acknowledgement_CheckBox_2__c = md.Photo_Consent_Acknowledgement_CheckBox_2__c;
                    ms.Return_Policy_Verification_Patient_Name__c = md.Return_Policy_Verification_Patient_Name__c;
                    ms.Photo_Consent_Verification_Parent_Guard__c = md.Photo_Consent_Verification_Parent_Guard__c;
                    ms.Photo_Consent_Verification_Date__c = md.Photo_Consent_Verification_Date__c;
                    ms.Patient_Allergy__c = md.Patient_Allergy__c;
                    ms.Patient_Allergy_Notes__c = md.Patient_Allergy_Notes__c;
                    ms.Patient_Current_Medication_dosage__c = md.Patient_Current_Medication_dosage__c;
                    ms.Patient_Current_Medication_dosage_Notes__c = md.Patient_Current_Medication_dosage_Notes__c;
                    
                    
                    listToCreateRecords.add(ms);
                    
                }
                
            }
            if(listToCreateRecords.size()>0){
                upsert listToCreateRecords;
                recId = returnRecordId(listToCreateRecords);
                
            }
            
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
        
        
    }
    
    public static String CreateAestheticConsult(List<Aesthetician_Consult__c> astheticConsult){
        try{
            List<Aesthetician_Consult__c> listToInsert = new List<Aesthetician_Consult__c>();
            String  recId;
            for(Aesthetician_Consult__c ast : astheticConsult){
                System.debug('Client Id==>'+ast.Chart__c);
                System.debug('Record Id==>'+ast.Id);
                
                if(ast.Membership_Notes__c != '' || ast.Other_Notes__c != '')
                {
                    Aesthetician_Consult__c ac = new Aesthetician_Consult__c();
                    ac.Id = ast.Id;
                    ac.Chart__c = ast.Chart__c;
                    ac.Membership_Notes__c = ast.Membership_Notes__c;
                    ac.Other_Notes__c = ast.Other_Notes__c;
                    listToInsert.add(ac);
                }
            }
            
            if(listToInsert.size()>0){
                upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            
            return recId; 
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    
    public static String CreateFolloup(List<Follow_up__c> folloupList){
        try{
            List<Follow_up__c> listToInsert = new List<Follow_up__c>();
            String recId;
            for(Follow_up__c fl : folloupList){
                System.debug('Client Id==>'+fl.Chart__c);
                
                if(fl.Cometics_Follow_Up__c != ''){
                    Follow_up__c fp = new Follow_up__c();
                    fp.Id = fl.Id;
                    fp.Chart__c = fl.Chart__c;
                    fp.Cometics_Follow_Up__c = fl.Cometics_Follow_Up__c;
                    listToInsert.add(fp);
                }
                
            }
            
            if(listToInsert.size()>0){
                Upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
        
        
    }
    
    public static String createCoolSculpting(List<Aesthetician_Coolsculpting__c> coolSculptingList){
        try{
            List<Aesthetician_Coolsculpting__c> listToInsert = new List<Aesthetician_Coolsculpting__c>();
            String recId;
            for(Aesthetician_Coolsculpting__c cl :coolSculptingList){
                System.debug('Client Id==>'+cl.Chart__c);
                
                if(String.isNotBlank(cl.Goals_of_CoolSculpting_Procedure__c) ||  cl.CoolSculpting_Date__c != null ||  cl.CoolSculpting_Weight__c != null || cl.Coolsculpt_Procedure_Checklist__c != null  || cl.PreCoolsculpting_Checklist__c != null)
                {
                    Aesthetician_Coolsculpting__c co = new Aesthetician_Coolsculpting__c();
                    co.Id = cl.Id;
                    co.Chart__c = cl.Chart__c;
                    co.Goals_of_CoolSculpting_Procedure__c = cl.Goals_of_CoolSculpting_Procedure__c;
                    co.CoolSculpting_Date__c = cl.CoolSculpting_Date__c;
                    co.CoolSculpting_Weight__c = cl.CoolSculpting_Weight__c;
                    co.Coolsculpt_Procedure_Checklist__c = cl.Coolsculpt_Procedure_Checklist__c;
                    co.PreCoolsculpting_Checklist__c = cl.PreCoolsculpting_Checklist__c;
                    listToInsert.add(co);
                }
            }
            if(listToInsert.size()>0){
                upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    
    public static String createThermage(List<Thermage_Treatment__c> thermageList){
        try{
            List<Thermage_Treatment__c> listToInsert = new List<Thermage_Treatment__c>();
            String recId;
            for(Thermage_Treatment__c ta : thermageList){
                System.debug('Client Id==>'+ta.Chart__c);
                if(ta.Staggered_Passes_Passes__c != '' || ta.Staggered_Passes_REPS__c != '' || ta.Staggered_Passes_Tx_Setting_Min_Max__c != '' || ta.Vector_Passes_REPS__c != '' || ta.Vector_Passes_Passes__c != '' || ta.Vector_PassesTx_Setting_Min_Max__c != '' || ta.Problem_area_passes_REPS__c != '' || ta.Problem_area_passes_Passes__c != '' || ta.Problem_area_passes_Tx_Setting_Min_Max__c != '' || ta.Thermage_Post_procedure_Details__c != '' || ta.Thermage_Post_procedure_Discomfort__c != null || ta.Thermage_Post_procedure_erythema__c != null || ta.Thermage_Post_procedure_swelling__c != null )
                {
                    Thermage_Treatment__c tt = new Thermage_Treatment__c();
                    tt.Id = ta.Id;
                    tt.Chart__c = ta.Chart__c;
                    tt.Staggered_Passes_Passes__c = ta.Staggered_Passes_Passes__c;
                    tt.Staggered_Passes_REPS__c = ta.Staggered_Passes_REPS__c;
                    tt.Staggered_Passes_Tx_Setting_Min_Max__c = ta.Staggered_Passes_Tx_Setting_Min_Max__c;
                    tt.Vector_Passes_REPS__c = ta.Vector_Passes_REPS__c;
                    tt.Vector_Passes_Passes__c = ta.Vector_Passes_Passes__c;
                    tt.Vector_PassesTx_Setting_Min_Max__c = ta.Vector_PassesTx_Setting_Min_Max__c;
                    tt.Problem_area_passes_REPS__c = ta.Problem_area_passes_REPS__c;
                    tt.Problem_area_passes_Passes__c = ta.Problem_area_passes_Passes__c;
                    tt.Problem_area_passes_Tx_Setting_Min_Max__c = ta.Problem_area_passes_Tx_Setting_Min_Max__c;
                    tt.Thermage_Post_procedure_Details__c = ta.Thermage_Post_procedure_Details__c;
                    tt.Thermage_Post_procedure_Discomfort__c = ta.Thermage_Post_procedure_Discomfort__c;
                    tt.Thermage_Post_procedure_erythema__c = ta.Thermage_Post_procedure_erythema__c;
                    tt.Thermage_Post_procedure_swelling__c = ta.Thermage_Post_procedure_swelling__c;
                    
                    
                    listToInsert.add(tt);
                }
            }
            
            if(listToInsert.size()>0){
                upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
        
    }
    
    public static String createSculpsureTreatment(List<Sculpsure_Treatment__c> sculpsureList){
        try{
            List<Sculpsure_Treatment__c> listToInsert = new List<Sculpsure_Treatment__c>();
            String recId;
            for(Sculpsure_Treatment__c st : sculpsureList){
                if(st.BMI__c != '' || st.Pre_Tx_Photos_taken__c != null || st.Tx_Clicks_remaining_on_key_post_treatmen__c != '' || st.Clicks_on_key_prior_to_treatment__c != '' || st.Pre_Tx_of_PAC_s_used__c != '' || st.Tx_Area__c != '' || st.Pre_Tx_Date__c != null || st.BMI_Height_in__c != '' || st.BMI_Weight_lbs__c != '')
                {
                    Sculpsure_Treatment__c sc = new Sculpsure_Treatment__c();
                    sc.Id = st.Id;
                    sc.Chart__c = st.Chart__c;
                    sc.BMI__c = st.BMI__c;
                    sc.Pre_Tx_Photos_taken__c = st.Pre_Tx_Photos_taken__c;
                    sc.Tx_Clicks_remaining_on_key_post_treatmen__c = st.Tx_Clicks_remaining_on_key_post_treatmen__c;
                    sc.Clicks_on_key_prior_to_treatment__c= st.Clicks_on_key_prior_to_treatment__c;
                    sc.Pre_Tx_of_PAC_s_used__c = st.Pre_Tx_of_PAC_s_used__c;
                    sc.Tx_Area__c = st.Tx_Area__c;
                    sc.Pre_Tx_Date__c = st.Pre_Tx_Date__c;
                    sc.BMI_Height_in__c = st.BMI_Height_in__c;
                    sc.BMI_Weight_lbs__c = st.BMI_Weight_lbs__c;
                    listToInsert.add(sc);
                }
            }
            if(listToInsert.size()>0){
                upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    //added by Sunny
    public static String createMedicationAndAllergies(List<Medication_and_Allergies__c> medicationsList){
        try{
            List<Medication_and_Allergies__c> listToInsert = new List<Medication_and_Allergies__c>();
            String recId;
            for(Medication_and_Allergies__c ma : medicationsList){
                if( ma.Patient_Allergy__c != '' || ma.Patient_Notes__c != '' || ma.Patient_Current_Medication_Doseges__c != '' || ma.Patient_Current_Medication_Doseges_Notes__c != '' || ma.Message_Checkbox_1__c == true)
                {
                    
                    Medication_and_Allergies__c mc = new Medication_and_Allergies__c();
                    mc.Id = ma.Id;
                    mc.Chart__c = ma.Chart__c;
                    mc.Patient_Allergy__c = ma.Patient_Allergy__c;
                    mc.Patient_Notes__c = ma.Patient_Notes__c;
                    mc.Patient_Current_Medication_Doseges__c = ma.Patient_Current_Medication_Doseges__c;
                    mc.Patient_Current_Medication_Doseges_Notes__c = ma.Patient_Current_Medication_Doseges_Notes__c;
                    mc.Message_Checkbox_1__c = ma.Message_Checkbox_1__c;
                    mc.Medications_Allergies__c = ma.Medications_Allergies__c;
                    listToInsert.add(mc);
                }
                
            }
            if(listToInsert.size()>0){
                upsert listToInsert;
                recId = returnRecordId(listToInsert);
            }
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
        
    }
    
    public static String createIPLTreatment(List<IPL_Treatment__c> iplList){
        
        boolean createRecord = false;
        try{
            List<IPL_Treatment__c> listToInsert = new List<IPL_Treatment__c>();
            String recId;
            for(IPL_Treatment__c ip : iplList){
                if(ip.Photos_Taken__c == true  || ip.Safety_Eyewear_Applied__c == true || ip.Consents_Signed__c == true || ip.Lux_Lotion_Applied__c == true || ip.Recent_Sun_Exposure__c != null || ip.New_Medications_since_last_treatment__c != null || ip.Self_Tanner_or_Spray_Tanner_in_the_last__c != null || ip.Improvement_since_last_treatment__c != null || ip.Test_Spot_Performed__c != null || ip.BLT_Applied__c != null )
                {
                    
                    IPL_Treatment__c it = new IPL_Treatment__c();
                    it.Id = ip.Id;
                    it.Chart__c = ip.Chart__c;
                    it.Photos_Taken__c = ip.Photos_Taken__c;
                    it.Safety_Eyewear_Applied__c = ip.Safety_Eyewear_Applied__c;
                    it.Consents_Signed__c = ip.Consents_Signed__c;
                    it.Lux_Lotion_Applied__c =ip.Lux_Lotion_Applied__c;
                    it.Recent_Sun_Exposure__c = ip.Recent_Sun_Exposure__c;
                    it.New_Medications_since_last_treatment__c = ip.New_Medications_since_last_treatment__c;
                    it.Self_Tanner_or_Spray_Tanner_in_the_last__c = ip.Self_Tanner_or_Spray_Tanner_in_the_last__c;
                    it.Improvement_since_last_treatment__c = ip.Improvement_since_last_treatment__c; 
                    it.Test_Spot_Performed__c = ip.Test_Spot_Performed__c;
                    it.BLT_Applied__c = ip.BLT_Applied__c;
                    
                    listToInsert.add(it);
                    
                    
                    
                }
            }
            
            if(listToInsert.size()>0){
                if(createRecord == false){
                    insert listToInsert;
                    createRecord = true;
                    recId = returnRecordId(listToInsert);
                }else if(createRecord == true){
                    update listToInsert;
                    recId = returnRecordId(listToInsert);
                }
                
            }
            
            return recId;
            
        }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
}