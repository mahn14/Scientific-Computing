%% Problem 15: Newton's Method

%a.) Function implementation

%b.)
B = 1.5;
a1 = 10;
a2 = 13;
a3 = 8;
a4 = 10;
x = 0:(pi-0)/100:pi;

plot(x, funny(x, B, a1, a2, a3, a4))
title('Problem 15b')
xlabel('x')
ylabel('f')

fun = @funny; dfun = @funnyd;
tol = 10^(-12);
r0 = 1.2;
[zero_b, res_b, niter_b] = newton(fun, dfun, r0, tol, nmax, B, a1, a2, a3, a4);

%c.)
%Uses same B, a1, a2, a3, a4, tol, x

plot(x, funny(x, B, a1, a2, a3, a4))
title('Problem 15c')
xlabel('x')
ylabel('f')

fun = @funny; dfun = @funnyd;
r0 = 0.8;
[zero_c, res_c, niter_c] = newton(fun, dfun, r0, tol, nmax, B, a1, a2, a3, a4);

    