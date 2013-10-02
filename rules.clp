(defglobal ?*currentQuestion* = 1)
(defglobal ?*points* = 0)
(defglobal ?*total* = 200)
(defglobal ?*questionNumber* = 19)

(deftemplate Order
    (slot counter)
    )
(deftemplate Description
    (slot name)
    (slot type)   
    (slot id)
    (slot explanation)
    )
(deftemplate Reason
    (slot name)
    (slot type)
    (slot explanation)
    (slot extraInfo
        (default "No Extra Information"))
    (slot url
    	(default "noImage.png"))
	(slot points
    	(default 0))
    )
(deftemplate Information
    (slot question)
    (slot explanation)
    (slot extraInfo
        (default "No Extra Information"))
    (slot questionType
        (default "SINGLE*"))
    (slot options
        (default "none*"))
    	(slot caption
        (default " *"))
    )
(deftemplate advice
    (slot text)
    )
(deftemplate Input
    (slot name)
    )
(deftemplate Question
    (slot section)  
    (slot type)
    (slot text)
    (slot answerType
        (default "YES-NO"))
    (slot ask
        (default yes))
    (slot order)
    (slot options
        (default ""))
    )
(deftemplate Feedback
    (slot explanation)
    (slot stage)
    )
(deffacts Questions
    ;Initial questions
    (Question (section Initial)(type "name")(text "Hi, I am Doctor Mellitus, a Diabetes Advisor, what is your name?") (answerType "INPUTT") (order 1))
    (Question (section Initial)(type "gender")(text "Are you male or female?")(answerType "MALE-FEMALE") (order 2))
    (Question (section Initial)(type "diabetesK")(text "Do you know about the disease called Diabetes?") (answerType "YES-NO") (order 3))
    (Question (section Initial)(type "diabetic")(text "Are you a Diabetic?") (answerType "OPTIONAL") (order 4)(options "Yes-No-Uncertain" ))
    (Question (section Initial)(type "Race")(text "What is your race?") (answerType "OPTIONAL")(order 5)(options "Black-White-Asian-Coloured-Other" ))
    (Question (section Initial)(type "Age")(text "How old are you?") (answerType "INPUTN") (order 6))
    (Question (section Initial)(type "familyH")(text "Do you have relatives who have been diagnosed with Diabetes?")(answerType "OPTIONAL")(options "Yes-No-Uncertain" )(order 7))
    (Question (section Initial)(type "familyType")(text "Is this relative any of the following?")(answerType "OPTIONAL")(options "Parent-Sibling-Grandparent-Aunt/Uncle-Other" )(order 8))
    (Question (section Initial)(type "pregnant")(text "Are you Pregnant?") (answerType "YES-NO") (order 9))
    (Question (section Initial)(type "weight")(text "What is your weight (Kilograms)")(answerType "INPUTND") (order 10))
    (Question (section Initial)(type "height")(text "What is your height (Meters)") (answerType "INPUTND") (order 11))
    ;Lifestyle questions
    (Question (section Lifestyle)(type "smoke")(text "Do You smoke cigarettes?") (answerType "YES-NO")(order 12))
    (Question (section Lifestyle)(type "smokeF")(text "How often do you smoke, please be honest?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" ) (order 13))
    (Question (section Lifestyle)(type "alcohol")(text "Do you consume any alcohol?") (answerType "YES-NO")(order 14))
    (Question (section Lifestyle)(type "alcoholF")(text "Alcohol is advised..in moderation
            How often do you drink alcohol?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" )(order 15))
    (Question (section Lifestyle)(type "exercise")(text "Do you do any sort of explicit physical exercise?") (answerType "YES-NO")(order 16))
    (Question (section Lifestyle)(type "exerciseF")(text "That's great, How often do you exercise?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" )(order 17))
    (Question (section Lifestyle)(type "bp")(text "Have you checked your blood pressure recently?") (answerType "YES-NO")(order 18))
    (Question (section Lifestyle)(type "bpLevel")(text "What level is your blood pressure?") (answerType "OPTIONAL")(options "Low-Average-High" )(order 19))
    (Order (counter 12))
    )
(deffacts Description
   (Description(name Fatigue)(type SYMPTOM) (id "fatigue")(explanation "Do you feel tired a lot? A feeling of tiredness that can not be explained."))
   (Description(name Frequent-Headache)(type SYMPTOM)(id "headache") (explanation "Do you have frequent headaches and do they sometimes last a long time (2-3 days)?*"))
   (Description(name Extreme-Thirst)(type SYMPTOM) (id "thirst") (explanation "Do you feel thirsty often throughout the day?*"))
   (Description (name Excessive-Urination)(type SYMPTOM)(id "urinating") (explanation "Do you make frequent trips to the toilet to urinate (pee)?*"))
   (Description (name Nausea)(id "nausea")(type SYMPTOM)(explanation "Do you have an uneasy feeling in your stomach? A feeling that makes you feel like vomitting, especially after eating?*"))
   (Description (name Weightloss)(type SYMPTOM)(id "weightloss") (explanation "Have you lost weight over the recent months/years, even though you have not been trying to do so actively?*"))
   (Description (name Irritability)(type SYMPTOM)(id "irritability")(explanation "Do you feel easily irritated and agitated, for no known reason?*"))
   (Description (name Yeast-Infection)(type SYMPTOM)(id "yeast")(explanation "Do you experience itching, burning, soreness, pain during intercourse and urination?*"))
   (Description (name Blurred-Vision) (type SYMPTOM)(id "blurvision")(explanation "Do you have problems seeing at times? Is your eyesight problematic?*"))
   (Description(name Slow-Healing-Wounds) (type SYMPTOM)(id "wounds")(explanation "Do your cuts and soars take a very long time to patch up and heal?*"))
   (Description (name Numbness)(id "numbness")(type SYMPTOM)(explanation "Do you lose sensation and feeling in certain body parts? Do your hands and feet ever feel numb?*"))
   (Description(name Gum-Infection)(type SYMPTOM)(id "teethandgum")(explanation "Have you been experiencing any teeth and gum related problems recently, like gum infection or loss of teeth?*"))
   (Description(name Extreme-Hunger)(type SYMPTOM)(id "hunger")(explanation "Do you experience hunger that seems unnatural, like soon after a big meal?*"))
   (Description(name Erectile-Dysfunction)(type SYMPTOM)(id "dysfunction")(explanation "Are you experiencing sexual difficulty with your woman, do you find it hard to get an erect penis?*") )
   (Description(name Gestational-Diabetes)(type SYMPTOM)(id "gestational")(explanation "Have you ever been diagnosed with Gestational Diabetes during pregnancy?*") )
   (Description(name Dry-Mouth)(type SYMPTOM)(id "dryMouth")(explanation "Does your mouth feel dry at  times, do you often find that you have little to no saliva in your mouth?*"))
   (Description(name Abdominal-Pain)(type SYMPTOM) (id "abdominal")(explanation "Does the area surrounding your stomach pain, especially after eating food and during digestion?*"))
    )
;The list of symp toms and their explanations
(deffacts symptomReason
   (Reason (name Fatigue)(type SYMPTOM)(points 2)(explanation "Fatigue - The glucose is not being converted into energy this weakens the cells and causes fatigue."))
   (Reason (name Frequent-Headache)(type SYMPTOM)(points 4)(url "headache.jpg")(explanation "Frequnt Headaches - This is due to the high level of glucose in the blood, this leads to frequent headaches experiecned for prolonged periods of time."))
   (Reason (name Extreme-Thirst)(type SYMPTOM)(points 10)(explanation "Extreme Thirst - Dehydration is caused by excess urine, this prompts an increased desire for water consumption."))
   (Reason (name Excessive-Urination)(type SYMPTOM)(points 10)(explanation "Excessive Urination - There is a high loss of Glucose through the urine."))
   (Reason (name Nausea)(type SYMPTOM)(url "nausea.jpg")(points 5)(explanation "Nausea - Nausea is caused by gastroparesis.")(extraInfo "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
   (Reason (name Weightloss)(type SYMPTOM)(points 10)(explanation "Weightloss - Insulin deficiency leads to loss of weight, as the sugar cannot be converted into energy, so the body seeks alternative sources like muscle tissue and fat."))
   (Reason (name Irritability)(type SYMPTOM)(points 1)(explanation "Irritability - Caused by a lack of energy. As the sugar is not being converted into energy to be used by the cells."))
   (Reason (name Yeast-Infection)(type SYMPTOM)(points 8)(explanation "Yeast Infection - Yeast organisms are present in most woman, but these organisms tend to overgrow in a sugar rich environment. A result of badly managed diabetes")
    	(extraInfo "Yeast is a type of fungus; yeast infection refers to the fungus scientifically known as Candida"))
   (Reason (name Blurred-Vision)(type SYMPTOM)(points 3)(explanation "Blurred Vision - The fluctuation in blood glucose levels leads to a light sensitivity. Also this can be caused by the tissue being pulled from the eye lenses tob e used for energy by the body."))
   (Reason (name Slow-Healing-Wounds)(type SYMPTOM)(points 5)(explanation "Slow Healing Wounds - Elevated blood sugar levels cause narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds."))
   (Reason (name Numbness)(type SYMPTOM)(points 4)(explanation "Numbness - The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Gum-Infection)(type SYMPTOM)(points 8)(url "teethandgum.jpg")(explanation "Gum Infection - High glucose levels in saliva promotes growth of bacteria that cause gum disease.") 
        (extraInfo "Diabetes reduces the body’s resistance to infection, which increases the probability of the gums becoming infected."))
   (Reason (name Extreme-Hunger)(type SYMPTOM)(points 8)(url "hunger.jpg")(explanation "Extreme Hunger - The dropping blood sugar levels lead to a desire for more food and energy."))
   (Reason (name Erectile-Dysfunction)(type SYMPTOM)(points 10)(url "dysfunction.jpg")(explanation " Erectile Dysfunction - This is a result of the nerve damage in the body.") )
   (Reason (name Gestational-Diabetes)(type SYMPTOM)(points 10)(url "gestational.jpg")(explanation "Gestational Diabetes - During pregnancy there is a lot of hormonal activity within the body, this affects the functioning of the insulin and might alter/interfere with how the body responmds tot he insulin. This condition usually subsides after the pregnacny") )
   (Reason (name Dry-Mouth)(type SYMPTOM)(url "drymouth.jpg")(points 7)(explanation "Dry Mouth - This is caused by dehydration in the body.") 
        (extraInfo "Dehydration is a result of the high demand for bodily fluids drawn from the tissues to help excrete the excess sugar from the body"))
   (Reason (name Abdominal-Pain)(type SYMPTOM)(points 8)(url "abdominal.jpg")(explanation "Abdominal Pain - Because of the gastroparesis, the stomach cannot empty its contents properly leading to stomach pain and cramping") 
        (extraInfo "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
   
    )
; Extra information that accompanies the symptoms
(deffacts Information
    (Information (question "7. Diabetes management*") (explanation "Type 1 Diabetes is difficult to control thus the treatment is a daily task.The strict regimen includes a carefully calculated diet, 
            planned physical activity and multiple insulin injections (frequently). 
            As well as a home blood glucose testing facility to check the levels throughout the day.-
            Type 2 Diabetes treatment typically includes diet control, frequent exercise, a home blood glucose testing facility 
            and in certain cases oral medication and insulin injections. The majority of Type 2 Diabetics do not require insulin injections.-
            Gestational Diabetes is brought about by hormonal effects of the pregnancy, thus no supplementary insulin is required. 
            The patient needs to ensure they exercise appropriately and maintain a healthy diet throughout the pregnancy to avoid developing type 2 Diabetes in the long run.-
            As a diabetic, your body cannot make proper use of insulin, leading to a high blood glucose level throughout the body.
			One needs to eat healthy to to keep the blood sugar levels within range, this is a very critical aspect of living with Diabetes.
            A dietitian can help cater a diet specific for you as this depends on your BMI(Body Mass Index), medicine, lifestyle and any health problems that one might have.            
            A healthy diebetic should do the following:
            Limit foods that are high in sugar.
            Eat small portions spread throughout the day.
            Watch the carbohydrate intake.
            Eat a variety of whole grains.
            Eat less fat .
            Limit the intake of alcohol.
            Use less salt.-
            Exercise is essential for a diabetic, it will not just help with weightloss, but it will also help the body
            use insulin better, so it can convert glucose into energy for cells.It does not even have to be very strenuous, 
            even just walking reguarly will help.
            Stress should be managed, because stress hormones, may alter blood glucose levels directly.
            Meditaion could be utilized as a very useful tool to manage stress.-
            Diabetics should take good care of their feet, skin, eyes and teeth and gum.
            Diabetics have a higher risk of blindness, cataracs and gum problems.So basic dental hygiene like brushing teeth  and flossing along with regular dentist vists will help tremendously.
            Because of the loss of sensation, this could mean not noticing a wound or infection for a prolonged period of time, so it is advised to check your feet regularly.*"
            )
        (caption "These are tips on how to manage a life after having being diagnosed with Diabetes.
            There is unfortunately no proven cure for Diabetes
            Depending on the type of Diabetes you have been diagnosed with, the treatments differ slightly*")
            (questionType "MULTIPLE*")
        	(options "Type 1-Type 2-Gestational-Diet-Lifestyle-Body Maintenance*")	
        )
    (Information (question "6. Diabetes prevention*") (explanation "Diabetes can be prevented, if the right precautions and mindset are incorporated into everyday life. There are certain things that
            are not in ones control, like family history and age. But one can take full control of their weight, lifestlye, habits and diet. Please refer to the response to question 7 for the appropriate
            measures to prevent the onset of Diabetes.Managing Diabetes is the same as preventing it,as it encourages a healthy diet and lifestyle.
           *")	         
        )
    (Information (question "5. Diabetes complications*") (explanation "Type 2 diabetes may increase the risk of Alzheimer's disease. The poorer your blood sugar control, the greater the risk appears to be. One theory is that cardiovascular problems caused by diabetes could contribute to dementia by blocking blood flow to the brain or causing strokes. Other possibilities are that too much insulin in the blood leads to brain-damaging inflammation, or lack of insulin in the brain deprives brain cells of glucose.-
            Diabetes dramatically increases the risk of various cardiovascular problems, including coronary artery disease with chest pain (angina), heart attack, stroke and narrowing of arteries (atherosclerosis). If you have diabetes, you are more likely to have heart disease or stroke.-
            Diabetes can damage the blood vessels of the retina (diabetic retinopathy), potentially leading to blindness. -
            The kidneys contain millions of tiny blood vessel clusters (glomeruli) that filter waste from your blood. Diabetes can damage this delicate filtering system. Severe damage can lead to kidney failure or irreversible endstage kidney disease, which may require dialysis or a kidney transplant-
            Excess sugar can injure the walls of the tiny blood vessels (capillaries) that nourish your nerves, especially in the legs. This can cause tingling, numbness, burning or pain that usually begins at the tips of the toes or fingers and gradually spreads upward. Left untreated, you could lose all sense of feeling in the affected limbs. Damage to the nerves related to digestion can cause problems with nausea, vomiting, diarrhea or constipation. For men, it may lead to erectile dysfunction.-
            Nerve damage in the feet or poor blood flow to the feet increases the risk of various foot complications. Left untreated, cuts and blisters can become serious infections. Severe damage might require toe, foot or even leg amputation.-
            The bones of people with Osteoporosis become thin and weak and are much more likely to fracture, especially the hip, spine, and wrist.-
            Diabetes may leave you more susceptible to skin problems, including bacterial and fungal infections.With gum infections being a major concern
            *")
            (questionType "MULTIPLE*")
        	(caption "Diabetes has a lot of complications that can result if not managed appropriately, early diagnosis plays a large role in
            preventing the complications from arising. Either because the body is insulin resistant or the pancreas is not 
            producing enough insulin, this leads to a high blood glucose level througouht the body, which can cause infections and disease over a period of time. 
            Badly managed Diabetes will eventally result in death.*")
        	(options "Alzheimer's disease-Cardiovascular Disease-Eye damage-Kidney damage-Nerve damage-Foot damage-Osteoporosis-Skin and mouth conditions.*")	
        )
    (Information (question "4. What are the symptoms of Diabetes*") (explanation "The fluctuation in blood glucose levels leads to a sensitivity to light. Also another reason is a result of the tissue being pulled from the eye lenses to be used for energy by the body.-
            This is caused by dehydration in the body, the mouth tends to get dry because of the high loss of liquids through urination.-
            This is a result of the nerve damage in the body, leading to males not being able to perform sexually. A lot of males experience erectile dysfuction-            
            There is a high loss of Glucose through the urine, this causes one to go to the toilet very often.-
            The dropping blood sugar levels lead to a desire for more food and energy, causing a continuous feeling of hunger.-
            Dehydration is caused by excess urine, this prompts an increased desire for water consumption.-  
            The glucose is not being converted into energy this weakens the cells and causes fatigue.-
            This is due to the high level of glucose(~) in the blood, this leads to frequent headaches experienced for prolonged periods of time.-
            During pregnancy there is a lot of hormonal activity within the body, this affects the functioning of the insulin and might alter/interfere with how the body responmds tot he insulin. This condition usually subsides after the pregnacny-
            High glucose levels in saliva promotes growth of bacteria that cause gum disease, because bacteria thrives in such an environment.-
            This is caused by a lack of energy. As the sugar is not being converted into energy to be used by the cells, leading to irritability.-
            Nausea is caused by gastroparesis.-
            The nerves in the body get damaged over time, leading to a tingling sensation, pain and an eventual loss of sensation.-
            Elevated blood sugar levels are caused by the gradual narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds.This increases the amount of time taken to heal. -
            Insulin deficiency leads to loss of weight, as the sugar cannot be converted into energy, so the body seeks alternative sources like muscle tissue and fat, gradually eating away at the body.-
            Yeast organisms are present in most woman, but these organisms tend to overgrow in a sugar rich environment. A result of badly managed diabetes.
            *")
        (questionType "MULTIPLE*")
        (options "Blurred Vision-Dry Mouth-Erectile Dysfunction-Exesive Urination-Extreme Hunger-Extreme Thirst-Fatigue-Frequent Headaches-Gestational Diabetes-Gum Infection-Irritability-Nausea-Numbness-Slow Healing Wounds-Weightloss-Yeast Infection*")
        (caption "Diabetes can be picked up through the symptoms that manifest over time. There are alot of symptoms that come with Diabetes. 
            Although with Type 2 Diabetes, these signs of Diabetes might not be made visible through symptoms for a very long time, making it difficult for someone to know their Diabetes status*"))
    (Information(question  "3. What are the types of Diabetes?*") (explanation "Type 1 Diabetes occurs when the beta cells in the pancreas are damaged. 
            Therefore the pancreas does not produce insulin anymore. Type 1 normally occurs in people under the age of 30 (it used to be called Juvenile Diabetes).-Type 2 Diabetes occurs when the beta cells in the body are resistant to the effect of insulin. 
            It develops gradually over a period of time.There is a high association with a family history of Diabetes and obesity. 
            Type 2 normally occurs in people older than 40 years of age-.
            This type of diabetes affects about 2% to 10% of females during last months of pregnancy. 
            Pregnant women have enough insulin, but the effect of insulin is partially blocked by other hormones produced in the placenta during pregnancy.
            This causes a rise in sugar levels.
            The disease normally disappears after pregnancy.-
            Prediabetes is the precursor of diabetes where the blood glucose levels 
            are higher than normal but not high enough to be considered as Diabetes. 
            However, if the condition is tackled at this stage through diet, 
            exercise and other healthy lifestyle changes (weight management programme), the risk can be significantly reduced.*")
        (questionType "MULTIPLE*")
        (options "Type 1-Type 2-Gestational-Prediabetes*")
        (caption "There are three distinct types of Diabetes, along with prediabetes which is sort of the prelude to Diabetes that should raise many warning bells because of rising blood sugar levels in the body.*")
        )
    (Information (question "2. What are the causes of Diabetes?*") 
        (explanation "Obesity is thought to be the primary cause of Type 2 Diabetes in people who already have a family history of the disease
            When a person is obese, the body has to deal with more nutrients than it can handle, 
            to counter this the cells stop reacting to insulin as long as the body is overweight. 
            This leads to the whole body to eventually be resistant to insulin, the onset of Type 2 Diabetes-
            If someone in your family has has Type 2 Diabetes, then you are at risk of developing the disease
            The closer the realtive the greater the risk, with studies showing that people with one parent with Diabetes has double the risk,
            while people with two diabtic parents have six times the risk of being diagnosed with Diabetes, with mothers presenting a greater risk than fathers.
            Famiily history is a great contributing factor that people often down play and take for granted.-
            If the pancreas is damaged and not working properly this leads to insufficient insulin secretion, the onset of Type 1 Diabetes*")
        (questionType "MULTIPLE*")
        (options "Obesity-Family History-Pancreas malfunction*")
        (caption "There are a few causes of Diabetes that play a significant role in your chances of getting the Disease, these are obesity, family history of Diabetes and the 
            malfunctioning of the Pancreas(~)*"))
    (Information (question "1. What is Diabetes Mellitus?*") (explanation "Diabetes Mellitus, more commonly known simply as Diabetes is a chronic medical condition where a person has 
            high blood sugar levels.This is either because the insulin production in the body is insufficient or because the body does not respond properly to insulin*"))
        (Information (question "0. KEYWORDS*") (explanation "Glucose is the most important simple sugar in a human metabolism, blood glucose is the level of glucose present in the blood stream-
            	Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process-
             Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood.-
             The Pancreas is long soft organ behind your stomach and infront of your spine, it produces insulin to help break down the food and hormones that halp control the blood sugar levels.-
            Yeast is a type of fungus; yeast infection refers to the fungus scientifically known as Candida*")
        (questionType "MULTIPLE*") 
        (options "Blood Glucose-Gastroparesis-Insulin-Pancreas-Yeast*")
        (caption "Important keywords that will be needed to understand defintions*")
        )      
    )
;Returns informationpertaining to the selected symptoms experienced by the user
(defrule getInfo
    (Get Info)
    (Information (question ?question) (explanation ?explanation)(questionType ?type) (options ?theOptions) (caption ?theCaption)) 
    =>
    	(printout out ?question)
    	(printout out2 ?type)
    	(printout out3 ?theOptions)
    	(printout out4 ?explanation)
    	(printout out5 ?theCaption)
    )
;Asks the initial set of questions
(defrule askQuestionInitial
    ?ask <- (Ask-Question-Initial)
    ?question <- (Question (section Initial)(type ?type)(text ?questionText) (answerType ?answerType) (ask yes) (order ?current) (options ?options))
    =>
    (if (eq ?current ?*currentQuestion*) then
    (bind ?counter (+ ?*currentQuestion* 1))
    (bind ?*currentQuestion* ?counter)
    (printout out ?questionText)
    (printout out2 ?answerType)    
    (printout out3 ?type)
    (printout out4 ?options)
    (printout out6 (* (/ ?*points* ?*total*) 100))      
    (modify ?question (ask no))
    (retract ?ask)
        )
    )
;Changes the order of the initial questions to ask, if a question should not be asked anymore.
(defrule changeInitialQuestions
    (declare (salience 5))
    (Ask-Question-Initial)
    ?question <- (Question (section Initial) (type ?type)(text ?questionText) (answerType ?answerType) (ask no) (order ?current))
    =>
    (if (eq ?current ?*currentQuestion*) then
    	(bind ?counter (+ ?*currentQuestion* 1))	
    	(bind ?*currentQuestion* ?counter)
    )
    )
;Changes the order of the lifestyle questions to ask, if a question should not be asked anymore.
(defrule changeLifestyleQuestions
    (declare (salience 5))
    (Ask-Question-Lifestyle)
    ?order <- (Order (counter ?counter))
    ?question <- (Question (section Lifestyle)(type ?type)(text ?questionText) (answerType ?answerType) (ask no) (order ?current))
    =>
    (if (eq ?current ?*currentQuestion*) then
    	(bind ?theCounter (+ ?*currentQuestion* 1))	
    	(bind ?*currentQuestion* ?theCounter)
    	(bind ?var (+ ?counter 1))
        (modify ?order (counter ?var))
        )
    )
;Asks the questions relating to Lifestyle.
(defrule askQuestionLifestyle
    ?ask <- (Ask-Question-Lifestyle)
    ?question <- (Question (section Lifestyle)(type ?type)(text ?questionText) (answerType ?answerType) (ask yes) (order ?current) (options ?options))
    ?order <- (Order (counter ?counter))
    =>
    (if (eq ?current ?*currentQuestion*) then
    (bind ?counter (+ ?*currentQuestion* 1))
    (bind ?*currentQuestion* ?counter)
    (printout out ?questionText)
    (printout out2 ?answerType)    
    (printout out3 ?type)
    (printout out4 ?options)
	(printout out6 (* (/ ?*points* ?*total*) 100))  
    (modify ?order (counter ?current))
    (modify ?question (ask no))
    (retract ?ask)
     )
    )
(defrule finished
    (Order (counter ?number))
    =>
    (if (eq ?number ?*questionNumber*)then 
    	(assert (Assessment Complete))
        )
    )
;Shows the explanation of the symptom in question.
(defrule finalFeedback
    (Assessment Complete)
    =>
    (assessPercentage())
    )
(defrule showReason
    ?input <- (Input (name ?inputName))
    ?reason <- (Description (name ?name) (explanation ?explanation))
    =>
    (bind ?*currentSymptom* ?inputName)
    (if (eq ?inputName ?name) then 
    (printout out ?explanation)
    (retract ?input) 
    )   
    )
;calculates the BMI with the provided weight and height of the user.
(defrule bmi
    (Height ?userHeight)
    (Weight ?userWeight)
    =>
    (bind ?weight ?userWeight)
    (bind ?height ?userHeight)
    (bind ?bmi (/ ?userWeight (* ?userHeight ?userHeight)))
    (assert (BMI ?bmi))
    
   (if (> ?bmi 30) then 
    	(assert (weight-classification Obese))
        (assert (stage INITIAL)(Feedback (explanation "Your BMI is above 30 kg/m^2, this classifies you as Obese,
                        this is very concerning because Obesity is a cause of Type 2 Diabetes.
                        You need to urgently try to manage your diet and incorporate some exercise into your daily/weekly routine.*"))) 
       (bind ?*points* (+ ?*points* 20))
          else
        	(if (> ?bmi 25) then
       		( assert (weight-classification Overweight))
                (assert (stage INITIAL)(Feedback (explanation "Your BMI is above 25 kg/m^2, this classifies you as Overweight,
                            this is slightly concerning if this is mostly body fat and not muscle.*")))
               (bind ?*points* (+ ?*points* 10)) else
           		(if (> ?bmi 18.5) then 
                		(assert (weight-classification OptimalWeight))
                    	(assert (Feedback (stage INITIAL) (explanation "Your BMI is between the range of 18kg/m^2 and 25 kg/m^2, this classifies you as having an Optimal weight, well done!
                                Keep doing what your are doing :)*"))) else
                			(if (< ?bmi 18.5 ) then
                   			(assert (weight-classification Underweight))
                              (assert (Feedback (stage INITIAL) (explanation "Your BMI is below, 18 kg/m^2, you are slightly underweight, a bit more body mass would be great.*")))
                	)
                   )
               )
            )
        )
(defrule printSymptoms
    (Symptoms)
    (Reason (name ?name) (explanation ?explanation))
    =>
    (printout out (?name crlf ?explanation))
    )
;Returns the name of the user.
(defrule getName
    ?request <- (Get Name)
    (name ?name)
    =>
    (printout out ?name)
    (retract ?request)
    )
;Returns the list of symptoms.
(defrule getSymptoms
    ?command <- (Get Symptoms)
    (Description(name ?name)(type SYMPTOM)(id ?id)(explanation ?explanation))
   	=>
    	(printout out ?name " ")
    	(printout out2  ?id " ")
    	(printout out3  ?explanation " ")
    	;(retract ?command)
    )
;Returns the information for a particular symptom.
(defrule getSymptom
    ?command <- (Symptom ?symptom)
    (Reason (name ?symptom)(type SYMPTOM)(points ?points)(url ?url)(explanation ?explanation)(extraInfo ?additional))
    =>
    	(printout out ?symptom)
    	(printout out2  ?url)
    	(printout out3  ?explanation)
   		(printout out4  ?additional)    
    	(bind ?*points* (+ ?*points* ?points))
    	(assert (Has-Symptom ?symptom))
    	(retract ?command)
    )
;If the suer is male then they are not pregnant and dont show yeast infection * gestational symtoms.
(defrule isMale
    (declare (salience 10))
    (Gender Male)
    ?question <- (Question (section Initial) (type "pregnant")(ask yes))
    ?femaleQ1 <- (Description(type SYMPTOM)(id "gestational"))
    ?femaleQ2 <- (Description(type SYMPTOM)(id "yeast"))
    =>
    (assert (Pregnant No))
    (modify ?question (ask no))
    (bind ?*total* (- ?*total* 10))
    (retract ?femaleQ1 ?femaleQ2)
    )
(defrule isFemale
    (declare (salience 10))
    (Gender Female)
    ?femaleQ1 <- (Description(type SYMPTOM)(id "dysfunction"))
    =>
    (bind ?*total* (- ?*total* 5))
    )
;Asserts the totals with the values.
(defrule familyH
    (declare (salience 10))
    (Family-History No)
    ?question <- (Question (section Initial) (type "familyType")(ask yes))
    =>
    	(modify ?question (ask no))
    )
(defrule family
    (Family-Type ?family)
    =>
    (bind ?*points* (+ ?*points* (family ?family)))
    )
;If family history is uncertain add an amount to points probability wise
(deffunction uncertain(?value)
    (bind ?point 0)
    (if (eq Uncertain ?value) then
        (bind ?point 2))
    ?point
    )
(deffunction race (?race)
    (bind ?point 0)
     (if (neq White ?race) then
        (bind ?point 1)
        (assert (Feedback (stage INITIAL)(explanation "Non white ethnic groups have a higher prevalence of diabetes, with certain ethnic groups having a higher rate of diabetes-related complications and deaths caused by Diabetes.*")))
         else
        (bind ?point 3))
    ?point
    )
;Adds points depending on the race
(defrule ageR
    (Age ?age)
    =>
    (bind ?*points* (+ ?*points* (age ?age)))
    )
(defrule raceR
    (Race ?race)
    =>
    (bind ?*points* (+ ?*points* (race ?race)))
     )
(defrule FH
    (Family-History ?history)
    =>
     	(bind ?*points* (+ ?*points* (uncertain ?history)))
    )
(deffunction assessPercentage()
    (bind ?percentage (* (/ ?*points* ?*total*) 100))
    (if (> ?percentage  85) then
       (assert (Feedback (stage FINAL) (explanation " You have a very high risk of Diabetes, this is a great concern and should be dealt with immediately
                    you should go to the nearest hospital and seek professional medical attention a soon as possible. Only after blood glucose tests, can you be oficially diagnosed with Diabetes*"))) else
        (if (> ?percentage 60) then
            (assert (Feedback (stage FINAL) (explanation " You have quite a high risk of Diabetes, this should be checked with a medical professional.*"))) else
            (if (> ?percentage 40) then
                (assert (Feedback (stage FINAL) (explanation " You stand an almost 50% risk of Diabetes, this should be seen as a concern and should be taken as a warning sign,
                                be sure to check why you are experiencing the symptoms you are experiencing*"))) else 
                (if ( > ?percentage 20) then
                    (assert (Feedback (stage FINAL) (explanation " You have a low risk of Diabetes, it should not be anything to worry about, provided you continue to eat well
                                    and live a healthy lifestyle.*"))) else 
                    (assert (Feedback (stage FINAL) (explanation "You have a very low risk of Diabetes, this is because of your lack of threatening risk factors
                                    and decent lifestyle habits, please do continue and remember to eat healthy and keep active!*")))
                    )
                ) 
         	)
        )
    )
(deffunction age (?age)
    (bind ?value 0)
    (if (> ?age 59) then
        (bind ?value 10) else
        (if (> ?age 45) then
            (bind ?value 5))
        )
    (assert (Feedback (stage INITIAL)(explanation "The older you get the more likely you are of getting Diabetes,
                this is because you tend to exercise less, lose muscle mass and gain weight as you age.*")))
    ?value
    )
;if pregnant
(defrule pregnancy
    (Pregnant ?status)
    =>
    (bind ?*points* (+ ?*points* (pregnant ?status)))
    )
;if pregnant increase points because of the chances of gestational Diabetes
(defrule smokeYes
    (Smoke-Frequency ?frequency)
    =>
    (bind ?*points* (+ ?*points* (SmokenAlcohol ?frequency)))	
    )
(defrule alcoholYes
    (Alcohol-Frequency ?frequency)
    =>
    (bind ?*points* (+ ?*points* (SmokenAlcohol ?frequency)))	
    )
(defrule bloodPressure
    (Blood-Pressure ?frequency)
    =>
    (bind ?*points* (+ ?*points* bp ?frequency))	
    )
(defrule exerciseNo
    (Exercise No)
        =>
        (bind ?*points* (+ ?*points* 15))
    	(assert (Feedback (stage LIFESTYLE) (explanation "No exercise...at all?? please try incorporate physical ectivity into you daily life, even if it means walking instead of driving
                , exercise is important as it is essential to keep the body active and running.*")))
        )
(defrule exerciseYes 
    (Exercise-Frequency ?fact)
    =>
    	(bind ?*points* (+ exercise ?fact))	
    )
(deffunction exercise (?frequency)
    (bind ?point 0)
    (if (eq Frequently ?frequency) then
        (bind ?point -15)
        (assert (Feedback (stage LIFESTYLE)(explanation "Frequent exercise, keep it up!*")))else
        (if (eq Occassionaly ?frequency) then
            (bind ?point -5)
            (assert (Feedback (stage LIFESTYLE)(explanation "Occasional exercise is healthy, just try and maintain it, and maybe improve the frequency if possible.*")))
            )
        )
    ?point 
    )
(deffunction pregnant (?status)
    (bind ?value 0)
    (if (eq ?status Yes) then
        (bind ?value 5) 
        (assert (Feedback (stage INITIAL)(explanation "Because you are currently pregnant, you have a high chance of getting gestational Diabetes,
                    this will most likely disappear after the pregnancy, but you should make sure
                    you manage your diet aswell as your physical activity throughout yourn pregnancy.*")))else
        (if (eq ?status No) then
            (bind ?value 0))
        )
    ?value
    )
(deffunction family (?relative)
    (bind ?points 0)
    (if (eq Parent ?relative) then
     	(assert (Feedback (stage INITIAL)(explanation "Your parent has/had Diabetes, a person whos parent is diabetic is 2x more likely to get the disease then the average person.*")))
        (bind ?points 10) else
        (if (eq Sibling ?relative) then
     		(bind ?points 15)
            (assert (Feedback  (stage INITIAL)(explanation "Your sibling has/had Diabetes, this means the chances of you getting the disease are very high, because you share a lot of the same genes.*"))) else
            	(if (eq Aunt/Uncle ?relative) then
     				(bind ?points 7) else 
                		(if (eq Grandparent ?relative) then
    	 					(assert (Feedback  (stage INITIAL)(explanation "Your grandparent had/has Diabetes, this means you are more likely than the average person to contract this disease, please tale the necessary precautions*")))
                    		(bind ?points 6) else 
                				(if (eq Other ?relative) then
                        			(assert (Feedback  (stage INITIAL)(explanation "Your relative had/has Diabetes, this means you are more likely than the average person to contract this disease, please tale the necessary precautions*")))
    	 							(bind ?points 5)
             )
            ))
            ))
    ?points
    )
(deffunction SmokenAlcohol(?smokenalcohol)
    (bind ?point 0) 
     (if (eq Frequently ?smokenalcohol) then
                (bind ?point 15)
                )
    ?point
    )
(deffunction bp(?bp)
    (bind ?point 0) 
    (if (eq Low ?bp) then
        (bind ?point 2) else
        (if (eq Average ?bp) then
            (bind ?point 5) else 
            (if (eq High ?bp) then
                (assert (Feedback (stage LIFESTYLE)(explanation "A high blood pressure is very dangerous, this is one of the risk factors that can 
                            increase your chance of getting heart disease, along with a stroke and other deadly comlications.*")))
                (bind ?point 10)
                )
            )
        )
    ?point
    )
;Assert the total and points facts, for retrieval by the server and for calculation.
(defrule totals
    ?command <-(Calculate Totals)
    =>
    (printout out6 (* (/ ?*points* ?*total*) 100))
    (retract ?command) 
    
    (assert (Total ?*total*))
    (assert (Points ?*points*))
    )
;If female don't show erectile dysfunction symptom.
(defrule isFemale
    (declare (salience 10))
    (Gender Female)
    ?maleQ1 <- (Description(type SYMPTOM)(id "dysfunction"))
    =>
    (retract ?maleQ1)
    )
;If no knowledge of diabetes do not ask if diabetic.
(defrule diabetesKnowledge
    (declare (salience 10))
    (Diabetes-Knowledge No)
    ?question <- (Question (section Initial) (type "diabetic") (text ?questionText) (answerType ?answerType) (ask yes))
    =>
    (modify ?question (ask no))
    )
;If no, dont ask how often.
(defrule smokeNo
    (declare (salience 10))
    (Smoke No)
    ?question <- (Question (section Lifestyle) (type "smokeF") (text ?questionText) (answerType ?answerType) (ask yes))
    =>
    (modify ?question (ask no))
    (assert (Feedback (explanation "No smoking you say..? Thats quite commendable, try not to get into this habit as it is quite hard to shake and has a lot of negative effects on the body in the long term.*")))
    )
;If no, dont ask how often.
(defrule alcohol
    (declare (salience 10))
    (Alcohol No)
    ?question <- (Question (section Lifestyle) (type "alcoholF") (text ?questionText) (answerType ?answerType) (ask yes))
    =>
    (modify ?question (ask no))
    (assert (Feedback (stage LIFESTYLE) (explanation "No alcohol consumption, thats great, keep this up!*")))
    )
;If no dont ask how often.
(defrule exercise
    (declare (salience 10))
    (Exercise No)
    ?question <- (Question (section Lifestyle) (type "exerciseF") (text ?questionText) (answerType ?answerType) (ask yes))
    =>
    (modify ?question (ask no))
    (assert (Feedback (stage LIFESTYLE) (explanation "You dont seem to get any sort of physical activity, this is dangerous in the long term and can lead to a sedentary
                lifestyle.It is essential to get some sort of physical activity at least once in a while*")))
    )
(defrule getFeedbackI
    (Get FeedbackI)
    (Feedback (stage INITIAL) (explanation ?explanation))
    =>
    (printout out ?explanation )
    )
(defrule getFeedbackL
    (Get FeedbackL)
    (Feedback (stage LIFESTYLE) (explanation ?explanation))
    =>
    (printout out ?explanation )
    )
(defrule getFeedbackF
    (Get FeedbackF)
    (Feedback (stage FINAL) (explanation ?explanation))
    =>
    (printout out ?explanation )
    )
;If no dont ask what the rate is.
(defrule bloodPressure
    (declare (salience 10))
    (BP-Knowledge No)
    ?question <- (Question (section Lifestyle) (type "bpLevel"))
    =>
    (modify ?question (ask no))
    )
;Adds a fact to the working memory.
(deffunction addFact(?factToAdd ?fact)
    (if (eq Symptom ?factToAdd) then
    	(assert (Symptom ?fact))else
       				(if (eq weight ?factToAdd) then
    					(assert (Weight ?fact))else
       						(if (eq height ?factToAdd) then
    							(assert (Height ?fact))else
       								(if (eq Age ?factToAdd) then
    									(assert (Age ?fact)) else
                    						(if (eq smoke ?factToAdd) then
    											(assert (Smoke ?fact))else
                    								(if (eq alcohol ?factToAdd) then
    													(assert (Alcohol ?fact))else
                    										(if (eq gender ?factToAdd) then
    															(assert (Gender ?fact))else
                    												(if (eq name ?factToAdd) then
    																	(assert (Name ?fact)) else
                    														(if (eq diabetesK ?factToAdd) then
    																			(assert (Diabetes-Knowledge ?fact))else
                    																(if (eq diabetic ?factToAdd) then
    																					(assert (Diabetic ?fact))else
                    																		(if (eq familyH ?factToAdd) then
    																							(assert (Family-History ?fact))else
                    																				(if (eq pregnant ?factToAdd) then
    																									(assert (Pregnant ?fact))else
                    																						(if (eq Race ?factToAdd) then
    																											(assert (Race ?fact))else
                    																								(if (eq exercise ?factToAdd) then
    																													(assert (Exercise ?fact))else
                    																										(if (eq bp ?factToAdd) then
    																															(assert (BP-Knowledge ?fact))else
                    																												(if (eq smokeF ?factToAdd) then
    																																	(assert (Smoke-Frequency ?fact))else
                    																														(if (eq alcoholF ?factToAdd) then
    																																			(assert (Alcohol-Frequency ?fact))else
                    																																(if (eq ExerciseF ?factToAdd) then
    																																					(assert (Exercise-Frequency ?fact))else
                    																																		(if (eq bpLevel ?factToAdd) then
    																																							(assert (Blood-Pressure ?fact)) else
                    																																				(if (eq familyType ?factToAdd) then
    																																									(assert (Family-Type ?fact))
                                                                                																						)
                                                                                    																					) 
                                                                            																			)	        
                                                                        																	)
                                                                    																)
                                                            																)
                                                            															)
                                                        													)													
                                                        											)
                                                											)
                                        											)
                                        									)
                                    								)
                                
                                							)
                            						)
                    						)
                    				)
                			)
                	)            
     )
)
