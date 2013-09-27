(defglobal ?*currentQuestion* = 1)


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
    (slot id)
    (slot url
    (default "image.jpg"))
    )
(deftemplate Information
    (slot name)
    (slot explanation)
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
(deffacts Questions
    (Question (section Initial)(type "name")(text "Hi, I am Doctor Mellitus, a Diabetes Advisor, what is your name?") (answerType "INPUTT") (order 1))
    (Question (section Initial)(type "gender")(text "Are you male or female?")(answerType "MALE-FEMALE") (order 2))
    (Question (section Initial)(type "diabetesK")(text "Do you know about the disease called Diabetes?") (answerType "YES-NO") (order 3))
    (Question (section Initial)(type "diabetic")(text "Are you a Diabetic?") (answerType "OPTIONAL") (order 4)(options "3-Yes-No-Uncertain" ))
    (Question (section Initial)(type "Race")(text "What is your race?") (answerType "OPTIONAL")(order 5)(options "5-Black-White-Asian-Coloured-Other" ))
    (Question (section Initial)(type "Age")(text "What is your age?") (answerType "INPUTN") (order 6))
    (Question (section Initial)(type "familyH")(text "Do you have relatives who have Diabetes?")(answerType "OPTIONAL")(options "3-Yes-No-Uncertain" ) (order 7))
    (Question (section Initial)(type "pregnant")(text "Are you Pregnant?") (answerType "YES-NO") (order 8))
    (Question (section Initial)(type "weight")(text "What is your weight (KG)")(answerType "INPUTND") (order 9))
    (Question (section Initial)(type "height")(text "What is your height (M)") (answerType "INPUTND") (order 10))
    ;(Question (type "smoke")(text "Do You smoke cigarettes?") (answerType "YES-NO"))
    ;(Question (type "alcohol")(text "Do you drink alcohol regularly?") (answerType "YES-NO"))
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
   (Description(name Diabetes) (explanation "Diabetes Mellitus, more commonly known simply as Diabetes is a chronic medical condition where a person has 
            high blood sugar levels.This is either because the insulin production in the body is insufficient or because the body does not respond properly to insulin"))
   (Description(name Type-1) (explanation "Type 1 Diabetes occurs when the beta cells in the pancreas are damaged. 
            Therefore the pancreas does not produce insulin anymore. Type 1 normally occurs in people under the age of 30 (it used to be called Juvenile Diabetes)."))
   (Description(name Type-2) (explanation "Type 2 Diabetes occurs when the beta cells in the body are resistant to the effect of insulin. 
            It develops gradually over a period of time.There is a high association with a family history of Diabetes and obesity. 
            Type 2 normally occurs in people older than 40 years of age."))
   (Description(name Pre-Diabetes) (explanation "Pre-diabetes is the pre-cursor of diabetes where the blood glucose levels are higher than normal but not high enough to be considered as Diabetes. However, if the condition is tackled at this stage through diet, exercise and other healthy lifestyle changes (weight management programme), the risk can be significantly reduced."))    
   (Description(name Gestational) (explanation "This type of diabetes affects about 2%-10% of females during last months of pregnancy. 
            Pregnant women have enough insulin, but the effect of insulin is partially blocked by other hormones produced in the placenta during pregnancy.
            This causes a rise in sugar levels.
            The disease normally disappears after pregnancy." ))
    )
;The list of symp toms and their explanations
(deffacts symptomReason
   (Reason (name Fatigue)(type SYMPTOM) (explanation "The glucose is not being converted into energy this weakens the cells and causes fatigue."))
   (Reason (name Frequent-Headache)(type SYMPTOM)(explanation "This is due to the high level of glucose in the blood, this leads to frequent headaches experiecned for prolonged periods of time."))
   (Reason (name Extreme-Thirst)(type SYMPTOM)(explanation "Dehydration is caused by excess urine, this prompts an increased desire for water consumption."))
   (Reason (name Excessive-Urination)(type SYMPTOM)(explanation "There is a high loss of Glucose through the urine."))
   (Reason (name Nausea)(type SYMPTOM)(explanation "Nausea is caused by gastroparesis."))
   (Reason (name Weightloss)(type SYMPTOM)(explanation "Insulin deficiency leads to loss of weight, as the sugar cannot be converted into energy, so the body seeks alternative sources like muscle tissue and fat."))
   (Reason (name Irritability)(type SYMPTOM)(explanation "Caused by a lack of energy. As the sugar is not being converted into energy to be used by the cells."))
   (Reason (name Yeast-Infection)(type SYMPTOM)(explanation "Yeast organisms are present in most woman, but these organisms tend to overgrow in a sugar rich environment. A result of badly managed diabetes"))
   (Reason (name Blurred-Vision)(type SYMPTOM)(explanation "The fluctuation in blood glucose levels leads to a light sensitivity. Also this can be caused by the tissue being pulled from the eye lenses tob e used for energy by the body."))
   (Reason (name Slow-Healing-Wounds)(type SYMPTOM)(explanation "Elevated blood sugar levels cause narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds."))
   (Reason (name Numbness)(type SYMPTOM)(explanation "The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Gum-Infection)(type SYMPTOM)(explanation "High glucose levels in saliva promotes growth of bacteria that cause gum disease."))
   (Reason (name Extreme-Hunger)(type SYMPTOM)(explanation "The dropping blood sugar levels lead to a desire for more food and energy."))
   (Reason (name Erectile-Dysfunction)(type SYMPTOM)(explanation "This is a result of the nerve damage in the body.") )
   (Reason (name Gestational-Diabetes)(type SYMPTOM)(explanation "During pregnancy there is a lot of hormonal activity within the body, this affects the functioning of the insulin and might alter/interfere with how the body responmds tot he insulin. This condition usually subsides after the pregnacny") )
   (Reason (name Dry-Mouth)(type SYMPTOM)(explanation "Dry Mouth - This is caused by dehydration in the body."))
   (Reason (name Abdominal-Pain)(type SYMPTOM)(explanation "Abdominal Pain - Because of the gastroparesis, the stomach cannot empty its contents properly leading to stomach pain and cramping"))
   (Reason (name Diabetes) (explanation "Diabetes Mellitus, more commonly known simply as Diabetes is a chronic medical condition where a person has 
            high blood sugar levels.This is either because the insulin production in the body is insufficient or because the body does not respond properly to insulin"))
   (Reason (name Type-1) (explanation "Type 1 Diabetes occurs when the beta cells in the pancreas are damaged. 
            Therefore the pancreas does not produce insulin anymore. Type 1 normally occurs in people under the age of 30 (it used to be called Juvenile Diabetes)."))
   (Reason (name Type-2) (explanation "Type 2 Diabetes occurs when the beta cells in the body are resistant to the effect of insulin. 
            It develops gradually over a period of time.There is a high association with a family history of Diabetes and obesity. 
            Type 2 normally occurs in people older than 40 years of age."))
   (Reason (name Pre-Diabetes) (explanation "Pre-diabetes is the pre-cursor of diabetes where the blood glucose levels are higher than normal but not high enough to be considered as Diabetes. However, if the condition is tackled at this stage through diet, exercise and other healthy lifestyle changes (weight management programme), the risk can be significantly reduced."))    
   (Reason (name Gestational) (explanation "This type of diabetes affects about 2%-10% of females during last months of pregnancy. 
            Pregnant women have enough insulin, but the effect of insulin is partially blocked by other hormones produced in the placenta during pregnancy.
            This causes a rise in sugar levels.
            The disease normally disappears after pregnancy." )) 
    )
; Extra information that accompanies the symptoms
(deffacts additional
	(Information (name Nausea) (explanation "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
   	(Information (name Frequent-Headache) (explanation ""))
    (Information (name Yeast-Infection) (explanation "Yeast is a type of fungus; yeast infection refers to the fungus scientifically known as Candida"))
   	(Information (name Dry-Mouth) (explanation "Dehydration is a result of the high demand for bodily fluids drawn from the tissues to help excrete the excess sugar from the body"))
   	(Information (name Abdominal-Pain) (explanation "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
   	(Information (name Gum-Infection) (explanation "Diabetes reduces the body’s resistance to infection, which increases the probability of the gums becoming infected."))
    (Information (name Fatigue) (explanation ""))
    (Information (name Extreme-Thirst) (explanation ""))
    (Information (name Excessive-Urination) (explanation ""))
    (Information (name Weightloss) (explanation ""))
    (Information (name Irritability) (explanation ""))
    (Information (name Blurred-Vision) (explanation ""))
    (Information (name Slow-Healing-Wounds) (explanation ""))
    (Information (name Numbness) (explanation ""))
    (Information (name Extreme-Hunger) (explanation ""))
    (Information (name Erectile-Dysfunction) (explanation "") )
    (Information (name Diabetes) (explanation "Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood.
            Insulin converts the glucose into energy to be used by the cells"))
   	(Information (name Type-1) (explanation "The Pancreas is a long soft organ that secrets insulin when the level of sugar in the blood rises in the body after a meal.
            Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood."))
   	(Information (name Type-2) (explanation "The Pancreas is a long soft organ that secrets insulin when the level of sugar in the blood rises in the body after a meal.
            Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood."))
    (Information (name Pre-Diabetes) (explanation ""))    
    (Information (name Gestational) (explanation ""))    
    	
     )
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
    (modify ?question (ask no))
    (retract ?ask)
        )
    )
(defrule changeQuestions
    (declare (salience 5))
    (Ask-Question-Initial)
    ?question <- (Question (section Initial)(type ?type)(text ?questionText) (answerType ?answerType) (ask no) (order ?current))
    =>
    (if (eq ?current ?*currentQuestion*) then
    	(bind ?counter (+ ?*currentQuestion* 1))	
    	(bind ?*currentQuestion* ?counter)
    )
    )
(defrule askQuestionLifestyle
    ?ask <- (Ask-Question-Lifestyle)
    ?question <- (Question (section Lifestyle)(type ?type)(text ?questionText) (answerType ?answerType) (ask yes) (order ?current) (options ?options))
    =>
    (if (eq ?current ?*currentQuestion*) then
    (bind ?counter (+ ?*currentQuestion* 1))
    (bind ?*currentQuestion* ?counter)
    (printout out ?questionText)
    (printout out2 ?answerType)    
    (printout out3 ?type)
    (printout out4 ?options)
    (modify ?question (ask no))
    (retract ?ask)
        )
    )
;shows the explanation of the symptom in question
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
;shows the extra information of the symptom in question
(defrule showExtraInformation
    ?extraInfo <- (Extra-Info)
    (Information (name ?symptom)(explanation ?explanation))
    =>
    (if (eq ?symptom ?*currentSymptom*) then 
    (printout out (filter ?explanation))
    (retract ?extraInfo))
    )
;calculates the BMI with the provided weight and height of the user
(defrule bmi
    (Height ?userHeight)
    (Weight ?userWeight)
    =>
    (bind ?weight ?userWeight)
    (bind ?height ?userHeight)
    (bind ?bmi (/ ?userWeight (* ?userHeight ?userHeight)))
    (assert (BMI ?bmi))
    (if (> ?bmi 30) then 
    	(assert (weight-classification Obese)) else
        	(if (> ?bmi 25) then
        		( assert (weight-classification Overweight)) else
            		(if (> ?bmi 18.5) then 
                		(assert (weight-classification OptimalWeight)) else
                			(if (< ?bmi 18.5 ) then
                    			(assert (weight-classification Underweight))
                    		)
                	)
        	)
    )  
    )
;(defrule weightAnalyzer)
(defrule printSymptoms
    (Symptoms)
    (Reason (name ?name) (explanation ?explanation))
    =>
    (printout out (?name crlf ?explanation))
    )
;if the suer is male then they are not pregnant.
(defrule getName
    ?request <- (Get Name)
    (name ?name)
    =>
    (printout out ?name)
    (retract ?request)
    )
(defrule getSymptoms
    ?command <- (Get Symptoms)
    (Description(name ?name)(type SYMPTOM)(id ?id)(explanation ?explanation))
   
    =>
    	(printout out ?name " ")
    	(printout out2  ?id " ")
    	(printout out3  ?explanation " ")
    	;(retract ?command)
    )

(defrule getSymptom
    ?command <- (Symptom ?symptom)
    (Reason (name ?symptom)(type SYMPTOM)(url ?url)(explanation ?explanation))
    =>
    	(printout out ?symptom)
    	(printout out2  ?url)
    	(printout out3  ?explanation)
   	    (assert (Has-Symptom ?symptom)) 
    	(retract ?command)
    )

(defrule isMale
    (declare (salience 10))
    (Gender Male)
    ?question <- (Question (section Initial) (type "pregnant") (text ?questionText) (answerType ?answerType) (ask yes))
    =>
    (assert (Pregnant No))
    (modify ?question (ask no))
    )
;This methods checks if there is any extra information, if not prints a generic message
(deffunction filter (?text)
    (bind ?current ?text)
    (if (eq ?current "") then
        (bind ?current "No extra information is available"))
    ?current 
    )
;adds a fact to the working memory
(deffunction addFact(?factToAdd ?fact)
    (if (eq Symptom ?factToAdd) then
    	(assert (Symptom ?fact))else
       				(if (eq Weight ?factToAdd) then
    					(assert (Weight ?weight))else
       						(if (eq Height ?factToAdd) then
    							(assert (Height ?fact)))
                	)            
     )
)
