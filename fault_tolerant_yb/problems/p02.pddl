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
    AX-01 - object ; bearing box type A
    AX-02 - object ; bearing
    AX-03 - object ; axis
    
    ER-02-01 - object ; blue box
)
(:init
    
    (= (total-cost) 0)

    ; distances between platforms and connections
    (connected SH_01 SH_02)
    (= (road-length SH_01 SH_02) 1)
    (connected SH_02 SH_01)
    (= (road-length SH_02 SH_01) 1)
    (connected SH_01 SH_03)
    (= (road-length SH_01 SH_03) 3)
    (connected SH_03 SH_01)
    (= (road-length SH_03 SH_01) 3)
    (connected SH_01 WS_01)
    (= (road-length SH_01 WS_01) 18)
    (connected WS_01 SH_01)
    (= (road-length WS_01 SH_01) 18)
    (connected SH_01 START)
    (= (road-length SH_01 START) 25)
    (connected START SH_01)
    (= (road-length START SH_01) 25)
    ;-------------------------------
    (connected SH_02 SH_03)
    (= (road-length SH_02 SH_03) 1)
    (connected SH_03 SH_02)
    (= (road-length SH_03 SH_02) 1)
    (connected SH_02 WS_01)
    (= (road-length SH_02 WS_01) 18)
    (connected WS_01 SH_02)
    (= (road-length WS_01 SH_02) 18)
    (connected SH_02 START)
    (= (road-length SH_02 START) 25)
    (connected START SH_02)
    (= (road-length START SH_02) 25)
    ;-------------------------------
    (connected SH_03 WS_01)
    (= (road-length SH_03 WS_01) 18)
    (connected WS_01 SH_03)
    (= (road-length WS_01 SH_03) 18)
    (connected SH_03 START)
    (= (road-length SH_03 START) 25)
    (connected START SH_03)
    (= (road-length START SH_03) 25)
    ;-------------------------------
    (connected WS_01 START)
    (= (road-length WS_01 START) 25)
    (connected START WS_01)
    (= (road-length START WS_01) 25)

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

    ; where are the objects located?
	; -------------------------------
    ; PLATFORM 1
    (on AX-01 SH_01) ; bearing box type A
    (on AX-02 SH_02) ; bearing
    (on AX-03 SH_03) ; axis
    ; WORKSTATION
    (on ER-02-01 WS_01) ; blue box
)

(:goal (and
        (in AX-01 ER-02-01)
        (in AX-02 ER-02-01)
        (in AX-03 ER-02-01)
    )
)

(:metric minimize (total-cost))

)
