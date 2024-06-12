@isTest
public class CreateAestheticVisitHandlerTestClass {
   
     @TestSetup
    public static void setupTestData() {
        
       Medical_Hist__c ms = new Medical_Hist__c();
        ms.Accutane__c = true;
        insert ms;
        
        Follow_up__c fo = new Follow_up__c();
        fo.Cometics_Follow_Up__c ='This is a way of Learning';
        insert fo;
        
        Aesthetician_Consult__c co = new Aesthetician_Consult__c();
        co.Membership_Notes__c = 'This is not true';
        insert co;
        
        Aesthetician_Coolsculpting__c ae = new Aesthetician_Coolsculpting__c();
        ae.CoolSculpting_Weight__c = 50;
        insert ae;
        
        Thermage_Treatment__c tt = new Thermage_Treatment__c();
        tt.Staggered_Passes_Passes__c = 'This is way';
        insert tt;
        
        Sculpsure_Treatment__c st = new Sculpsure_Treatment__c();
        st.BMI_Height_in__c = '56';
        insert st;
        
        Medication_and_Allergies__c ma = new Medication_and_Allergies__c();
        ma.Patient_Allergy__c = 'dust';
        insert ma;
        
        IPL_Treatment__c ip = new IPL_Treatment__c();
        ip.Photos_Taken__c = true;
        insert ip;
        
        Aesthetic_Consult_Recommendations__c Ac = new Aesthetic_Consult_Recommendations__c();
        Ac.Membership_Consult_Notes__c = 'I am Dev';
        insert Ac;
        
      //  Contact con = new Contact();
      //  con.LastName = 'Rohit';
      //  con.Patient_Note__c = 'This is one';
      //  insert con;
        
       CoolSculpting__c CS = new CoolSculpting__c();
        CS.Target_Comments__c = 'I';
        insert CS;
        
        Tattoo_Removal_Consult__c trc = new Tattoo_Removal_Consult__c();
        trc.Discussed_with_Patient__c = 'After Care';
        trc.Name = 'This is n-';
        insert trc;
        
        Hair_Restoration_consult__c hrc = new Hair_Restoration_consult__c();
        hrc.Dermatologist_medical_records__c = 'Yes';
        insert hrc;
        
        Hormone_Primary_Health_Concerns__c hp = new Hormone_Primary_Health_Concerns__c();
        hp.Abdominal_areaWeight_gain_spare_tire__c = 'A';
        insert hp;
        
        Full_Patient_History__c ful = new Full_Patient_History__c();
        ful.Areas_of_Interest_Anti_Aging__c = true;
        insert ful;
        
        Follow_up__c fol = new Follow_up__c();
        fol.Cometics_Follow_Up__c = 'M';
        insert fol;
        
        Botox_Dysport__c bd = new Botox_Dysport__c();
        bd.Injectable_Notes_Botox_Dysport__c = 'Dev';
        insert bd;
        
        Dermal_Filler__c der = new Dermal_Filler__c();
        der.Injectable_Notes_Dermal_Filler__c = 'A';
        insert der;
        
        Dermaplaning__c dep = new Dermaplaning__c();
        dep.Dermaplaning_treatment_details__c = 'S';
        insert dep;
        
        Emsculpt__c ems = new Emsculpt__c();
        ems.Emsculpt_Consents_signed__c = true;
        insert ems;
        
        Fractional_Laser__c fra = new Fractional_Laser__c();
        fra.Fractional_Laser_BLT_applied__c = 'Yes';
        insert fra;
        
        IPL__c ipl = new IPL__c();
        ipl.BLT_Applied_IPL__c = 'Yes';
        insert ipl;
        
        Laser_Hair_Removal__c lhr = new Laser_Hair_Removal__c();
        lhr.BLT_applied__c = 'Yes';
        insert lhr;
        
        Laser_Vein_removal__c lvr = new Laser_Vein_removal__c();
        lvr.BLT_applied__c = 'Yes';
        insert lvr;
        
        Tattoo_Removal__c tat = new Tattoo_Removal__c();
        tat.Area__c = 'Dev';
        insert tat;
        
        Sculptra_body__c scu = new Sculptra_body__c();
        scu.Injectable_notes__c = 'Salesforce';
        insert scu;
        
        SkinPen_Microneedling__c ski = new SkinPen_Microneedling__c();
        ski.Consents_signed__c = true;
        insert ski;
        
        TruSculpt__c tru = new TruSculpt__c();
        tru.Consents_signed__c = true;
        insert tru;
        
        Vanquish__c van = new Vanquish__c();
        van.Consents_signed__c = true;
        insert van;
        
        Weight_Loss__c wli = new Weight_Loss__c();
        wli.Additional_notes__c = 'Associate';
        insert wli;
        
        General_Exam__c gen = new General_Exam__c();
        gen.General_Exam__c = 'Developer';
        insert gen;
                
    }
    
    

