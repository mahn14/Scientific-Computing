%% Problem 20

% a.) Approximate Jacobian with fd using one point
x0 = [-0.3, 0.05]';
h = 0.001;
a1 = 12.56;
a2 = 0.92;
a3 = 2.72;

J_a = approxJ_fdh(@fun, x0, h, a1, a2, a3);

% b.) Implement newtonsys_approxJ_fdh

% c.) Solve nonlinear system

tol = 10^(-8);
nmax = 100;

[x_c, res_c, niter_c] = newtonsys_approxJ_fdh(@fun, x0, h, tol, nmax, a1, a2, a3);
