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
(deffacts symptoms
   (Reason (name Fatigue) (explanation "The glucose is not being converted into energy this weakens the cells and causes fatigue."))
   (Reason (name Extreme-Thirst) (explanation "Dehydration is caused by excess urine, this prompts an increased desire for water consumption."))
   (Reason (name Excessive-Urination) (explanation "There is a high loss of Glucose through the urine."))
   (Reason (name Nausea) (explanation "Nausea is caused by gastroparesis."))
   (Reason (name Weightloss) (explanation "Insulin deficiency leads to loss of weight, as the sugar cannot be converted into bodily fat."))
   (Reason (name Irritability) (explanation "Caused by a lack of energy. As the sugar is not being converted into energy to be sued by the cells."))
   (Reason (name Yeast-Infection) (explanation "Yeast organisms are present in most woman, but these organisms tend to overgrow in a sugar rich environment. A result of badly managed diabetes"))
   (Reason (name Blurred-Vision) (explanation "The fluctuation in blood glucose levels leads to a light sensitivity."))
   (Reason (name Slow-Healing-Wounds) (explanation "Elevated blood sugar levels cause narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds."))
   (Reason (name Numbness) (explanation "The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Gum-Infection) (explanation "High glucose levels in saliva promotes growth of bacteria that cause gum disease."))
   (Reason (name Extreme-Hunger) (explanation "The dropping blood sugar levels lead to a desire for more food and energy."))
   (Reason (name Erectile-Dysfunction) (explanation "This is a result of the nerve damage in the body.") )
   (Reason (name Vaginal-Itchiness) (explanation "Signs of a yeast infection due to excess sugar in the areas suroundiong the vagina."))
   (Reason (name Dry-Mouth) (explanation "This is caused by dehydration in the body."))
   (Reason (name Abdominal-Pain) (explanation "Because of the gastroparesis, the stomach cannot its contents properly leading to stomach pain and cramping"))
    )
(deffacts additional
	(Information (name Nausea) (explanation "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working, affecting the digestive process"))
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
    (Information (name Vaginal-Itchiness) (explanation ""))
    
    )

(defrule showExplanation
    ?input <- (Input (name ?inputName))
    ?reason <- (Reason (name ?name) (explanation ?explanation))
    =>
    (bind ?*currentSymptom* ?inputName)
    (if (eq ?inputName ?name) then 
    (printout out ?explanation)
    (retract ?input) 
    )   
    )

(defrule showInformation
    ?extraInfo <- (Extra-Info)
    ?reason <-(Information (name ?symptom)(explanation ?explanation))
    =>
    (if (eq ?symptom ?*currentSymptom*) then 
    (printout out ?explanation)
    (retract ?extraInfo))
    )

(deffunction addFact(?factToAdd ?fact)
    (if (eq Symptom ?factToAdd) then
    	(assert (Symptom ?fact))else
       	(if (eq LifeStyle ?factToAdd) then
    	(assert (LifeStyle ?fact)))
    )
)