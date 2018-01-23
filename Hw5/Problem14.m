%% Problem 14

%a.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FUNCTION IMPLEMENTATION


%b.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PLOT +BISECTION METHOD

% Plotting f(x) from x = [0, pi]
B = 0;
a1 = 10;
a2 = 13;
a3 = 8;
a4 = 10;
x = 0:(pi - 0)/100:pi;
plot(x, funny(x, B, a1, a2, a3, a4));
title('Problem 14b: Graph')
xlabel('x = 0:01:pi')
ylabel('f')

% Choosing interval a,b for alpha \in [a,b] s.t. f(alpha) = 0 for bisection

a = 0; b = 1; tol = 10^(-12); nmax = 1000;
[zero_b, res_b, niter_b] = bisection(@funny, a, b, tol, nmax, B, a1, a2, a3, a4);


%c.) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~a

B = 0;
a1 = 9;
a2 = 12;
a3 = 9;
a4 = 9;
x = 0:0.01:pi;
plot(x, funny(x, B, a1, a2, a3, a4));
title('Problem 14c: Graph')
xlabel('x = 0:01:pi')
ylabel('f')

% Choosing interval a,b for alpha \in [a,b] s.t. f(alpha) = 0 for bisection

a = 0; b = 1; tol = 10^(-12); nmax = 1000;
[zero_c, res_c, niter_c] = bisection(@funny, a, b, tol, nmax, B, a1, a2, a3, a4);




