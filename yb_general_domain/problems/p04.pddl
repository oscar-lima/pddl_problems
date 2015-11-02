; This problem definition was automatically generated 
; from a knowledge base snapshot by using rosplan interface 

(define (problem yb_general_domain_task)
(:domain yb_general_domain)
(:objects
    dynamixel - gripper
    s1 s2 s3 s4 start exit cb_ramp cb_trash drill_loc force_fitting assembly_station - location
    o1 o2 o3 o4 o5 o6 faulty_plate fixable_plate filecard tray blue_box drill trash - object
    youbot-brsu-3 - robot
    platform_middle platform_left platform_right - robot_platform
)

(:init
    (= (total-cost) 0)
    (at youbot-brsu-3 start)
    (empty_object trash)
    (empty_object tray)
    (empty_object blue_box)
    (empty_object filecard)
    (gripper_is_free dynamixel)
    (heavy drill)
    (heavy trash)
    (insertable o1)
    (insertable o2)
    (insertable o3)
    (insertable o4)
    (insertable o5)
    (insertable o6)
    (insertable faulty_plate)
    (insertable fixable_plate)
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
    (this_object_can_drill drill)
)

(:goal (and
           (in o1 tray)
           (in o2 tray)
           (on tray force_fitting)
           (on o3 s2)
       )
)

(:metric minimize (total-cost))

)
