%% Problem 19: Modified Newton

% a.) Compute approx Jacobian_fd for nonlinear
        %at x1 with parameters x0, a1, a2, a3

x0 = [-0.31, 0.051]';
x1 = [-0.3, 0.05]';
a1 = 12.56;
a2 = 0.92;
a3 = 2.72;

J_a = approxJ_fd(@fun, x0, x1, a1, a2, a3);

J_a(1,1);
J_a(2,2);


% b.) Modified Newton

tol = 10^(-8);
nmax = 10000;

[x_b, res_b, niter_b] = newtonsys_approxJ_fd(@fun, x0, x1, tol, nmax, a1, a2, a3);
x_b;