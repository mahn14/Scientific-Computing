%% Problem 33

%a.) Implement Newton-Cotes formula nodes, closed
%b.) Implement NCC
%c.) Use Formula

n = 5;
B1 = sqrt(2);
B2 = pi;

f1 = quadrature_NCC(@NCC3c, 0, 0.5, n, B1);
f2 = quadrature_NCC(@NCC3c, 0, 0.5, n, B2);