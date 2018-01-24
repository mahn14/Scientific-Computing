%% 3. Secant Method


% a.) Use Secant method to compute the zero around 0.9
a1 = 0.1; a2 = 4.2; a3 = -5; a4 = -1;
x0 = 0.8; x1 = 0.9; tol = 10^(-12); nmax = 100;


[zero_a, res_a, niter_a] = secant(@fun3, x0, x1, tol, nmax, a1, a2, a3, a4);


% b.) Use Newton method to compute the zero around 0.9

a1 = 0.2; a2 = 4.5; a3 = -5; a4 = -1;
x0 = 0.9; tol = 10^(-12); nmax = 100;

[zero_b, res_b, niter_b] = newton(@fun3, @fun3d, x0, tol, nmax, a1, a2, a3, a4);

%c.) Discussion in Word docx