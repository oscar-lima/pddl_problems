(define (problem p01)
	
  (:domain yb_drill_TBM2)

  (:objects 
  	S1 S2 S3 S4 S5 - location
  	EXIT START - location
  	platform_middle platform_left platform_right - robot_platform
  	YOUBOT - robot
  	o1 o2 o3 o4 o5 o6 - object
  	dynamixel - gripper
  )

  (:init 
    (= (total-cost) 0)
  	(at youbot START)
  	(on o1 S2)
  	(on o2 S2)
  	(on o3 S3)
  	(on o4 S3)
  	(on o5 S4)
  	(on o6 S5)
	(not (occupied platform_middle))
	(not (occupied platform_left))
	(not (occupied platform_right))
	(gripper_is_free dynamixel)
  ) 

  (:goal
  		(and	(on o1 S1)
  				(on o3 S4)
  		)
  )

  (:metric minimize (total-cost))
 )
