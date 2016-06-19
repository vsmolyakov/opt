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

**De-blurring**

Many computer vision tasks can be formulated as an optimization program. For example, given a blur kernel D and the blurred image G, we can formulate a constrained least squares problem solved using an optimization toolbox in Matlab.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/blur_merged.png"/>
</p>

The figure above shows the original, the blurred, and the deblurred images. We can see that the deblurred image closely resembles the original. Similar optimization programs can be formulated for image in-painting and denoising.

References:  
*D. Zoran and Y. Weiss, "From Learning Models of Natural Image Patches to Whole Image Restoration", ICCV 2011.*

 
### Dependencies

Matlab 2014a  
CVX 2.1  
