%% Problem 4: Jacobian, Broyden, Newton

%a.) f(x0) = 0 on Word docx
%b.) J(x) on Word docx
%c.) Implement fun_Qp and fun_QpJ

%d.) Use Broyden's method to approximate Q1, Q2, Q3, p

gam = 9790;
z = [-19; -7; 2];
c = [3.7220; 64.5452; 21.2734];

x0 = [1;1;1;1*10^5];
B0 = eye(4,4);
tol = 10^(-8);
nmax = 200;

[x_d, res_d, niter_d, err_d, B_d] = broyden(@fun_Qp, B0, x0, tol, nmax, gam, c, z);

%e.) Use Newton's method to approximate Q1, Q2, Q3, p

[x_e, res_e, niter_e] = newtonsys(@fun_Qp, @fun_QpJ, x0, tol, nmax, gam, c, z);