    @isTest
    public static void testAestheticHandler() {
        
        List<Medical_Hist__c> medicalHistory = [SELECT Acne_Medication__c, Id, OwnerId, Name, IsDeleted, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, Accutane__c, Accutanec__c, Acne_Medicationc__c, Antibiotics__c, Antibioticsc__c, Arbitration_Acknowledgement_CheckBox_1__c, Arbitration_Acknowledgement_CheckBox_2__c, Arbitration_Verification_Date__c, Arbitration_Verification_Parent_or_Guard__c, Arbitration_Verification_Patient_Name__c, Areas_Of_Interest_TruSculpt_Body_Contouc__c, Areas_Of_Interest_TruSculpt_Body_Contour__c, Areas_of_InterestLaser_Hair_Removal__c, Areas_of_InterestLaser_Hair_Removalc__c, Areas_of_Interest_Anti_Aging__c, Areas_of_Interest_Anti_Agingc__c, Areas_of_Interest_Botox_Dysport__c, Areas_of_Interest_Brown_Spots__c, Areas_of_Interest_Botox_Dysportc__c, Areas_of_Interest_Brown_Spotsc__c, Areas_of_Interest_Dermal_Fillers__c, Areas_of_Interest_Dermal_Fillersc__c, Areas_of_Interest_Facials__c, Areas_of_Interest_Facialsc__c, Areas_of_Interest_Nonec__c, Areas_of_Interest_Other__c, Areas_of_Interest_Otherc__c, Areas_of_Interest_Skin_Rejuvenation__c, Areas_of_Interest_Skin_Rejuvenationc__c, Areas_of_Interest_Spider_Veins__c, Areas_of_Interest_Spider_Veinsc__c, Areas_of_Interest_Tattoo_Removal__c, Areas_of_Interest_Tattoo_Removalc__c, Areas_of_Interest_Weight_Management__c, Areas_of_Interest_Weight_Managementc__c, Asthma__c, Asthmac__c, Autoimmune_Disorders__c, Autoimmune_Disordersc__c, Blood_Thinner__c, Blood_Thinnerc__c, Blood_clots_Phlebitis_Bleeding_Disorderc__c, Blood_clots_Phlebitis_Bleeding_Disorders__c, Botox_Restylane_Dermal_Fillerc__c, Botox_Restylane_Dermal_Fillers__c, Bring_Complete_Prescription_Medication__c, Bring_OTC_Meds_List__c, Cancer_and_or_precancerous_lesions__c, Cancer_and_or_precancerous_lesionsc__c, Chemotherapy_radiation_therapy__c, Chemotherapy_radiation_therapyc__c, Currently_Breastfeeding__c, Currently_Breastfeedingc__c, Diabetes_Type_1__c, Diabetes_Type_1c__c, Facial_Skin_Products__c, Facial_Skin_Productsc__c, HIV__c, HIVc__c, Herbal_Supplements__c, Herbal_Supplementsc__c, Hernias__c, Herniasc__c, Herpes_Virus_Cold_Sore__c, Herpes_Virus_Cold_Sorec__c, Hip_Replacement__c, Hip_Replacementc__c, Internal_Metal_Devices__c, Internal_Metal_Devicesc__c, Keliod_Hypertrophic_Scarring__c, Keliod_Hypertrophic_Scarringc__c, Latex_Allergies__c, Latex_Allergiesc__c, List_Each_Med_Dosage__c, Lupus__c, Lupusc__c, Lymph_Node_Removal__c, Lymph_Node_Removals__c, Lymphedemia__c, Lymphedemiac__c, Medullary_thyroid_carcinoma__c, Medullary_thyroid_carcinomac__c, Multiple_Sclerosis__c, Multiple_Sclerosisc__c, Multiple_endocrine_neoplastic__c, Multiple_endocrine_neoplasticc__c, No_Couture_Med_Spa_Messages__c, None__c, None_of_the_above_apply_to_me__c, None_of_the_above_apply_to_mec__c, Numbness_in_the_area__c, Numbness_in_the_areac__c, Oral_Contraceptives__c, Oral_Contraceptivesc__c, Over_the_counter_medications__c, Over_the_counter_medicationsc__c, Pacemakers_internal_pacing_devices__c, Pacemakers_internal_pacing_devicesc__c, Past_Surgeries__c, Past_Surgeriesc__c, Patient_Allergy_Notes__c, Patient_Allergy__c, Patient_Current_Medication_dosage_Notes__c, Patient_Current_Medication_dosage__c, Permanent_Make_up__c, Permanent_Make_upc__c, Photo_Consent_Acknowledgement_CheckBox_1__c, Photo_Consent_Acknowledgement_CheckBox_2__c, Photo_Consent_Verification_Date__c, Photo_Consent_Verification_Parent_Guard__c, Photo_Consent_Verification_Patient_Name__c, Polycystic_Ovarian_Syndrome__c, Polycystic_Ovarian_Syndromec__c, Pregnant_Actively_trying_to_get_pregnanc__c, Pregnant_Actively_trying_to_get_pregnant__c, Present_Scarringc__c, Present_Scarring__c, Recent_Cosmetic_Procedures__c, Recent_Cosmetic_Proceduresc__c, Retin_A_or_Generics__c, Retin_A_or_Genericsc__c, Return_Policy_Acknowledgement_CheckBox_1__c, Return_Policy_Acknowledgement_CheckBox_2__c, Return_Policy_Verification_Date_Date__c, Return_Policy_Verification_Parents_or_Gu__c, Return_Policy_Verification_Patient_Name__c, SUGGESTION_for_Bag_or_Photo_Medication__c, Sarcoidosis__c, Sarcoidosisc__c, Scleroderma__c, Sclerodermac__c, Seizures_and_or_Epilepsy__c, Seizures_and_or_Epilepsyc__c, Skin_Disorders__c, Skin_Disordersc__c, Tattoos__c, Tattoosc__c, Varicose_Veins__c, Varicose_Veinsc__c, Vitiligo__c, Vitiligoc__c, syndrome_type_2__c, syndrome_type_2c__c, Client__c, MessageCheckbox1__c FROM Medical_Hist__c where Accutane__c = true ];
        CreateAestheticVisitHandler.CreateMedicalHistory(medicalHistory);
        CreateAestheticVisitHandler.genericRecordsList(medicalHistory);        
        System.assert(true, medicalHistory[0].Accutane__c);
        
    }
    
    @isTest
    public static void testCreateFolloup(){
        
        List<Follow_up__c> followupList = [SELECT Id, Chart__c, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, Cometics_Follow_Up__c, Client__c FROM Follow_up__c where Client__c = null];
        CreateAestheticVisitHandler.CreateFolloup(followupList);
        CreateAestheticVisitHandler.genericRecordsList(followupList);
        System.assertNotEquals(null, followupList[0].Cometics_Follow_Up__c);
        
        
    }
    
    @isTest
    public static void testCreateConsult(){
        
        List<Aesthetician_Consult__c> consultList = [SELECT Id, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, Areas__c, Membership_Notes__c, Membership__c, Treatments__c, Units_Syringe__c, Other_Notes__c, Products__c, Comments__c, Client__c FROM Aesthetician_Consult__c where Client__c = null];
        CreateAestheticVisitHandler.CreateAestheticConsult(consultList);
        CreateAestheticVisitHandler.genericRecordsList(consultList);
        System.assertEquals(null, consultList[0].Other_Notes__c);
        
    }
    
    @isTest
    public static void createCoolScupting(){
        List<Aesthetician_Coolsculpting__c>  coolsculptingList = [SELECT Id, Goals_of_CoolSculpting_Procedure__c, PreCoolsculpting_Checklist__c, Coolsculpt_Procedure_Checklist__c, CoolSculpting_Date__c, CoolSculpting_Weight__c, Area__c, Applicator__c, Client__c FROM Aesthetician_Coolsculpting__c where Client__c = null];
        CreateAestheticVisitHandler.createCoolSculpting(coolsculptingList);
        CreateAestheticVisitHandler.genericRecordsList(coolsculptingList);
        System.assertNotEquals(null, coolsculptingList[0].CoolSculpting_Weight__c);
        
    }
    
