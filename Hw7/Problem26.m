%% Problem 26

x = [-55, -25, -5, 25, 55];
y = [3.7, 3.27, 3.15, 3.47, 3.62];
degree = length(x) - 1;
coef = polyfit(x, y, degree); coef_d = polyder(coef);
P = @(t) polyval(coef, t) - 3.225;
P_d = @(t) polyval(coef_d, t);

% a.) Newton's Method
x0 = -25;
tol = 10^(-12);
nmax_a = 2;
fun = P; fun_d = P_d;

[xs, res, niter] = newton(fun, fun_d, x0, tol, nmax);

%b.) Choosing x0

[xs_b, res_b, niter_b] = newton(fun, fun_d, 0, tol, 1000);
