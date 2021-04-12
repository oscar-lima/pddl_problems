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
    (robot_is_full)
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
    			  	   (not (robot_is_full))
    			  )
    :effect (and  (package_is_loaded ?pkg)
    			  (not (pkg_at ?pkg ?pkg_location))
    			  (robot_is_full)
    		)
  )

  (:action unload
    :parameters (?pkg - package ?location - location)
    :precondition (and (robot_at ?location)
    				   (package_is_loaded ?pkg)
    				   (robot_is_full)
    			  )
    :effect (and  
    			  (pkg_at ?pkg ?location)
    			  (not (package_is_loaded ?pkg))
    			  (not (robot_is_full))
    		)
  )
)