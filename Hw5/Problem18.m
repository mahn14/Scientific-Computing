%% Problem 18: Nonlinear System of Equations (vfun, Jacobian)

%a, b.) On paper deriving vfun, J
%c.) Implementing vfun, J functions in MATLAB


%d.) computing first two iterations of x(1), x(2) in Newton's Method
e = exp(1);
    %constants
a1 = 4*pi;
a2 = (4*pi - 1)/(4*pi);
a3 = e;
    %params
x0 = [-0.3; 0.05];
f = @vfun;
df = @J;
tol = 10^(-12); %isn't used;
    %1 and 2 iterations
[zero_1, res_1, niter_1] = newtonsys(f, df, x0, tol, 1, a1, a2, a3);
[zero_2, res_2, niter_2] = newtonsys(f, df, x0, tol, 2, a1, a2, a3);

%e.) solving for x(1), x(2) 
e = exp(1);
f = @vfun;
df = @J;
a1 = 4*pi;
a2 = (4*pi - 1)/(4*pi);
a3 = e;
tol = 10^(-8);
nmax = 10000;
[zero, res, niter] = newtonsys(f, df, x0, tol, nmax, a1, a2, a3);








