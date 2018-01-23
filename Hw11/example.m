f = @(x) cos(4*pi*x.^2); g = @(x) exp(cos(2*pi*x));
F = @(x) f(x) - g(x);
Fdx = @(x) 2*pi*exp(cos(2*pi*x)).*sin(2*pi*x) - 8*pi*x.*sin(4*pi*x.^2);
x0 = 0.65; tol = 10^(-12); nmax = 100;
[a1,res,niter]=newton(F, Fdx, x0, tol, nmax);
x0 = 0.75; tol = 10^(-12); nmax = 100;
[a2,res,niter]=newton(F, Fdx, x0, tol, nmax);
F = @(x) g(x) - f(x);
a = 0; b = 1;
M = 100; n_s = 2;
Area = 0;
Area = Area + quadrature_comp(F, a, a1, M, @quadrature_GL, n_s)
Area = Area + quadrature_comp(F, a1, a2, M, @quadrature_GL, n_s)
Area = Area + quadrature_comp(F, a2, b, M, @quadrature_GL, n_s)