%% Problem 17: Secant Method- compute negative zero

%visually choosing x0, x1 estimates
f = @(x) cosh(x) + cos(x) - 3;
g = @(x) 0*x;

x = -4:0.01:4;
plot(x, f(x))
hold on
plot(x, g(x))

%setting parameters for secant function
x0 = -1.5;
x1 = -1.6;
tol = 10^(-12);
nmax = 10000;

[zero, res, niter] = secant(f, x0, x1, tol, nmax);