public class createCosmeticRecordChartFlowHandler {
    
     public class FlowOutput {
        @InvocableVariable
        public Id recordId;
        
        public FlowOutput(Id recId) {
            this.recordId = recId;
        }
    }
    
    @InvocableMethod(label='Get list from flow')
    public static List<FlowOutput> genericRecordsList(List<SObject>recordsList){
        List<Sobject> recordListToSend = new List<Sobject>();
        List<FlowOutput> results = new List<FlowOutput>();
        
        for (SObject record : recordsList) {
            String objectType = record.getSObjectType().getDescribe().getName();
             System.debug('objectType=====>'+objectType);
            /*if (objectType == 'Chart__c') {
                recordListToSend.add(record);
                createChartRecords(recordListToSend); 
            }*/
            if (objectType == 'Aesthetic_Consult_Recommendations__c') {
                recordListToSend.add(record);
                String recId = createAestheticConsult(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if (objectType == 'CoolSculpting__c') {
                System.debug('this is calling');
                recordListToSend.add(record);
                String recId = createCoolsculptingConsult(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            
            if(objectType == 'Hormone_Primary_Health_Concerns__c'){
                recordListToSend.add(record);
                String recId = createHormonePrimaryHealthConcerns(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Tattoo_Removal_Consult__c'){
                recordListToSend.add(record);
                String recId = createTattooRemovalConsult(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Hair_Restoration_consult__c'){
                recordListToSend.add(record);
                String recId = CreateHairRestorationConsult(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Full_Patient_History__c'){
                recordListToSend.add(record);
                String recId = createFullPatientHistory(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Botox_Dysport__c'){
               recordListToSend.add(record);
               String recId = createBotoxDysport(recordListToSend);
               System.debug('recId==>'+recId);
               FlowOutput output = new FlowOutput(recId);
               results.add(output);
            }
            if(objectType == 'Follow_up__c'){
                recordListToSend.add(record);
                String recId = createFollowUp(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Dermal_Filler__c'){
                recordListToSend.add(record);
                String recId = createDermalFiller(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Dermaplaning__c'){
                recordListToSend.add(record);
                String recId = createDermaplaning(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Emsculpt__c'){
                recordListToSend.add(record);
                String recId = createEmsculpt(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Fractional_Laser__c'){
                recordListToSend.add(record);
                String recId = createFractionalLaser(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'IPL__c'){
                recordListToSend.add(record);
                String recId = createIPL(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Laser_Hair_Removal__c'){
                recordListToSend.add(record);
                String recId = createLaserHairRemoval(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Laser_Vein_removal__c'){
                recordListToSend.add(record);
                String recId = createLaserVeinRemoval(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Tattoo_Removal__c'){
                recordListToSend.add(record);
                String recId = createTattooRemoval(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Sculptra_body__c'){
                recordListToSend.add(record);
                String recId = createSculptraBody(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'SkinPen_Microneedling__c'){
                recordListToSend.add(record);
                String recId = createSkinpenMicroneedling(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'TruSculpt__c'){
                recordListToSend.add(record);
                String recId = createTrusculpt(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Vanquish__c'){
                recordListToSend.add(record);
                String recId = createVanquish(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'Weight_Loss__c'){
                recordListToSend.add(record);
                String recId = createWeightLossInjections(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
            if(objectType == 'General_Exam__c'){
                recordListToSend.add(record);
                String recId = createGeneralExam(recordListToSend);
                System.debug('recId==>'+recId);
                FlowOutput output = new FlowOutput(recId);
                results.add(output);
            }
        }
        return results;
    }
        
        public static String returnRecordId(List<Sobject> genericRecordList){
        
        if(genericRecordList != null && !genericRecordList.isEmpty()) {
            SObject firstRecord = genericRecordList.get(0);
            System.debug('recordId===>'+(String)firstRecord.get('Id'));
            return (String)firstRecord.get('Id');
        }
        return null;   
    }
    
    
    /*public static void createChartRecords(list<Chart__c> listChart)
    {
        System.debug('listChart===>'+listChart);
        List<Chart__c> insertList = new List<Chart__c>();
        for(Chart__c crt : listChart)
        {
            System.debug('Chart__c===>'+crt);
            Chart__c ch  = new Chart__c();
            if( crt.Internal_Patient_notes__c != '' || crt.Reason_for_visit_In_patient_s_words__c != '' || crt.Membership_consult_notes__c != '' )
            {
                system.debug('Inside if loop');
                //ch.Name = 'Test Chart';
                ch.Internal_Patient_notes__c = crt.Internal_Patient_notes__c;
                ch.Reason_for_visit_In_patient_s_words__c = crt.Reason_for_visit_In_patient_s_words__c;
                ch.Membership_consult_notes__c = crt.Membership_consult_notes__c;
                ch.Client__c = crt.Client__c;
                insertList.add(ch);
            }
            System.debug(crt.Internal_Patient_notes__c);
            System.debug(crt.Reason_for_visit_In_patient_s_words__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            insert insertList;
        }

    }
    */
    
    public static string createAestheticConsult(list<Aesthetic_Consult_Recommendations__c> listAesthetic)
    {
        System.debug('listAesthetic===>'+listAesthetic);
        List<Aesthetic_Consult_Recommendations__c> insertList = new List<Aesthetic_Consult_Recommendations__c>();
        String recId;
        for(Aesthetic_Consult_Recommendations__c acr : listAesthetic)
        {
            System.debug('Aesthetic_Consult_Recommendations__c===>'+acr);
            Aesthetic_Consult_Recommendations__c Ac  = new Aesthetic_Consult_Recommendations__c();
            if( acr.Membership_Consult_Notes__c != '' || acr.Aesthetic_Consult_Other_Notes__c != '' )
            {
                system.debug('Inside if loop');
                Ac.Membership_Consult_Notes__c = acr.Membership_Consult_Notes__c;
                ac.Id = acr.Id;
                Ac.Aesthetic_Consult_Other_Notes__c = acr.Aesthetic_Consult_Other_Notes__c;
                Ac.Chart__c = acr.Chart__c;
                insertList.add(Ac);
            }
            System.debug(acr.Membership_Consult_Notes__c);
            System.debug(acr.Aesthetic_Consult_Other_Notes__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertList);
        }
        
        return recId;

    }
    
    public static String createCoolsculptingConsult(list<CoolSculpting__c> listCoolsculpting)
    {
        System.debug(listCoolsculpting);
        List<CoolSculpting__c> insertList = new List<CoolSculpting__c>();
        String recId;
        for(CoolSculpting__c CS : listCoolsculpting)
        {
            System.debug('inner loop '+CS);

            CoolSculpting__c Cool  = new CoolSculpting__c();
            
            if( CS.Target_Comments__c != '' || CS.Target_Transform_Comments__c != '' || CS.Total_Transformation_Comments__c != '' || CS.Target_Savings__c != NULL || CS.Target_Transform_Savings__c != NULL || CS.Total_Transformation_Savings__c != NULL || CS.Target_Retail_Price__c != NULL || CS.Target_Transform_Retail_Price__c != NULL || CS.Total_Transformation_Retail_Price__c != NULL || CS.Target_Patient_Price__c != NULL || CS.Target_Transform_Patient_Price__c != NULL || CS.Total_Transformation_Patient_Price__c != NULL)
            {
                System.debug('inner iff ');
                Cool.Name = 'Test Coolsculpting Consult';
                Cool.Target_Comments__c = CS.Target_Comments__c;
                Cool.Id = CS.Id;
                Cool.Target_Transform_Comments__c = CS.Target_Transform_Comments__c;
                Cool.Total_Transformation_Comments__c = CS.Total_Transformation_Comments__c;
                Cool.Target_Savings__c = CS.Target_Savings__c;
                Cool.Target_Transform_Savings__c = CS.Target_Transform_Savings__c;
                Cool.Total_Transformation_Savings__c = CS.Total_Transformation_Savings__c;
                Cool.Target_Retail_Price__c = CS.Target_Retail_Price__c;
                Cool.Target_Transform_Retail_Price__c = CS.Target_Transform_Retail_Price__c;
                Cool.Total_Transformation_Retail_Price__c = CS.Total_Transformation_Retail_Price__c;
                Cool.Target_Patient_Price__c = CS.Target_Patient_Price__c;
                Cool.Target_Transform_Patient_Price__c = CS.Target_Transform_Patient_Price__c;
                Cool.Total_Transformation_Patient_Price__c = CS.Total_Transformation_Patient_Price__c;
                Cool.Chart__c = CS.Chart__c;
                insertList.add(Cool);
            }
            
        }
                        System.debug('insertList   '+insertList);

        if (!insertList.isEmpty())
        {
            upsert insertList;
            recId = returnRecordId(insertList);
           
        }
                System.debug('recId  '+recId);

         return recId;
    }
    
    public static String createTattooRemovalConsult(list<Tattoo_Removal_Consult__c> listTattRemoval)
    {
       try{
        System.debug(listTattRemoval);
        List<Tattoo_Removal_Consult__c> insertList = new List<Tattoo_Removal_Consult__c>();
        String recId;
        for(Tattoo_Removal_Consult__c trc : listTattRemoval)
        {
            
            if( trc.Discussed_with_Patient__c != '' || trc.Possible_Complications_Discussed__c != '' || trc.Tattoo_Treatment_Recommendation__c != '')
            {
              Tattoo_Removal_Consult__c tatt  = new Tattoo_Removal_Consult__c();
                tatt.Name = 'Test Tattoo Removal Consult';

                tatt.Discussed_with_Patient__c = trc.Discussed_with_Patient__c;
                tatt.Id = trc.Id;
                tatt.Possible_Complications_Discussed__c = trc.Possible_Complications_Discussed__c;
                tatt.Tattoo_Treatment_Recommendation__c = trc.Tattoo_Treatment_Recommendation__c;
                tatt.Chart__c = trc.Chart__c;
                insertList.add(tatt);
            }
        }
        if (!insertList.isEmpty())
        {
            upsert insertList;
            recId = returnRecordId(insertList);
        }
        
         return recId;
           
    }catch(exception e){
        System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
        return null;
    }
    }
    
    public static String CreateHairRestorationConsult(List<Hair_Restoration_consult__c>listHairRestoration)
    {
        
        System.debug('listHairRestoration===>'+listHairRestoration);
        
        List<Hair_Restoration_consult__c> listToInsertHairRestoration = new List<Hair_Restoration_consult__c>();
        String recId;
        for(Hair_Restoration_consult__c hrc : listHairRestoration){
            System.debug('Hair_Restoration_consult__c===>'+hrc);
            Hair_Restoration_consult__c hairRest = new Hair_Restoration_consult__c();
            
            if( hrc.Any_types_of_medications__c != null || hrc.Any_typesOf_medications__c != null || hrc.Are_you_taking_supplementation__c !=null ||hrc.compulsively_pulling_out_your_hair__c != null ||hrc.currently_being_treated_for_Eyelash__c != null || hrc.Dermatologist_medical_records__c != '' ||hrc.Describe_your_current_eyelashes__c !='' ||hrc.Diagnosed_with_any_form_of_skin_disease__c !='' ||hrc.Diagnosed_with_AUTOIMMUNE_scalp_disorder__c !=null || hrc.Diagnosed_with_thyroid_disease__c !=null || hrc.DiagnosedWith_any_form_of_skin_disease__c != null ||hrc.DiagnosedWith_thyroid_disease__c != null ||hrc.Do_you_excessively_rub_your_eyebrows__c != null || hrc.Do_you_excessively_rub_your_eyelashes__c != null || hrc.Do_you_have_a_history_of_low_iron__c != null || hrc.Do_you_wear_eyelash_extensions__c != null || hrc.Ever_been_evaluated_by_a_dermatologist__c != null || hrc.Expectations_with_eyelash_transplant__c != '' || hrc.EyeBrow_Hair_Loss_last_episode__c != '' || hrc.eyebrows_permanently_tattooed__c != null || hrc.Family_members_with_same_symptoms__c != null || hrc.FEMALE_Specific_Questions__c != null || hrc.First_Notice_Thinning_Of_Your_Eyebrows__c != null ||hrc.First_notice_thinning_of_your_eyelashes__c != '' ||hrc.For_how_long__c !='' ||hrc.General_Hair_Loss_Associated_features__c != null ||hrc.General_Hair_Loss_Current_Treatments__c != null || hrc.General_Hair_Loss_Location__c != null || hrc.General_Hair_Loss_Onset__c != null ||hrc.General_Hair_Loss_Past_Treatments__c != null || hrc.General_Hair_Loss_Signs_and_Symptoms__c != null ||hrc.General_Hair_Loss_Timing__c != null || hrc.General_Hair_Loss_Type_of_hair_loss__c != null ||hrc.Goals_and_expectations_with_eyebrow__c != '' ||hrc.Goals_and_expectations_with_facial_hair__c != '' ||hrc.Hair_Color__c != null ||hrc.Hair_Curl__c != null ||hrc.Hair_Density__c != null ||hrc.Hair_loss_are_most_bothersome__c != '' ||hrc.Hair_Loss_Assessment_Plan__c != null ||hrc.Hair_loss_classification__c != null ||hrc.Hair_Loss_currently_being_treated__c != '' ||hrc.Hair_Loss_Diagnosis__c != null ||hrc.Hair_loss_findings__c != null ||hrc.Hair_Pattern__c != null ||hrc.Hair_restoration_Counseling__c != null || hrc.Have_you_undergone_menopause__c != null ||hrc.History_of_chemotherapy_or_radiation__c != null ||hrc.History_of_over_EyeBrow_plucking__c != null || hrc.history_of_physical_trauma_to_eyelashes__c != null ||hrc.HPI_hair_loss_notes__c != '' ||hrc.Identify_any_specific_areas_of_interest__c != null || hrc.Laser_hair_removal_to_the_eyebrows__c != null || hrc.Laser_hair_removal_to_your_face__c !=null ||hrc.List_drug_name_and_dates_of_treatment__c != '' ||hrc.Noticed_any_redness_flaking_inflammation__c != null ||hrc.Noticed_redness_flaking_inflammation__c != null ||hrc.Please_explain_event_year__c != '' ||hrc.please_explain_event_year_EyeBrows__c != '' ||hrc.please_explain_event_year_For_Eyelash__c != '' ||hrc.Products_have_you_tried_for_Eyebrow__c != '' ||hrc.Pulling_out_your_eyebrow_hairs__c != null ||hrc.Pulling_out_your_eyelashes__c != null ||hrc.Redness_flaking_inflammation__c !=null ||hrc.Scalp_biopsy_results__c != '' ||hrc.Scalp_biopsy_to_evaluate_your_hair_loss__c != null ||hrc.Serious_illness_during_the_past_year__c != '' ||hrc.Skin_disease_such_alopecia_areata__c != null ||hrc.Thyroid_level_last_checked__c != null ||hrc.Thyroid_levelLast_checked__c != null ||hrc.Trichotillomania__c != null ||hrc.Tried_Latisse_Bimatoprost__c != null ||hrc.Wear_a_hairpiece_or_extensions__c != null ||hrc.what_illness_and_how_long__c != '' ||hrc.what_is_your_diagnosis__c != '' ||hrc.what_is_your_diagnosis_for_EyeBrow__c != '' ||hrc.what_is_your_diagnosis_When__c != '' ||hrc.What_is_yourDiagnosis_When__c != '' ||hrc.What_isYour_diagnosis__c != '' ||hrc.What_products_have_you_tried__c != '' ||hrc.What_productsHave_you_tried__c != '' ||hrc.When_was_your_last_blood_work_checked__c != null ||hrc.when_was_your_last_episode__c != '' ||hrc.which_medication_s_and_when__c != '' ||hrc.Which_medications_and_when__c != '' ||hrc.Your_last_episode_for_Eyelash_Hair_Loss__c != '' )
            {
              //  hairRest.Name = 'Test Hair Restoration Consult';
                hairRest.Any_types_of_medications__c = hrc.Any_types_of_medications__c;
                hairRest.Id = hrc.Id;
                hairRest.Any_typesOf_medications__c = hrc.Any_typesOf_medications__c;
                hairRest.Are_you_taking_supplementation__c = hrc.Are_you_taking_supplementation__c;  
                hairRest.compulsively_pulling_out_your_hair__c = hrc.compulsively_pulling_out_your_hair__c;
                hairRest.currently_being_treated_for_Eyelash__c =  hrc.currently_being_treated_for_Eyelash__c; 
                hairRest.Dermatologist_medical_records__c= hrc.Dermatologist_medical_records__c;
                hairRest.Describe_your_current_eyelashes__c =hrc.Describe_your_current_eyelashes__c;
                hairRest.Diagnosed_with_any_form_of_skin_disease__c = hrc.Diagnosed_with_any_form_of_skin_disease__c;
                hairRest.Diagnosed_with_AUTOIMMUNE_scalp_disorder__c = hrc.Diagnosed_with_AUTOIMMUNE_scalp_disorder__c; 
                hairRest.Diagnosed_with_thyroid_disease__c = hrc.Diagnosed_with_thyroid_disease__c; 
                hairRest.DiagnosedWith_any_form_of_skin_disease__c = hrc.DiagnosedWith_any_form_of_skin_disease__c;
                hairRest.DiagnosedWith_thyroid_disease__c = hrc.DiagnosedWith_thyroid_disease__c;
                hairRest.Do_you_excessively_rub_your_eyebrows__c = hrc.Do_you_excessively_rub_your_eyebrows__c;
                hairRest.Do_you_excessively_rub_your_eyelashes__c =hrc.Do_you_excessively_rub_your_eyelashes__c; 
                hairRest.Do_you_have_a_history_of_low_iron__c = hrc.Do_you_have_a_history_of_low_iron__c;
                hairRest.Do_you_wear_eyelash_extensions__c = hrc.Do_you_wear_eyelash_extensions__c;
                hairRest.Ever_been_evaluated_by_a_dermatologist__c = hrc.Ever_been_evaluated_by_a_dermatologist__c;
                hairRest.Expectations_with_eyelash_transplant__c = hrc.Expectations_with_eyelash_transplant__c;
                hairRest.EyeBrow_Hair_Loss_last_episode__c= hrc.EyeBrow_Hair_Loss_last_episode__c;
                hairRest.eyebrows_permanently_tattooed__c = hrc.eyebrows_permanently_tattooed__c;
                hairRest.Family_members_with_same_symptoms__c = hrc.Family_members_with_same_symptoms__c;
                hairRest.FEMALE_Specific_Questions__c = hrc.FEMALE_Specific_Questions__c;
                hairRest.First_Notice_Thinning_Of_Your_Eyebrows__c = hrc.First_Notice_Thinning_Of_Your_Eyebrows__c;
                hairRest.First_notice_thinning_of_your_eyelashes__c=  hrc.First_notice_thinning_of_your_eyelashes__c;
                hairRest.For_how_long__c = hrc.For_how_long__c;
                hairRest.General_Hair_Loss_Associated_features__c = hrc.General_Hair_Loss_Associated_features__c;
                hairRest.General_Hair_Loss_Current_Treatments__c = hrc.General_Hair_Loss_Current_Treatments__c;
                hairRest.General_Hair_Loss_Location__c = hrc.General_Hair_Loss_Location__c;
                hairRest.General_Hair_Loss_Onset__c = hrc.General_Hair_Loss_Onset__c;
                hairRest.General_Hair_Loss_Past_Treatments__c = hrc.General_Hair_Loss_Past_Treatments__c;
                hairRest.General_Hair_Loss_Signs_and_Symptoms__c = hrc.General_Hair_Loss_Signs_and_Symptoms__c;
                hairRest.General_Hair_Loss_Timing__c = hrc.General_Hair_Loss_Timing__c;
                hairRest.General_Hair_Loss_Type_of_hair_loss__c = hrc.General_Hair_Loss_Type_of_hair_loss__c;
                hairRest.Goals_and_expectations_with_eyebrow__c = hrc.Goals_and_expectations_with_eyebrow__c;
                hairRest.Goals_and_expectations_with_facial_hair__c = hrc.Goals_and_expectations_with_facial_hair__c;
                hairRest.Hair_Color__c = hrc.Hair_Color__c;
                hairRest.Hair_Curl__c = hrc.Hair_Curl__c;
                hairRest.Hair_Density__c = hrc.Hair_Density__c;
                hairRest.Hair_loss_are_most_bothersome__c = hrc.Hair_loss_are_most_bothersome__c;
                hairRest.Hair_Loss_Assessment_Plan__c = hrc.Hair_Loss_Assessment_Plan__c;
                hairRest.Hair_loss_classification__c = hrc.Hair_loss_classification__c;
                hairRest.Hair_Loss_currently_being_treated__c = hrc.Hair_Loss_currently_being_treated__c;
                hairRest.Hair_Loss_Diagnosis__c = hrc.Hair_Loss_Diagnosis__c;
                hairRest.Hair_loss_findings__c = hrc.Hair_loss_findings__c;
                hairRest.Hair_Pattern__c =  hrc.Hair_Pattern__c;
                hairRest.Hair_restoration_Counseling__c = hrc.Hair_restoration_Counseling__c;
                hairRest.Have_you_undergone_menopause__c = hrc.Have_you_undergone_menopause__c;
                hairRest.History_of_chemotherapy_or_radiation__c = hrc.History_of_chemotherapy_or_radiation__c;
                hairRest.History_of_over_EyeBrow_plucking__c = hrc.History_of_over_EyeBrow_plucking__c;
                hairRest.history_of_physical_trauma_to_eyelashes__c = hrc.history_of_physical_trauma_to_eyelashes__c;
                hairRest.HPI_hair_loss_notes__c = hrc.HPI_hair_loss_notes__c;
                hairRest.Identify_any_specific_areas_of_interest__c = hrc.Identify_any_specific_areas_of_interest__c;
                hairRest.Laser_hair_removal_to_the_eyebrows__c = hrc.Laser_hair_removal_to_the_eyebrows__c;
                hairRest.Laser_hair_removal_to_your_face__c = hrc.Laser_hair_removal_to_your_face__c;
                hairRest.List_drug_name_and_dates_of_treatment__c = hrc.List_drug_name_and_dates_of_treatment__c;
                hairRest.Noticed_any_redness_flaking_inflammation__c = hrc.Noticed_any_redness_flaking_inflammation__c;
                hairRest.Noticed_redness_flaking_inflammation__c = hrc.Noticed_redness_flaking_inflammation__c;
                hairRest.Please_explain_event_year__c = hrc.Please_explain_event_year__c;
                hairRest.please_explain_event_year_EyeBrows__c = hrc.please_explain_event_year_EyeBrows__c;
                hairRest.please_explain_event_year_For_Eyelash__c = hrc.please_explain_event_year_For_Eyelash__c;
                hairRest.Products_have_you_tried_for_Eyebrow__c = hrc.Products_have_you_tried_for_Eyebrow__c;
                hairRest.Pulling_out_your_eyebrow_hairs__c = hrc.Pulling_out_your_eyebrow_hairs__c;
                hairRest.Pulling_out_your_eyelashes__c = hrc.Pulling_out_your_eyelashes__c;
                hairRest.Redness_flaking_inflammation__c = hrc.Redness_flaking_inflammation__c;
                hairRest.Scalp_biopsy_results__c = hrc.Scalp_biopsy_results__c;
                hairRest.Scalp_biopsy_to_evaluate_your_hair_loss__c = hrc.Scalp_biopsy_to_evaluate_your_hair_loss__c;
                hairRest.Serious_illness_during_the_past_year__c = hrc.Serious_illness_during_the_past_year__c;
                hairRest.Skin_disease_such_alopecia_areata__c = hrc.Skin_disease_such_alopecia_areata__c;
                hairRest.Thyroid_level_last_checked__c = hrc.Thyroid_level_last_checked__c;
                hairRest.Thyroid_levelLast_checked__c = hrc.Thyroid_levelLast_checked__c;
                hairRest.Trichotillomania__c = hrc.Trichotillomania__c;
                hairRest.Tried_Latisse_Bimatoprost__c = hrc.Tried_Latisse_Bimatoprost__c;
                hairRest.Wear_a_hairpiece_or_extensions__c = hrc.Wear_a_hairpiece_or_extensions__c;
                hairRest.what_illness_and_how_long__c = hrc.what_illness_and_how_long__c;
                hairRest.what_is_your_diagnosis__c = hrc.what_is_your_diagnosis__c;
                hairRest.what_is_your_diagnosis_for_EyeBrow__c = hrc.what_is_your_diagnosis_for_EyeBrow__c;
                hairRest.what_is_your_diagnosis_When__c = hrc.what_is_your_diagnosis_When__c;
                hairRest.What_is_yourDiagnosis_When__c = hrc.What_is_yourDiagnosis_When__c;
                hairRest.What_isYour_diagnosis__c = hrc.What_isYour_diagnosis__c;
                hairRest.What_products_have_you_tried__c = hrc.What_products_have_you_tried__c;
                hairRest.What_productsHave_you_tried__c = hrc.What_productsHave_you_tried__c;
                hairRest.When_was_your_last_blood_work_checked__c = hrc.When_was_your_last_blood_work_checked__c;
                hairRest.when_was_your_last_episode__c = hrc.when_was_your_last_episode__c;
                hairRest.which_medication_s_and_when__c = hrc.which_medication_s_and_when__c;
                hairRest.Which_medications_and_when__c = hrc.Which_medications_and_when__c;
                hairRest.Your_last_episode_for_Eyelash_Hair_Loss__c = hrc.Your_last_episode_for_Eyelash_Hair_Loss__c;
                hairRest.Chart__c = hrc.Chart__c;
                listToInsertHairRestoration.add(hairRest);
                
            }
        }
        
        if(!listToInsertHairRestoration.isEmpty()){
            System.debug('listToInsertHairRestoration==>'+listToInsertHairRestoration);
            upsert listToInsertHairRestoration;
            recId = returnRecordId(listToInsertHairRestoration);
        }
        
        return recId;
    }
    
    public static String createHormonePrimaryHealthConcerns(List<Hormone_Primary_Health_Concerns__c> primaryHealthList)
    {
        
        
        List<Hormone_Primary_Health_Concerns__c> listToInsert = new List<Hormone_Primary_Health_Concerns__c>();
        String recId;
        for(Hormone_Primary_Health_Concerns__c hp : primaryHealthList){
            System.debug('Primary health Concern ====>'+ hp);
            Hormone_Primary_Health_Concerns__c hpc =  new Hormone_Primary_Health_Concerns__c();
            if( hp.Abdominal_areaWeight_gain_spare_tire__c != '' || hp.Decreased_sex_drive_libido__c == true || hp.DecreasedSex_drive_libido__c !=  '' ||hp.Difficult_recovering_from_workout__c != '' ||hp.Difficulty_recovering_from_workout__c == true ||hp.General_health_Acne__c  == true ||hp.General_health_Bloating__c == true ||hp.General_health_Brain_fog__c == true ||hp.General_health_Cold_hands_feet__c == true ||hp.General_health_Decreased_muscle_strength__c == true ||hp.General_health_Depressed_mood__c == true ||hp.General_health_Difficulty_having_orgasms__c == true ||hp.General_health_Dry_wrinkled_skin__c  == true ||hp.General_health_Erectile_dysfunction__c == true ||hp.General_health_Fatigue__c == true ||hp.General_health_Food_cravings__c == true ||hp.General_health_Hair_loss_breakage__c == true ||hp.General_health_Hot_flashes__c == true ||hp.General_health_Irritability__c == true ||hp.General_health_Memory_loss__c  == true ||hp.General_health_Migraines__c == true ||hp.General_health_Mood_changes_irritability__c == true ||hp.General_health_Night_sweats__c == true ||hp.General_health_Sleep_problems__c == true ||hp.General_health_Vaginal_dryness__c == true ||hp.General_health_Weight_gain__c == true ||hp.General_health_Weight_loss__c == true ||hp.General_healthOther__c == true ||hp.GeneralHealth_Acne__c != '' ||hp.GeneralHealth_Bloating__c != '' ||hp.GeneralHealth_Brain_fog__c != '' ||hp.GeneralHealth_Cold_hands_feet__c != '' ||hp.GeneralHealth_Decreased_muscle_strength__c != '' ||hp.GeneralHealth_Depressed_mood__c != '' ||hp.GeneralHealth_Difficulty_having_orgasms__c != '' ||hp.GeneralHealth_Dry_wrinkled_skin__c != '' ||hp.GeneralHealth_Erectile_dysfunction__c != '' ||hp.GeneralHealth_Fatigue__c != '' ||hp.GeneralHealth_Food_cravings__c != '' ||hp.GeneralHealth_Hair_loss_breakage__c != '' ||hp.GeneralHealth_Hot_flashes__c != '' ||hp.Abdominal_area_weight_gain_spare_tire__c == true ||hp.Abdomen_Other__c != '' ||hp.Abdomen_Soft_non_tender__c != '' ||hp.Chest_CTA_bilateral__c != '' ||hp.Chest_Heart_RRR__c != '' ||hp.Chest_Other__c != '' ||hp.GeneralHealth_Irritability__c != '' ||hp.GeneralHealth_Memory_loss__c != '' ||hp.GeneralHealth_Migraines__c != '' || hp.GeneralHealth_Mood_changes_irritability__c != '' ||hp.GeneralHealth_Night_sweats__c != '' ||hp.GeneralHealth_Sleep_problems__c != '' ||hp.GeneralHealth_Vaginal_dryness__c != '' ||hp.GeneralHealth_Weight_gain__c != '' ||hp.HEENT_Other__c != '' ||hp.HEENT_PERRLA__c != '' ||hp.HEENT_Throat_WML__c != '' ||hp.Hormone_25_Hydroxyvitamin_D__c != '' ||hp.Hormone_Assessment_Adrenal_Fatigue__c == true ||hp.Hormone_Assessment_Andropause__c == true ||hp.Hormone_Assessment_Fatigue__c == true ||hp.Hormone_Assessment_Menopause__c == true ||hp.Hormone_Assessment_Other__c == true ||hp.Hormone_Assessment_Sleep_Disorder__c == true ||hp.Hormone_Cortisol__c != '' ||hp.Hormone_DHEA_S__c != '' ||hp.Hormone_Estradiol_female__c != '' ||hp.Hormone_Estradiol_male__c != '' ||hp.Hormone_Free_T3__c != '' ||hp.Hormone_Insulin_fastin__c != '' ||hp.Hormone_PE_General_Appearance__c != null ||hp.Hormone_Plan_Estradiol_cream__c == true || hp.Hormone_Plan_Estradiol_patch__c == true ||hp.Hormone_Plan_Estradiol_oral__c == true || hp.Hormone_Plan_Estradiol_pellet__c == true || hp.Hormone_Plan_Progesterone_oral__c == true ||hp.Hormone_Plan_Progesterone_sublingual__c == true ||hp.Hormone_Plan_Testosterone__c == true || hp.Hormone_Plan_Testosterone_Lipoderm__c == true ||hp.Hormone_Plan_Testosterone_pellets__c == true || hp.Hormone_Plan_Thyroid_comp_dessicated__c == true ||hp.Hormone_Plan_Thyroid_NP__c == true ||hp.Hormone_Progesterone__c != '' ||hp.Hormone_PSA_free__c != '' ||hp.Hormone_PSA_total__c != '' ||hp.Hormone_Somatomedin_IGF_1__c != '' ||hp.Hormone_TSH__c != '' ||hp.HormoneAssessment_Adrenal_Fatigue__c != '' ||hp.HormoneAssessment_Andropause__c != '' ||hp.HormoneAssessment_Fatigue__c != '' ||hp.HormoneAssessment_Menopause__c != '' ||hp.HormoneAssessment_Other__c != '' ||hp.HormoneAssessment_Sleep_Disorder__c != '' ||hp.HormonePlan_Estradiol_cream__c != '' ||hp.HormonePlan_Estradiol_oral__c != '' ||hp.HormonePlan_Progesterone_sublingual__c != '' ||hp.HormonePlan_Testosterone__c != '' ||hp.HormonePlan_Testosterone_Lipoderm__c != '' ||hp.HormonePlan_Testosterone_pellets__c != '' ||hp.HormonePlan_Thyroid_comp_dessicated__c != '' ||hp.HormonePlan_Thyroid_NP__c != '' ||hp.Joint_pain_muscle_aches__c == true ||hp.JointPain_muscle_aches__c != '' ||hp.Neuro_Other__c == true ||hp.Neuro_Other_Notes__c != '' ||hp.Neuro_UE_LE_strength_grossly_intact__c == true ||hp.NeuroDTR_without_hyperreflexia_asymmetry__c == true ||hp.NeuroUE_LE_strength_grossly_intact__c != '' ||hp.Office_Visit_Follow_Up__c != null ||hp.PE_Abdomen_Other__c == true ||hp.PE_Abdomen_Soft_non_tender__c == true ||hp.PE_Chest_CTA_bilateral__c == true ||hp.PE_Chest_Heart_RRR__c == true ||hp.PE_Chest_Other__c == true ||hp.PE_HEENT_Other__c == true ||hp.PE_HEENT_PERRLA__c == true ||hp.PE_HEENT_Throat_WML__c == true ||hp.PE_Vascular_Distal_pulses_intact__c == true ||hp.PE_Vascular_Dorsalis_Pedis_absent__c == true ||hp.PE_Vascular_Other__c == true ||hp.Phone_Follow_up__c != null ||hp.Prior_Treatment_Cytomel__c == true ||hp.Prior_Treatment_Dessicated_Thyroid__c == true ||hp.Prior_Treatment_Diet__c == true ||hp.PriorTreatment_Estradiol__c != '' ||hp.PriorTreatment_Medical_Weight_Loss__c != '' ||hp.PriorTreatment_Other__c != '' ||hp.PriorTreatment_Premarin__c != '' ||hp.PriorTreatment_Progestin__c != '' ||hp.PriorTreatment_Synthroid__c != '' ||hp.PriorTreatment_Testosterone__c != '' ||hp.Testosterone_Free_female__c != '' ||hp.Testosterone_Free_male__c != '' ||hp.Testosterone_Total__c != '' ||hp.Vascular_Distal_pulses_intact__c != '' ||hp.Vascular_Dorsalis_Pedis_absent__c != '' ||hp.Vascular_Other__c != '' ||hp.Vital_Pulse__c != '' ||hp.Vital_Respiration_Rate__c != '' ||hp.Vital_Temperature__c != '' ||hp.Weight_loss_how_much__c != ''  ||hp.HormonePlan_Estradiol_patch__c != '' ||hp.HormonePlan_Estradiol_pellet__c != '' ||hp.HormonePlan_Progesterone_oral__c != '' ||hp.NeuroDTRwithout_hyperreflexia_asymmetry__c != '' ||hp.PriorTreatment_Cytomel__c != '' ||hp.PriorTreatment_Dessicated_Thyroid__c != '' ||hp.PriorTreatment_Diet__c != '' || hp.Hormone_Plan_Thyroid_Armour__c == true || hp.HormonePlan_Thyroid_Armour__c == '' || hp.Hormone_Plan_DHEA__c == true || hp.HormonePlan_DHEA__c == '' || hp.Hormone_Plan_DHEA_Pregnenolene__c == true || hp.HormonePlan_DHEA_Pregnenolene__c == '' || hp.Hormone_Plan_VIT_D3__c == true || hp.HormonePlan_VIT_D3__c == '' || hp.Hormone_Plan_VIT_D3_ADK__c == true || hp.HormonePlan_VIT_D3_ADK__c == '' || hp.Hormone_Plan_VIT_D3_D3_K2__c == true || hp.HormonePlan_VIT_D3_D3_K2__c == '' || hp.Hormone_Plan_CoQ_10__c == true || hp.HormonePlan_CoQ_10__c =='' || hp.Hormone_Plan_DIM__c == true || hp.HormonePlan_DIM__c == '' || hp.Hormone_Plan_Aged_Garlic__c == true || hp.HormonePlan_Aged_Garlic__c == '' || hp.HormonePlan_Fish_Oil__c == '' || hp.Hormone_Plan_Fish_Oil__c == true || hp.HormonePlan_Iodine__c == '' || hp.Hormone_Plan_Iodine__c == true || hp.Hormone_Plan_Niacin__c == true || hp.HormonePlan_Niacin__c == '' || hp.Hormone_Plan_Ace_Inhibitor__c == true || hp.HormonePlan_Ace_Inhibitor__c == '' ||hp.Hormone_Plan_Other__c == true || hp.HormonePlan_Other__c == '' )
            {
                hpc.Name = 'Test Hormone Therapy Consult';
                hpc.Abdominal_areaWeight_gain_spare_tire__c = hp.Abdominal_areaWeight_gain_spare_tire__c;
                hpc.Id = hp.Id;
                hpc.Decreased_sex_drive_libido__c = hp.Decreased_sex_drive_libido__c;
                hpc.DecreasedSex_drive_libido__c = hp.DecreasedSex_drive_libido__c;
                hpc.Difficult_recovering_from_workout__c = hp.Difficult_recovering_from_workout__c;
                hpc.Difficulty_recovering_from_workout__c = hp.Difficulty_recovering_from_workout__c;
                hpc.General_health_Acne__c = hp.General_health_Acne__c;
                hpc.General_health_Bloating__c = hp.General_health_Bloating__c;
                hpc.General_health_Brain_fog__c = hp.General_health_Brain_fog__c;
                hpc.General_health_Cold_hands_feet__c = hp.General_health_Cold_hands_feet__c;
                hpc.General_health_Decreased_muscle_strength__c = hp.General_health_Decreased_muscle_strength__c;
                hpc.General_health_Depressed_mood__c = hp.General_health_Depressed_mood__c;
                hpc.General_health_Difficulty_having_orgasms__c = hp.General_health_Difficulty_having_orgasms__c;
                hpc.General_health_Dry_wrinkled_skin__c = hp.General_health_Dry_wrinkled_skin__c;
                hpc.General_health_Erectile_dysfunction__c = hp.General_health_Erectile_dysfunction__c;
                hpc.General_health_Fatigue__c = hp.General_health_Fatigue__c;
                hpc.General_health_Food_cravings__c = hp.General_health_Food_cravings__c;
                hpc.General_health_Hair_loss_breakage__c = hp.General_health_Hair_loss_breakage__c;
                hpc.General_health_Hot_flashes__c = hp.General_health_Hot_flashes__c;
                hpc.General_health_Irritability__c = hp.General_health_Irritability__c;
                hpc.General_health_Memory_loss__c = hp.General_health_Memory_loss__c;
                hpc.General_health_Migraines__c = hp.General_health_Migraines__c;
                hpc.General_health_Mood_changes_irritability__c = hp.General_health_Mood_changes_irritability__c;
                hpc.General_health_Night_sweats__c = hp.General_health_Night_sweats__c;
                hpc.General_health_Sleep_problems__c = hp.General_health_Sleep_problems__c;
                hpc.General_health_Vaginal_dryness__c = hp.General_health_Vaginal_dryness__c;
                hpc.General_health_Weight_gain__c = hp.General_health_Weight_gain__c;
                hpc.General_health_Weight_loss__c = hp.General_health_Weight_loss__c;
                hpc.General_healthOther__c = hp.General_healthOther__c;
                hpc.GeneralHealth_Acne__c = hp.GeneralHealth_Acne__c;
                hpc.GeneralHealth_Bloating__c = hp.GeneralHealth_Bloating__c;
                hpc.GeneralHealth_Brain_fog__c = hp.GeneralHealth_Brain_fog__c;
                hpc.GeneralHealth_Cold_hands_feet__c = hp.GeneralHealth_Cold_hands_feet__c;
                hpc.GeneralHealth_Decreased_muscle_strength__c = hp.GeneralHealth_Decreased_muscle_strength__c;
                hpc.GeneralHealth_Depressed_mood__c=hp.GeneralHealth_Depressed_mood__c;
                hpc.GeneralHealth_Difficulty_having_orgasms__c = hp.GeneralHealth_Difficulty_having_orgasms__c;
                hpc.GeneralHealth_Dry_wrinkled_skin__c =hp.GeneralHealth_Dry_wrinkled_skin__c;
                hpc.GeneralHealth_Erectile_dysfunction__c = hp.GeneralHealth_Erectile_dysfunction__c;
                hpc.GeneralHealth_Fatigue__c = hp.GeneralHealth_Fatigue__c;
                hpc.GeneralHealth_Food_cravings__c = hp.GeneralHealth_Food_cravings__c;  
                hpc.GeneralHealth_Hair_loss_breakage__c = hp.GeneralHealth_Hair_loss_breakage__c;
                hpc.GeneralHealth_Hot_flashes__c = hp.GeneralHealth_Hot_flashes__c;
                hpc.Abdominal_area_weight_gain_spare_tire__c = hp.Abdominal_area_weight_gain_spare_tire__c;
                hpc.Abdomen_Other__c = hp.Abdomen_Other__c;
                hpc.Abdomen_Soft_non_tender__c = hp.Abdomen_Soft_non_tender__c;
                hpc.Chest_CTA_bilateral__c = hp.Chest_CTA_bilateral__c;
                hpc.Chest_Heart_RRR__c = hp.Chest_Heart_RRR__c;
                hpc.Chest_Other__c = hp.Chest_Other__c;
                hpc.GeneralHealth_Irritability__c = hp.GeneralHealth_Irritability__c;
                hpc.GeneralHealth_Memory_loss__c = hp.GeneralHealth_Memory_loss__c;
                hpc.GeneralHealth_Migraines__c = hp.GeneralHealth_Migraines__c;
                hpc.GeneralHealth_Mood_changes_irritability__c = hp.GeneralHealth_Mood_changes_irritability__c;
                hpc.GeneralHealth_Night_sweats__c = hp.GeneralHealth_Night_sweats__c;
                hpc.GeneralHealth_Sleep_problems__c = hp.GeneralHealth_Sleep_problems__c;
                hpc.GeneralHealth_Vaginal_dryness__c = hp.GeneralHealth_Vaginal_dryness__c;
                hpc.GeneralHealth_Weight_gain__c = hp.GeneralHealth_Weight_gain__c;
                hpc.HEENT_Other__c = hp.HEENT_Other__c;
                hpc.HEENT_PERRLA__c = hp.HEENT_PERRLA__c;
                hpc.HEENT_Throat_WML__c = hp.HEENT_Throat_WML__c;
                hpc.Hormone_25_Hydroxyvitamin_D__c = hp.Hormone_25_Hydroxyvitamin_D__c;
                hpc.Hormone_Assessment_Adrenal_Fatigue__c = hp.Hormone_Assessment_Adrenal_Fatigue__c;
                hpc.Hormone_Assessment_Andropause__c = hp.Hormone_Assessment_Andropause__c;
                hpc.Hormone_Assessment_Fatigue__c = hp.Hormone_Assessment_Fatigue__c;
                hpc.Hormone_Assessment_Menopause__c =  hp.Hormone_Assessment_Menopause__c;
                hpc.Hormone_Assessment_Other__c = hp.Hormone_Assessment_Other__c;
                hpc.Hormone_Assessment_Sleep_Disorder__c = hp.Hormone_Assessment_Sleep_Disorder__c;
                hpc.Hormone_Cortisol__c = hp.Hormone_Cortisol__c;
                hpc.Hormone_DHEA_S__c = hp.Hormone_DHEA_S__c;
                hpc.Hormone_Estradiol_female__c =  hp.Hormone_Estradiol_female__c;
                hpc.Hormone_Estradiol_male__c = hp.Hormone_Estradiol_male__c;
                hpc.Hormone_Free_T3__c = hp.Hormone_Free_T3__c;
                hpc.Hormone_Insulin_fastin__c = hp.Hormone_Insulin_fastin__c;
                hpc.Hormone_PE_General_Appearance__c = hp.Hormone_PE_General_Appearance__c;
                hpc.Hormone_Plan_Estradiol_cream__c = hp.Hormone_Plan_Estradiol_cream__c;
                hpc.Hormone_Plan_Estradiol_patch__c = hp.Hormone_Plan_Estradiol_patch__c;
                hpc.Hormone_Plan_Estradiol_oral__c = hp.Hormone_Plan_Estradiol_oral__c;
                hpc.Hormone_Plan_Estradiol_pellet__c = hp.Hormone_Plan_Estradiol_pellet__c;
                hpc.Hormone_Plan_Progesterone_oral__c = hp.Hormone_Plan_Progesterone_oral__c;
                hpc.Hormone_Plan_Progesterone_sublingual__c = hp.Hormone_Plan_Progesterone_sublingual__c;
                hpc.Hormone_Plan_Testosterone__c = hp.Hormone_Plan_Testosterone__c;
                hpc.Hormone_Plan_Testosterone_Lipoderm__c = hp.Hormone_Plan_Testosterone_Lipoderm__c;
                hpc.Hormone_Plan_Testosterone_pellets__c = hp.Hormone_Plan_Testosterone_pellets__c;
                hpc.Hormone_Plan_Thyroid_comp_dessicated__c = hp.Hormone_Plan_Thyroid_comp_dessicated__c;
                hpc.Hormone_Plan_Thyroid_NP__c = hp.Hormone_Plan_Thyroid_NP__c;
                hpc.Hormone_Progesterone__c = hp.Hormone_Progesterone__c;
                hpc.Hormone_PSA_free__c = hp.Hormone_PSA_free__c;
                hpc.Hormone_PSA_total__c = hp.Hormone_PSA_total__c;
                hpc.Hormone_Somatomedin_IGF_1__c = hp.Hormone_Somatomedin_IGF_1__c;
                hpc.Hormone_TSH__c = hp.Hormone_TSH__c;
                hpc.HormoneAssessment_Adrenal_Fatigue__c =  hp.HormoneAssessment_Adrenal_Fatigue__c;
                hpc.HormoneAssessment_Andropause__c = hp.HormoneAssessment_Andropause__c;
                hpc.HormoneAssessment_Fatigue__c = hp.HormoneAssessment_Fatigue__c;
                hpc.HormoneAssessment_Menopause__c = hp.HormoneAssessment_Menopause__c;
                hpc.HormoneAssessment_Other__c = hp.HormoneAssessment_Other__c;
                hpc.HormoneAssessment_Sleep_Disorder__c = hp.HormoneAssessment_Sleep_Disorder__c;
                hpc.HormonePlan_Estradiol_cream__c = hp.HormonePlan_Estradiol_cream__c;
                hpc.HormonePlan_Estradiol_oral__c = hp.HormonePlan_Estradiol_oral__c;
                hpc.HormonePlan_Progesterone_sublingual__c =hp.HormonePlan_Progesterone_sublingual__c;
                hpc.HormonePlan_Testosterone__c = hp.HormonePlan_Testosterone__c;
                hpc.HormonePlan_Testosterone_Lipoderm__c = hp.HormonePlan_Testosterone_Lipoderm__c;
                hpc.HormonePlan_Testosterone_pellets__c = hp.HormonePlan_Testosterone_pellets__c;
                hpc.HormonePlan_Thyroid_comp_dessicated__c = hp.HormonePlan_Thyroid_comp_dessicated__c;
                hpc.HormonePlan_Thyroid_NP__c = hp.HormonePlan_Thyroid_NP__c;
                hpc.Joint_pain_muscle_aches__c = hp.Joint_pain_muscle_aches__c;
                hpc.JointPain_muscle_aches__c = hp.JointPain_muscle_aches__c;
                hpc.Neuro_Other__c =  hp.Neuro_Other__c;
                hpc.Neuro_Other_Notes__c = hp.Neuro_Other_Notes__c;
                hpc.Neuro_UE_LE_strength_grossly_intact__c = hp.Neuro_UE_LE_strength_grossly_intact__c;
                hpc.NeuroDTR_without_hyperreflexia_asymmetry__c = hp.NeuroDTR_without_hyperreflexia_asymmetry__c;
                hpc.NeuroUE_LE_strength_grossly_intact__c = hp.NeuroUE_LE_strength_grossly_intact__c;
                hpc.Office_Visit_Follow_Up__c = hp.Office_Visit_Follow_Up__c;
                hpc.PE_Abdomen_Other__c = hp.PE_Abdomen_Other__c;
                hpc.PE_Abdomen_Soft_non_tender__c = hp.PE_Abdomen_Soft_non_tender__c;
                hpc.PE_Chest_CTA_bilateral__c = hp.PE_Chest_CTA_bilateral__c;
                hpc.PE_Chest_Heart_RRR__c = hp.PE_Chest_Heart_RRR__c;
                hpc.PE_Chest_Other__c = hp.PE_Chest_Other__c;
                hpc.PE_HEENT_Other__c = hp.PE_HEENT_Other__c;
                hpc.PE_HEENT_PERRLA__c = hp.PE_HEENT_PERRLA__c;
                hpc.PE_HEENT_Throat_WML__c = hp.PE_HEENT_Throat_WML__c;
                hpc.PE_Vascular_Distal_pulses_intact__c = hp.PE_Vascular_Distal_pulses_intact__c;
                hpc.PE_Vascular_Dorsalis_Pedis_absent__c = hp.PE_Vascular_Dorsalis_Pedis_absent__c;
                hpc.PE_Vascular_Other__c = hp.PE_Vascular_Other__c;
                hpc.Phone_Follow_up__c = hp.Phone_Follow_up__c;
                hpc.Prior_Treatment_Cytomel__c = hp.Prior_Treatment_Cytomel__c;
                hpc.Prior_Treatment_Dessicated_Thyroid__c = hp.Prior_Treatment_Dessicated_Thyroid__c;
                hpc.Prior_Treatment_Diet__c = hp.Prior_Treatment_Diet__c;
                hpc.PriorTreatment_Estradiol__c =   hp.PriorTreatment_Estradiol__c;
                hpc.PriorTreatment_Medical_Weight_Loss__c = hp.PriorTreatment_Medical_Weight_Loss__c;
                hpc.PriorTreatment_Other__c = hp.PriorTreatment_Other__c;
                hpc.PriorTreatment_Premarin__c = hp.PriorTreatment_Premarin__c;
                hpc.PriorTreatment_Progestin__c = hp.PriorTreatment_Progestin__c;
                hpc.PriorTreatment_Synthroid__c = hp.PriorTreatment_Synthroid__c;
                hpc.PriorTreatment_Testosterone__c = hp.PriorTreatment_Testosterone__c;
                hpc.Testosterone_Free_female__c = hp.Testosterone_Free_female__c;
                hpc.Testosterone_Free_male__c = hp.Testosterone_Free_male__c;
                hpc.Testosterone_Total__c = hp.Testosterone_Total__c;
                hpc.Vascular_Distal_pulses_intact__c = hp.Vascular_Distal_pulses_intact__c;
                hpc.Vascular_Dorsalis_Pedis_absent__c = hp.Vascular_Dorsalis_Pedis_absent__c;
                hpc.Vascular_Other__c =  hp.Vascular_Other__c;
                hpc.Vital_Pulse__c = hp.Vital_Pulse__c;
                hpc.Vital_Respiration_Rate__c = hp.Vital_Respiration_Rate__c;
                hpc.Vital_Temperature__c = hp.Vital_Temperature__c;
                hpc.Weight_loss_how_much__c = hp.Weight_loss_how_much__c;
                hpc.HormonePlan_Estradiol_patch__c = hp.HormonePlan_Estradiol_patch__c;
                hpc.HormonePlan_Estradiol_pellet__c = hp.HormonePlan_Estradiol_pellet__c;
                hpc.HormonePlan_Progesterone_oral__c = hp.HormonePlan_Progesterone_oral__c;
                hpc.NeuroDTRwithout_hyperreflexia_asymmetry__c = hp.NeuroDTRwithout_hyperreflexia_asymmetry__c;
                hpc.PriorTreatment_Cytomel__c = hp.PriorTreatment_Cytomel__c;
                hpc.PriorTreatment_Dessicated_Thyroid__c = hp.PriorTreatment_Dessicated_Thyroid__c;
                hpc.PriorTreatment_Diet__c = hp.PriorTreatment_Diet__c;
                hpc.Chart__c = hp.Chart__c;
                hpc.Hormone_Plan_Thyroid_Armour__c  = hp.Hormone_Plan_Thyroid_Armour__c;
                hpc.HormonePlan_Thyroid_Armour__c = hp.HormonePlan_Thyroid_Armour__c;
                hpc.Hormone_Plan_DHEA__c = hp.Hormone_Plan_DHEA__c;
                hpc.HormonePlan_DHEA__c = hp.HormonePlan_DHEA__c;
                hpc.Hormone_Plan_DHEA_Pregnenolene__c = hp.Hormone_Plan_DHEA_Pregnenolene__c;
                hpc.HormonePlan_DHEA_Pregnenolene__c = hp.HormonePlan_DHEA_Pregnenolene__c;
                hpc.Hormone_Plan_VIT_D3__c = hp.Hormone_Plan_VIT_D3__c;
                hpc.HormonePlan_VIT_D3__c = hp.HormonePlan_VIT_D3__c;
                hpc.Hormone_Plan_VIT_D3_ADK__c = hp.Hormone_Plan_VIT_D3_ADK__c;
                hpc.HormonePlan_VIT_D3_ADK__c = hp.HormonePlan_VIT_D3_ADK__c;
                hpc.Hormone_Plan_VIT_D3_D3_K2__c = hp.Hormone_Plan_VIT_D3_D3_K2__c;
                hpc.HormonePlan_VIT_D3_D3_K2__c = hp.HormonePlan_VIT_D3_D3_K2__c;
                hpc.Hormone_Plan_CoQ_10__c = hp.Hormone_Plan_CoQ_10__c;
                hpc.HormonePlan_CoQ_10__c = hp.HormonePlan_CoQ_10__c;
                hpc.Hormone_Plan_DIM__c = hp.Hormone_Plan_DIM__c;
                hpc.HormonePlan_DIM__c = hp.HormonePlan_DIM__c;
                hpc.Hormone_Plan_Aged_Garlic__c = hp.Hormone_Plan_Aged_Garlic__c;
                hpc.HormonePlan_Aged_Garlic__c = hp.HormonePlan_Aged_Garlic__c;
                hpc.HormonePlan_Fish_Oil__c = hp.HormonePlan_Fish_Oil__c;
                hpc.Hormone_Plan_Fish_Oil__c = hp.Hormone_Plan_Fish_Oil__c;
                hpc.HormonePlan_Iodine__c = hp.HormonePlan_Iodine__c;
                hpc.Hormone_Plan_Iodine__c = hp.Hormone_Plan_Iodine__c;
                hpc.Hormone_Plan_Niacin__c = hp.Hormone_Plan_Niacin__c;
                hpc.HormonePlan_Niacin__c = hp.HormonePlan_Niacin__c;
                hpc.Hormone_Plan_Ace_Inhibitor__c = hp.Hormone_Plan_Ace_Inhibitor__c;
                hpc.HormonePlan_Ace_Inhibitor__c = hp.HormonePlan_Ace_Inhibitor__c;
                hpc.Hormone_Plan_Other__c = hp.Hormone_Plan_Other__c;
                hpc.HormonePlan_Other__c = hp.HormonePlan_Other__c;
                
                listToInsert.add(hpc);
            }
        }
        if(!listToInsert.isEmpty()){
            System.debug('Primary health listToInsert ====>'+listToInsert);
            upsert listToInsert;
            recId = returnRecordId(listToInsert);
        }
        return recId;
    }


    public static String createFullPatientHistory(list<Full_Patient_History__c> listFullPatient)
    {
        System.debug('listFullPatient===>'+listFullPatient);
        List<Full_Patient_History__c> insertList = new List<Full_Patient_History__c>();
        String recId;
        for(Full_Patient_History__c ful : listFullPatient)
        {
            System.debug('Full_Patient_History__c===>'+ful);
            Full_Patient_History__c ph  = new Full_Patient_History__c();
            if ( ful.Areas_of_Interest_Anti_Aging__c == TRUE ||ful.Areas_of_Interest_Botox_Dysport__c == TRUE ||ful.Areas_of_Interest_Brown_Spots__c == TRUE || ful.Areas_of_Interest_Dermal_Fillers__c == TRUE ||ful.Areas_of_Interest_Facials__c == TRUE ||ful.Areas_of_Interest_Laser_Hair_Removal__c == TRUE ||ful.Areas_of_Interest_None__c == TRUE ||ful.Areas_of_Interest_Other__c == TRUE ||ful.Areas_of_Interest_Skin_Rejuvenation__c == TRUE ||ful.Areas_of_Interest_Spider_Veins__c == TRUE ||ful.Areas_of_Interest_Tattoo_Removal__c == TRUE ||ful.Areas_of_Interest_Weight_Management__c == TRUE ||ful.AreasOf_Interest_Anti_Aging__c != '' ||ful.AreasOf_Interest_Botox_Dysport__c != '' ||ful.AreasOf_Interest_Brown_Spots__c != '' ||ful.AreasOf_Interest_Dermal_Fillers__c != '' ||ful.AreasOf_Interest_Facials__c != '' ||ful.AreasOf_Interest_Laser_Hair_Removal__c != '' ||ful.AreasOf_Interest_None__c != '' ||ful.AreasOf_Interest_Other__c != '' ||ful.AreasOf_Interest_Skin_Rejuvenation__c != '' ||ful.AreasOf_Interest_Spider_Veins__c != '' ||ful.AreasOf_Interest_Tattoo_Removal__c != '' ||ful.AreasOf_Interest_Weight_Management__c != '' ||ful.Blood_clots_Phlebitis_Bleeding_Disorders__c == TRUE ||ful.BloodClots_Phlebitis_Bleeding_Disorders__c != '' ||ful.Chemotherapy_radiation_theraphy__c == TRUE ||ful.ChemotherapyRadiation_theraphy__c != '' ||ful.History_Of_Accutane__c == TRUE ||ful.History_Of_Acne_Medication__c == TRUE ||ful.History_Of_Antibiotics__c == TRUE ||ful.History_Of_Asthma__c == TRUE ||ful.History_Of_Autoimmune_Disorders__c == TRUE ||ful.History_Of_Blood_Thinner__c == TRUE ||ful.History_Of_Cancer_precancerous_lesions__c == TRUE ||ful.History_Of_Currently_Breastfeeding__c == TRUE ||ful.History_Of_Food_Allergies__c == TRUE ||ful.History_Of_Herbal_Supplements__c == TRUE ||ful.History_Of_Hernias__c == TRUE ||ful.History_Of_Herpes_Virus_Cold_Sore__c == TRUE ||ful.History_Of_Hip_Replacement__c == TRUE ||ful.History_Of_HIV__c == TRUE ||ful.History_Of_Internal_Metal_Devices__c == TRUE ||ful.History_Of_Keliod_Hypertrophic_Scarring__c == TRUE ||ful.History_Of_Latex_Allergies__c == TRUE ||ful.History_Of_Lupus__c == TRUE ||ful.History_Of_Lymph_Node_Removal__c == TRUE ||ful.History_Of_Lymphedemia__c == TRUE ||ful.History_Of_Multiple_Sclerosis__c == TRUE ||ful.History_Of_Numbness_in_the_area__c == TRUE ||ful.History_Of_Oral_Contraceptives__c == TRUE ||ful.History_Of_Past_Surgeries__c == TRUE ||ful.History_Of_Permanent_Make_up__c == TRUE ||ful.History_Of_Polycystic_Ovarian_Syndrome__c == TRUE ||ful.History_Of_Present_Scarring__c != '' ||ful.Pregnant_Actively_trying_to_get__c == TRUE ||ful.History_Of_Retin_A_or_Generics__c == TRUE ||ful.History_Of_Sarcoidosis__c == TRUE ||ful.History_Of_Scleroderma__c == TRUE ||ful.History_Of_Seizures_Epilepsy__c == TRUE ||ful.History_Of_Skin_Disorders__c == TRUE ||ful.History_Of_Varicose_Veins__c == TRUE ||ful.History_Of_Vitiligo__c == TRUE ||ful.HistoryOf_Accutane__c != '' ||ful.HistoryOf_Acne_Medication__c != '' ||ful.HistoryOf_Antibiotics__c != '' ||ful.HistoryOf_Asthma__c != '' ||ful.HistoryOf_Autoimmune_Disorders__c != '' ||ful.HistoryOf_Blood_Thinner__c != '' ||ful.HistoryOf_Cancer_precancerous_lesions__c != '' ||ful.HistoryOf_Currently_Breastfeeding__c != '' ||ful.HistoryOf_Food_Allergies__c != '' ||ful.HistoryOf_Herbal_Supplements__c != '' ||ful.HistoryOf_Hernias__c != '' ||ful.HistoryOf_Herpes_Virus_Cold_Sore__c != '' ||ful.HistoryOf_Hip_Replacement__c != '' ||ful.HistoryOf_HIV__c != '' ||ful.HistoryOf_Internal_Metal_Devices__c != '' ||ful.HistoryOf_Keliod_Hypertrophic_Scarring__c != '' ||ful.HistoryOf_Latex_Allergies__c != '' ||ful.HistoryOf_Lupus__c != '' ||ful.HistoryOf_Lymph_Node_Removal__c != '' ||ful.HistoryOf_Past_Surgeries__c != '' ||ful.HistoryOf_Oral_Contraceptives__c != '' ||ful.HistoryOf_Numbness_in_the_area__c != '' ||ful.HistoryOf_Multiple_Sclerosis__c != '' ||ful.HistoryOf_Lymphedemia__c != '' ||ful.HistoryOf_Permanent_Make_up__c != '' ||ful.HistoryOf_Polycystic_Ovarian_Syndrome__c != '' ||ful.PregnantActively_trying_to_get__c != '' ||ful.HistoryOf_Present_Scarring__c == TRUE ||ful.HistoryOf_Retin_A_or_Generics__c != '' ||ful.HistoryOf_Sarcoidosis__c != '' ||ful.HistoryOf_Scleroderma__c != '' ||ful.HistoryOf_Seizures_Epilepsy__c != '' ||ful.HistoryOf_Skin_Disorders__c != '' ||ful.HistoryOf_Varicose_Veins__c != '' ||ful.HistoryOf_Vitiligo__c != '' ||ful.Over_the_counter_medications__c == TRUE ||ful.Over_theCounter_medications__c != '' ||ful.Pacemakers_internal_pacing_devices__c == TRUE ||ful.PacemakersInternal_pacing_devices__c != '' ||ful.TruSculpt_Body_Contouring__c == TRUE ||ful.TruSculptBody_Contouring__c != '' ||ful.History_Of_Tattoos__c == TRUE ||ful.HistoryOf_Tattoos__c != '' ||ful.History_Of_Recent_Cosmetic_Procedures__c == TRUE ||ful.HistoryOf_Recent_Cosmetic_Procedures__c != '' ||ful.HistoryOf_Botox_Restylane_Dermal_Filler__c == TRUE ||ful.History_Of_Botox_Restylane_Dermal_Filler__c != '' ||ful.History_Of_Facial_Skin_Products__c == TRUE ||ful.HistoryOf_Facial_Skin_Products__c != '' ||ful.one_of_the_above_apply_to_me__c == TRUE ||ful.one_of_above_apply_to_me__c != '' ||ful.Arbitration_Acknowledgement_CheckBox_1__c == TRUE ||ful.Arbitration_Acknowledgement_CheckBox_2__c == TRUE ||ful.Arbitration_Verification_Date__c != NULL ||ful.Arbitration_Verification_Parent_or_Guard__c != '' ||ful.Arbitration_Verification_Patient_Name__c != '' ||ful.Photo_Consent_Acknowledgement_CheckBox_1__c == TRUE ||ful.Photo_Consent_Acknowledgement_CheckBox_2__c == TRUE ||ful.Photo_Consent_Verification_Date__c != NULL ||ful.Photo_Consent_Verification_Parent_Guard__c != '' ||ful.Photo_Consent_Verification_Patient_Name__c != '' ||ful.Return_Policy_Acknowledgement_CheckBox_1__c == TRUE ||ful.Return_Policy_Acknowledgement_CheckBox_2__c == TRUE ||ful.Return_Policy_Verification_Date__c != NULL ||ful.Return_Policy_Verification_Parents__c != '' ||ful.Return_Policy_Verification_Patient_Name__c != '' ||ful.History_Of_Diabetes_1__c == TRUE ||ful.HistoryOf_Diabetes_1__c != '' ||ful.History_Of_Medullary_thyroid_carcinoma__c == TRUE ||ful.HistoryOf_Medullary_thyroid_carcinoma__c != '' ||ful.Multiple_Endocrine_Neoplastic_SyndromeCB__c == TRUE ||ful.Multiple_Endocrine_Neopla_SyndromeText__c != ''
                )
            {
                system.debug('Inside if loop');
                ph.Areas_of_Interest_Anti_Aging__c = ful.Areas_of_Interest_Anti_Aging__c;
                ph.Id = ful.Id;
                ph.Chart__c = ful.Chart__c;
                ph.Areas_of_Interest_Botox_Dysport__c = ful.Areas_of_Interest_Botox_Dysport__c;
                ph.Areas_of_Interest_Brown_Spots__c = ful.Areas_of_Interest_Brown_Spots__c;
                ph.Areas_of_Interest_Dermal_Fillers__c = ful.Areas_of_Interest_Dermal_Fillers__c;
                ph.Areas_of_Interest_Facials__c = ful.Areas_of_Interest_Facials__c;
                ph.Areas_of_Interest_Laser_Hair_Removal__c = ful.Areas_of_Interest_Laser_Hair_Removal__c;
                ph.Areas_of_Interest_None__c = ful.Areas_of_Interest_None__c;
                ph.Areas_of_Interest_Other__c = ful.Areas_of_Interest_Other__c;
                ph.Areas_of_Interest_Skin_Rejuvenation__c = ful.Areas_of_Interest_Skin_Rejuvenation__c;
                ph.Areas_of_Interest_Spider_Veins__c = ful.Areas_of_Interest_Spider_Veins__c;
                ph.Areas_of_Interest_Tattoo_Removal__c = ful.Areas_of_Interest_Tattoo_Removal__c;
                ph.Areas_of_Interest_Weight_Management__c = ful.Areas_of_Interest_Weight_Management__c;
                ph.AreasOf_Interest_Anti_Aging__c = ful.AreasOf_Interest_Anti_Aging__c;
                ph.AreasOf_Interest_Botox_Dysport__c = ful.AreasOf_Interest_Botox_Dysport__c;
                ph.AreasOf_Interest_Brown_Spots__c = ful.AreasOf_Interest_Brown_Spots__c;
                ph.AreasOf_Interest_Dermal_Fillers__c = ful.AreasOf_Interest_Dermal_Fillers__c;
                ph.AreasOf_Interest_Facials__c = ful.AreasOf_Interest_Facials__c;
                ph.AreasOf_Interest_Laser_Hair_Removal__c = ful.AreasOf_Interest_Laser_Hair_Removal__c;
                ph.AreasOf_Interest_None__c = ful.AreasOf_Interest_None__c;
                ph.AreasOf_Interest_Other__c = ful.AreasOf_Interest_Other__c;
                ph.AreasOf_Interest_Skin_Rejuvenation__c = ful.AreasOf_Interest_Skin_Rejuvenation__c;
                ph.AreasOf_Interest_Spider_Veins__c = ful.AreasOf_Interest_Spider_Veins__c;
                ph.AreasOf_Interest_Tattoo_Removal__c = ful.AreasOf_Interest_Tattoo_Removal__c;
                ph.AreasOf_Interest_Weight_Management__c = ful.AreasOf_Interest_Weight_Management__c;
                ph.Blood_clots_Phlebitis_Bleeding_Disorders__c = ful.Blood_clots_Phlebitis_Bleeding_Disorders__c;
                ph.BloodClots_Phlebitis_Bleeding_Disorders__c = ful.BloodClots_Phlebitis_Bleeding_Disorders__c;
                ph.Chemotherapy_radiation_theraphy__c = ful.Chemotherapy_radiation_theraphy__c;
                ph.ChemotherapyRadiation_theraphy__c = ful.ChemotherapyRadiation_theraphy__c;
                ph.History_Of_Accutane__c = ful.History_Of_Accutane__c;
                ph.History_Of_Acne_Medication__c = ful.History_Of_Acne_Medication__c;
                ph.History_Of_Antibiotics__c = ful.History_Of_Antibiotics__c;
                ph.History_Of_Asthma__c = ful.History_Of_Asthma__c;
                ph.History_Of_Autoimmune_Disorders__c = ful.History_Of_Autoimmune_Disorders__c;
                ph.History_Of_Blood_Thinner__c = ful.History_Of_Blood_Thinner__c;
                ph.History_Of_Cancer_precancerous_lesions__c = ful.History_Of_Cancer_precancerous_lesions__c;
                ph.History_Of_Currently_Breastfeeding__c = ful.History_Of_Currently_Breastfeeding__c;
                ph.History_Of_Food_Allergies__c = ful.History_Of_Food_Allergies__c;
                ph.History_Of_Herbal_Supplements__c = ful.History_Of_Herbal_Supplements__c;
                ph.History_Of_Hernias__c = ful.History_Of_Hernias__c;
                ph.History_Of_Herpes_Virus_Cold_Sore__c = ful.History_Of_Herpes_Virus_Cold_Sore__c;
                ph.History_Of_Hip_Replacement__c = ful.History_Of_Hip_Replacement__c;
                ph.History_Of_HIV__c = ful.History_Of_HIV__c;
                ph.History_Of_Internal_Metal_Devices__c = ful.History_Of_Internal_Metal_Devices__c;
                ph.History_Of_Keliod_Hypertrophic_Scarring__c = ful.History_Of_Keliod_Hypertrophic_Scarring__c;
                ph.History_Of_Latex_Allergies__c = ful.History_Of_Latex_Allergies__c;
                ph.History_Of_Lupus__c = ful.History_Of_Lupus__c;
                ph.History_Of_Lymph_Node_Removal__c = ful.History_Of_Lymph_Node_Removal__c;
                ph.History_Of_Lymphedemia__c = ful.History_Of_Lymphedemia__c;
                ph.History_Of_Multiple_Sclerosis__c = ful.History_Of_Multiple_Sclerosis__c;
                ph.History_Of_Numbness_in_the_area__c = ful.History_Of_Numbness_in_the_area__c;
                ph.History_Of_Oral_Contraceptives__c = ful.History_Of_Oral_Contraceptives__c;
                ph.History_Of_Past_Surgeries__c = ful.History_Of_Past_Surgeries__c;
                ph.History_Of_Permanent_Make_up__c = ful.History_Of_Permanent_Make_up__c;
                ph.History_Of_Polycystic_Ovarian_Syndrome__c = ful.History_Of_Polycystic_Ovarian_Syndrome__c;
                ph.History_Of_Present_Scarring__c = ful.History_Of_Present_Scarring__c;
                ph.Pregnant_Actively_trying_to_get__c = ful.Pregnant_Actively_trying_to_get__c;
                ph.History_Of_Retin_A_or_Generics__c = ful.History_Of_Retin_A_or_Generics__c;
                ph.History_Of_Sarcoidosis__c = ful.History_Of_Retin_A_or_Generics__c;
                ph.History_Of_Scleroderma__c = ful.History_Of_Scleroderma__c;
                ph.History_Of_Seizures_Epilepsy__c = ful.History_Of_Seizures_Epilepsy__c;
                ph.History_Of_Skin_Disorders__c = ful.History_Of_Skin_Disorders__c;
                ph.History_Of_Varicose_Veins__c = ful.History_Of_Varicose_Veins__c;
                ph.History_Of_Vitiligo__c = ful.History_Of_Vitiligo__c;
                ph.HistoryOf_Accutane__c = ful.HistoryOf_Accutane__c;
                ph.HistoryOf_Acne_Medication__c = ful.HistoryOf_Acne_Medication__c;
                ph.HistoryOf_Antibiotics__c = ful.HistoryOf_Antibiotics__c;
                ph.HistoryOf_Asthma__c = ful.HistoryOf_Asthma__c;
                ph.HistoryOf_Autoimmune_Disorders__c = ful.HistoryOf_Autoimmune_Disorders__c;
                ph.HistoryOf_Blood_Thinner__c = ful.HistoryOf_Blood_Thinner__c;
                ph.HistoryOf_Cancer_precancerous_lesions__c = ful.HistoryOf_Cancer_precancerous_lesions__c;
                ph.HistoryOf_Currently_Breastfeeding__c = ful.HistoryOf_Currently_Breastfeeding__c;
                ph.HistoryOf_Food_Allergies__c = ful.HistoryOf_Food_Allergies__c;
                ph.HistoryOf_Herbal_Supplements__c = ful.HistoryOf_Herbal_Supplements__c;
                ph.HistoryOf_Hernias__c = ful.HistoryOf_Hernias__c;
                ph.HistoryOf_Herpes_Virus_Cold_Sore__c = ful.HistoryOf_Herpes_Virus_Cold_Sore__c;
                ph.HistoryOf_Hip_Replacement__c = ful.HistoryOf_Hip_Replacement__c;
                ph.HistoryOf_HIV__c = ful.HistoryOf_HIV__c;
                ph.HistoryOf_Internal_Metal_Devices__c = ful.HistoryOf_Internal_Metal_Devices__c;
                ph.HistoryOf_Keliod_Hypertrophic_Scarring__c = ful.HistoryOf_Keliod_Hypertrophic_Scarring__c;
                ph.HistoryOf_Latex_Allergies__c = ful.HistoryOf_Latex_Allergies__c;
                ph.HistoryOf_Lupus__c = ful.HistoryOf_Lupus__c;
                ph.HistoryOf_Lymph_Node_Removal__c = ful.HistoryOf_Lymph_Node_Removal__c;
                ph.HistoryOf_Past_Surgeries__c = ful.HistoryOf_Past_Surgeries__c;
                ph.HistoryOf_Oral_Contraceptives__c = ful.HistoryOf_Oral_Contraceptives__c;
                ph.HistoryOf_Numbness_in_the_area__c = ful.HistoryOf_Numbness_in_the_area__c;
                ph.HistoryOf_Multiple_Sclerosis__c = ful.HistoryOf_Multiple_Sclerosis__c;
                ph.HistoryOf_Lymphedemia__c = ful.HistoryOf_Lymphedemia__c;
                ph.HistoryOf_Permanent_Make_up__c = ful.HistoryOf_Permanent_Make_up__c;
                ph.HistoryOf_Polycystic_Ovarian_Syndrome__c = ful.HistoryOf_Polycystic_Ovarian_Syndrome__c;
                ph.PregnantActively_trying_to_get__c = ful.PregnantActively_trying_to_get__c;
                ph.HistoryOf_Present_Scarring__c = ful.HistoryOf_Present_Scarring__c;
                ph.HistoryOf_Retin_A_or_Generics__c = ful.HistoryOf_Retin_A_or_Generics__c;
                ph.HistoryOf_Sarcoidosis__c = ful.HistoryOf_Sarcoidosis__c;
                ph.HistoryOf_Scleroderma__c = ful.HistoryOf_Scleroderma__c;
                ph.HistoryOf_Seizures_Epilepsy__c = ful.HistoryOf_Seizures_Epilepsy__c;
                ph.HistoryOf_Skin_Disorders__c = ful.HistoryOf_Skin_Disorders__c;
                ph.HistoryOf_Varicose_Veins__c = ful.HistoryOf_Varicose_Veins__c;
                ph.HistoryOf_Vitiligo__c = ful.HistoryOf_Vitiligo__c;
                ph.Over_the_counter_medications__c = ful.Over_the_counter_medications__c;
                ph.Over_theCounter_medications__c = ful.Over_theCounter_medications__c;
                ph.Pacemakers_internal_pacing_devices__c = ful.Pacemakers_internal_pacing_devices__c;
                ph.PacemakersInternal_pacing_devices__c = ful.PacemakersInternal_pacing_devices__c;
                ph.TruSculpt_Body_Contouring__c = ful.TruSculpt_Body_Contouring__c;
                ph.TruSculptBody_Contouring__c = ful.TruSculptBody_Contouring__c;
                ph.History_Of_Tattoos__c = ful.History_Of_Tattoos__c;
                ph.HistoryOf_Tattoos__c = ful.HistoryOf_Tattoos__c;
                ph.History_Of_Recent_Cosmetic_Procedures__c = ful.History_Of_Recent_Cosmetic_Procedures__c;
                ph.HistoryOf_Recent_Cosmetic_Procedures__c = ful.HistoryOf_Recent_Cosmetic_Procedures__c;
                ph.HistoryOf_Botox_Restylane_Dermal_Filler__c = ful.HistoryOf_Botox_Restylane_Dermal_Filler__c;
                ph.History_Of_Botox_Restylane_Dermal_Filler__c = ful.History_Of_Botox_Restylane_Dermal_Filler__c;
                ph.History_Of_Facial_Skin_Products__c = ful.History_Of_Facial_Skin_Products__c;
                ph.HistoryOf_Facial_Skin_Products__c = ful.HistoryOf_Facial_Skin_Products__c;
                ph.one_of_the_above_apply_to_me__c = ful.one_of_the_above_apply_to_me__c;
                ph.one_of_above_apply_to_me__c = ful.one_of_above_apply_to_me__c;
                ph.Arbitration_Acknowledgement_CheckBox_1__c = ful.Arbitration_Acknowledgement_CheckBox_1__c;
                ph.Arbitration_Acknowledgement_CheckBox_2__c= ful.Arbitration_Acknowledgement_CheckBox_2__c;
                ph.Arbitration_Verification_Date__c = ful.Arbitration_Verification_Date__c;
                ph.Arbitration_Verification_Parent_or_Guard__c = ful.Arbitration_Verification_Parent_or_Guard__c;
                ph.Arbitration_Verification_Patient_Name__c = ful.Arbitration_Verification_Patient_Name__c;
                ph.Photo_Consent_Acknowledgement_CheckBox_1__c = ful.Photo_Consent_Acknowledgement_CheckBox_1__c;
                ph.Photo_Consent_Acknowledgement_CheckBox_2__c = ful.Photo_Consent_Acknowledgement_CheckBox_2__c;
                ph.Photo_Consent_Verification_Date__c = ful.Photo_Consent_Verification_Date__c;
                ph.Photo_Consent_Verification_Parent_Guard__c = ful.Photo_Consent_Verification_Parent_Guard__c;
                ph.Photo_Consent_Verification_Patient_Name__c = ful.Photo_Consent_Verification_Patient_Name__c;
                ph.Return_Policy_Acknowledgement_CheckBox_1__c = ful.Return_Policy_Acknowledgement_CheckBox_1__c;
                ph.Return_Policy_Acknowledgement_CheckBox_2__c = ful.Return_Policy_Acknowledgement_CheckBox_2__c;
                ph.Return_Policy_Verification_Date__c = ful.Return_Policy_Verification_Date__c;
                ph.Return_Policy_Verification_Parents__c = ful.Return_Policy_Verification_Parents__c;
                ph.Return_Policy_Verification_Patient_Name__c = ful.Return_Policy_Verification_Patient_Name__c;
                ph.History_Of_Diabetes_1__c = ful.History_Of_Diabetes_1__c;
                ph.HistoryOf_Diabetes_1__c = ful.HistoryOf_Diabetes_1__c;
                ph.History_Of_Medullary_thyroid_carcinoma__c = ful.History_Of_Medullary_thyroid_carcinoma__c;
                ph.HistoryOf_Medullary_thyroid_carcinoma__c = ful.HistoryOf_Medullary_thyroid_carcinoma__c;
                ph.Multiple_Endocrine_Neoplastic_SyndromeCB__c = ful.Multiple_Endocrine_Neoplastic_SyndromeCB__c;
                ph.Multiple_Endocrine_Neopla_SyndromeText__c = ful.Multiple_Endocrine_Neopla_SyndromeText__c;
                insertList.add(ph);
            }
            System.debug(ful.Multiple_Endocrine_Neopla_SyndromeText__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertList);
        }
        
        return recId;
    }
    


    
    public static String createFollowUp(list<Follow_up__c> listFollowUp)
    {
        System.debug('listFollowUp===>'+listFollowUp);
        List<Follow_up__c> insertList = new List<Follow_up__c>();
        String recId;
        for(Follow_up__c fol : listFollowUp)
        {
            System.debug('Follow_up__c===>'+fol);
            Follow_up__c fu  = new Follow_up__c();
            if( fol.Cometics_Follow_Up__c != '' )
            {
                system.debug('Inside if loop');
                fu.Cometics_Follow_Up__c = fol.Cometics_Follow_Up__c;
                fu.Id = fol.Id;
                fu.Chart__c = fol.Chart__c;
                insertList.add(fu);
            }
            System.debug(fol.Cometics_Follow_Up__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertList);
        }
        return recId;
    }
    
    public static string createBotoxDysport(list<Botox_Dysport__c> listBotox)
    {
        BotoxDysportController.createBotoxDysport(listBotox);
        
       String recId;
        return recId;
    }
    
    public static String createDermalFiller(list<Dermal_Filler__c> listDermFiller)
    {
        try{
        System.debug('listDermFiller===>'+listDermFiller);
        List<Dermal_Filler__c> insertList = new List<Dermal_Filler__c>();
        String recId;
        for(Dermal_Filler__c der : listDermFiller)
        {
            System.debug('Dermal_Filler__c===>'+der);
            Dermal_Filler__c df  = new Dermal_Filler__c();
            if( der.Injectable_Notes_Dermal_Filler__c != '' )
            {
                system.debug('Inside if loop');
                df.Injectable_Notes_Dermal_Filler__c = der.Injectable_Notes_Dermal_Filler__c;
                df.Id = der.Id;
                df.Chart__c = der.Chart__c;
                insertList.add(df);
            }
            System.debug(der.Injectable_Notes_Dermal_Filler__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;
         }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    
    public static String createDermaplaning(list<Dermaplaning__c> listDermaplaning)
    {
        try{
        System.debug('listDermaplaning===>'+listDermaplaning);
        List<Dermaplaning__c> insertList = new List<Dermaplaning__c>();
        String recId;
        for(Dermaplaning__c dep : listDermaplaning)
        {
            System.debug('Dermaplaning__c===>'+dep);
            Dermaplaning__c dp  = new Dermaplaning__c();
            if( dep.Dermaplaning_treatment_details__c != '' )
            {
                system.debug('Inside if loop');
                dp.Dermaplaning_treatment_details__c = dep.Dermaplaning_treatment_details__c;
                dp.Id = dep.Id;
                dp.Chart__c = dep.Chart__c;
                insertList.add(dp);
            }
            System.debug(dep.Dermaplaning_treatment_details__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;
 }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    
    public static String createEmsculpt(list<Emsculpt__c> listEmsculpt)
    {
        try{
        System.debug('listEmsculpt===>'+listEmsculpt);
        List<Emsculpt__c> insertList = new List<Emsculpt__c>();
        String recId;
        for(Emsculpt__c ems : listEmsculpt)
        {
            System.debug('Emsculpt__c===>'+ems);
            Emsculpt__c et  = new Emsculpt__c();
            if( ems.Emsculpt_Consents_signed__c == TRUE || ems.Emsculpt_Photos_Taken__c == TRUE || ems.Emsculpt_Post_care_reviewed__c == TRUE || ems.Emsculpt_Pre_Care_Reviewed__c == TRUE ||ems.Emsculpt_post_treatment_notes__c != '')
            {
                system.debug('Inside if loop');
                et.Emsculpt_Consents_signed__c = ems.Emsculpt_Consents_signed__c;
                et.id = ems.Id;
                et.Emsculpt_Photos_Taken__c = ems.Emsculpt_Photos_Taken__c;
                et.Emsculpt_Post_care_reviewed__c = ems.Emsculpt_Post_care_reviewed__c;
                et.Emsculpt_post_treatment_notes__c = ems.Emsculpt_post_treatment_notes__c;
                et.Emsculpt_Pre_Care_Reviewed__c = ems.Emsculpt_Pre_Care_Reviewed__c;
                et.Chart__c = ems.Chart__c;
                insertList.add(et);
            }
            System.debug(ems.Emsculpt_Consents_signed__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;
 }catch(exception e){
            System.debug('Got Error: ' + e.getMessage() + ' at line ' + e.getLineNumber());
            return null;
        }
    }
    
    public static String createFractionalLaser(list<Fractional_Laser__c> listFracLaser)
    {
        System.debug('listFracLaser===>'+listFracLaser);
        List<Fractional_Laser__c> insertList = new List<Fractional_Laser__c>();
        String recId;
        for(Fractional_Laser__c fra : listFracLaser)
        {
            System.debug('Fractional_Laser__c===>'+fra);
            Fractional_Laser__c fl  = new Fractional_Laser__c();
            if( fra.Fractional_Laser_BLT_applied__c != NULL || fra.Improvement_since_last_treatment__c != NULL || fra.New_medications_since_last_treatment__c != NULL || fra.Pregnant_or_Breast_Feeding__c != NULL || fra.Recent_sun_exposure__c != NULL || fra.Self_tanner_or_spray_tanner__c != NULL || fra.Test_spot_performed__c != NULL || fra.Fractional_Laser_Photos_Taken__c == TRUE || fra.Fractional_Laser_consents_signed__c == TRUE || fra.lux_lotion_applied__c == TRUE || fra.safety_eyewear_applied__c == TRUE
              )
            {
                system.debug('Inside if loop');
                fl.Fractional_Laser_BLT_applied__c = fra.Fractional_Laser_BLT_applied__c;
                fl.Id = fra.Id;
                fl.Fractional_Laser_Photos_Taken__c = fra.Fractional_Laser_Photos_Taken__c;
                fl.Fractional_Laser_consents_signed__c = fra.Fractional_Laser_consents_signed__c;
                fl.Improvement_since_last_treatment__c = fra.Improvement_since_last_treatment__c;
                fl.lux_lotion_applied__c = fra.lux_lotion_applied__c;
                fl.New_medications_since_last_treatment__c = fra.New_medications_since_last_treatment__c;
                fl.Pregnant_or_Breast_Feeding__c = fra.Pregnant_or_Breast_Feeding__c;
                fl.Recent_sun_exposure__c = fra.Recent_sun_exposure__c;
                fl.safety_eyewear_applied__c = fra.safety_eyewear_applied__c;
                fl.Self_tanner_or_spray_tanner__c = fra.Self_tanner_or_spray_tanner__c;
                fl.Test_spot_performed__c = fra.Test_spot_performed__c;
                fl.Chart__c = fra.Chart__c;
                insertList.add(fl);
            }
            System.debug(fra.Fractional_Laser_BLT_applied__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createIPL(list<IPL__c> listIPL)
    {
        System.debug('listIPL===>'+listIPL);
        List<IPL__c> insertList = new List<IPL__c>();
        String recId;
        for(IPL__c ipl : listIPL)
        {
            System.debug('IPL__c===>'+ipl);
            IPL__c il  = new IPL__c();
            if( ipl.BLT_Applied_IPL__c != NULL ||ipl.Improvement_since_last_treatment__c != NULL ||ipl.New_medications_since_last_treatment__c != NULL ||ipl.Pregnant_or_Breast_Feeding_IPL__c != NULL ||ipl.Recent_sun_exposure__c != NULL ||ipl.Self_tanner_spray_tanner_in_last_7_days__c != NULL ||ipl.Consents_signed__c != NULL ||ipl.lux_lotion_applied__c == TRUE ||ipl.Photos_Taken__c == TRUE ||ipl.Safety_eyewear_applied__c == TRUE
              )
            {
                system.debug('Inside if loop');
                il.BLT_Applied_IPL__c = ipl.BLT_Applied_IPL__c;
                il.Id = ipl.Id;
                il.Improvement_since_last_treatment__c = ipl.Improvement_since_last_treatment__c;
                il.New_medications_since_last_treatment__c = ipl.New_medications_since_last_treatment__c;
                il.Pregnant_or_Breast_Feeding_IPL__c = ipl.Pregnant_or_Breast_Feeding_IPL__c;
                il.Recent_sun_exposure__c = ipl.Recent_sun_exposure__c;
                il.Self_tanner_spray_tanner_in_last_7_days__c = ipl.Self_tanner_spray_tanner_in_last_7_days__c;
                il.Test_spot_performed__c = ipl.Test_spot_performed__c;
                il.Consents_signed__c = ipl.Consents_signed__c;
                il.lux_lotion_applied__c = ipl.lux_lotion_applied__c;
                il.Photos_Taken__c = ipl.Photos_Taken__c;
                il.Safety_eyewear_applied__c = ipl.Safety_eyewear_applied__c;
                il.Chart__c = ipl.Chart__c;
                insertList.add(il);
            }
            System.debug(ipl.BLT_Applied_IPL__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createLaserHairRemoval(list<Laser_Hair_Removal__c> listLaserHair)
    {
        System.debug('listLaserHair===>'+listLaserHair);
        List<Laser_Hair_Removal__c> insertList = new List<Laser_Hair_Removal__c>();
        String recId;
        for(Laser_Hair_Removal__c lhr : listLaserHair)
        {
            System.debug('Laser_Hair_Removal__c===>'+lhr);
            Laser_Hair_Removal__c las  = new Laser_Hair_Removal__c();
            if( lhr.BLT_applied__c != NULL || lhr.Improvement_since_last_treatment__c != NULL || lhr.New_medications_since_last_treatment__c != NULL || lhr.Pregnant_or_Breastfeeding__c != NULL || lhr.Recent_sun_exposure__c != NULL || lhr.Self_tanner_spray_tanner_in_last_7_days__c != NULL || lhr.Consents_signed__c != NULL || lhr.lux_lotion_applied__c == TRUE || lhr.Photos_Taken__c == TRUE || lhr.Safety_eyewear_applied__c == TRUE
              )
            {
                system.debug('Inside if loop');
                las.BLT_applied__c = lhr.BLT_applied__c;
                las.Id = lhr.Id;
                las.Improvement_since_last_treatment__c = lhr.Improvement_since_last_treatment__c;
                las.New_medications_since_last_treatment__c = lhr.New_medications_since_last_treatment__c;
                las.Pregnant_or_Breastfeeding__c = lhr.Pregnant_or_Breastfeeding__c;
                las.Recent_sun_exposure__c = lhr.Recent_sun_exposure__c;
                las.Self_tanner_spray_tanner_in_last_7_days__c = lhr.Self_tanner_spray_tanner_in_last_7_days__c;
                las.Test_spot_performed__c = lhr.Test_spot_performed__c;
                las.Consents_signed__c = lhr.Consents_signed__c;
                las.lux_lotion_applied__c = lhr.lux_lotion_applied__c;
                las.Photos_Taken__c = lhr.Photos_Taken__c;
                las.Safety_eyewear_applied__c = lhr.Safety_eyewear_applied__c;
                las.Chart__c = lhr.Chart__c;
                insertList.add(las);
            }
            System.debug(lhr.BLT_applied__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createLaserVeinRemoval(list<Laser_Vein_removal__c> listLaserHair)
    {
        System.debug('listLaserHair===>'+listLaserHair);
        List<Laser_Vein_removal__c> insertList = new List<Laser_Vein_removal__c>();
        String recId;
        for(Laser_Vein_removal__c lvr : listLaserHair)
        {
            System.debug('Laser_Vein_removal__c===>'+lvr);
            Laser_Vein_removal__c vei  = new Laser_Vein_removal__c();
            if( lvr.BLT_applied__c != NULL ||lvr.Improvement_since_last_treatment__c != NULL ||lvr.New_medications_since_last_treatment__c != NULL ||lvr.Pregnant_or_Breastfeeding__c != NULL ||lvr.Recent_sun_exposure__c != NULL ||lvr.Self_tanner_spray_tanner_in_last_7_days__c != NULL ||lvr.Consents_signed__c != NULL ||lvr.lux_lotion_applied__c == TRUE ||lvr.Photos_Taken__c == TRUE ||lvr.Safety_eyewear_applied__c == TRUE )
            {
                system.debug('Inside if loop');
                vei.BLT_applied__c = lvr.BLT_applied__c;
                vei.Id = lvr.Id;
                vei.Improvement_since_last_treatment__c = lvr.Improvement_since_last_treatment__c;
                vei.New_medications_since_last_treatment__c = lvr.New_medications_since_last_treatment__c;
                vei.Pregnant_or_Breastfeeding__c = lvr.Pregnant_or_Breastfeeding__c;
                vei.Recent_sun_exposure__c = lvr.Recent_sun_exposure__c;
                vei.Self_tanner_spray_tanner_in_last_7_days__c = lvr.Self_tanner_spray_tanner_in_last_7_days__c;
                vei.Test_spot_performed__c = lvr.Test_spot_performed__c;
                vei.Consents_signed__c = lvr.Consents_signed__c;
                vei.lux_lotion_applied__c = lvr.lux_lotion_applied__c;
                vei.Photos_Taken__c = lvr.Photos_Taken__c;
                vei.Safety_eyewear_applied__c = lvr.Safety_eyewear_applied__c;
                vei.Chart__c = lvr.Chart__c;
                insertList.add(vei);
            }
            System.debug(lvr.BLT_applied__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createTattooRemoval(list<Tattoo_Removal__c> listTattooRemoval)
    {
        System.debug('listTattooRemoval===>'+listTattooRemoval);
        List<Tattoo_Removal__c> insertList = new List<Tattoo_Removal__c>();
        String recId;
        for(Tattoo_Removal__c tat : listTattooRemoval)
        {
            System.debug('Tattoo_Removal__c===>'+tat);
            Tattoo_Removal__c tr  = new Tattoo_Removal__c();
            if( tat.Area__c != '' ||tat.BLT_applied__c != NULL || tat.Improvement_since_last_treatment__c != NULL || tat.New_medications_since_last_treatment__c != NULL || tat.Pregnant_or_Breastfeeding__c != NULL || tat.Recent_sun_exposure__c != NULL || tat.Self_tanner_spray_tanner_in_last_7_days__c != NULL || tat.Consents_signed__c != NULL || tat.lux_lotion_applied__c == TRUE || tat.Photos_Taken__c == TRUE || tat.Safety_eyewear_applied__c == TRUE )
            {
                system.debug('Inside if loop');
                tr.Area__c = tat.Area__c;
                tr.Id = tat.Id;
                tr.BLT_applied__c = tat.BLT_applied__c;
                tr.Improvement_since_last_treatment__c = tat.Improvement_since_last_treatment__c;
                tr.New_medications_since_last_treatment__c = tat.New_medications_since_last_treatment__c;
                tr.Pregnant_or_Breastfeeding__c = tat.Pregnant_or_Breastfeeding__c;
                tr.Recent_sun_exposure__c = tat.Recent_sun_exposure__c;
                tr.Self_tanner_spray_tanner_in_last_7_days__c = tat.Self_tanner_spray_tanner_in_last_7_days__c;
                tr.Test_spot_performed__c = tat.Test_spot_performed__c;
                tr.Consents_signed__c = tat.Consents_signed__c;
                tr.lux_lotion_applied__c = tat.lux_lotion_applied__c;
                tr.Photos_Taken__c = tat.Photos_Taken__c;
                tr.Safety_eyewear_applied__c = tat.Safety_eyewear_applied__c;
                tr.Chart__c = tat.Chart__c;
                insertList.add(tr);
            }
            System.debug(tat.BLT_applied__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createSculptraBody(list<Sculptra_body__c> listSculptra)
    {
        System.debug('listSculptra===>'+listSculptra);
        List<Sculptra_body__c> insertList = new List<Sculptra_body__c>();
        String recId;
        for(Sculptra_body__c scu : listSculptra)
        {
            System.debug('Sculptra_body__c===>'+scu);
            Sculptra_body__c sb  = new Sculptra_body__c();
            if( scu.Injectable_notes__c != '' )
            {
                system.debug('Inside if loop');
                sb.Injectable_notes__c = scu.Injectable_notes__c;
                sb.Id = scu.Id;
                sb.Chart__c = scu.Chart__c;
                insertList.add(sb);
            }
            System.debug(scu.Injectable_notes__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createSkinpenMicroneedling(list<SkinPen_Microneedling__c> listSkinMicro)
    {
        System.debug('listSkinMicro===>'+listSkinMicro);
        List<SkinPen_Microneedling__c> insertList = new List<SkinPen_Microneedling__c>();
        String recId;
        for(SkinPen_Microneedling__c ski : listSkinMicro)
        {
            System.debug('SkinPen_Microneedling__c===>'+ski);
            SkinPen_Microneedling__c sm  = new SkinPen_Microneedling__c();
            if( ski.Consents_signed__c == TRUE || ski.Photos_Taken__c == TRUE || ski.Post_care_reviewed__c == TRUE || ski.Pre_Care_reviewed__c == TRUE )
            {
                system.debug('Inside if loop');
                sm.Consents_signed__c = ski.Consents_signed__c;
                sm.Id = ski.Id;
                sm.Photos_Taken__c = ski.Photos_Taken__c;
                sm.Post_care_reviewed__c = ski.Post_care_reviewed__c;
                sm.Pre_Care_reviewed__c = ski.Pre_Care_reviewed__c;
                sm.Chart__c = ski.Chart__c;
                insertList.add(sm);
            }
            System.debug(ski.Consents_signed__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createTrusculpt(list<TruSculpt__c> listTrusculpt)
    {
        System.debug('listTrusculpt===>'+listTrusculpt);
        List<TruSculpt__c> insertList = new List<TruSculpt__c>();
        String recId;
        for(TruSculpt__c tru : listTrusculpt)
        {
            System.debug('TruSculpt__c===>'+tru);
            TruSculpt__c ts  = new TruSculpt__c();
            if( tru.Consents_signed__c == TRUE || tru.Photos_Taken__c == TRUE || tru.Post_care_reviewed__c == TRUE || tru.Pre_care_reviewed__c == TRUE ||tru.Post_Treatment_Notes__c != '')
            {
                system.debug('Inside if loop');
                ts.Consents_signed__c = tru.Consents_signed__c;
                ts.Id = tru.Id;
                ts.Photos_Taken__c = tru.Photos_Taken__c;
                ts.Post_care_reviewed__c = tru.Post_care_reviewed__c;
                ts.Post_Treatment_Notes__c = tru.Post_Treatment_Notes__c;
                ts.Pre_care_reviewed__c = tru.Pre_care_reviewed__c;
                ts.Chart__c = tru.Chart__c;
                insertList.add(ts);
            }
            System.debug(tru.Consents_signed__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createVanquish(list<Vanquish__c> listVanquish)
    {
        System.debug('listVanquish===>'+listVanquish);
        List<Vanquish__c> insertList = new List<Vanquish__c>();
        String recId;
        for(Vanquish__c van : listVanquish)
        {
            System.debug('Vanquish__c===>'+van);
            Vanquish__c vq  = new Vanquish__c();
            if( van.Consents_signed__c == TRUE || van.Photos_Taken__c == TRUE || van.Post_care_reviewed__c == TRUE || van.Pre_care_reviewed__c == TRUE ||van.Post_Treatment_Notes__c != '')
            {
                system.debug('Inside if loop');
                vq.Consents_signed__c = van.Consents_signed__c;
                vq.Id = van.Id;
                vq.Photos_Taken__c = van.Photos_Taken__c;
                vq.Post_care_reviewed__c = van.Post_care_reviewed__c;
                vq.Post_Treatment_Notes__c = van.Post_Treatment_Notes__c;
                vq.Pre_care_reviewed__c = van.Pre_care_reviewed__c;
                vq.Chart__c = van.Chart__c;
                insertList.add(vq);
            }
            System.debug(van.Consents_signed__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;

    }
    
    public static String createWeightLossInjections(list<Weight_Loss__c> listWeightLoss)
    {
        System.debug('listWeightLoss===>'+listWeightLoss);
        List<Weight_Loss__c> insertList = new List<Weight_Loss__c>();
        String recId;
        for(Weight_Loss__c wli : listWeightLoss)
        {
            System.debug('Weight_Loss__c===>'+wli);
            Weight_Loss__c wt  = new Weight_Loss__c();
            if( wli.Additional_notes__c != '' )
            {
                system.debug('Inside if loop');
                wt.Additional_notes__c = wli.Additional_notes__c;
                wt.Id = wli.Id;
                wt.Chart__c = wli.Chart__c;
                insertList.add(wt);
            }
            System.debug(wli.Additional_notes__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;
    }
    
    public static String createGeneralExam(list<General_Exam__c> listGeneral)
    {
        System.debug('listGeneral===>'+listGeneral);
        List<General_Exam__c> insertList = new List<General_Exam__c>();
        String recId;
        for(General_Exam__c gen : listGeneral)
        {
            System.debug('General_Exam__c===>'+gen);
            General_Exam__c ge  = new General_Exam__c();
            if( gen.General_Exam__c != '' )
            {
                system.debug('Inside if loop');
                ge.General_Exam__c = gen.General_Exam__c;
                ge.Id = gen.Id;
                ge.Chart__c = gen.Chart__c;
                insertList.add(ge);
            }
            System.debug(gen.General_Exam__c);
        }
        if (!insertList.isEmpty())
        {
            System.debug('insertList==>'+insertList);
            upsert insertList;
            recId = returnRecordId(insertlist);
        }
        return recId;
    }
    
}