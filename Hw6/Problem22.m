%% Problem 22: Bryoden's Method

% a.) Implement broyden.m

% b.) Approximating x
nmax = 1000;
a1 = 12.5;
a2 = 0.9;
a3 = 2.7;

x0 = [-0.3, 0.05]';
B0 = eye(2,2);
tol = 10^(-8);

[x_b, res_b, niter_b, err_b, B_b] = broyden(@fun, B0, x0, tol, 2, a1, a2, a3);


% c.) Solve System

EPS = 10^(-7);
x0 = [-0.3, 0.05]';
B0 = approxJ_compl(@fun, x0, EPS, a1, a2, a3);

tol = 10^(-8);
nmax = 100;

[x_c, res_c, niter_c, err_c, B_c] = broyden(@fun, B0, x0, tol, nmax, a1, a2, a3);