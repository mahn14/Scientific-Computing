%% Problem 37

g1 = @(x) cos(x.^2);
g2 = @(x) exp(-sin(x.^2)) + cos(x);

F = @(x) g1(x) - g2(x);
dF = @(x) -2.*x.*sin(x.^2) + exp(-sin(x.^2))*cos(x.^2)*(2.*x) + sin(x);

x = 0:0.01:pi;

x0 = 2.35; tol = 10^(-12); nmax = 100;
[a1, res1, niter1] = newton(F, dF, x0, tol, nmax);
x0 = 2.85; tol = 10^(-12); nmax = 100;
[a2, res2, niter2] = newton(F, dF, x0, tol, nmax);

F = @(x) g2(x) - g1(x);
Area = 0; M = 50;
a = 0; b = pi;
n_s = 3;
Area = Area + quadrature_comp(F, a, a1, M, @quadrature_GL, n_s);
Area = Area + quadrature_comp(F, a1, a2, M, @quadrature_GL, n_s);
Area = Area + quadrature_comp(F, a2, b, M, @quadrature_GL, n_s);

x = 0:0.001:pi; g1 = cos(x.^2);
g2 = exp(-sin(x.^2))+cos(x);
plot(x, g1 - g2)