function f = fun1(x, a1, a2, a3, a4)

f = x.^3 - (a1 - exp(a2.*x)).*x.^2 + a3.*x - a4;

end