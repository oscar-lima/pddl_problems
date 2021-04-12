(define (domain drone_delivery)

  (:requirements
    :typing
    :negative-preconditions
  )

  (:types
    location
    package
  )

  (:predicates
    (robot_at ?l - location)
    (pkg_at ?pkg - package ?l - location)
    (package_is_loaded ?pkg - package)
  ) 

  (:action move
    :parameters (?source ?destination - location)
    :precondition (robot_at ?source)
    :effect (and    ( not (robot_at ?source))
    				(robot_at ?destination)
    		)
  )

  (:action load
    :parameters (?pkg - package ?pkg_location - location)
    :precondition (and (robot_at ?pkg_location)
    			  	   (pkg_at ?pkg ?pkg_location)
    			  )
    :effect (and  (package_is_loaded ?pkg)
    			  (not (pkg_at ?pkg ?pkg_location))
    		)
  )
)