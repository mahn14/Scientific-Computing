%% Homework 4: Problem 13

load('I_512_1.mat');
load('J_512_1.mat');
load('b_512_n.mat');
load('V_512_n.mat');

A = sparse(I, J, V);

%a.) Ax=b using GMRES method; preconditioner from incomplete LU factorization

restart = 100; tol = 10e-12; maxit = 5000;
[L,U] = ilu(A,struct('type','nofill','droptol',1e-7));
[x_a, flag_a, relres_a, iter_a] = gmres(A, b, restart, tol, maxit, L, U);


%b.) GMRES without preconditioner
restart = 100; tol = 10e-12; maxit = 5000;
[x_b, flag_b, relres_b, iter_b] = gmres(A, b, restart, tol, maxit);

