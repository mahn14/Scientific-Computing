% Problem 3: BVP for steady state Burgers

%% a.) Derive Finite Difference equations

%% b.) Find Jacobian

%% c.) Use Newton and Broyden methods to solve the FD eq

    % BROYDEN
mew = 1; alpha = 0; beta = 1;
f = @(x) -exp(x-2*x^2)*(x*exp(x)*(-1-x+2*x^2) + ... 
    exp(x^2)*(2-5*x-4*x^2 + 4*x^3));
h = 0.01; a = 0; b = 1;
N = (b - a)/h + 1; x = linspace(a, b, N);



c1 = (beta-alpha)/(b-a); c2 = alpha - c1*a;
u0 = c1*x' + c2; EPS = 10^(-5);

B0 = approxJ_compl(@two_point_nonlinear_F, u0, EPS, ...
    x, mew, f, alpha, beta);

tol = 10^(-12); nmax = 100;
[u1, res1, niter1] = broyden(@two_point_nonlinear_F, B0, u0, tol, ...
    nmax, x, mew, f, alpha, beta);

xx = 0.5; i = find(abs(x-xx) <= eps); 
ans_c1 = u1(i);

    % NEWTON
[u2, res2, niter2] = newtonsys_approxJ_compl(@two_point_nonlinear_F, ...
    u0, EPS, tol, nmax, x, mew, f, alpha, beta);
ans_c2 = u2(i);

%% d.) Interpolation

    %1/pi is between index 32 and 33
xx_d = [x(31) x(32) x(33) x(34)];
yy_d = [u2(31) u2(32) u2(33) u2(34)];


ans_d = lagrange_interp(1/pi, xx_d, yy_d, 0);








    
    
    