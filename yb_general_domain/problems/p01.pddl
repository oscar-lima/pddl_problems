(define (problem p01)
	
  (:domain yb_general_domain)

  (:objects 
  	S1 S2 S3 S4 assembly_station cb_ramp blue_box_location - location
  	drill_location force_fitting conveyor_belt_location trash_location - location
  	exit start - location
  	platform_middle platform_left platform_right - robot_platform
  	youbot-brsu-3 - robot
  	o1 o2 o3 o4 o5 o6 - object
  	faulty_plate_1 faulty_plate_2 fixable_plate_1 fixable_plate_2 filecard - object
    tray trash blue_box drill bearing_box1 bearing_box2 - object
  	dynamixel - gripper
  )

  (:init 
    (= (total-cost) 0)
    (at youbot-brsu-3 start)
    (on o1 S2)
    (on o2 S2)
    (on o3 S3)
  	(on o4 S3)
    (on o5 S4)
    (on bearing_box1 S1)
    (on bearing_box2 S1)
    (on blue_box S2)
    (on tray assembly_station)
    (on filecard force_fitting)
    (on drill drill_location)
    (on faulty_plate_1 cb_ramp)
    (on faulty_plate_2 cb_ramp)
    (on fixable_plate_1 cb_ramp)
    (on fixable_plate_2 cb_ramp)
    (on trash trash_location)
    (not (on drill S1))
    (not (on drill S2))
    (not (on drill S3))
    (not (on drill S4))
    (not (on drill assembly_station))
    (not (on drill force_fitting))
    (not (on drill conveyor_belt_location))
    (not (on drill trash_location))
    (not (on drill exit))
    (not (on drill start))
    (not (on drill cb_ramp))
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
    (not (insertable tray))
    (not (insertable blue_box))
    (not (insertable filecard))
    (insertable o1)
    (insertable o2)
    (insertable o3)
    (insertable o4)
    (insertable o5)
    (insertable o6)
    (insertable bearing_box1)
    (insertable bearing_box2)
    (insertable faulty_plate_1)
    (insertable faulty_plate_2)
    (insertable fixable_plate_1)
    (insertable fixable_plate_2)
    (empty_object trash)
    (empty_object tray)          ; you can insert an object into a tray
    (empty_object blue_box)       ; you can insert an object into a box
    (empty_object filecard)      ; you can insert an object into a filecard
  	(not (occupied platform_middle)) ; yb platforms are free
  	(not (occupied platform_left))
  	(not (occupied platform_right))
  	(gripper_is_free dynamixel)
    (heavy drill)                 ; drill cannot be moved by the robot
    (heavy trash)
    (this_object_can_drill drill)
    (not (this_object_can_drill o1))
    (not (this_object_can_drill o2))
    (not (this_object_can_drill o3))
    (not (this_object_can_drill o4))
    (not (this_object_can_drill o5))
    (not (this_object_can_drill o6))
    (not (this_object_can_drill faulty_plate_1))
    (not (this_object_can_drill faulty_plate_2))
    (not (this_object_can_drill fixable_plate_1))
    (not (this_object_can_drill fixable_plate_2))
    (not (this_object_can_drill tray))
    (not (this_object_can_drill blue_box))
    (not (this_object_can_drill filecard))
  ) 

  (:goal
  		(and 	(in bearing_box1 tray)
  				  (in bearing_box2 tray)
            (on tray force_fitting)
            ;(in faulty_plate_1 trash)
            ;(in faulty_plate_2 trash)
            ;(drilled fixable_plate_1)
            ;(drilled fixable_plate_2)
            ;(in fixable_plate_1 filecard)
            ;(in fixable_plate_2 filecard)
            ;(on filecard s4)
            (on o3 s2)
  		)
  )

  (:metric minimize (total-cost))
 )
