from pyswarm import pso
from math import *
def optimize(x):
	x1=x[0]
	x2=x[1]
	return exp(-0.2*sqrt(x1+x2))*sin(x1)*cos(1.2*x2)
def constraint(x):
	x1=x[0]
	x2=x[1]
	return [0]

lb = [0,0]
ub = [4*pi,2*pi]
xopt, fopt = pso(optimize, lb, ub, f_ieqcons=constraint)
print 'the postion optimum found is [x1,x2]=',xopt
print 'the minimum of the function: ',fopt
print 'the value of constraint at opt pos:',constraint(xopt)
