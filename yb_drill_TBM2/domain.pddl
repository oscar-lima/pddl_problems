;; Specification in PDDL1 of the rockin TBM2 drill test domain

(define (domain yb_drill_TBM2)
 (:requirements :typing )
 (:types 
  location      		; locations in the arena, points of interest
  robot         		; your amazing yet powerful robot
  object				; objects to be manipulated by the robot
  gripper				; robot gripper
  robot_platform	; platform slots for the robot to store objects
 )

 (:predicates

	; robot ?r is at location ?l
 	(at ?r - robot ?l - location)
 	
 	; object ?o is in location ?l
 	(in ?o - object ?l - location) ;todo

 	; object ?o is stored in robot platform slot ?rp
 	(stored ?o - object ?rp - robot_platform) 	
 	
 	; robot platform slot ?rp is occupied
	(occupied ?rp - robot_platform)
	
	; gripper ?g is holding object ?o
	(holding ?g - gripper ?o - object)

	; gripper ?g is free (does not contain object)
	(free ?g - gripper)
 )

 (:functions
     (total-cost) - number
 )

; moves a robot ?r from ?source - location to a ?destination - location
; NOTE : the situation in which the robot arm is in any position before moving 
;is not handled at the planning level, hence we advise to always move the arm 
; to a folded position, then navigate
 (:action move_base
     :parameters (?r - robot ?source ?destination - location ?g - gripper)
     :precondition (and (at ?r ?source)
     					(free ?g)
     			   )
     :effect (and (not (at ?r ?source))
     			  (at ?r ?destination)
     			  (increase (total-cost) 9)
     		 )
 )

 ; pick an object ?o which is inside a location ?l with a free gripper ?g 
 ; from location ?l with robot ?r that is at location ?l
 (:action pick                                
     :parameters (?o - object ?l - location ?r - robot ?g - gripper)
     :precondition 	(and 	(in ?o ?l)
                      		(at ?r ?l)
                      		(free ?g)
                   	)
     :effect (and  	(holding ?g ?o) 
                   	(not (in ?o ?l))
                   	(not (free ?g))
                   	(increase (total-cost) 3)
             )
 )

 ; store an object ?o in a robot platform ?rp which is not occupied with a gripper ?g 
 ; which is holding the object ?o
 (:action store
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition 	(and 	(holding ?g ?o)
                      		(not (occupied ?rp))
                      		(not (free ?g))
                   	)
     :effect (and  	(not (holding ?g ?o))
     				(free ?g)
     			   	(stored ?o ?rp)
                   	(occupied ?rp)
                   	(increase (total-cost) 1)
             )
 )

 ; unstore an object ?o stored in a robot platform ?rp with a free gripper ?g
 (:action unstore
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition 	(and 	(free ?g)
                      		(stored ?o ?rp)
                      		(not (holding ?g ?o))
                   	)
     :effect (and  	(not (free ?g))
     			   	(not (stored ?o ?rp))
                   	(not (occupied ?rp))
                   	(holding ?g ?o)
                   	(increase (total-cost) 1)
             )
 )

; places and object ?o with a gripper ?g which is holding the object ?o
; with a robot ?r at a location ?l in platform robot_platform ?rp
 (:action place
     :parameters (?o - object ?l - location ?g - gripper ?r - robot ?rp - robot_platform)
     :precondition 	(and 	(at ?r ?l)
     						(holding ?g ?o)
     						(not (stored ?o ?rp))
                   	)
     :effect (and 	(free ?g)
     				(in ?o ?l)
     				(not (holding ?g ?o))
     				(increase (total-cost) 3)
             )
 )
)