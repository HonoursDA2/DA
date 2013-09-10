
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
   (Reason (name Fatigue) (explanation "The glucose is not being converted into energy this weakens the cells and causes fatigue"))
   (Reason (name Extreme-Thirst) (explanation "Dehydration is caused by excess urine, this prompts an increased desire for water consumption"))
   (Reason (name Excessive-Urination) (explanation "There is a high loss of Glucose throough the urine"))
   (Reason (name Nausea) (explanation "Nausea is caused by gastroparesis"))
   (Reason (name Weightloss) (explanation "Insulin deficiency leads to loss of weight"))
   (Reason (name Irritability) (explanation "Cells no have any enegery, so they want more"))
   (Reason (name Yeast-Infection) (explanation "Cells no have any enegery, so they want more"))
   (Reason (name Blurred-Vision) (explanation "The fluctuation in blood glucose levels leads to a light sensitivity"))
   (Reason (name Slow-Healing-Wounds) (explanation "Elevated blood sugar levels cause narrowing of blood vessels, leading to a decreased blood flow and oxygen to the wounds."))
   (Reason (name Numbness) (explanation "The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Teeth-and-Gum-Problems) (explanation ""))
   (Reason (name Extreme-Hunger) (explanation "The dropping blood sugar levels lead to a desire for more food and energy"))
   (Reason (name Errectional-Disfunction) (explanation "This is a result of the nerve damage in the body.") )
   (Reason (name Vaginal-Itchiness) (explanation "Icthy Vagina") )
   (Reason (name Dry-Mouth) (explanation "Saliva is on the run") )
   (Reason (name Abdominal-Pain) (explanation "Abdominal Pain") )
     
    )
(deffacts additional
   (Information (name Gastroparesis) (explanation "Gastroparesis is a disease of the muscles of the stomach or the nerves controlling the muscles that causes the muscles to stop working"))
   )

(defrule showExplanation
    ?input <- (Input (name ?inputName))
    ?reason <- (Reason (name ?name) (explanation ?explanation))
    =>
    (if (eq ?inputName ?name) then 
    (printout out ?explanation)
    (retract ?input) 
    )   
    )
(defrule showInformation
    ?input <- (Input (name ?inputName))
    ?reason <- (Information (name ?name) (explanation ?explanation))
    =>
    (if (eq ?inputName ?name) then (printout out ?explanation))    
    )

(deffunction addFact(?factToAdd ?fact)
    (if (eq Symptom ?factToAdd) then
    	(assert (Symptom ?fact))else
       	(if (eq "LifeStyle" ?factToAdd) then
    	(assert (LifeStyle ?fact)))
    )
)




