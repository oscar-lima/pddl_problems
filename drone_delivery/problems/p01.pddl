(define (problem p01)

  (:domain drone_delivery)

  (:objects
  	locA locB - location
  )

  (:init 
  	(robot_at locA)
  ) 

  (:goal
  	(  and (robot_at locB)
    )
  )
 )
