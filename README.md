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

**Markowitz Portfolio**

The goal of portfolio optimization is to find optimum portfolio weights that minimize portfolio variance while maximizing portfolio return. The optimum portfolio weights are found through convex programming. 

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/markowitz.png"/>
</p>

The figure above shows the distribution of optimal portfolio weights solved by CVX. 

References:  
*http://cvxr.com/cvx/examples/*

**Simulated Annealing**

Simulated annealing is a stochastic algorithm that attempts to find the global optimum of a function f(x). The method is inspired by statistical physics: the Boltzmann distribution that specifies the probability of being in a particular state as p(x) ~ exp(-f(x)/T). Where f(x) is the energy of the system and T is the temperature. As the system cools, it spends more and more time in its minimum energy (most probable) state.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/sim_annealing/figures/sim_annealing_merged.png"/>
</p>

The figure above shows the function f(x) at two different temperatures (left). As the temperature cools, the largest peaks become larger and the smallest peaks disappear. By cooling according to a schedule it is possible to track the largest peak and therefore find a global optimum. The energy of the system, the cooling temperature and the histogram of accepted samples are shown on the right.

References:  
*K. Murphy, "Machine Learning: A Probabilistic Perspective", 2012.*  

**Bayesian Optimization**

Bayesian Optimization uses a Gaussian Process (GP) to construct a posterior distribution that describes the function you want to optimize. As the number of observations increases, the algorithm becomes more certain of which regions in the parameter space are worth exploring and which are not thus balancing exploration vs exploitation trade-off.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/bayes_opt/figures/bayes_opt_merged.png"/>
</p>

The figure above shows bayesian optimization of F1 score as a function of gamma parameter for SVM RBF kernel (left). We can see that after 7 iterations, we have discovered the gamma parameter that gives the maximum F1 score. The peak of the utility function at the bottom tells us which experiment to perform next. On the right, bayesian optimization is used to maximize F1 score as a function of maximum depth and number of estimators for a random forest classifier. From the heatmap, we can tell that the maximum F1 score is achieved for 158 estimators with depth 10.

References:  
*https://github.com/fmfn/BayesianOptimization*  


**De-blurring**

Many computer vision tasks can be formulated as an optimization program. For example, given a blur kernel D and the blurred image G, we can formulate a constrained least squares problem solved using an optimization toolbox in Matlab.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/blur_merged.png"/>
</p>

The figure above shows the original, the blurred, and the deblurred images. We can see that the deblurred image closely resembles the original. Similar optimization programs can be formulated for image in-painting and denoising.

References:  
*D. Zoran and Y. Weiss, "From Learning Models of Natural Image Patches to Whole Image Restoration", ICCV 2011.*

**Inpainting**

Inpainting removes text and other masked features that do not belong to the original image. The reconstructed image is obtained by minimizing the total variation norm subject to matching of known pixels constraint.

<p align="center">
<img src="https://github.com/vsmolyakov/opt/blob/master/figures/inpainting_merged.png"/>
</p>

The figure above shows the inpainted image on the left and the corrupted image on the right. The SCS solver of CVXPY is able to correctly recover the image.

References:  
*http://www.cvxpy.org/en/latest/examples/index.html*

 
### Dependencies

Matlab 2014a  
CVX 2.1  
Python 2.7  
