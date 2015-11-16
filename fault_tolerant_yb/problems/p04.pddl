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
    (connected SH-01 SH-02)
    (= (road-length SH-01 SH-02) 1) ; 
    (connected SH-02 SH-01)
    (= (road-length SH-02 SH-01) 1) ; 
    (connected SH-01 WS-01)
    (= (road-length SH-01 WS-01) 1) ; 
    (connected WS-01 SH-01)
    (= (road-length WS-01 SH-01) 1) ; 
    (connected SH-01 WS-02)
    (= (road-length SH-01 WS-02) 1) ; 
    (connected WS-02 SH-01)
    (= (road-length WS-02 SH-01) 1) ; 
    (connected SH-01 START)
    (= (road-length SH-01 START) 1) ; 
    (connected START SH-01)
    (= (road-length START SH-01) 1) ; 
    (connected SH-01 CB-01)
    (= (road-length SH-01 CB-01) 1) ; 
    (connected CB-01 SH-01)
    (= (road-length CB-01 SH-01) 1) ; 
    (connected SH-01 DM-01)
    (= (road-length SH-01 DM-01) 1) ; 
    (connected DM-01 SH-01)
    (= (road-length DM-01 SH-01) 1) ; 
    (connected SH-02 WS-01)
    (= (road-length SH-02 WS-01) 1) ; 
    (connected WS-01 SH-02)
    (= (road-length WS-01 SH-02) 1) ; 
    (connected SH-02 WS-02)
    (= (road-length SH-02 WS-02) 1) ; 
    (connected WS-02 SH-02)
    (= (road-length WS-02 SH-02) 1) ; 
    (connected SH-02 START)
    (= (road-length SH-02 START) 1) ; 
    (connected START SH-02)
    (= (road-length START SH-02) 1) ; 
    (connected SH-02 CB-01)
    (= (road-length SH-02 CB-01) 1) ; 
    (connected CB-01 SH-02)
    (= (road-length CB-01 SH-02) 1) ; 
    (connected SH-02 DM-01)
    (= (road-length SH-02 DM-01) 1) ; 
    (connected DM-01 SH-02)
    (= (road-length DM-01 SH-02) 1) ; 
    (connected WS-01 WS-02)
    (= (road-length WS-01 WS-02) 1) ; 
    (connected WS-02 WS-01)
    (= (road-length WS-02 WS-01) 1) ; 
    (connected WS-01 START)
    (= (road-length WS-01 START) 1) ; 
    (connected START WS-01)
    (= (road-length START WS-01) 1) ; 
    (connected WS-01 CB-01)
    (= (road-length WS-01 CB-01) 1) ; 
    (connected CB-01 WS-01)
    (= (road-length CB-01 WS-01) 1) ; 
    (connected WS-01 DM-01)
    (= (road-length WS-01 DM-01) 1) ; 
    (connected DM-01 WS-01)
    (= (road-length DM-01 WS-01) 1) ; 
    (connected WS-02 START)
    (= (road-length WS-02 START) 1) ; 
    (connected START WS-02)
    (= (road-length START WS-02) 1) ; 
    (connected WS-02 CB-01)
    (= (road-length WS-02 CB-01) 1) ; 
    (connected CB-01 WS-02)
    (= (road-length CB-01 WS-02) 1) ; 
    (connected WS-02 DM-01)
    (= (road-length WS-02 DM-01) 1) ; 
    (connected DM-01 WS-02)
    (= (road-length DM-01 WS-02) 1) ; 
    (connected START CB-01)
    (= (road-length START CB-01) 1) ; 
    (connected CB-01 START)
    (= (road-length CB-01 START) 1) ; 
    (connected START DM-01)
    (= (road-length START DM-01) 1) ; 
    (connected DM-01 START)
    (= (road-length DM-01 START) 1) ; 
    (connected CB-01 DM-01)
    (= (road-length CB-01 DM-01) 1) ; 
    (connected DM-01 CB-01)
    (= (road-length DM-01 CB-01) 1) ; 


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
