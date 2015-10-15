#!/usr/bin/env python
import sys

argument1="not_set"

if len(sys.argv) == 1:
    exit("ERROR : No arguments received !\nPLAN USAGE :\n./plan number_of_problem_to_solve\n-----------------------------------\nExample:\n./plan 1\nwhich means : solve problems/p01.pddl")
elif len(sys.argv) == 2:
    argument1 = sys.argv[1]
    try:
        int_arg = int(argument1)
        if int_arg < 10:
            problem_to_solve = "p0" + argument1
        else:
            problem_to_solve = "p" + argument1
        print problem_to_solve
    except:
        print "ERROR : argument should be an integer value, not string"
        pass
else: 
    print "WARNING : the plan function only takes 1 argument, 2 or more have been received : ignoring additional arguments"