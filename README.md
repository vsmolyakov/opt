# opt
Optimization Algorithms

### Description

**Iterative Reweighted Least Squares**

The Iterative Reweighted Least Squares (IRLS) algorithm minimizes a weighted least squares objective function where the weights are updated at every iteration. Here, IRLS is used to fit Bayesian Logistic Regression model.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/irls.png" width = "400" />
</p>

The figure above shows the cumulative MSE of the hyperplane parameter vs IRLS iterations. The IRLS algorithm is derived from Newton's updates by computing the gradient and the Hessian of logistic regression objective in closed form.

References:  
*K. Murphy, "Machine Learning: A Probabilistic Perspective", 2012.*  

**Semidefinite Programming**

Semidefinite programs optimize over semidefinite matrices and have been used to find approximate solutions to combinatorial optimization problems. The figure below shows the optimum SDP matrix for the max cut problem (left) and the stable set problem (right) forPetersen graph.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/sdp_merged.png"/>
</p>

The SDP program finds the maximum stable set of size 4 and the maximum cut of value 12.

References:  
*S. Boyd and L. Vandenberghe, "Convex Optimization", 2004*
 
### Dependencies

Matlab 2014a  
CVX 2.1  
