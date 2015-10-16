(define (problem p01)
	
  (:domain yb_drill_TBM2)

  (:objects 
  	s1 s2 s3 s4 s5 - location
  	drill_location force_fitting_location conveyor_belt_location cb_trash_location - location
  	exit start - location
  	yb_platform1 yb_platform2 yb_platform3 - robot_platform
  	youbot-brsu-3 - robot
  	o1 o2 o3 o4 o5 o6 - object
  	faulty_plate_1 faulty_plate_2 fixable_plate_1 fixable_plate_2 - object
    tray1 blue_box - object
  	dynamixel - gripper
  )

  (:init 
    (= (total-cost) 0)
    (at youbot-brsu-3 start)
    (on o1 s2)
    (on o2 s2)
    (on o3 s3)
  	(on o4 s3)
    (on o5 s4)
    (on o6 s3)
    (on tray1 s3)
    (not (empty_object o1))       ; you cannot put any object inside o1
    (not (empty_object o2))
    (not (empty_object o3))
    (not (empty_object o4))
    (not (empty_object o5))
    (not (empty_object o6))
    (not (empty_object faulty_plate_1))
    (not (empty_object faulty_plate_2))
    (not (empty_object fixable_plate_1))
    (not (empty_object fixable_plate_2))
    (empty_object tray1)          ; you can insert an object into a tray
    (empty_object blue_box)       ; you can insert an object into a box
  	(not (occupied yb_platform1)) ; yb platforms are free
  	(not (occupied yb_platform2))
  	(not (occupied yb_platform3))
  	(gripper_is_free dynamixel)
  ) 

  (:goal
  		(and 	(on o1 drill_location)          ; transport task
  				  (on o2 force_fitting_location)  ; transport task
            (in o6 tray1)                   ; peg in hole task
            (on tray1 s5)
  		)
  )

  (:metric minimize (total-cost))
 )
