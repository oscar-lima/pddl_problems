(define (problem p01)
	
  (:domain yb_drill_TBM2)

  (:objects 
  	s1 s2 s3 s4 s5 - location
  	drill_location force_fitting_location conveyor_belt_location cb_trash_location - location
  	exit start - location
  	yb_platform1 yb_platform2 yb_platform3 - robot_platform
  	youbot - robot
  	o1 o2 o3 o4 o5 o6 - object
  	faulty_plate_1 faulty_plate_2 fixable_plate_1 fixable_plate_2 - object
  	dynamixel - gripper
  )

  (:init 
  	(at youbot start)
  	(in o1 s2)
  	(in o2 s2)
  	(in o3 s3)
  	(in o4 s3)
  	(in o5 s4)
  	(in o6 s5)
	(not (occupied yb_platform1))
	(not (occupied yb_platform2))
	(not (occupied yb_platform3))
	(free dynamixel)
  ) 

  (:goal
  		(and 	(in o5 drill_location)
  				(in o2 force_fitting_location)
  				(at youbot exit)
  		)
  )
 )
