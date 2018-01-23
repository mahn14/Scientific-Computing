%Jacobian for vector function vfun

function y = J(x, a1, a2, a3)
n = max(size(x));
y = zeros(n,n);
e = exp(1);

y(1,1) = a1*x(2)*cos(a1*x(1)*x(2)) - 1;

y(1,2) = a1*x(1)*cos(a1*x(1)*x(2)) - 2;

y(2,1) = 2*a2*e^(2*x(1)) - 2*a3;

y(2,2) = 8*a3*x(2);

end