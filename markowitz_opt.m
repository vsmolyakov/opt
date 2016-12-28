%% Markowitz Portfolio Optimization
%
% min x'Sx
% s.t. p'x >= r_min
%      1'x = 1
%      x >= 0
%      sum_{i=1}^{0.1n} x[i] <= alpha
%
% x: portfolio weights
% S: portfolio covariance matrix
% p: mean return vector
% x[i]: ith greatest component in x
%
%% generate data
randn('state',0);
n=25; %number of items
p_mean = randn(n,1);
temp = randn(n,n);
sig = temp'*temp;
r = floor(0.1*n);
alpha = 0.8;
r_min = 1;

%% optimization
fprintf('Computing optimal Markowitz portfolio weights...')
cvx_begin
    variable x(n)
    minimize(quad_form(x,sig))
    p_mean'*x >= r_min
    ones(1,n)*x == 1;
    x >= 0;
    sum_largest(x, r) <= alpha;
cvx_end

%% generate plots
figure; bar(x); xlim([0, n]);
title('optimal portfolio weights');






