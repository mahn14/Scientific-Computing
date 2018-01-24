%% Problem 5

%a.) write the vector function and implement fun_gravity_flow, fun_gravity_flow_J

%b.) Compute f(theta0) and J(theta0)
g = 32.16;
X = 2;
Del_y = 0.2;
v = zeros(20,1);
for n = 1:20
    v(n) = sqrt(2*g*n*Del_y);
end
theta0 = (1:20)';

f = fun_gravity_flow(theta0, v, X, Del_y);
J = fun_gravity_flow_J(theta0, v, X, Del_y);

%c.) Use Newton's method to solve this nonlinear system
theta0 = ones(20, 1);
tol = 10^(-12);
nmax = 200;

[x_c, res_c, niter_c] = newtonsys_approxJ_compl(@fun_gravity_flow, theta0, ...
    10^(-5), tol, nmax, v, X, Del_y);


%d.) Broyden's method

g = 32.16; X = 2.1; Del_y = 0.25;
for i = 1:20
    v(i) = sqrt(2*g*((n+1)/n) * Del_y);
end

theta0 = ones(20,1); tol = 10^(-12); nmax = 200;
B0 = approxJ_compl(@fun_gravity_flow, theta0, 10^(-5), v, X, Del_y);

[x_d, res_d, niter_d, err_d, B_d] = broyden(@fun_gravity_flow, B0, theta0, tol, nmax, v, X, Del_y);






