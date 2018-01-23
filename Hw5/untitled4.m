dog = @(x) x.^3 + 4*x.^2 - 10;
a = 1; b = 2; tol = 10^(-10); nmax = 1000;
[zero, res, niter] = bisection(dog, a, b, tol, nmax)