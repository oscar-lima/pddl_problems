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
    SH_01 SH_02 SH_03 - location
    WS_01 - location
    START - location

    ; objects
    AX_01 - object ; bearing box type A
    AX_02 - object ; bearing
    AX_03 - object ; axis
    
    ER_02_01 - object ; blue box
)
(:init
    
    (= (total-cost) 0)

    ; distances between platforms and connections
    (connected SH_01 SH_02)
    (= (road-length SH_01 SH_02) 1) ; 1
    (connected SH_02 SH_01)
    (= (road-length SH_02 SH_01) 1) ; 1
    (connected SH_01 SH_03)
    (= (road-length SH_01 SH_03) 1) ; 3
    (connected SH_03 SH_01)
    (= (road-length SH_03 SH_01) 1) ; 3
    (connected SH_01 WS_01)
    (= (road-length SH_01 WS_01) 2) ; 18
    (connected WS_01 SH_01)
    (= (road-length WS_01 SH_01) 1) ; 18
    (connected SH_01 START)
    (= (road-length SH_01 START) 1) ; 25
    (connected START SH_01)
    (= (road-length START SH_01) 1) ; 25
    ;-------------------------------
    (connected SH_02 SH_03)
    (= (road-length SH_02 SH_03) 1) ; 1
    (connected SH_03 SH_02)
    (= (road-length SH_03 SH_02) 1) ; 1
    (connected SH_02 WS_01)
    (= (road-length SH_02 WS_01) 2) ; 18
    (connected WS_01 SH_02)
    (= (road-length WS_01 SH_02) 1) ; 18
    (connected SH_02 START)
    (= (road-length SH_02 START) 1) ; 25
    (connected START SH_02)
    (= (road-length START SH_02) 1) ; 25
    ;-------------------------------
    (connected SH_03 WS_01)
    (= (road-length SH_03 WS_01) 2) ; 18
    (connected WS_01 SH_03)
    (= (road-length WS_01 SH_03) 1) ; 18
    (connected SH_03 START)
    (= (road-length SH_03 START) 1) ; 25
    (connected START SH_03)
    (= (road-length START SH_03) 1) ; 25
    ;-------------------------------
    (connected WS_01 START)
    (= (road-length WS_01 START) 1) ; 25
    (connected START WS_01)
    (= (road-length START WS_01) 2) ; 25

    ; hardness to detect objects
    (= (perception-complexity AX_01) 250) ; bearing box type A
    (= (perception-complexity AX_02) 1) ; bearing
    (= (perception-complexity AX_03) 100) ; axis
    (= (perception-complexity ER_02_01) 350) ; blue box

    ; robot initial conditions : location
    (at youbot-brsu-3 START) ; youbot is at start position

    ; status of the gripper at the beginning
    (gripper_is_free dynamixel) ; youbot gripper does not have any object and therefore is free

    ; objects in which you can insert other objects
    (empty_object ER_02_01) ; you can insert objects into blue box

    ; affordances : heavy objects that cannot be lifted by the robot
    ;(heavy ER_02_01) ; blue box

    ; list of pegs, objects which robot can insert into other objects (holes)    
    (insertable AX_01) 		; bearing box type A
    (insertable AX_02)       ;bearing
    (insertable AX_03) 		; axis

    ; where are the objects located?
	; -------------------------------
    ; PLATFORM 1
    (on AX_01 SH_01) ; bearing box type A
    (on AX_02 SH_02) ; bearing
    (on AX_03 SH_03) ; axis
    ; WORKSTATION
    (on ER_02_01 WS_01) ; blue box
)

(:goal (and
        (in AX_01 ER_02_01)
        (in AX_02 ER_02_01)
        (in AX_03 ER_02_01)
    )
)

(:metric minimize (total-cost))

)
