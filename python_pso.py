from pyswarm import pso
from math import *
def optimize(x):
	x1=x[0]
	x2=x[1]
	return exp(-0.2*sqrt(x1+x2))*sin(x1)*cos(1.2*x2)
def constraints(x):
	x1=x[0]
	x2=x[1]
	return [-exp(0.012*(x1**2))+1+x2,-0.1*((0.4*x1/(4*pi) +0.8)*sin(pi*x1/2)*sin(pi*x2/2)-0.7)]	

lb = [0,0]
ub = [4*pi,2*pi]

xopt,fopt=pso(optimize, lb, ub,ieqcons=[2], f_ieqcons=constraints,swarmsize=50, omega=1, phip=2, phig=2, maxiter=100, minstep=1e-8,minfunc=1e-8, debug=False)

print 'the postion optimum found is [x1,x2]=',xopt
print 'the minimum of the function: ',fopt
print 'the value of constraint at opt pos:',constraints(xopt)

