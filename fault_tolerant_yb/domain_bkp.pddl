; Specification in PDDL1 for youbot all competitions general domain
; this includes rockin and robocup
; author : Oscar Lima, olima_84@yahoo.com

(define (domain yb_general_domain)
 (:requirements :typing :action-costs)
 (:types 
  	location      		; locations in the arena, points of interest
  	robot         		; your amazing yet powerful robot
  	object				; objects to be manipulated by the robot
  	gripper				; robot gripper
  	robot_platform		; platform slots for the robot to store objects
 )

 (:predicates

	; robot ?r is at location ?l
 	(at ?r - robot ?l - location)
 	
 	; source is connected with destination
	(connected ?source ?destination - location)

 	; object ?o is on location ?l
 	(on ?o - object ?l - location)

 	; object ?o is stored on robot platform ?rp
 	(stored ?o - object ?rp - robot_platform) 	
 	
 	; robot platform ?rp is occupied, yb has 3 free places to store objects
	(occupied ?rp - robot_platform)
	
	; gripper ?g is holding object ?o
	(holding ?g - gripper ?o - object)

	; gripper ?g is free (does not contain object)
	(gripper_is_free ?g - gripper)

	; object ?o is empty and is ready to receive a peg (peg & hole task)
	(empty_object ?o - object)

	; object ?o is inserted inside object ?h
	(in ?peg - object ?hole - object)

	; the object ?o is heavy and cannot be lifted by the robot
	(heavy ?o - object)

	; the object ?o is drilled, this work has performed by a drill press machine
	(drilled ?o - object)

	; specifiy that this object is a machine that can perform a drill job
	(this_object_can_drill ?drill - object)

	; specifies if an object ?o can be inserted into another object
	(insertable ?o - object)

	; a location ?l is perceived when object recognition was triggered
	; gets lost if the robot does large motions
	(perceived ?l - location)
 )

 (:functions
	(road-length ?source ?destination - location) - number
	(total-cost) - number
 )

; moves a robot ?r from ?source - location to a ?destination - location
; NOTE : the situation in which the robot arm is in any position before moving 
; is not handled at the planning level, hence we advise to always move the arm 
; to a folded position, then navigate
 (:action move_base_safe
     :parameters (?source ?destination - location ?r - robot ?g - gripper)
     :precondition (and (at ?r ?source)
     					(gripper_is_free ?g)
     					(connected ?source ?destination)
     			   )
     :effect (and (not (at ?r ?source))
     			  (at ?r ?destination)
     			  (not (perceived ?source))
     			  (increase (total-cost) (road-length ?source ?destination))
     		 )
 )

 ; perceive a location ?l with a empty gripper ?g to find the positions of 
 ; the objects ?o before they can be picked from a location ?l
 (:action perceive
   :parameters (?l - location ?r - robot ?g - gripper)
   :precondition 	(and 	(at ?r ?l)
   							(gripper_is_free ?g)
   							(not (perceived ?l))
   					)
   :effect 	(and 	(perceived ?l)
   					(increase (total-cost) 1)
  			)
 )

 ; pick an object ?o which is inside a location ?l with a free gripper ?g 
 ; with robot ?r that is at location ?l
 (:action pick
     :parameters (?o - object ?l - location ?r - robot ?g - gripper)
     :precondition 	(and 	(on ?o ?l)
                      		(at ?r ?l)
                      		(perceived ?l)
                      		(gripper_is_free ?g)
                      		(not (heavy ?o))
                   	)
     :effect (and  	(holding ?g ?o) 
                   	(not (on ?o ?l))
                   	(not (gripper_is_free ?g))
                   	(increase (total-cost) 3)
             )
 )

 ; stage an object ?o in a robot platform ?rp which is not occupied with a gripper ?g 
 ; which is holding the object ?o
 (:action stage
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition 	(and 	(holding ?g ?o)
                      		(not (occupied ?rp))
                      		(not (gripper_is_free ?g))
                   	)
     :effect (and  	(not (holding ?g ?o))
     				(gripper_is_free ?g)
     			   	(stored ?o ?rp)
                   	(occupied ?rp)
                   	(increase (total-cost) 1)
             )
 )

 ; unstage an object ?o stored on a robot platform ?rp with a free gripper ?g
 (:action unstage
     :parameters (?o - object ?rp - robot_platform ?g - gripper)
     :precondition 	(and 	(gripper_is_free ?g)
                      		(stored ?o ?rp)
                      		(not (holding ?g ?o))
                   	)
     :effect (and  	(not (gripper_is_free ?g))
     			   	(not (stored ?o ?rp))
                   	(not (occupied ?rp))
                   	(holding ?g ?o)
                   	(increase (total-cost) 1)
             )
 )

; places and object ?o with a gripper ?g which is holding the object ?o
; with a robot ?r at a location ?l on robot_platform ?rp
 (:action drop_on_platform
     :parameters (?o - object ?l - location ?g - gripper ?r - robot ?rp - robot_platform)
     :precondition 	(and 	(at ?r ?l)
     						(holding ?g ?o)
     						(not (stored ?o ?rp))
                   	)
     :effect (and 	(gripper_is_free ?g)				; the gripper is free
     				(on ?o ?l)				; object is now on location l
     				(not (holding ?g ?o))	; the gripper is no longer holding the object
     				(increase (total-cost) 3)
             )
 )

 ; inserts a object ?o which gripper ?g is holding into another object ?o at location ?l
 (:action insert
   :parameters (?peg ?hole - object ?g - gripper ?r - robot ?l - location)
   :precondition 	(and 	(at ?r ?l)
   							(on ?hole ?l)
   							(holding ?g ?peg)
   							(empty_object ?hole)
   							(not (gripper_is_free ?g))
   							(not (in ?peg ?hole))
   							(insertable ?peg)
   					)
   :effect 	(and 	(not (holding ?g ?peg))
   					;(not (empty_object ?hole))
   					(gripper_is_free ?g)
   					(in ?peg ?hole)
   					(on ?peg ?l)
   					(heavy ?peg)
   					(heavy ?hole)
   					(increase (total-cost) 1)
   			)
 )

 ; a robot ?r in a ?drill location holding an object o? places the object in the drill,
 ; actuates the drill, then picks the fixed plate
 (:action drill_object
   :parameters 		(?o ?drill - object ?l - location ?r - robot ?g - gripper)
   :precondition 	(and 	(at ?r ?l)
   							(holding ?g ?o)
   							(on ?drill ?l)
   							(this_object_can_drill ?drill)
   					)
   :effect 			(and 	(drilled ?o)
   							(increase (total-cost) 1)
   					)
 )

)