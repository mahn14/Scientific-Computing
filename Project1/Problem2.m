%% 2. Bisection: Nonlinear Function


% a.) find a zero, alpha, for f(x) in [0.6, 0.8] with bisection
tol = 10^(-15);
nmax = 1000;
[x1, res1, iter1] = bisection(@fun2, 0.6, 0.8, tol, nmax);

x = 0.6:0.01:0.8;
plot(x, fun2(x))


% b.) use the approximate zero to estimate the multiplicity m for the
%     actual zero, alpha

ans_b1 = fun2d(x1);     %returns ~zero, try 2nd derivative
ans_b2 = fun2dd(x1);    %returns ~zero, try 3rd derivative
ans_b3 = fun2ddd(x1);   %return ~ 26, m = 3

% c.) implement modified newton's

% d.) use modified newtons method to find a zero, alpha
tol = 10^(-16);
nmax = 1000;
x0 = 0.75;
m = 3;
[ans_d, res_d, iter_d] = newton_mod(@fun2, @fun2d, x0, tol, m, nmax);