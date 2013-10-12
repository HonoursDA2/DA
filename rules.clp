(defglobal ?*nextQuestion* = 1)
(defglobal ?*currentQuestion* = 1)
(defglobal ?*points* = 0)
(defglobal ?*total* = 160)
(defglobal ?*questionNumber* = 19)
(defglobal ?*stage1* = 1)
(defglobal ?*stage2* = 12)

(deftemplate sectionFact
    (slot stage)
    (slot name)
    (slot value)
    (slot order)
    )
(deftemplate Order
    (slot counter)
    (slot lastAsked)
    (slot current)
    (slot points)
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
    (slot explanation
        (default "*"))
    (slot stage)
    (slot order)
    (slot url
        (default "noImage.jpg"))
    )
(deffacts Questions
    ;Initial questions
    (Question (section Initial)(type "Name")(text "Hi, I am Doctor Mellitus, a Diabetes Advisor, what is your name?") (answerType "INPUTT") (order 1))
    (Question (section Initial)(type "Gender")(text "Are you male or female?")(answerType "MALE-FEMALE") (order 2))
    (Question (section Initial)(type "Diabetes-Knowledge")(text "Do you know about the disease called Diabetes?") (answerType "YES-NO") (order 3))
    (Question (section Initial)(type "Diabetic")(text "Are you a Diabetic?") (answerType "OPTIONAL") (order 4)(options "Yes-No-Uncertain" ))
    (Question (section Initial)(type "Race")(text "What is your race?") (answerType "OPTIONAL")(order 5)(options "Black-White-Asian-Coloured-Other" ))
    (Question (section Initial)(type "Age")(text "How old are you?") (answerType "INPUTN") (order 6))
    (Question (section Initial)(type "Family-History")(text "Do you have relatives who have been diagnosed with Diabetes?")(answerType "OPTIONAL")(options "Yes-No-Uncertain" )(order 7))
    (Question (section Initial)(type "Family-Type")(text "Is this relative any of the following?")(answerType "OPTIONAL")(options "Parent-Child-Sibling-Grandparent-AuntOrUncle-Other" )(order 8))
    (Question (section Initial)(type "Pregnant")(text "Are you Pregnant?") (answerType "YES-NO") (order 9))
    (Question (section Initial)(type "Weight")(text "What is your weight (Kilograms)")(answerType "INPUTND") (order 10))
    (Question (section Initial)(type "Height")(text "What is your height (Meters)") (answerType "INPUTND") (order 11))
    ;Lifestyle questions
    (Question (section Lifestyle)(type "Smoke")(text "Do You smoke cigarettes?") (answerType "YES-NO")(order 12))
    (Question (section Lifestyle)(type "Smoke-Frequency")(text "How often do you smoke, please be honest?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" ) (order 13))
    (Question (section Lifestyle)(type "Alcohol")(text "Do you consume any alcohol?") (answerType "YES-NO")(order 14))
    (Question (section Lifestyle)(type "Alcohol-Frequency")(text "Yes some people may say that alcohol is healthy.. but remember, ONLY in moderation!
            How often do you drink alcohol?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" )(order 15))
    (Question (section Lifestyle)(type "Exercise")(text "Do you do any sort of explicit physical exercise?") (answerType "YES-NO")(order 16))
    (Question (section Lifestyle)(type "Exercise-Frequency")(text "That's great, How often do you exercise?") (answerType "OPTIONAL")(options "Hardly-Occassionaly-Frequently" )(order 17))
    (Question (section Lifestyle)(type "Blood-Pressure-Knowledge")(text "Have you checked your blood pressure recently?") (answerType "YES-NO")(order 18))
    (Question (section Lifestyle)(type "Blood-Pressure")(text "What level is your blood pressure?") (answerType "OPTIONAL")(options "Low-Average-High" )(order 19))
    (Order (counter 1) (lastAsked 0) (current 0))
    (Feedback (order 0))
    )
(deffacts Description
   (Description(name Fatigue)(type SYMPTOM) (id "fatigue")(explanation "Do you feel tired a lot? An overwhelming feeling of tiredness that can not be explained."))
   (Description(name Frequent-Headache)(type SYMPTOM)(id "headache") (explanation "Do you have frequent headaches and do they sometimes last a long time (2-3 days)?*"))
   (Description(name Extreme-Thirst)(type SYMPTOM) (id "thirst") (explanation "Do you feel thirsty often throughout the day?*"))
   (Description (name Excessive-Urination)(type SYMPTOM)(id "urinating") (explanation "Do you make frequent trips to the toilet to urinate (pee)?*"))
   (Description (name Nausea)(id "nausea")(type SYMPTOM)(explanation "Do you have an uneasy feeling in your stomach? A feeling that makes you feel like vomitting, especially after eating?*"))
   (Description (name Weightloss)(type SYMPTOM)(id "weightloss") (explanation "Have you lost weight over the recent months/years, even though you have not been trying to do so actively?*"))
   (Description (name Irritability)(type SYMPTOM)(id "irritability")(explanation "Do you feel easily irritated and agitated, for no known reason?*"))
   (Description (name Yeast-Infection)(type SYMPTOM)(id "yeast")(explanation "Do you experience itching, burning, soreness, pain during sexual intercourse and urination?*"))
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
    (Information (question "5. Diabetes complications*") (explanation " Diabetes dramatically increases the risk of various cardiovascular problems, including coronary artery disease with chest pain (angina), heart attack, stroke and narrowing of arteries (atherosclerosis). If you have diabetes, you are more likely to have heart disease or stroke.-
            Diabetes can damage the blood vessels of the retina (diabetic retinopathy), potentially leading to blindness. -
            The kidneys contain millions of tiny blood vessel clusters that filter waste from your blood. Diabetes can damage this delicate filtering system. Severe damage can lead to kidney failure or irreversible endstage kidney disease, which may require dialysis or a kidney transplant.-
            Excess sugar can injure the walls of the tiny blood vessels (capillaries) that nourish your nerves, especially in the legs. This can cause tingling, numbness, burning or pain that usually begins at the tips of the toes or fingers and gradually spreads upward. Left untreated, you could lose all sense of feeling in the affected limbs. Damage to the nerves related to digestion can cause problems with nausea, vomiting, diarrhea or constipation. For men, it may lead to erectile dysfunction.-
            Nerve damage in the feet or poor blood flow to the feet increases the risk of various foot complications. Left untreated, cuts and blisters can become serious infections. Severe damage might require toe, foot or even leg amputation.-
            Diabetes may leave you more susceptible to skin problems, including bacterial and fungal infections.With gum infections being a major concern
            *")
            (questionType "MULTIPLE*")
        	(caption "Diabetes has a lot of complications that can manifest if the disease is not managed appropriately, early diagnosis plays a large role in
            preventing the complications from arising.*")
        	(options "Cardiovascular Disease-Eye damage-Kidney damage-Nerve damage-Foot damage-Skin and mouth conditions.*")	
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
        (options "Blurred Vision-Dry Mouth-Erectile Dysfunction-Excesive Urination-Extreme Hunger-Extreme Thirst-Fatigue-Frequent Headaches-Gestational Diabetes-Gum Infection-Irritability-Nausea-Numbness-Slow Healing Wounds-Weightloss-Yeast Infection*")
        (caption "Diabetes can be picked up through the symptoms that manifest over time. There are alot of symptoms that come with Diabetes. 
            Although with Type 2 Diabetes, these signs of Diabetes might not be made visible through symptoms for a very long time, making it difficult for someone to know their Diabetes status*"))
    (Information(question  "3. What are the different types of Diabetes?*") (explanation "Type 1 Diabetes occurs when the beta cells in the pancreas are damaged. 
            Because of this, the pancreas does not produce insulin anymore. Type 1 normally occurs in people under the age of 30 (it used to be called Juvenile Diabetes).-Type 2 Diabetes occurs when the cells in the body are resistant to the effect of insulin. 
            It develops gradually over a period of time.There is a high association with a family history of Diabetes and obesity. 
            Type 2 normally occurs in people older than 40 years of age-.
            This type of diabetes affects about 2% to 10% of females during last months of pregnancy. 
            Pregnant women have enough insulin, but the effect of insulin is partially blocked by other hormones produced in the placenta during the pregnancy.
            This causes an abnormal rise in sugar levels in the body.
            The is a complication of pregnancy and normally disappears after the pregnancy.-
            Prediabetes, also known as impaired  glucose tolerance is the condition where the blood glucose levels in the body  
            are much higher than normal but not high enough to be classified as Diabetes. 
            If the condition is tackled at an early stage through diet, 
            exercise and other healthy lifestyle changes (weight management programme), the risk of going on ot develop Type 2 Diabetes can be significantly reduced.*")
        (questionType "MULTIPLE*")
        (options "Type 1-Type 2-Gestational-Prediabetes*")
        (caption "There are two distinct types of Diabetes: Type 1 Diabetes and Type 2 Diabetes. Prediabetes is a condition that may eventually lead to Diabetes. Gestational Diabetes is a condition that occurs in some woman during pregnacy that may (in some cases) eventually lead to Type 2 Diabetes after the pregnancy.*"))
    (Information (question "2. What are the risk factors of Diabetes?*") 
        (explanation "Obesity is thought to be a primary cause of Type 2 Diabetes in people who already have a family history of the disease.
            When a person is obese, the body has to deal with more nutrients than it can handle, 
            to counter this the cells stop reacting to insulin as long as the body is overweight. 
            This leads to the whole body to eventually be resistant to insulin, the onset of Type 2 Diabetes-
            If someone in your family has has Type 2 Diabetes, then you too are at risk of developing the disease.
            The closer the realtive the greater the risk, with studies showing that people with one parent with Diabetes have double the risk,
            while people with two diabetic parents have six times the risk of being diagnosed with Diabetes, with mothers presenting a greater risk than fathers.
            Famiily history is a great contributing factor that people often down play and take for granted.-
            If the pancreas is damaged and not working properly this leads to insufficient insulin secretion, the onset of Type 1 Diabetes.*")
        (questionType "MULTIPLE*")
        (options "Obesity-Family History-Pancreas malfunction*")
        (caption "There are a few risk factors that will vastly increase your chances of developing Diabetes, these are obesity, family history of Diabetes and the 
            malfunctioning of the Pancreas*"))
    (Information (question "1. What is Diabetes Mellitus?*") (explanation "Diabetes Mellitus, more commonly known simply as Diabetes is a chronic medical condition where a person has 
            high blood sugar levels.This is either because the insulin production in the body is insufficient or because the body does not respond properly to insulin*"))
        (Information (question "0. KEYWORDS*") (explanation "Glucose is the most important simple sugar in a human metabolism, blood glucose is the level of glucose present in the blood stream.-
             The cardiovascular system consists of the heart, blood vessels and the blood that the blood vessels transport throughout the body. The cardiovasuclar system is powered by the heart.-
             Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process.-
             Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood.-
             The Pancreas is long soft organ behind your stomach and infront of your spine, it produces insulin to help break down the food and hormones that halp control the blood sugar levels.-
            Yeast is a type of fungus.*")
        (questionType "MULTIPLE*") 
        (options "Blood Glucose-Cardiovascular-Gastroparesis-Insulin-Pancreas-Yeast*")
        (caption "Important keywords that will be needed to understand defintions*")
        )      
    )
(defrule restart
    (Restart ?section)
    =>
    (restart ?section)
    )
(defrule removeRestart
    (declare (salience 3))
    ?restart <- (Restart INITIAL)
    =>
    (retract ?restart)
    )
(defrule restartInitialQ
    (declare (salience 5))  
    (Restart INITIAL)
    ?question1 <-(Question (section Initial) (ask no) (order ?order))
    ?question2 <-(Question (section Initial) (ask yes) (order ?order1 ))  
    =>
    (if (eq ?order (- ?order1 1)) then
      (modify ?question1 (ask yes))   
      )
    )
(defrule restartInitialF
    (declare (salience 10))   
    (Restart INITIAL)
    ?fact<-(sectionFact (stage INITIAL))
    =>
    (retract ?fact)
    )
(defrule restartInitialFb
    (declare (salience 8))
    (Restart INITIAL)
    ?feedback <-(Feedback (stage INITIAL))
    =>
    (retract ?feedback)
    )
(defrule goBack
    (declare (salience 10))
    (Go-Back)
    ?fact <- (sectionFact (order ?order))
    ?feedback <- (Feedback (order ?number))
    ?theOrder <- (Order (counter ?order1)(lastAsked ?last)(current ?current) (points ?points))
    ?question <- (Question (ask no) (order ?order))
    ?question1 <- (Question (ask no) (order ?currentOrder))
    =>
    (if (eq ?last ?order) then
    (retract ?fact )
    
    (bind ?*points* ?points)
    (bind ?*nextQuestion* ?last)
    (modify ?question (ask yes))
    )
    (if (eq ?currentOrder ?current) then
    (modify ?question1 (ask yes))
    )
    (if (eq ?last ?number) then
    (retract ?feedback)
        )
    
    ;(if (eq (?order3 ?order)) then
    ; (retract ?feedback)     
    ; )
    )
(defrule removeBack
    ?back <- (Go-Back)
    ?theOrder <- (Order (counter ?order1)(lastAsked ?last)(current ?current) (points ?points))
    =>
    (modify ?theOrder (counter ?last))
    (retract ?back)
    )
(defrule removeRestartL
    (declare (salience 3))
    ?restart <- (Restart LIFESTYLE)
    ?order <- (Order (counter ?number))
    =>
    (retract ?restart)
    (modify ?order (counter ?*stage2*))
    )
(defrule restartInitialL
    (declare (salience 5))  
    (Restart LIFESTYLE)
    ?question1 <-(Question (section Lifestyle) (ask no) (order ?order))
    ?question2 <-(Question (section Lifestyle) (ask yes) (order ?order1 ))  
    =>
    (if (eq ?order (- ?order1 1)) then
      (modify ?question1 (ask yes))   
      )
    )
(defrule restartInitialFL
    (declare (salience 10))   
    (Restart LIFESTYLE)
    ?fact<-(sectionFact (stage LIFESTYLE))
    =>
    (retract ?fact)
    )
(defrule restartInitialFbL
    (declare (salience 8))
    (Restart LIFESTYLE)
    ?feedback <-(Feedback (stage LIFESTYLE))
    =>
    (retract ?feedback)
    )
(deffunction restart (?section)
    (if (eq ?section stage1) then
        (bind ?*points* 0)        
        (bind ?*nextQuestion* ?*stage1*)
        (assert (Restart INITIAL))
         else
            (if (eq ?section stage2) then
            (bind ?*nextQuestion* ?*stage2*)    
            (assert (Restart LIFESTYLE))
                ))
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
(defrule removeInitial
    (declare (salience 5))
    (Ask-Question-Lifestyle)
    ?question <- (Question (section Initial))
    =>
    (retract ?question)
    )
(defrule askQuestionInitial
    ?ask <- (Ask-Question-Initial)
    ?question <- (Question (section Initial)(type ?type)(text ?questionText) (answerType ?answerType) (ask yes) (order ?current) (options ?options))
    ?order <- (Order (counter ?counter))
    =>
    (if (eq ?current ?*nextQuestion*) then
    (bind ?counter (+ ?*nextQuestion* 1))
    (bind ?*nextQuestion* ?counter)
	(printout out ?questionText)
    (printout out2 ?answerType)    
    (printout out3 ?type)
    (printout out4 ?options)
    (printout out6 (* (/ ?*points* ?*total*) 100))
    (printout out7 ?current)
    (modify ?order (counter ?counter)(current ?current))      
    (modify ?question (ask no))
    (retract ?ask)
        )
    )
(defrule askQuestionLifestyle
    ?ask <- (Ask-Question-Lifestyle)
    ?question <- (Question (section Lifestyle)(type ?type)(text ?questionText) (answerType ?answerType) (ask yes) (order ?current) (options ?options))
    ?order <- (Order (counter ?counter))
    =>
    (if (eq ?current ?*nextQuestion*) then
    (bind ?counter (+ ?*nextQuestion* 1))
    (bind ?*nextQuestion* ?counter)
    (printout out ?questionText)
    (printout out2 ?answerType)    
    (printout out3 ?type)
    (printout out4 ?options)
	(printout out6 (* (/ ?*points* ?*total*) 100))  
    (printout out7 ?current)
    (modify ?order (counter ?counter)(current ?current)) 
    (modify ?question (ask no))
    (retract ?ask)
     )
    )
;Changes the order of the initial questions to ask, if a question should not be asked anymore.
(defrule changeInitialQuestions
    (declare (salience 1))
    (Ask-Question-Initial)
    ?question <- (Question (section Initial) (type ?type)(text ?questionText) (answerType ?answerType) (ask no) (order ?current))
    =>
    (if (eq ?current ?*nextQuestion*) then
    	(bind ?counter (+ ?*nextQuestion* 1))	
    	(bind ?*nextQuestion* ?counter)
    )
    )
;Changes the order of the lifestyle questions to ask, if a question should not be asked anymore.
(defrule changeLifestyleQuestions
    (declare (salience 5))
    (Ask-Question-Lifestyle)
    ?question <- (Question (section Lifestyle)(type ?type)(text ?questionText) (answerType ?answerType) (ask no) (order ?current))
    =>
    (if (eq ?current ?*nextQuestion*) then
    	(bind ?theCounter (+ ?*nextQuestion* 1))	
    	(bind ?*nextQuestion* ?theCounter)
        )
    )
;Asks the questions relating to Lifestyle.
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
;calculates the BMI with the provided weight and height of the user.
(defrule bmi
    (sectionFact (name Height) (value ?userHeight))
  	(sectionFact (name Weight) (value ?userWeight))
  =>
  (bind ?weight ?userWeight)
    (bind ?height ?userHeight)
    (bind ?bmi (/ ?userWeight (* ?userHeight ?userHeight)))
    (assert (BMI ?bmi))
   
   (if (> ?bmi 30) then 
   	(assert (weight-classification Obese))
        ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (url "BMI.GIF*")(explanation "Your BMI is above 30 kg/m^2, this classifies you as Obese,
                        this is very concerning because Obesity is a cause of Type 2 Diabetes.
                        You need to urgently try to manage your diet and incorporate some exercise into your daily/weekly routine.*"))) 
       (bind ?*points* (+ ?*points* 20))
          else
        	(if (> ?bmi 25) then
       		( assert (weight-classification Overweight))
                ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (explanation "Your BMI is above 25 kg/m^2, this classifies you as Overweight,
                            this is slightly concerning if this is mostly body fat and not muscle.*"))
               (bind ?*points* (+ ?*points* 10)) else
           		(if (> ?bmi 18.5) then 
                		(assert (weight-classification OptimalWeight))
                    	( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (explanation "Your BMI is between the range of 18kg/m^2 and 25 kg/m^2, this classifies you as having an Optimal weight, well done!
                                Keep doing what your are doing :)*")))) else
                			(if (< ?bmi 18.5 ) then
                   			(assert (weight-classification Underweight))
                              ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (explanation "Your BMI is below, 18 kg/m^2, you are slightly underweight, a bit more body mass would be great.*")))
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
    (sectionFact (name Name) (value ?name))
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
(defrule isGender
    (declare (salience 10))
    (sectionFact (name Gender) (value ?gender))
  	?question <- (Question (section Initial) (type "Pregnant")(ask ?yesno))
    ?femaleQ1 <- (Description(type SYMPTOM)(id "gestational"))
    ?femaleQ2 <- (Description(type SYMPTOM)(id "yeast"))
    ?maleQ1 <- (Description(type SYMPTOM)(id "dysfunction"))
    =>
    (if (eq ?gender Male) then
    	(assert (sectionFact (name Pregnant) (value No)))
    	(modify ?question (ask no))
    	(bind ?*total* (- ?*total* 10))
    	(retract ?femaleQ1 ?femaleQ2)
    		 else (if (eq ?gender Female) then
    		(retract ?maleQ1)
            (modify ?question (ask yes))
    		)
        )
 )
;Family history
(defrule familyH
    (declare (salience 10))
    (sectionFact (name Family-History) (value ?yesno))
  	?question <- (Question (section Initial) (type "Family-Type")(ask ?noyes))
    =>
    (if(neq ?yesno Yes) then 
    	(modify ?question (ask no)) else
        (modify ?question (ask yes)) 
     )
     (uncertain ?yesno)
     )
(defrule family
    (sectionFact (name Family-Type) (value ?family))
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
;Add points for race
(deffunction race (?race)
    (bind ?point 0)
   (if (eq White ?race) then
        (bind ?point 1)
         else
        (bind ?point 3))
    	(assert (Feedback (order ?*currentQuestion*) (stage INITIAL)(url "ethnicity.jpeg*")(explanation "Non white ethnic groups have a higher prevalence of diabetes, with certain ethnic groups having a higher rate of diabetes-related complications and deaths caused by Diabetes.*"))) 
    ?point
    )
;Age
(defrule ageR
    (sectionFact (name Age) (value ?age))
  	=>
    (bind ?*points* (+ ?*points* (age ?age)))
    )
;Race
(defrule raceR
    (sectionFact (name Race) (value ?race))
  	=>
    (bind ?*points* (+ ?*points* (race ?race)))
     )
;family history
(defrule FH
    (sectionFact (name Family-History) (value ?history))
  	=>
     	(bind ?*points* (+ ?*points* (uncertain ?history)))
    )
;Asses diabetes percentage and provide feedback
(deffunction assessPercentage()
    (bind ?percentage (* (/ ?*points* ?*total*) 100))
    (if (> ?percentage  75) then
       ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation " You have a very high risk of Diabetes, this is a great concern and should be dealt with immediately
                    you should go to the nearest hospital and seek professional medical attention a soon as possible. Only after blood glucose tests, can you be oficially diagnosed with Diabetes*"))) else
        (if (> ?percentage 50) then
            ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation " Your chances of getting diabetes is greater than 50 percent, this is higher than usual  and should be checked with a medical professional.*"))) else
            (if (> ?percentage 35) then
                ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation "Your risk of Diabetes is around the 50% region, this should be seen as a concern and should be taken as a warning sign.
                                *"))) else 
                (if ( > ?percentage 25) then
                    ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation " You have a low risk of Diabetes, it should not be anything to worry about, provided you continue to eat well
                                    and live a healthy lifestyle.*"))) else 
                    ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation "You have a very low risk of Diabetes, this is because of your lack of threatening risk factors
                                    and decent lifestyle habits, please do continue and remember to eat healthy and keep active!*")))
                    )
                ) 
         	)
        )

        (bind ?percentage (* (/ ?*points* ?*total*) 100))
        (bind ?number (format nil %3.0f ?percentage))    
    	(bind ?text (str-cat "You have a " (str-cat ?number "% Risk of Diabetes*")))
        ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation ?text)))
    )
(deffunction age (?age)
    (bind ?value 0)
    (if (> ?age 59) then
        ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL)(url "age.jpg*")(explanation "Being older than 60, it means is less likely that you can manage a rigorous physical 
                    workout, I strongly recommend that you watch your diet.*")))
        (bind ?value 10) else
        (if (> ?age 45) then
            (bind ?value 5))
        )
    ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL)(url "age.jpg*")(explanation "The older you get the more likely you are of getting Diabetes,
                this is because you tend to exercise less, lose muscle mass and gain weight as you age. Also as people age they are less able to process glucose appropriately and therefore have a greater risk of developing type 2 Diabetes.*")))
    ?value
    )
(defrule teachDiabetes
    (sectionFact (name Diabetes-Knowledge) (value No))
    =>
    ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (url "diabetes-world.gif*")(explanation "Diabetes is the most common chronic disease, currently estimated to affect about 330 Million people worldwide.
                The biggest issues surrounding diabetes are a lack of awareness and education on the Disease*")))
    ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (url "diabetes-test.jpg*")(explanation "The only way to test for Diabetes is to do a blood glucose test at a hospital and receive an official diagnosis from a qualified Doctor. This system only provides a risk assesment.*")))
    ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation "Please remember that the only way to test for Diabetes is to do a blood glucose test at a hospital and receive an official diagnosis from a qualified Doctor. This system only provides a risk assesment to raise awareness and education on the Disease.*")))
    )
;if pregnant
(defrule pregnancy
    (sectionFact (name Gender) (value Female))
    (sectionFact (name Pregnant) (value ?status))
  	=>
    (bind ?*points* (+ ?*points* (pregnant ?status)))
    )
(defrule diabeticNo
    (sectionFact (name Diabetic) (value No))
    =>
    ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (explanation "The only way to test for Diabetes is to do a blood glucose test at a hospital and receive an official diagnosis from a qualified Doctor. This system only provides a risk assesment.*")))
     ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation "Please remember that the only way to test for Diabetes is to do a blood glucose test at a hospital and receive an official diagnosis from a qualified Doctor. This system only provides a risk assesment toraise awareness and education on the Disease.*")))
    
     )
;if pregnant increase points because of the chances of gestational Diabetes
(defrule SmokenAlcoholYes
    (sectionFact (name ?name) (value ?frequency))
  	=>
    (bind ?*points* (+ ?*points* (SmokenAlcohol ?name ?frequency)))	
    )
;smoke and diabetic status
(defrule smoker
    (sectionFact (name Smoke-Frequency) (value ?frequency))
  	(sectionFact (name Diabetic) (value ?yesno))
  	=>
    (smoker ?yesno ?frequency)
    )
;feedback based on diabetes and smoke frequency
(deffunction smoker(?yesno ?frequency)
    (if (neq ?yesno Yes) then
         (if (neq ?frequency Hardly) then 
          ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE) (explanation "As a smoker and a non Diabetic, your chances of developing Diabetes is much higher.Ths is because smoking increases your blood sugar levels, and can lead to Diabetes along with its many complications over time.*")))
          )
     else 
    	(if (eq ?yesno Yes) then
         	( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE) (explanation "Smoking increases your blood sugar levels, this will make the disease much harder to control aswell as increasing the chances of developing many Diabetes related complications over time.*")))
        ) 
     )
 )
;Blood pressure
(defrule bloodPressure2
    (sectionFact (name Blood-Pressure) (value ?frequency))
    =>
    (bind ?*points* (+ ?*points* (bp ?frequency) ))
    )
;points for exercise, feedback
(defrule exerciseNo
    (sectionFact (name Exercise) (value No))
  	=>
        (bind ?*points* (+ ?*points* 15))
    	( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE) (explanation "No exercise at all? please try incorporate physical ectivity into you daily life, even if it means walking instead of driving
                , exercise is important as it is essential to keep the body active and running.*")))
        )
;add points exercise frequency
(defrule exerciseYes 
    (sectionFact (name Exercise-Frequency) (value ?fact))
	 =>
    	(bind ?*points* (+  ?*points* (exercise ?fact)))	
    )
;deduct points for exercise
(deffunction exercise (?frequency)
    (bind ?point 0)
    (if (eq Frequently ?frequency) then
        (bind ?point -15)
        ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE)(explanation "Frequent exercise, keep it up*")))else
        (if (eq Occassionaly ?frequency) then
            (bind ?point -5)
            ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE)(explanation "Occasional exercise is healthy, just try and maintain it, and maybe improve the frequency if possible.*")))
            )
        )
    ?point 
    )
