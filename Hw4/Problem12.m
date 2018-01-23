%% Homework 4: Problem 12

A = [-1/4 1/10 1/10 0 0 0 0 0 0 0 0 0 0 0 0;
1/10 -1/2 0 1/5 1/5 0 0 0 0 0 0 0 0 0 0;
1/10 0 -1/2 0 0 1/5 1/5 0 0 0 0 0 0 0 0;
0 1/5 0 -1 0 0 0 0.4 0.4 0 0 0 0 0 0;
0 1/5 0 0 -1 0 0 0 0 0.4 0.4 0 0 0 0;
0 0 1/5 0 0 -1 0 0 0 0 0 0.4 0.4 0 0;
0 0 1/5 0 0 0 -1 0 0 0 0 0 0 0.4 0.4;
0 0 0 0.4 0 0 0 -2 0 0 0 0 0 0 0;
0 0 0 0.4 0 0 0 0 -2 0 0 0 0 0 0;
0 0 0 0 0.4 0 0 0 0 -2 0 0 0 0 0;
0 0 0 0 0.4 0 0 0 0 0 -2 0 0 0 0;
0 0 0 0 0 0.4 0 0 0 0 0 -2 0 0 0;
0 0 0 0 0 0.4 0 0 0 0 0 0 -2 0 0;
0 0 0 0 0 0 0.4 0 0 0 0 0 0 -2 0;
0 0 0 0 0 0 0.4 0 0 0 0 0 0 0 -2
];
B = -A;
b = [5, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0]';

%.a)
B_s = sparse(B);
memory_B_s = nnz(B_s)*3*8;
size(B);
memory_B = 15*15*8;

[I, J, V] = find(B_s);


%b.) Cholesky, Incomplete Cholesky
    
    %Cholesky
U = chol(B);
L = U';
[s1, s2] = size(L);
memory_L = s1*s2*8;

options = struct('type','ict','droptol',1e-02,'michol','off');
Li = ichol(B_s, options)'; %upper triangular??
memory_Li = nnz(Li)*3*8;

%c.) PCG without preconditioner
tol_c = 10^(-12); maxit_c = 2;
[x_c, flag_c, relres_c, iter_c] = pcg(B, b, tol_c, maxit_c);
%d.)
tol_d = 10^(-12); maxit_d = 100;
[x_d, flag_d, relres_d, iter_d] = pcg(B,b,tol_d,maxit_d);

%e.) PCG with preconditioner
tol_e = 10^(-12); maxit_e = 100;
[x_e, flag_e, relres_e, iter_e] = pcg(B, b, tol_e, maxit_e, Li', Li);


    
