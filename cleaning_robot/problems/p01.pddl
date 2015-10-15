(define (problem p01)
	
  (:domain cleaning_robot)

  (:objects 
  	ghost - robot
  	locA locB - location
  
  )

  (:init 
  	(at ghost locA)
  	(not(clean locA))
  	(not(clean locB))
  	
  ) 

  (:goal
  	(  at ghost locB
    )
  )
 )
