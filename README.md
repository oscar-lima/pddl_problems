pddl problems
===

This basic PDDL problems will help you to get introduced with planning.

to run the planners do:

1. Install ff famous planner

        sudo apt-get install ros-kinetic-ffha

2. make a plan:

        cd cleaning_robot
        rosrun ffha ffha -o domain.pddl -f problems/p01.pddl

3. play around with the domains, modify them, create new problem instances, etc.
