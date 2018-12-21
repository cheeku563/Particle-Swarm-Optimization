# Particle-Swarm-Optimization : State of the art

 [pso](https://jamesmccaffrey.wordpress.com/2015/06/09/particle-swarm-optimization- using-python)

* A basic variant of the PSO algorithm works by having a population (called a
   swarm) of candidate solutions (called particles).
 * Swarm means These particles are moved around in the search-space according to a few simple formulae.
 * The movements of the particles are guided by their own best known position in the
   search-space as well as the entire swarm's best known position.
# Requirements
  * MATLAB
  * Python 2.7
  * pyswarm
  
# Goal and Objective
  * To find the optimal values of the given functions with no constraint, and with given constraints boundaries using Particle swarm optimization technique
# Implementation
  * The minimization of the following function ɸ(𝑥1,𝑥2) with 𝜓(𝑥1,𝑥2)≤0 as constraint is executed in the code, 
  you can change the function and its parameters in the code and run the following code
 The following is the code to be run for single constraint optimization.
 ```
 saiky.m
 ```
 The following is the command in python
 ```
 python case2.py
 ```
 no constraint case is executed by running nocon.py file
 
   * The python implementation is done for optimization of ɸ(𝑥1,𝑥2) with 𝜓(𝑥1,𝑥2) and H(x1,x2) as constraints. 
  The following is the command for the pso optimization in python for 2 constraints.
  ```
   python python_pso.py
   ```
