function y = fun(x, a1, a2, a3)
y = zeros(size(x));

y(1) = sin(a1*x(1)*x(2)) - 2*x(2) - x(1);
y(2) = a2*(exp(2*x(1)) -exp(1)) + a3*(4*x(2)^2 - 2*x(1));

end