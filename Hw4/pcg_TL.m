function x = pcg_TL(A, b, P, maxit)
x = zeros(max(size(A)), 1);
r = b - A*x;
z = P\r; p = z;
for k = 1:maxit
Ap = A*p;
al = p'*r/(p'*Ap);
x = x + al*p;
r = r - al*Ap;
z = P\r;
bet = (Ap)'*z/((Ap)'*p);
p = z - bet*p;
end