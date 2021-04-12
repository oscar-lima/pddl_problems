(define (domain drone_delivery)

  (:requirements
    :typing
    :negative-preconditions
  )

  (:types
    location
  )

  (:predicates
    (robot_at ?l - location)
  ) 

  (:action move
    :parameters (?source ?destination - location)
    :precondition (robot_at ?source)
    :effect (and    ( not (robot_at ?source))
    				(robot_at ?destination)
    		)
  )
)