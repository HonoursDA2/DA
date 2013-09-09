
(deftemplate Reason
    (slot name)
    (slot explanation)
    )

(deftemplate Input
    (slot name)
    )

(deffacts symptoms
   (Reason (name Fatigue) (explanation "The glucose is not being converted into energy this weakens the cells and causes fatigue"))
   (Reason (name Extreme_Thirst) (explanation "Dehydration is caused by excess urine, this prompts an increased desire for water consumption"))
   (Reason (name Excessive_Urination) (explanation "There is a high loss of Glucose throough the urine"))
   (Reason (name Nausea) (explanation "Nausea is caused by gastroparesis"))
   (Reason (name Weight_Loss) (explanation "Insulin deficiency leads to weight loss"))
   (Reason (name Irritability) (explanation "Cells no have any enegery, so they want more"))
   (Reason (name Yeast_Infection) (explanation "Cells no have any enegery, so they want more"))
   (Reason (name Blurred_Vision) (explanation "The fluctuation in blood glucose levels leads to a light sensitivity"))
   (Reason (name Slow_Healing_Wounds) (explanation ""))
   (Reason (name Numbness) (explanation "The nerves in the body get damaged over time, leading to a tingling sensation, pain and eventual loss of sensation"))
   (Reason (name Teeth_and_Gum_Problems) (explanation ""))
   (Reason (name Extreme_Hunger) (explanation "The dropping blood sugar levels lead to a desire for more food and energy"))
   (Reason (name Errectional_Disfunction) (explanation "This is a result of the nerve damage in the body.") )
   )

(defrule showExplanation
    ?input <- (Input (name ?inputName))
    ?reason <- (Reason (name ?name) (explanation ?explanation))
    =>
   	(if (eq ?inputName ?name) then (printout t ?explanation))
    ;(retract (?input))
    )

(deffunction input()
    (bind ?read (read))    
    (assert (Input (name ?read))
        )
    )
(defrule start
    => 
    (input())
    )

(reset)
(run)

