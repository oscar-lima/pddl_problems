;; Specification in PDDL1 of the DWR domain

(define (domain yb_btt)
 (:requirements :typing )
 (:types 
  platform      ; there are several platforms in the arena
  container		; place for the object to be stored
  robot         ; stores at most 3 object
  object		; at work object
 )

 (:predicates

 	(at ?r - robot ?p - platform)       	; robot ?r is at platform ?p
 	(stored ?o - object ?c - container) 	; object ?o is stored in container ?c
	(occupied ?c - container)             	; container ?c is occupied
	(on ?o - object ?p - platform)  		; object ?o is on platform ?p
 )

; moves a robot to a platform
 (:action move                                
     :parameters (?r - robot ?source ?destination - platform)
     :precondition (at ?r ?source)
     :effect (and (not (at ?r ?source))
     			  (at ?r ?destination)
     		 )
 )

; pick an object from a platform and stores it into a free container
 (:action pick-and-store                                
     :parameters (?o - object ?p - platform ?c - container ?r - robot)
     :precondition (and (on ?o ?p) 
     					(not (occupied ?c))
                      	(at ?r ?p)
                   )
     :effect (and  (occupied ?c) 
                   (stored ?o ?c)
                   (not (on ?o ?p))                   
             )
 )

; unloads a stored object and places it on a platform
 (:action place_on_platform                                 
     :parameters (?o - object ?p - platform ?c - container ?r - robot)
     :precondition (and (at ?r ?p) 
     					(stored ?o ?c)
                   )
     :effect (and 	(on ?o ?p)
                	(not (occupied ?c))
             )
 )

)