    @isTest 
    public static void createThermage(){
        List<Thermage_Treatment__c> thermageList = [SELECT Id, Date__c, Pre_Tx_Weight__c, Pre_Tx_Measurement__c, Pre_Tx_Waist_at_Umbilicus__c, Start__c, End__c, Pain_Management__c, Return_Pad_Area__c, Return_Pad_Moved_to__c, Lot__c, Staggered_Passes_REPS__c, Staggered_Passes_Passes__c, Staggered_Passes_Tx_Setting_Min_Max__c, Vector_Passes_REPS__c, Vector_Passes_Passes__c, Vector_PassesTx_Setting_Min_Max__c, Problem_area_passes_REPS__c, Problem_area_passes_Passes__c, Problem_area_passes_Tx_Setting_Min_Max__c, Thermage_Post_procedure_Discomfort__c, Thermage_Post_procedure_swelling__c, Thermage_Post_procedure_erythema__c, Thermage_Post_procedure_Details__c, Client__c FROM Thermage_Treatment__c where Client__c = null];
        CreateAestheticVisitHandler.createThermage(thermageList);
        CreateAestheticVisitHandler.genericRecordsList(thermageList);
        System.assertNotEquals(null, thermageList[0].Staggered_Passes_Passes__c);
        
    }
    
    @isTest 
    public static void createSculpsureTreatment_Test(){
        
        List<Sculpsure_Treatment__c> sculpsureList = [SELECT Id, Pre_Tx_Photos_taken__c, Clicks_on_key_prior_to_treatment__c, Pre_Tx__c, Pre_Tx_of_PAC_s_used__c, Tx_Clicks_remaining_on_key_post_treatmen__c, Pre_Tx_Date__c, BMI_Height_in__c, BMI_Weight_lbs__c, BMI__c, Tx_Area__c, Energy_in_Build__c, End_Build_Zone__c, Energy_Adj_Zo__c, PAC_1__c, PAC_2__c, PAC_3__c, PAC_4__c, Comments__c, Client__c FROM Sculpsure_Treatment__c where Client__c = null];
        CreateAestheticVisitHandler.createSculpsureTreatment(sculpsureList);
        CreateAestheticVisitHandler.genericRecordsList(sculpsureList);
        System.assertNotEquals(null, sculpsureList[0].BMI_Height_in__c);
        
    }
    
    @isTest
    public static void createMedicationAndAllergies_Test(){
        
        List<Medication_and_Allergies__c> medicationList = [SELECT Id, Client__c, Patient_Allergy__c, Patient_Current_Medication_Doseges_Notes__c, Patient_Current_Medication_Doseges__c, Patient_Notes__c, Medications_Allergies__c, Message_Checkbox_1__c FROM Medication_and_Allergies__c where Patient_Allergy__c ='dust'];
        CreateAestheticVisitHandler.createMedicationAndAllergies(medicationList);
        CreateAestheticVisitHandler.genericRecordsList(medicationList);
        System.assertNotEquals(null, medicationList[0].Patient_Allergy__c);
        
    }
    
    @isTest
    public static void createIPLTreatment_Test(){
        
        List<IPL_Treatment__c> iplList = [SELECT Id, Tx__c, Area__c, Handpiece__c, SkinTel__c, Baseline_Skintel__c, Joules__c, Pulse_Width__c, Last_Skin__c, Photos_Taken__c, Consents_Signed__c, Safety_Eyewear_Applied__c, Lux_Lotion_Applied__c, Recent_Sun_Exposure__c, New_Medications_since_last_treatment__c, Self_Tanner_or_Spray_Tanner_in_the_last__c, Pregnant_or_Breastfeeding__c, Improvement_since_last_treatment__c, Test_Spot_Performed__c, BLT_Applied__c, Client__c FROM IPL_Treatment__c where Client__c = null];
        CreateAestheticVisitHandler.createIPLTreatment(iplList);
        CreateAestheticVisitHandler.genericRecordsList(iplList);
        System.assert(true, iplList[0].Photos_Taken__c);
    }
    
    @isTest
    public static void createAesthetic_Consult_RecommendationsTest(){
        
        List<Aesthetic_Consult_Recommendations__c> listAesthetic = [SELECT Id, Aesthetic_Consult_Other_Notes__c, Aesthetic_consult_Area__c, Aesthetic_consult_Comments__c, Aesthetic_consult_Membership__c, Aesthetic_consult_Products__c, Aesthetic_consult_Treatments__c, Aesthetic_consult_units_syrings__c, Chart__c, Membership_Consult_Notes__c, Client__c FROM Aesthetic_Consult_Recommendations__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createAestheticConsult(listAesthetic);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listAesthetic);
        System.assert(true, listAesthetic[0].Membership_Consult_Notes__c);
    }
    
    @isTest
    public static void createCoolsculptingConsultTest(){

        List<CoolSculpting__c> listCoolsculpting = [SELECT Id, Chart__c, CoolSculpting_Location__c, CoolSculpting_No_Treatment_s__c, CoolSculpting_Problem__c, CoolSculpting_Stamped_Quantity__c, CoolSculpting_Treatments_Notes__c, CoolSculpting_Type__c, Target_Comments__c, Target_Patient_Price__c, Target_Savings__c, Target_Retail_Price__c, Target_Transform_Comments__c, Target_Transform_Patient_Price__c, Target_Transform_Retail_Price__c, Target_Transform_Savings__c, Total_Transformation_Comments__c, Total_Transformation_Patient_Price__c, Total_Transformation_Retail_Price__c, Total_Transformation_Savings__c, Client__c, Coolsculpt_Procedure_Checklist__c, PreCoolsculpting_Checklist__c, Goals_of_CoolSculpting_Procedure__c, Date__c, Weight__c FROM CoolSculpting__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createCoolsculptingConsult(listCoolsculpting);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listCoolsculpting);
        System.assert(true, listCoolsculpting[0].Target_Comments__c);


    }
    
