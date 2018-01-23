%Vector function f

function y = vfun(x, a1, a2, a3)
y=zeros(size(x));
e = exp(1);

y(1) = sin(a1*x(1)*x(2)) - 2*x(2) - x(1);
y(2) = a2*(e^(2*x(1)) -e) + a3*(4*x(2)^2 - 2*x(1));

end