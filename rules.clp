(deftemplate Description
    (slot name)
    (slot explanation)
    )
(deftemplate Reason
    (slot name)
    (slot explanation)
    )
(deftemplate Information
    (slot name)
    (slot explanation)
    )
(deftemplate Input
    (slot name)
    )
(deffacts symtpomDescription
   (Description(name Fatigue) (explanation "Do you feel tired a lot? A feeling of tiredness that can not be explained."))
   (Description(name Extreme-Thirst) (explanation "Do you feel thirsty often throughout the day?"))
   (Description (name Excessive-Urination) (explanation "Do you make frequent trips to the toilet to urinate (pee)?"))
   (Description (name Nausea) (explanation "Do you have an uneasy feeling in your stomach? A feeling that makes you feel like vomitting, especially after eating?"))
   (Description (name Weightloss) (explanation "Have you lost weight over the recent months/years, even though you have not been trying to do so actively?"))
   (Description (name Irritability) (explanation "Do you feel easily irritated and agitated, for no known reason?"))
   (Description (name Yeast-Infection) (explanation "Do you exxperience itching, burning, soreness, pain during intercourse and urination?"))
   (Description (name Blurred-Vision) (explanation "Do you have problems seeing at times? Is your eyesight problematic?"))
   (Description(name Slow-Healing-Wounds) (explanation "Do your cuts and soars take a very long time to patch up and heal?"))
   (Description (name Numbness) (explanation "Do you lose sensation and feeling in certain body parts? Do your hands and feet ever feel numb?"))
   (Description(name Gum-Infection) (explanation "Do you have an infection in your mouth? Have you been experiencing any teeth and gum related problems recently?"))
   (Description(name Extreme-Hunger) (explanation "Do you experience hunger that seems unnatural, like soon after a big meal?"))
   (Description(name Erectile-Dysfunction) (explanation "Are you experienxcing sexual difficulty with your woman, do you find it hard to get an erect penis?") )
   (Description(name Vaginal-Itchiness) (explanation "Does your vagina get itchy at times, even though you clean and wash regularly?"))
   (Description(name Dry-Mouth) (explanation "Does your mouth feel dry often, do you often find that you have very little to no saliva in your mouth?"))
   (Description(name Abdominal-Pain) (explanation "Does the area surrounding your stomach pain, especially after eating food, during digestion?"))
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
;The list of symptoms and their explanations
(deffacts symptomReason
   (Reason (name Fatigue) (explanation "The glucose is not being converted into energy this weakens the cells and causes fatigue."))
   (Reason (name Extreme-Thirst) (explanation "Dehydration is caused by excess urine, this prompts an increased desire for water consumption."))
   (Reason (name Excessive-Urination) (explanation "There is a high loss of Glucose through the urine."))
   (Reason (name Nausea) (explanation "Nausea is caused by gastroparesis."))
   (Reason (name Weightloss) (explanation "Insulin deficiency leads to loss of weight, as the sugar cannot be converted into energy, so the body seeks alternative sources like muscle tissue and fat."))
   (Reason (name Irritability) (explanation "Caused by a lack of energy. As the sugar is not being converted into energy to be used by the cells."))
   (Reason (name Yeast-Infection) (explanation "Yeast organisms are present in most woman, but these organisms tend to overgrow in a sugar rich environment. A result of badly managed diabetes"))
   (Reason (name Blurred-Vision) (explanation "The fluctuation in blood glucose levels leads to a light sensitivity. Also this can be caused by the tissue being pulled from the eye lenses tob e used for energy by the body."))
   (Reason (name Slow-Healing-Wounds) (explanation "Elevated blood sugar levels cause narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds."))
   (Reason (name Numbness) (explanation "The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Gum-Infection) (explanation "High glucose levels in saliva promotes growth of bacteria that cause gum disease."))
   (Reason (name Extreme-Hunger) (explanation "The dropping blood sugar levels lead to a desire for more food and energy."))
   (Reason (name Erectile-Dysfunction) (explanation "This is a result of the nerve damage in the body.") )
   (Reason (name Vaginal-Itchiness) (explanation "Signs of a yeast infection due to excess sugar in the areas suroundiong the vagina."))
   (Reason (name Dry-Mouth) (explanation "This is caused by dehydration in the body."))
   (Reason (name Abdominal-Pain) (explanation "Because of the gastroparesis, the stomach cannot empty its contents properly leading to stomach pain and cramping"))
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
   	(Information (name Yeast-Infection) (explanation "Yeast is a type of fungus; yeast infection refers to the fungus scientifically known as Candida"))
   	(Information (name Dry-Mouth) (explanation "Dehydration is a result of the high demand for bodily fluids drawn from the tissues to help excrete the excess sugar from the body"))
   	(Information (name Abdominal-Pain) (explanation "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
   	(Information (name Gum-Infection) (explanation "Diabetes reduces the body�s resistance to infection, which increases the probability of the gums becoming infected."))
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
    (Information (name Vaginal-Itchiness) (explanation ""))
    (Information (name Diabetes) (explanation "Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood.
            Insulin converts the glucose into energy to be used by the cells"))
   	(Reason (name Type-1) (explanation "The Pancreas is a long soft organ that secrets insulin when the level of sugar in the blood rises in the body after a meal.
            Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood."))
   	(Reason (name Type-2) (explanation "The Pancreas is a long soft organ that secrets insulin when the level of sugar in the blood rises in the body after a meal.
            Insulin is a hormone produced by the Pancreas that is the main regulator of the glucose (sugar) in the blood."))
    (Reason (name Pre-Diabetes) (explanation ""))    
    (Reason (name Gestational) (explanation ""))    
    	
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
    )
;(defrule weightAnalyzer)
(defrule printSymptoms
    (Symptoms)
    (Reason (name ?name) (explanation ?explanation))
    =>
    (printout out (?name crlf ?explanation))
    )
;if the suer is male then they are not pregnant.
(defrule isMale
    (Gender Male)
    =>
    (assert (Pregnant No))
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
