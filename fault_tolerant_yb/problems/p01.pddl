; use case for testing rockin competition tasks
(define (problem yb_general_domain_task)
(:domain yb_general_domain)
(:objects

    ; robots
    youbot-brsu-3 - robot

    ; robot available platforms, to store objects inside the robot
    platform_middle platform_left platform_right - robot_platform

    ; grippers
    dynamixel - gripper
    
    ; locations
    SH-01 SH-02 SH-03 - location
    ;SH-04 SH-05 SH-06 - location
    SH-07 SH-08 SH-09 - location
    WS-01 WS-03 - location
    START - location

    ; objects
    AX-01 - object ; bearing box type A
    AX-02 - object ; bearing
    AX-03 - object ; axis
    AX-04 - object ; shaft nut
    AX-05 - object ; distance tube
    AX-09 - object ; motor
    ;AX-16 - object ; bearing box type B
    
    ER-02-01 - object ; blue box
    ;EM-01-XX - object ; tray
    ;EM-02-XX - object ; file card
)
(:init
    
    (= (total-cost) 0)

    ; distances between platforms
    (= (road-length SH-01 SH-02) 1)
    (= (road-length SH-02 SH-01) 1)

    (= (road-length SH-01 SH-03) 3)
    (= (road-length SH-03 SH-01) 3)

    (= (road-length SH-01 SH-07) 8)
    (= (road-length SH-07 SH-01) 8)

    (= (road-length SH-01 SH-08) 8)
    (= (road-length SH-08 SH-01) 8)

    (= (road-length SH-01 SH-09) 8)
    (= (road-length SH-09 SH-01) 8)

    (= (road-length SH-01 WS-01) 8)
    (= (road-length WS-01 SH-01) 8)

    (= (road-length SH-01 WS-03) 3)
    (= (road-length WS-03 SH-01) 3)

    (= (road-length SH-01 START) 15)
    (= (road-length START SH-01) 15)

    (= (road-length SH-02 SH-03) 1)
    (= (road-length SH-03 SH-02) 1)

    (= (road-length SH-02 SH-07) 8)
    (= (road-length SH-07 SH-02) 8)

    (= (road-length SH-02 SH-08) 8)
    (= (road-length SH-08 SH-02) 8)

    (= (road-length SH-02 SH-09) 8)
    (= (road-length SH-09 SH-02) 8)

    (= (road-length SH-02 WS-01) 8)
    (= (road-length WS-01 SH-02) 8)

    (= (road-length SH-02 WS-03) 8)
    (= (road-length WS-03 SH-02) 8)

    (= (road-length SH-02 START) 15)
    (= (road-length START SH-02) 15)

    (= (road-length SH-03 SH-07) 8)
    (= (road-length SH-07 SH-03) 8)

    (= (road-length SH-03 SH-08) 8)
    (= (road-length SH-08 SH-03) 8)

    (= (road-length SH-03 SH-09) 8)
    (= (road-length SH-09 SH-03) 8)

    (= (road-length SH-03 WS-01) 8)
    (= (road-length WS-01 SH-03) 8)

    (= (road-length SH-03 WS-03) 8)
    (= (road-length WS-03 SH-03) 8)

    (= (road-length SH-03 START) 15)
    (= (road-length START SH-03) 15)

    (= (road-length SH-07 SH-08) 1)
    (= (road-length SH-08 SH-07) 1)

    (= (road-length SH-07 SH-09) 3)
    (= (road-length SH-09 SH-07) 3)

    (= (road-length SH-07 WS-01) 8)
    (= (road-length WS-01 SH-07) 8)

    (= (road-length SH-07 WS-03) 8)
    (= (road-length WS-03 SH-07) 8)

    (= (road-length SH-07 START) 15)
    (= (road-length START SH-07) 15)

    (= (road-length SH-08 SH-09) 1)
    (= (road-length SH-09 SH-08) 1)

    (= (road-length SH-08 WS-01) 8)
    (= (road-length WS-01 SH-08) 8)

    (= (road-length SH-08 WS-03) 8)
    (= (road-length WS-03 SH-08) 8)

    (= (road-length SH-08 START) 15)
    (= (road-length START SH-08) 15)

    (= (road-length SH-09 WS-01) 8)
    (= (road-length WS-01 SH-09) 8)

    (= (road-length SH-09 WS-03) 8)
    (= (road-length WS-03 SH-09) 8)

    (= (road-length SH-09 START) 15)
    (= (road-length START SH-09) 15)

    (= (road-length WS-01 WS-03) 1)
    (= (road-length WS-03 WS-01) 1)

    (= (road-length WS-01 START) 15)
    (= (road-length START WS-01) 15)

    (= (road-length WS-03 START) 15)
    (= (road-length START WS-03) 15)

    ; robot initial conditions : location
    (at youbot-brsu-3 START) ; youbot is at start position


    ; status of the gripper at the beginning
    (gripper_is_free dynamixel) ; youbot gripper does not have any object and therefore is free


    ; objects in which you can insert other objects
    (empty_object ER-02-01) ; you can insert objects into blue box
    

    ; affordances : heavy objects that cannot be lifted by the robot
    ;(heavy ER-02-01) ; blue box

    ; list of pegs, objects which robot can insert into other objects (holes)    
    (insertable AX-01) 		; bearing box type A
    (insertable AX-02)       ;bearing
    (insertable AX-03) 		; axis
    (insertable AX-04) 		;shaft nut
    (insertable AX-05) 		;distance tube
    (insertable AX-09)       ; motor


    ; where are the objects located?
	; -------------------------------
    ; PLATFORM 1
    (on AX-01 SH-01) ; bearing box type A
    (on AX-02 SH-02) ; bearing
    (on AX-03 SH-03) ; axis
    ; PLATFORM 2 (empty)
    ; PLATFORM 3
    (on AX-04 SH-07) ; shaft nut
    (on AX-05 SH-08) ; distance tube
    (on AX-09 SH-09) ; motor
    ; WORKSTATION
    (on ER-02-01 WS-03) ; blue box
    
)
(:goal (and
    (in AX-03 ER-02-01)
    (in AX-02 ER-02-01)
    (in AX-04 ER-02-01)
    
))
(:metric minimize (total-cost))
)
