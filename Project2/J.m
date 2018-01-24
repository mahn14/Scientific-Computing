function f = J(t, x, y, z)

r = sqrt(x.^2 + y.^2 + z.^2);
f(1) = 2.*x.*r;
f(2) = 2.*y.*r;
f(3) = 2.*z.*r;

return