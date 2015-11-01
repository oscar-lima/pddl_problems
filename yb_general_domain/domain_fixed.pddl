;; Transport sequential
;;

(define (domain yb_general_domain)
  (:requirements :typing :action-costs)
  (:types
        location
        robot
        object
        gripper
        robot_platform
  )

  (:predicates 
     (at ?r - robot ?l - location)
      (on ?o - object ?l - location)
      (stored ?o - object ?rp - robot_platform)
      (occupied ?rp - robot_platform)
      (holding ?g - gripper ?o - object)
      (gripper_is_free ?g - gripper)
      (empty_object ?o - object)
      (in ?peg - object ?hole - object)
      (heavy ?o)
      (drilled ?o)
      (this_object_can_drill ?drill)
      (insertable ?o)
      (perceived ?l - location)
  )

  (:functions
     (total-cost) - number
  )

  (:action move_base
    :parameters (?source ?destination - location ?r - robot ?g - gripper)
    :precondition (and
        (at ?r ?source)
        (gripper_is_free ?g)
      )
    :effect (and
        (not (at ?r ?source))
        (at ?r ?destination)
        (not (perceived ?source))
        (increase (total-cost) 10)
      )
  )

 (:action perceive
    :parameters (?l - location ?r - robot ?g - gripper)
    :precondition (and
        (at ?r ?l)
        (gripper_is_free ?g)
        (not (perceived ?l))
      )
    :effect (and
        (perceived ?l)
      )
  )

  (:action pick
    :parameters (?o - object ?l - location ?r - robot ?g - gripper)
    :precondition (and
        (on ?o ?l)
        (at ?r ?l)
        (perceived ?l)
        (gripper_is_free ?g)
        (not (heavy ?o))
      )
    :effect (and
        (holding ?g ?o)
        (not (on ?o ?l))
        (not (gripper_is_free ?g))
        (increase (total-cost) 3)
      )
  )

  (:action stage
    :parameters (?o - object ?rp - robot_platform ?g - gripper)
    :precondition (and
        (holding ?g ?o)
        (not (occupied ?rp))
        (not (gripper_is_free ?g))
      )
    :effect (and
        (not (holding ?g ?o))
        (gripper_is_free ?g)
        (stored ?o ?rp)
        (occupied ?rp)
        (increase (total-cost) 1)
      )
  )

  (:action unstage
    :parameters (?o - object ?rp - robot_platform ?g - gripper)
    :precondition (and
        (gripper_is_free ?g)
        (stored ?o ?rp)
        (not (holding ?g ?o))
      )
    :effect (and
        (not (gripper_is_free ?g))
        (not (stored ?o ?rp))
        (not (occupied ?rp))
        (holding ?g ?o)
        (increase (total-cost) 1)
      )
  )

  (:action drop_on_platform
    :parameters (?o - object ?l - location ?g - gripper ?r - robot ?rp - robot_platform)
    :precondition (and
        (at ?r ?l)
        (holding ?g ?o)
        (not (stored ?o ?rp))
      )
    :effect (and
        (gripper_is_free ?g)
        (on ?o ?l)
        (not (holding ?g ?o))
        (increase (total-cost) 3)
      )
  )

  (:action insert
    :parameters (?peg ?hole - object ?g - gripper ?r - robot ?l - location)
    :precondition (and
        (at ?r ?l)
        (on ?hole ?l)
        (holding ?g ?peg)
        (empty_object ?hole)
        (not (gripper_is_free ?g))
        (not (in ?peg ?hole))
        (insertable ?peg)
      )
    :effect (and
        (not (holding ?g ?peg))
        (gripper_is_free ?g)
        (in ?peg ?hole)
        (on ?peg ?l)
        (heavy ?peg)
        (heavy ?hole)
        (increase (total-cost) 1)
      )
  )

  (:action drill_object
    :parameters (?o ?drill - object ?l - location ?r - robot ?g - gripper)
    :precondition (and
        (at ?r ?l)
        (holding ?g ?o)
        (on ?drill ?l)
        (this_object_can_drill ?drill)
      )
    :effect (and
        (drilled ?o)
        (increase (total-cost) 1)
      )
  )

)