;points for pregnancy status
(deffunction pregnant (?status)
    (bind ?value 0)
    (if (eq ?status Yes) then
        (bind ?value 5) 
        ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL)(url "gestational.jpg*")(explanation "Because you are currently pregnant, you have a high chance of developing gestational Diabetes,
                    this will most likely disappear after the pregnancy, but you should make sure
                    you manage your diet aswell as your physical activity throughout your pregnancy.*")))else
        (if (eq ?status No) then
            ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (explanation "If you plan on getting pregnant, be sure to check on your blood sugar levels with your doctor during the pregnancy.
            Gestatioal Diabetes occurs in about 2% to 5% of all pregnacies, making it one of the most common health problems associated with pregnancy.*")))
            (bind ?value 0))
        )
    ?value
    )
;Points for family type, feedback for family type
(deffunction family (?relative)
    (bind ?points 0)
    (if (eq Parent ?relative) then
     	( assert (Feedback (order ?*currentQuestion*) (stage INITIAL)(url "family-tree.gif*")(explanation "Your parent has/had Diabetes, a person whos parent is diabetic is 2x more likely to get the disease then the average person.*")))
        (bind ?points 10) else
        (if (eq Sibling ?relative) then
     		(bind ?points 15)
            ( assert (Feedback (order ?*currentQuestion*)  (stage INITIAL)(url "family-tree.gif*")(explanation "Your sibling has/had Diabetes, this means the chances of you getting the disease are very high, because you share a lot of the same genes.*"))) else
            	(if (eq AuntOrUncle ?relative) then
     				(bind ?points 7) else 
                		(if (eq Grandparent ?relative) then
    	 					( assert (Feedback (order ?*currentQuestion*)  (url "family-tree.gif*")(stage INITIAL)(explanation "Your grandparent had/has Diabetes, this means you are more likely than the average person to contract this disease, please tale the necessary precautions*")))
                    		(bind ?points 6) else 
                				(if (eq Other ?relative) then
                        			( assert (Feedback (order ?*currentQuestion*)  (url "family-tree.gif*")(stage INITIAL)(explanation "Your relative had/has Diabetes, this means you are more likely than the average person to contract this disease, please tale the necessary precautions*")))
    	 							(bind ?points 5) else
                        (if (eq Child ?relative) then
                            ( assert (Feedback (order ?*currentQuestion*) (stage INITIAL) (url "family-tree.gif*")(explanation "Your child has Diabetes, then it is most likely that you also have Diabetes, or someone else in your family has it.*")))
             				(bind ?points 20)
                            ))
            ))
            ))
    ( assert (Feedback (order ?*currentQuestion*) (stage INTITIAL) (explanation "Diabetes often runs in families, its is not a guarentee, but the chances are always migh higher provided trhere is a family history of the disease.*")))
    ?points
    )
;Points for alcohol consumption
(deffunction SmokenAlcohol(?name ?frequency)
    (bind ?point 0) 
    (if (eq Smoke-Frequency ?name) then 
    	(if (eq Frequently ?frequency) then
        	(bind ?point 10)
                ) else
 					(if (eq Alcohol-Frequency ?name) then
    					(if (eq Frequently ?frequency) then
                			(bind ?point 15)
                	)
            )        
        )
    ?point
    )
;asserts feedback depending on blood pressure, ads points
(deffunction bp(?bp)
    (bind ?point 0) 
    (if (eq Low ?bp) then
        (bind ?point 2) else
        (if (eq Average ?bp) then
            (bind ?point 5) else 
            (if (eq High ?bp) then
                ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE)(explanation "A high blood pressure is very dangerous, this is one of the risk factors that can 
                            increase your chance of getting heart disease, along with a stroke and other deadly complications.*")))
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
;If no knowledge of diabetes do not ask if diabetic.
(defrule diabetesKnowledge
    (declare (salience 10))
    (sectionFact (name Diabetes-Knowledge) (value ?answer))
    ?question <- (Question (section Initial) (type "Diabetic") (text ?questionText) (answerType ?answerType) (ask ?yesno))
    =>
    (if (eq ?answer No) then
    (modify ?question (ask no)) else
         (if (eq ?answer Yes) then
        (modify ?question (ask yes))
        )
        )
    )
;If no, dont ask how often.
(defrule smokeNo
    (declare (salience 10))
    (sectionFact (name Smoke) (value ?yesno))  	
    ?question <- (Question (section Lifestyle) (type "Smoke-Frequency"))
    =>
    (if (eq ?yesno No) then
    (modify ?question (ask no))
    ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE)(explanation "No smoking you say..? Thats quite commendable, try not to get into this habit as it is quite hard to shake and has a lot of negative effects on the body in the long term.*")))
    else
    (modify ?question (ask yes))
    )
    )
;If no, dont ask how often.
(defrule alcohol
    (declare (salience 10))
    (sectionFact (name Alcohol) (value ?yesno))
  	?question <- (Question (section Lifestyle) (type "Alcohol-Frequency") (text ?questionText) (answerType ?answerType))
    =>
    (if (eq ?yesno No) then
    (modify ?question (ask no))
    ( assert (Feedback (order ?*currentQuestion*) (stage LIFESTYLE) (explanation "No alcohol consumption, thats great, keep this up!Alcohol has a high sugar content, this raises the blood sugar levels in the body, forcing the pancreas to work harder. Frequent alcohol consumption 
                    is not advised in order to maintain a healthy pancreas.*")))
    else
     (modify ?question (ask yes)) 
           )
        )
;If no dont ask how often.
(defrule exercise
    (declare (salience 10))
    (sectionFact (name Exercise) (value ?yesno))
    ?question <- (Question (section Lifestyle) (type "Exercise-Frequency") (text ?questionText) (answerType ?answerType))
    =>
    (if (eq ?yesno No) then
    (modify ?question (ask no))
    else
    (modify ?question (ask yes))
    )
    )
;Gets initial quesitons feedback feedback
(defrule getFeedbackI
    (Get FeedbackI)
    (Feedback (stage INITIAL) (explanation ?explanation) (url ?imageurl))
    =>
    (printout out ?explanation )
    (printout out2 ?imageurl)
    
    )
;Gets lifestyle feedback
(defrule getFeedbackL
    (Get FeedbackL)
    (Feedback (stage LIFESTYLE) (explanation ?explanation))
    =>
    (printout out ?explanation )
    )
;Gets final feedback
(defrule getFeedbackF
    (Get FeedbackF)
    (Feedback (stage FINAL) (explanation ?explanation))
    =>
    (printout out ?explanation )
    )
;If no dont ask what the rate is.
(defrule bloodPressure1
    (declare (salience 10))
    (sectionFact (name Blood-Pressure-Knowledge)(value ?yesno))
    ?question <- (Question (section Lifestyle) (type "Blood-Pressure"))
    =>
    (if (eq ?yesno No) then
    (modify ?question (ask no))
        else
        (modify ?question (ask yes))   
        )
    )
;Ceks the BMI and their phyiscal activity.
(defrule fatnExcercise
    (sectionFact (name Exercise)(value ?yesno))
    (sectionFact (name weight-classification)(value ?classification))
        =>
       (weightExercise ?yesno ?classification)
    )
;Checks the BMI and responds acccordingly
(deffunction weightExercise (?yesno ?classification)
    (if (eq ?yesno No ) then
    (if (eq ?classification Obese) then
        ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (url "BMI.GIF*")(explanation "Your BMI is above 30kg/m^2 (Obese) and you mentioned that you do not exercise, this is a major problem that will only increase your
            chances of getting Diabetes, it is strongly advised that you start to exercise more regularly in order to reduce your chances of Diabetes. Obesity is amajor contributing fact to Diabetes.")))
        else
        	(if (eq ?classification Overweight) then
            	  ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation "Your BMI is above 25kg/m^2 (Overweight) and you mentioned that you do not exercise, this is a major problem that will only increase your
            		chances of getting Diabetes, it is strongly advised that you start to exercise more regularly in order to reduce your chances of Diabetes. This could lead to obesity.")))
       			)
           )
       )  
 )
(defrule change
    (declare (salience 10))
    ?change <- (change-last ?last)
    ?order <- (Order (lastAsked ?theLast))
    =>
    (modify ?order (lastAsked ?last) (points ?*points*))
    (bind ?*currentQuestion* ?last)
    (retract ?change)
     )
;Adds a fact to the working memory.
(deffunction addFact(?factToAdd ?fact ?last)

    (assert (change-last ?last))

       				(if (eq Weight ?factToAdd) then
    					(assert (sectionFact (stage INITIAL)(name Weight)(value ?fact) (order ?last)))
            else
       						(if (eq Height ?factToAdd) then
                    (assert (sectionFact (stage INITIAL)(name Height)(value ?fact) (order ?last)))
    							else
       								(if (eq Age ?factToAdd) then
    						(assert (sectionFact (stage INITIAL)(name Age)(value ?fact) (order ?last)))			
                           		 else
                    						(if (eq Smoke ?factToAdd) then
    									(assert (sectionFact (stage LIFESTYLE)(name Smoke)(value ?fact)(order ?last)))			
                                    	else
                    								(if (eq Alcohol ?factToAdd) then
    										(assert (sectionFact (stage LIFESTYLE)(name Alcohol)(value ?fact) (order ?last)))			
                                            else
                    										(if (eq Gender ?factToAdd) then
    												(assert (sectionFact (stage INITIAL)(name Gender)(value ?fact) (order ?last))	)		
                                                    else
                    												(if (eq Name ?factToAdd) then
    														(assert (sectionFact (stage INITIAL)(name Name)(value ?fact) (order ?last)))			
                                                             else
                    														(if (eq Diabetes-Knowledge ?factToAdd) then
                                                                    (assert (sectionFact (stage INITIAL)(name Diabetes-Knowledge)(value ?fact) (order ?last)))
    																			else
                    																(if (eq Diabetic ?factToAdd) then
    																		(assert (sectionFact (stage INITIAL)(name Diabetic)(value ?fact) (order ?last)))	
                                                                            else
                    																		(if (eq Family-History ?factToAdd) then
                                                                                    (assert (sectionFact (stage INITIAL)(name Family-History)(value ?fact) (order ?last)))
    																							else
                    																				(if (eq Pregnant ?factToAdd) then
                                                                                            (assert (sectionFact (stage INITIAL)(name Pregnant)(value ?fact) (order ?last)))
    																									else
                    																						(if (eq Race ?factToAdd) then
                                                                                                    (assert (sectionFact (stage INITIAL)(name Race)(value ?fact) (order ?last)))
    																											else
                    																								(if (eq Exercise ?factToAdd) then
                                                                                                            (assert (sectionFact (stage LIFESTYLE)(name Exercise)(value ?fact) (order ?last)))
    																													else
                    																										(if (eq Blood-Pressure-Knowledge ?factToAdd) then
                                                                                                                    (assert (sectionFact (stage INITIAL)(name Blood-Pressure-Knowledge)(value ?fact) (order ?last)))
    																															else
                    																												(if (eq Smoke-Frequency ?factToAdd) then
                                                                  																	(assert (sectionFact (stage LIFESTYLE)(name Smoke-Frequency)(value ?fact) (order ?last)))
    																																	else
                    																														(if (eq Alcohol-Frequency ?factToAdd) then
                                                                           																	 (assert (sectionFact (stage LIFESTYLE)(name Alcohol-Frequency)(value ?fact) (order ?last)))
    																																			else
                    																																(if (eq Exercise-Frequency ?factToAdd) then
                                                                                (assert (sectionFact (stage LIFESTYLE)(name Exercise-Frequency)(value ?fact) (order ?last)))
    																																					else
                    																																		(if (eq Blood-Pressure ?factToAdd) then
                                                                                        																(assert (sectionFact (stage LIFESTYLE)(name Blood-Pressure)(value ?fact) (order ?last)))
    																																							 else
                    																																				(if (eq Family-Type ?factToAdd) then
    																																									(assert (sectionFact (stage INITIAL)(name Family-Type)(value ?fact) (order ?last)))
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
;Adds a symptom
(deffunction addSymptom(?fact)
        (assert (Symptom ?fact))
    )
;Adds important feedback to the final feedback list 
(deffunction start ()
    (bind ?url (str-cat "*   Please check the following site for the questionnaire: " "http://bit.ly/159vbwa *")) 
    ( assert (Feedback (order ?*currentQuestion*) (stage FINAL) (explanation ?url))))
    