    @isTest
    public static void createTattooRemovalConsultTest(){
        
        List<Tattoo_Removal_Consult__c> listTattRemoval = [SELECT Id, Discussed_with_Patient__c, Possible_Complications_Discussed__c, Tattoo_Removal_Age__c, Tattoo_Removal_Amount_of_Ink__c, Tattoo_Removal_Colors__c, Tattoo_Removal_Ink_Layering__c, Tattoo_Removal_Kirby_Score__c, Tattoo_Removal_Location__c, Tattoo_Removal_Notes__c, Tattoo_Removal_Scarring_Tissue_Change__c, Tattoo_Removal_Size__c, Tattoo_Removal_Skin_Type__c, Tattoo_Removal_Tattoo_Type__c, Tattoo_Treatment_Recommendation__c, Client__c FROM Tattoo_Removal_Consult__c where Discussed_with_Patient__c != null];
        createCosmeticRecordChartFlowHandler.createTattooRemovalConsult(listTattRemoval);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listTattRemoval);
        System.assert(true, listTattRemoval[0].Discussed_with_Patient__c);
        
    }
    
    @isTest
    public static void CreateHairRestorationConsultTest(){
        
        List<Hair_Restoration_consult__c> listHairRestoration = [SELECT Id, Chart__c, Any_typesOf_medications__c, Any_types_of_medications__c, Are_you_taking_supplementation__c, Dermatologist_medical_records__c, Describe_your_current_eyelashes__c, DiagnosedWith_any_form_of_skin_disease__c, DiagnosedWith_thyroid_disease__c, Diagnosed_with_AUTOIMMUNE_scalp_disorder__c, Diagnosed_with_any_form_of_skin_disease__c, Diagnosed_with_thyroid_disease__c, Do_you_excessively_rub_your_eyebrows__c, Do_you_excessively_rub_your_eyelashes__c, Do_you_have_a_history_of_low_iron__c, Do_you_wear_eyelash_extensions__c, Ever_been_evaluated_by_a_dermatologist__c, Expectations_with_eyelash_transplant__c, EyeBrow_Hair_Loss_last_episode__c, FEMALE_Specific_Questions__c, Family_members_with_same_symptoms__c, First_Notice_Thinning_Of_Your_Eyebrows__c, First_notice_thinning_of_your_eyelashes__c, For_how_long__c, General_Hair_Loss_Associated_features__c, General_Hair_Loss_Current_Treatments__c, General_Hair_Loss_Location__c, General_Hair_Loss_Onset__c, General_Hair_Loss_Past_Treatments__c, General_Hair_Loss_Signs_and_Symptoms__c, General_Hair_Loss_Timing__c, General_Hair_Loss_Type_of_hair_loss__c, Goals_and_expectations_with_eyebrow__c, Goals_and_expectations_with_facial_hair__c, HPI_Date__c, HPI_FUT_vs_FUE__c, HPI_No_of_Grafts__c, HPI_Surgeon__c, HPI_Year__c, HPI_hair_loss_notes__c, Hair_Color__c, Hair_Curl__c, Hair_Density__c, Hair_Loss_Assessment_Plan__c, Hair_Loss_Diagnosis__c, Hair_Loss_currently_being_treated__c, Hair_Pattern__c, Hair_RestorationCosmetic_Notes__c, Hair_Restoration_Cosmetic_For__c, Hair_Restoration_Cosmetic_Interval__c, Hair_Restoration_Cosmetic_Next_Visit__c, Hair_Restoration_Cosmetic_Number__c, Hair_Restoration_Cosmetict_With__c, Hair_Restoration_consult_Next_App__c, Hair_Restoration_consult_Other_Notes__c, Hair_loss_are_most_bothersome__c, Hair_loss_classification__c, Hair_loss_findings__c, Hair_restoration_Counseling__c, Have_you_undergone_menopause__c, History_of_chemotherapy_or_radiation__c, History_of_over_EyeBrow_plucking__c, History_of_physical_trauma_to_the_face__c, History_of_trauma_to_the_eyebrows__c, HormonePlan_Ace_Inhibitor__c, HormonePlan_Aged_Garlic__c, HormonePlan_CoQ10__c, HormonePlan_DHEA_Pregnenolone__c, HormonePlan_DHEA__c, HormonePlan_DIM__c, HormonePlan_Fish_oil__c, HormonePlan_Niacin__c, HormonePlan_Other__c, HormonePlan_Thyroid_Armour__c, HormonePlan_Vit_D3_ADK__c, HormonePlan_Vit_D3_D3_K2__c, HormonePlan_Vit_D3__c, HormonePlan_lodine__c, Hormone_Plan_Ace_Inhibitor__c, Hormone_Plan_Aged_Garlic__c, Hormone_Plan_CoQ10__c, Hormone_Plan_DHEA_Pregnenolone__c, Hormone_Plan_DHEA__c, Hormone_Plan_DIM__c, Hormone_Plan_Fish_oil__c, Hormone_Plan_Niacin__c, Hormone_Plan_Other__c, Hormone_Plan_Thyroid_Armour__c, Hormone_Plan_Vit_D3_ADK__c, Hormone_Plan_Vit_D3_D3_K2__c, Hormone_Plan_Vit_D3__c, Hormone_Plan_lodine__c, Identify_any_specific_areas_of_interest__c, Laser_hair_removal_to_the_eyebrows__c, Laser_hair_removal_to_your_face__c, List_drug_name_and_dates_of_treatment__c, Noticed_any_redness_flaking_inflammation__c, Noticed_redness_flaking_inflammation__c, Office_Visit_Follow_Up__c, Phone_Follow_Up__c, Please_explain_event_year__c, Products_have_you_tried_for_Eyebrow__c, Pulling_out_your_eyebrow_hairs__c, Pulling_out_your_eyelashes__c, Redness_flaking_inflammation__c, Scalp_biopsy_results__c, Scalp_biopsy_to_evaluate_your_hair_loss__c, Serious_illness_during_the_past_year__c, Skin_disease_such_alopecia_areata__c, Thyroid_levelLast_checked__c, Thyroid_level_last_checked__c, Trichotillomania__c, Tried_Latisse_Bimatoprost__c, Wear_a_hairpiece_or_extensions__c, What_isYour_diagnosis__c, What_is_yourDiagnosis_When__c, What_productsHave_you_tried__c, What_products_have_you_tried__c, When_was_your_last_blood_work_checked__c, Which_medications_and_when__c, Your_last_episode_for_Eyelash_Hair_Loss__c, compulsively_pulling_out_your_hair__c, currently_being_treated_for_Eyelash__c, eyebrows_permanently_tattooed__c, history_of_physical_trauma_to_eyelashes__c, please_explain_event_year_EyeBrows__c, please_explain_event_year_For_Eyelash__c, what_illness_and_how_long__c, what_is_your_diagnosis_When__c, what_is_your_diagnosis__c, what_is_your_diagnosis_for_EyeBrow__c, when_was_your_last_episode__c, which_medication_s_and_when__c, Client__c FROM Hair_Restoration_consult__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.CreateHairRestorationConsult(listHairRestoration);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listHairRestoration);
        System.assert(true, listHairRestoration[0].Dermatologist_medical_records__c);
        
    }
    @isTest 
    public static void createHormonePrimaryHealthConcernsTest(){
        List<Hormone_Primary_Health_Concerns__c> primaryHealthList = [SELECT Id, Abdomen_Other__c, Abdomen_Soft_non_tender__c, Abdominal_areaWeight_gain_spare_tire__c, Abdominal_area_weight_gain_spare_tire__c, Chest_CTA_bilateral__c, Chest_Heart_RRR__c, Chest_Other__c, DecreasedSex_drive_libido__c, Decreased_sex_drive_libido__c, Difficult_recovering_from_workout__c, Difficulty_recovering_from_workout__c, GeneralHealth_Acne__c, GeneralHealth_Bloating__c, GeneralHealth_Brain_fog__c, GeneralHealth_Cold_hands_feet__c, GeneralHealth_Decreased_muscle_strength__c, GeneralHealth_Depressed_mood__c, GeneralHealth_Difficulty_having_orgasms__c, GeneralHealth_Dry_wrinkled_skin__c, GeneralHealth_Erectile_dysfunction__c, GeneralHealth_Fatigue__c, GeneralHealth_Food_cravings__c, GeneralHealth_Hair_loss_breakage__c, GeneralHealth_Hot_flashes__c, GeneralHealth_Irritability__c, GeneralHealth_Memory_loss__c, GeneralHealth_Migraines__c, GeneralHealth_Mood_changes_irritability__c, GeneralHealth_Night_sweats__c, GeneralHealth_Sleep_problems__c, GeneralHealth_Vaginal_dryness__c, GeneralHealth_Weight_gain__c, General_healthOther__c, General_health_Acne__c, General_health_Bloating__c, General_health_Brain_fog__c, General_health_Cold_hands_feet__c, General_health_Decreased_muscle_strength__c, General_health_Depressed_mood__c, General_health_Difficulty_having_orgasms__c, General_health_Dry_wrinkled_skin__c, General_health_Erectile_dysfunction__c, General_health_Fatigue__c, General_health_Food_cravings__c, General_health_Hair_loss_breakage__c, General_health_Hot_flashes__c, General_health_Irritability__c, General_health_Memory_loss__c, General_health_Migraines__c, General_health_Mood_changes_irritability__c, General_health_Night_sweats__c, General_health_Other__c, General_health_Sleep_problems__c, General_health_Vaginal_dryness__c, General_health_Weight_gain__c, General_health_Weight_loss__c, HEENT_Other__c, HEENT_PERRLA__c, HEENT_Throat_WML__c, HormoneAssessment_Adrenal_Fatigue__c, HormoneAssessment_Andropause__c, HormoneAssessment_Fatigue__c, HormoneAssessment_Menopause__c, HormoneAssessment_Other__c, HormoneAssessment_Sleep_Disorder__c, HormonePlan_Estradiol_cream__c, HormonePlan_Estradiol_oral__c, HormonePlan_Estradiol_patch__c, HormonePlan_Estradiol_pellet__c, HormonePlan_Progesterone_oral__c, HormonePlan_Progesterone_sublingual__c, HormonePlan_Testosterone_Lipoderm__c, HormonePlan_Testosterone__c, HormonePlan_Testosterone_pellets__c, HormonePlan_Thyroid_NP__c, HormonePlan_Thyroid_comp_dessicated__c, Hormone_25_Hydroxyvitamin_D__c, Hormone_Assessment_Adrenal_Fatigue__c, Hormone_Assessment_Andropause__c, Hormone_Assessment_Fatigue__c, Hormone_Assessment_Menopause__c, Hormone_Assessment_Other__c, Hormone_Assessment_Sleep_Disorder__c, Hormone_Cortisol__c, Hormone_DHEA_S__c, Hormone_Estradiol_female__c, Hormone_Estradiol_male__c, Hormone_Free_T3__c, Hormone_Insulin_fastin__c, Hormone_PE_General_Appearance__c, Hormone_PSA_free__c, Hormone_PSA_total__c, Hormone_Plan_Estradiol_cream__c, Hormone_Plan_Estradiol_oral__c, Hormone_Plan_Estradiol_patch__c, Hormone_Plan_Estradiol_pellet__c, Hormone_Plan_Progesterone_oral__c, Hormone_Plan_Progesterone_sublingual__c, Hormone_Plan_Testosterone_Lipoderm__c, Hormone_Plan_Testosterone__c, Hormone_Plan_Testosterone_pellets__c, Hormone_Plan_Thyroid_NP__c, Hormone_Plan_Thyroid_comp_dessicated__c, Hormone_Progesterone__c, Hormone_Somatomedin_IGF_1__c, Hormone_TSH__c, JointPain_muscle_aches__c, Joint_pain_muscle_aches__c, NeuroDTR_without_hyperreflexia_asymmetry__c, NeuroDTRwithout_hyperreflexia_asymmetry__c, NeuroUE_LE_strength_grossly_intact__c, Neuro_Other_Notes__c, Neuro_Other__c, Neuro_UE_LE_strength_grossly_intact__c, Office_Visit_Follow_Up__c, PE_Abdomen_Other__c, PE_Abdomen_Soft_non_tender__c, PE_Chest_CTA_bilateral__c, PE_Chest_Heart_RRR__c, PE_Chest_Other__c, PE_HEENT_Other__c, PE_HEENT_PERRLA__c, PE_HEENT_Throat_WML__c, PE_Vascular_Distal_pulses_intact__c, PE_Vascular_Dorsalis_Pedis_absent__c, PE_Vascular_Other__c, Phone_Follow_up__c, PriorTreatment_Cytomel__c, PriorTreatment_Dessicated_Thyroid__c, PriorTreatment_Diet__c, PriorTreatment_Estradiol__c, PriorTreatment_Medical_Weight_Loss__c, PriorTreatment_Other__c, PriorTreatment_Premarin__c, PriorTreatment_Progestin__c, PriorTreatment_Synthroid__c, PriorTreatment_Testosterone__c, Prior_Treatment_Cytomel__c, Prior_Treatment_Dessicated_Thyroid__c, Prior_Treatment_Diet__c, Prior_Treatment_Estradiol__c, Prior_Treatment_Medical_Weight_Loss__c, Prior_Treatment_Other__c, Prior_Treatment_Premarin__c, Prior_Treatment_Progestin__c, Prior_Treatment_Synthroid__c, Prior_Treatment_Testosterone__c, Testosterone_Free_female__c, Testosterone_Free_male__c, Testosterone_Total__c, Vascular_Distal_pulses_intact__c, Vascular_Dorsalis_Pedis_absent__c, Vascular_Other__c, Vital_Pulse__c, Vital_Respiration_Rate__c, Vital_Temperature__c, Weight_loss_how_much__c, Client__c, Chart__c, Hormone_Plan_Thyroid_Armour__c, HormonePlan_Thyroid_Armour__c, Hormone_Plan_DHEA__c, HormonePlan_DHEA__c, Hormone_Plan_DHEA_Pregnenolene__c, HormonePlan_DHEA_Pregnenolene__c, Hormone_Plan_VIT_D3__c, HormonePlan_VIT_D3__c, Hormone_Plan_VIT_D3_ADK__c, HormonePlan_VIT_D3_ADK__c, Hormone_Plan_VIT_D3_D3_K2__c, HormonePlan_VIT_D3_D3_K2__c, Hormone_Plan_CoQ_10__c, HormonePlan_CoQ_10__c, Hormone_Plan_DIM__c, HormonePlan_DIM__c, Hormone_Plan_Aged_Garlic__c, HormonePlan_Aged_Garlic__c, Hormone_Plan_Fish_Oil__c, HormonePlan_Fish_Oil__c, Hormone_Plan_Iodine__c, HormonePlan_Iodine__c, Hormone_Plan_Niacin__c, HormonePlan_Niacin__c, Hormone_Plan_Ace_Inhibitor__c, HormonePlan_Ace_Inhibitor__c, Hormone_Plan_Other__c, HormonePlan_Other__c FROM Hormone_Primary_Health_Concerns__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createHormonePrimaryHealthConcerns(primaryHealthList);
        createCosmeticRecordChartFlowHandler.genericRecordsList(primaryHealthList);
        System.assert(true, primaryHealthList[0].Abdominal_areaWeight_gain_spare_tire__c);
        
    }
    @isTest
    public static void createFullPatientHistoryTest(){
        List<Full_Patient_History__c> listFullPatient = [SELECT AreasOf_Interest_Anti_Aging__c, Id, Chart__c, AreasOf_Interest_Botox_Dysport__c, AreasOf_Interest_Brown_Spots__c, AreasOf_Interest_Dermal_Fillers__c, AreasOf_Interest_Facials__c, AreasOf_Interest_Laser_Hair_Removal__c, AreasOf_Interest_None__c, AreasOf_Interest_Other__c, AreasOf_Interest_Skin_Rejuvenation__c, AreasOf_Interest_Spider_Veins__c, AreasOf_Interest_Tattoo_Removal__c, AreasOf_Interest_Weight_Management__c, Areas_of_Interest_Anti_Aging__c, Areas_of_Interest_Botox_Dysport__c, Areas_of_Interest_Brown_Spots__c, Areas_of_Interest_Dermal_Fillers__c, Areas_of_Interest_Facials__c, Areas_of_Interest_Laser_Hair_Removal__c, Areas_of_Interest_None__c, Areas_of_Interest_Other__c, Areas_of_Interest_Skin_Rejuvenation__c, Areas_of_Interest_Spider_Veins__c, Areas_of_Interest_Tattoo_Removal__c, Areas_of_Interest_Weight_Management__c, BloodClots_Phlebitis_Bleeding_Disorders__c, Blood_clots_Phlebitis_Bleeding_Disorders__c, ChemotherapyRadiation_theraphy__c, Chemotherapy_radiation_theraphy__c, HistoryOf_Accutane__c, HistoryOf_Acne_Medication__c, HistoryOf_Antibiotics__c, HistoryOf_Asthma__c, HistoryOf_Autoimmune_Disorders__c, HistoryOf_Blood_Thinner__c, HistoryOf_Botox_Restylane_Dermal_Filler__c, HistoryOf_Cancer_precancerous_lesions__c, HistoryOf_Currently_Breastfeeding__c, HistoryOf_Facial_Skin_Products__c, HistoryOf_Food_Allergies__c, HistoryOf_HIV__c, HistoryOf_Herbal_Supplements__c, HistoryOf_Hernias__c, HistoryOf_Herpes_Virus_Cold_Sore__c, HistoryOf_Hip_Replacement__c, HistoryOf_Internal_Metal_Devices__c, HistoryOf_Keliod_Hypertrophic_Scarring__c, HistoryOf_Latex_Allergies__c, HistoryOf_Lupus__c, HistoryOf_Lymph_Node_Removal__c, HistoryOf_Lymphedemia__c, HistoryOf_Multiple_Sclerosis__c, HistoryOf_Numbness_in_the_area__c, HistoryOf_Oral_Contraceptives__c, HistoryOf_Past_Surgeries__c, HistoryOf_Permanent_Make_up__c, HistoryOf_Polycystic_Ovarian_Syndrome__c, HistoryOf_Present_Scarring__c, HistoryOf_Recent_Cosmetic_Procedures__c, HistoryOf_Retin_A_or_Generics__c, HistoryOf_Sarcoidosis__c, HistoryOf_Scleroderma__c, HistoryOf_Seizures_Epilepsy__c, HistoryOf_Skin_Disorders__c, HistoryOf_Tattoos__c, HistoryOf_Varicose_Veins__c, HistoryOf_Vitiligo__c, HistoryOf_pregnant__c, History_Of_Accutane__c, History_Of_Acne_Medication__c, History_Of_Antibiotics__c, History_Of_Asthma__c, History_Of_Autoimmune_Disorders__c, History_Of_Blood_Thinner__c, History_Of_Botox_Restylane_Dermal_Filler__c, History_Of_Cancer_precancerous_lesions__c, History_Of_Currently_Breastfeeding__c, History_Of_Facial_Skin_Products__c, History_Of_Food_Allergies__c, History_Of_HIV__c, History_Of_Herbal_Supplements__c, History_Of_Hernias__c, History_Of_Herpes_Virus_Cold_Sore__c, History_Of_Hip_Replacement__c, History_Of_Internal_Metal_Devices__c, History_Of_Keliod_Hypertrophic_Scarring__c, History_Of_Latex_Allergies__c, History_Of_Lupus__c, History_Of_Lymph_Node_Removal__c, History_Of_Lymphedemia__c, History_Of_Multiple_Sclerosis__c, History_Of_Numbness_in_the_area__c, History_Of_Oral_Contraceptives__c, History_Of_Past_Surgeries__c, History_Of_Permanent_Make_up__c, History_Of_Polycystic_Ovarian_Syndrome__c, History_Of_Present_Scarring__c, History_Of_Recent_Cosmetic_Procedures__c, History_Of_Retin_A_or_Generics__c, History_Of_Sarcoidosis__c, History_Of_Scleroderma__c, History_Of_Seizures_Epilepsy__c, History_Of_Skin_Disorders__c, History_Of_Tattoos__c, History_Of_Varicose_Veins__c, History_Of_Vitiligo__c, History_Of_pregnant__c, Over_theCounter_medications__c, Over_the_counter_medications__c, PacemakersInternal_pacing_devices__c, Pacemakers_internal_pacing_devices__c, PregnantActively_trying_to_get__c, Pregnant_Actively_trying_to_get__c, TruSculptBody_Contouring__c, TruSculpt_Body_Contouring__c, one_of_above_apply_to_me__c, one_of_the_above_apply_to_me__c, Client__c, Arbitration_Acknowledgement_CheckBox_1__c, Arbitration_Acknowledgement_CheckBox_2__c, Arbitration_Verification_Date__c, Arbitration_Verification_Parent_or_Guard__c, Arbitration_Verification_Patient_Name__c, Return_Policy_Acknowledgement_CheckBox_1__c, Return_Policy_Acknowledgement_CheckBox_2__c, Return_Policy_Verification_Date__c, Return_Policy_Verification_Parents__c, Return_Policy_Verification_Patient_Name__c, Photo_Consent_Acknowledgement_CheckBox_1__c, Photo_Consent_Acknowledgement_CheckBox_2__c, Photo_Consent_Verification_Date__c, Photo_Consent_Verification_Parent_Guard__c, Photo_Consent_Verification_Patient_Name__c, SUGGESTION_for_Bag_or_Photo_Medication__c, History_Of_Diabetes_1__c, HistoryOf_Diabetes_1__c, History_Of_Medullary_thyroid_carcinoma__c, HistoryOf_Medullary_thyroid_carcinoma__c, Multiple_Endocrine_Neoplastic_SyndromeCB__c, Multiple_Endocrine_Neopla_SyndromeText__c FROM Full_Patient_History__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createFullPatientHistory(listFullPatient);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listFullPatient);
        System.assert(true, listFullPatient[0].Areas_of_Interest_Anti_Aging__c);
    }
    
    @isTest
    public static void createFollowUpTest(){
        List <Follow_up__c> listFollowUp = [SELECT Id, Chart__c, Cometics_Follow_Up__c, Client__c FROM Follow_up__c where client__c = null];
        createCosmeticRecordChartFlowHandler.createFollowUp(listFollowUp);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listFollowUp);
        System.assert(true, listFollowUp[0].Cometics_Follow_Up__c);

    }
    
    @isTest
    public static void createBotoxDysportTest(){
        List<Botox_Dysport__c> listBotox = [SELECT Id, Chart__c, Botox_Dysport_Injectable_Procedure_Area__c, Botox_Dysport_Procedure_Injectable__c, Botox_Dysport_Procedure_Units_Syringes__c, Botox_Dysport_Procedure_Reconstituted__c, Botox_Dysport_Procedure_Lot__c, Botox_Dysport_Procedure_Expiration__c, Injectable_Notes_Botox_Dysport__c, Client__c FROM Botox_Dysport__c where client__c = null];
        createCosmeticRecordChartFlowHandler.createBotoxDysport(listBotox);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listBotox);
        System.assert(true, listBotox[0].Injectable_Notes_Botox_Dysport__c);
    }
    
    @isTest
    public static void createDermalFillerTest(){
        List<Dermal_Filler__c> listDermFiller = [SELECT Id, Chart__c, Injectable_Notes_Dermal_Filler__c, Client__c FROM Dermal_Filler__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createDermalFiller(listDermFiller);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listDermFiller);
        System.assertEquals(null, listDermFiller[0].Chart__c);
    }
    
    @isTest
    public static void createDermaplaningTest(){
        List<Dermaplaning__c> listDermaplaning = [SELECT Id, Chart__c,Dermaplaning_treatment_details__c, Client__c FROM Dermaplaning__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createDermaplaning(listDermaplaning);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listDermaplaning);
        System.assert(true, listDermaplaning[0].Dermaplaning_treatment_details__c);
    }
    
  //  @isTest
   // public static void createEmsculptTest(){
     //   List<Emsculpt__c> listEmsculpt = [SELECT Id, Chart__c, Emsculpt_Photos_Taken__c, Emsculpt_Consents_signed__c, Emsculpt_Pre_Care_Reviewed__c, Emsculpt_date__c, Emsculpt_body_area__c, Emsculpt_Tx_Time__c, Emsculpt_Power_Used__c, Emsculpt_Notes__c, Emsculpt_post_treatment_notes__c, Client__c, Emsculpt_Post_care_reviewed__c FROM Emsculpt__c where Client__c = null];
     //   createCosmeticRecordChartFlowHandler.createEmsculpt(listEmsculpt);
      //  createCosmeticRecordChartFlowHandler.genericRecordsList(listEmsculpt);
       // System.assert(true, listEmsculpt[0].Emsculpt_Consents_signed__c);
  //  }
    
    @isTest
    public static void createFractionalLaserTest(){
        List<Fractional_Laser__c> listFracLaser = [SELECT Fractional_Laser_BLT_applied__c, Id, Chart__c, Fractional_Laser_Photos_Taken__c, Fractional_Laser_consents_signed__c, safety_eyewear_applied__c, lux_lotion_applied__c, Recent_sun_exposure__c, New_medications_since_last_treatment__c, Self_tanner_or_spray_tanner__c, Pregnant_or_Breast_Feeding__c, Improvement_since_last_treatment__c, Test_spot_performed__c, Fractional_Laser_Tx__c, Fractional_Laser_area__c, Fractional_Laser_tip__c, Fractional_Laser_joules__c, Fractional_Laser_pulses_ms__c, Fractional_Laser_ice_roller_applied__c, Fractional_Laser_HA_serum_applied__c, Fractional_Laser_notes__c, Fractional_Laser_passes_completed__c, Client__c FROM Fractional_Laser__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createFractionalLaser(listFracLaser);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listFracLaser);
        System.assert(true, listFracLaser[0].Fractional_Laser_BLT_applied__c);
    }
    
    @isTest
    public static void createIPLTest(){
        List<IPL__c> listIPL = [SELECT Id, Chart__c, Photos_Taken__c, Consents_signed__c, Safety_eyewear_applied__c, lux_lotion_applied__c, Recent_sun_exposure__c, New_medications_since_last_treatment__c, Self_tanner_spray_tanner_in_last_7_days__c, Improvement_since_last_treatment__c, Test_spot_performed__c, IPL_Tx__c, Area__c, Handpiece__c, IPL_skinTel__c, Baseline_Skintel__c, Joules__c, Pulse_width__c, Last_skintel__c, Notes__c, Sunscreen_applied__c, Last_Skin__c, Pregnant_or_Breast_Feeding_IPL__c, BLT_Applied_IPL__c, Client__c FROM IPL__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createIPL(listIPL);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listIPL);
        System.assert(true, listIPL[0].BLT_Applied_IPL__c);
    }
    
    @isTest
    public static void createLaserHairRemovalTest(){
        List<Laser_Hair_Removal__c> listLaserHair = [SELECT Id, Chart__c, Photos_taken__c, Consents_signed__c, Safety_eyewear_applied__c, Lux_lotion_applied__c, Recent_sun_exposure__c, New_medications_since_last_treatment__c, Self_tanner_spray_tanner_in_last_7_days__c, Pregnant_or_Breastfeeding__c, Improvement_since_last_treatment__c, Test_spot_performed__c, BLT_applied__c, Laser_Hair_Removal_area__c, Treatment__c, Tip__c, Joules__c, Pulse_width__c, Pases__c, Skintel__c, Baseline_Skintel__c, Skin_type__c, Notes__c, Client__c FROM Laser_Hair_Removal__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createLaserHairRemoval(listLaserHair);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listLaserHair);
        System.assert(true, listLaserHair[0].BLT_applied__c);
    }
    
    @isTest
    public static void createLaserVeinRemovalTest(){
        List<Laser_Vein_removal__c> listLaserHair = [SELECT Id, Chart__c, Photos_taken__c, Consents_signed__c, Safety_eyewear_applied__c, Lux_lotion_applied__c, Recent_sun_exposure__c, New_medications_since_last_treatment__c, Self_tanner_spray_tanner_in_last_7_days__c, Pregnant_or_Breastfeeding__c, Improvement_since_last_treatment__c, Test_spot_performed__c, BLT_applied__c, Area__c, Spot_size__c, ms__c, Joules__c, Notes__c, Jelly_applied__c, Skintel__c, Baseline_skintell__c, Ice_roller_used__c, Client__c FROM Laser_Vein_removal__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createLaserVeinRemoval(listLaserHair);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listLaserHair);
        System.assert(true, listLaserHair[0].BLT_applied__c);
    }
    
    @isTest
    public static void createTattooRemovalTest(){
        List<Tattoo_Removal__c> listTattooRemoval = [SELECT Id, Chart__c, Area__c, Date__c, Photos_taken__c, Consents_signed__c, Safety_eyewear_applied__c, Lux_lotion_applied__c, Recent_sun_exposure__c, New_medications_since_last_treatment__c, Self_tanner_spray_tanner_in_last_7_days__c, Pregnant_or_Breastfeeding__c, Improvement_since_last_treatment__c, Test_spot_performed__c, BLT_applied__c, Treatment__c, wavelength__c, Spot_size_mm__c, Energy__c, Rep_rate_hz__c, Frosting_present__c, Occlusive_balm__c, Notes__c, Client__c FROM Tattoo_Removal__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createTattooRemoval(listTattooRemoval);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listTattooRemoval);
        System.assert(true, listTattooRemoval[0].Area__c);
    }
    
    @isTest
    public static void createSculptraBodyTest(){
        List<Sculptra_body__c> listSculptra = [SELECT Id, Chart__c, Area__c, Client__c, Injectables__c, of_vials__c, Lot__c, Expiration_date__c, Dilution__c, Reconstitution__c, Injectable_notes__c FROM Sculptra_body__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createSculptraBody(listSculptra);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listSculptra);
        System.assert(true, listSculptra[0].Injectable_notes__c);
    }
    
    @isTest
    public static void createSkinpenMicroneedlingTest(){
        List<SkinPen_Microneedling__c> listSkinMicro = [SELECT Id, Chart__c, Photos_Taken__c, Pre_Care_reviewed__c, Consents_signed__c, Post_care_reviewed__c, Areas_treated__c, tx__c, Topical_anesthesia__c, Number_of_passe__c, Client__c, Procedure_depth__c, Notes__c FROM SkinPen_Microneedling__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createSkinpenMicroneedling(listSkinMicro);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listSkinMicro);
        System.assert(true, listSkinMicro[0].Consents_signed__c);
    }
    
    @isTest
    public static void createTrusculptTest(){
        List<TruSculpt__c> listTrusculpt = [SELECT Id, Chart__c, Photos_Taken__c, Consents_signed__c, Pre_care_reviewed__c, Post_care_reviewed__c, Date__c, Hydration_level__c, Body_area__c, Tx_time__c, Employee_hook_up_initials__c, Power_used__c, Employee_mid_point_initials__c, Notes__c, Average_tuning__c, Employee_removal_initials__c, Post_Treatment_Notes__c, Client__c FROM TruSculpt__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createTrusculpt(listTrusculpt);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listTrusculpt);
        System.assert(true, listTrusculpt[0].Consents_signed__c);
    }
    
    @isTest
    public static void createVanquishTest(){
        List<Vanquish__c> listVanquish = [SELECT Id, Chart__c, Consents_signed__c, Photos_Taken__c, Pre_care_reviewed__c, Post_care_reviewed__c, Post_Treatment_Notes__c, Client__c FROM Vanquish__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createVanquish(listVanquish);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listVanquish);
        System.assert(true, listVanquish[0].Consents_signed__c);
    }
    
    @isTest
    public static void createWeightLossInjectionsTest(){
        List<Weight_Loss__c> listWeightLoss = [SELECT Id, Chart__c, Additional_notes__c, Other_notes__c, Client__c FROM Weight_Loss__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createWeightLossInjections(listWeightLoss);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listWeightLoss);
        System.assert(true, listWeightLoss[0].Additional_notes__c);
    }
    
    @isTest
    public static void createGeneralExamTest(){
        List<General_Exam__c> listGeneral = [SELECT Id, General_Exam__c, Client__c, Chart__c FROM General_Exam__c where Client__c = null];
        createCosmeticRecordChartFlowHandler.createGeneralExam(listGeneral);
        createCosmeticRecordChartFlowHandler.genericRecordsList(listGeneral);
        System.assert(true, listGeneral[0].General_Exam__c);
    }
     
}