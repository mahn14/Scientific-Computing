%% Problem 21: Implementing and Testing, Jacobian with complex variable

% a.) Implement complex variable method approxJ_compl

% b.) Use approxJ_compl to compute approximate Jf

x0 = [-0.3, 0.05]';
EPS_b = 10^(-1);
a1 = 12.566;
a2 = 0.920;
a3 = 2.718;

Jf = approxJ_compl(@fun, x0, EPS_b, a1, a2, a3);

% c.) Implement newtonsys_approxJ_compl

% d.) 
EPS_d = 10^(-5);
tol_d = 10^(-8);
nmax_d = 100;

[x_d, res_d, niter_d] = newtonsys_approxJ_compl(@fun, x0, EPS_d, tol_d, nmax_d, a1, a2, a3);