%% Homework 3 %%

% 9. 
load('I_512_1.mat');
load('J_512_1.mat');
load('V_512_1.mat');

S = sparse(I, J, V);

% finding size of vector/matrix
size(V);
size(S);

% number of nonzero entries
nnz(S);

% memory used
length(V)*3*8;
nnz(S)*3*8;

% values
S(77690, 3170);
S(53700, 53187);


% 10.

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
[m, n] = size(B);

    % a.) LU Factorization
tmp = lugauss(B);
L = eye(m) + tril(tmp, -1);
U = triu(tmp);
b = [5, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0]';
y = L\b;
x = U\y;
    
    % b.) LU Partial Pivoting
[L, U, P] = lu(B);
max(max(abs(L*U - P*A)));
y = L\(P*b);
x = U\y;
    
    % c.) LU Total Pivoting
[L, U, P, Q] = lu(sparse(B));
max(max(abs(L*U - P*B*Q)));
y = L\(P*b);
xstar = U\y;
x = Q*xstar;
    
    % d.) Cholesky
U = chol(B);
L = U';
y = U'\b;
x = U\y;
    



