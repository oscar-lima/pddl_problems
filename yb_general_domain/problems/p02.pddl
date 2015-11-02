(define (problem p01)
	
  (:domain yb_general_domain)

  (:objects 
  	youbot-brsu-3 - robot
    dynamixel - gripper
    platform_middle platform_left platform_right - robot_platform
    S1 S2 S3 S4 start exit - location
    cb_ramp cb_trash drill_loc force_fitting assembly_station - location
  	o1 o2 o3 o4 o5 o6 - object
  	faulty_plate fixable_plate filecard  tray blue_box drill trash - object  	
  )

  (:init 
    (= (total-cost) 0)
    ; youbot start location
    (at youbot-brsu-3 start)
    ; objects initial location
    (on o1 S2)
    (on o2 S2)
    (on o3 S3)
  	(on o4 S3)
    (on o5 S4)
    (on o6 S4)
    (on blue_box S2)
    (on tray assembly_station)
    (on filecard force_fitting)
    (on drill drill_loc)
    (on faulty_plate cb_ramp)
    (on fixable_plate cb_ramp)
    (on trash cb_trash)
    ; objects which can contain other objects (potential holes)
    (empty_object trash)
    (empty_object tray)
    (empty_object blue_box)
    (empty_object filecard)
    ; objects which cannot contain objects
    ;(not (empty_object o1))
    ;(not (empty_object o2))
    ;(not (empty_object o3))
    ;(not (empty_object o4))
    ;(not (empty_object o5))
    ;(not (empty_object o6))
    ;(not (empty_object faulty_plate))
    ;(not (empty_object fixable_plate))
    ; list of pegs
    (insertable o1)
    (insertable o2)
    (insertable o3)
    (insertable o4)
    (insertable o5)
    (insertable o6)
    (insertable faulty_plate)
    (insertable fixable_plate)
    ; list of objects which you cannot insert into other objects
    ;(not (insertable tray))
    ;(not (insertable blue_box))
    ;(not (insertable filecard))
    ; yb platforms are free at start
  	;(not (occupied platform_middle))
  	;(not (occupied platform_left))
  	;(not (occupied platform_right))
    ; general conditions
  	(gripper_is_free dynamixel)
    (heavy drill)              ; drill cannot be moved by the robot   
    (heavy trash)
    (this_object_can_drill drill)
    ;(not (this_object_can_drill o1))
    ;(not (this_object_can_drill o2))
    ;(not (this_object_can_drill o3))
    ;(not (this_object_can_drill o4))
    ;(not (this_object_can_drill o5))
    ;(not (this_object_can_drill o6))
    ;(not (this_object_can_drill faulty_plate_1))
    ;(not (this_object_can_drill faulty_plate_2))
    ;(not (this_object_can_drill fixable_plate_1))
    ;(not (this_object_can_drill fixable_plate_2))
    ;(not (this_object_can_drill tray))
    ;(not (this_object_can_drill blue_box))
    ;(not (this_object_can_drill filecard))
  ) 

  (:goal
  		(and 	(in o1 tray)
  				  (in o2 tray)
            (on tray force_fitting)
            ;(in faulty_plate trash)
            ;(drilled fixable_plate)
            ;(in fixable_plate filecard)
            ;(on filecard s4)
            (on o3 s2)
  		)
  )

  (:metric minimize (total-cost))
 )
