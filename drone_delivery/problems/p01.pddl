(define (problem p01)

  (:domain drone_delivery)

  (:objects
  	locA locB - location
    pkg1 pkg2 - package
  )

  (:init 
  	(robot_at locA)
    (pkg_at pkg1 locB)
    (pkg_at pkg2 locB)
  ) 

  (:goal
  	(  and (package_is_loaded pkg1)
    )
  )
 )
