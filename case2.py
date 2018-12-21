
from pyswarm import pso
from math import *
def optimize(x):
	x1=x[0]
	x2=x[1]
	return exp(-0.2*sqrt(x1+x2))*sin(x1)*cos(1.2*x2)
def constraint(x):
	x1=x[0]
	x2=x[1]
	return [-0.1*((0.4*x1/(4*pi) +0.8)*sin(pi*x1/2)*sin(pi*x2/2)-0.7)]

lb = [0,0]
ub = [4*pi,2*pi]
xopt, fopt = pso(optimize, lb, ub, f_ieqcons=constraint)
print xopt
print fopt
print constraint(xopt)
print 'the position optimum given is:',xopt
print 'the function value at the point:',optimize(xopt)
print 'the constraint value at pso optimum:',constraint(xopt)