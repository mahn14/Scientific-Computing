function f = fun42a(t, x1, x1d, x2, x2d)

f = [0 0]';
m1 = 5; m2 = 5;
k1 = 15; k2 = 15;

f(1) = (-3*k1.*x1(t) - k2.*x2(t)) / (3*m1 + m2);
f(2) = (-k1.*x1(t) - k2.*x2(t) - m1.*f(1)) / m2;
return