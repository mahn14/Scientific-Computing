%% Problem 16: Secant Method

% a.)
f = @(x) x.^3 + 4*x.^2 - 10;
tol = 10^(-12);
nmax = 10000;
niter = 1;
x0 = 1.5; x1 = 1.4;

[zero, res, niter] = secant(f, x0, x1, tol, nmax);