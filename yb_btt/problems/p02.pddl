; a simple BTT problem with 1 robot 3 objects and 3 platforms
(define (problem p02)
  (:domain yb_btt)

  (:objects
   s1 s2 s3 - platform
   c1 c2 c3 - container
   youbot - robot
   o1 o2 o3 - object
  )

  (:init
   (at youbot s3)
   (not (occupied c1))
   (not (occupied c2))
   (not (occupied c3))
   (on o1 s1)
   (on o2 s1)
   (on o3 s2)
  )

  (:goal
    (and (on o1 s3)
         (on o2 s3)
         (on o3 s3)
         (at youbot s2)
    )
  )
)