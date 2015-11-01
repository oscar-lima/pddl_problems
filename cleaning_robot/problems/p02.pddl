; this problem definition was automatically generated from rosplan interface
(define (problem cleaning_robot_task)
(:domain cleaning_robot)
(:objects
    locA locB - location
    ghost - robot
)
(:init
    (at ghost locA)
)
(:goal (and
    (clean locA)
    (clean locB)
    (at ghost locA)
)))
