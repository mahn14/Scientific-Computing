%% 1. Bisection Method
    %find all zeros in [0,1] to f(x) = x^3 - (a1 - exp(a2*x))*x^2 + a3*x - a4

%parameters
tol = 10^(-12);
a1 = 1.4; a2 = -7.9; a3 = 0.51; a4 = 0.05;
nmax = 1000;

%plotting find estimates for x0

x = 0:0.01:1;
y1 = fun1(x, a1, a2, a3, a4);
plot(x, y1)
    %getting visual estimates x = 0.2, 0.4, 0.9

[x1, res1, iter1] = bisection(@fun1, 0, 0.3, tol, nmax, a1, a2, a3, a4);
[x2, res2, iter2] = bisection(@fun1, 0.3, 0.5, tol, nmax, a1, a2, a3, a4);
[x3, res3, iter3] = bisection(@fun1, 0.7, 1, tol, nmax, a1, a2, a3, a4);
