function f = fun42b(t, w)

f = zeros(size(w));

m1 = 5; m2 = 5; k1 = 15; k2 = 15;

f(1)= w(2);
f(2) = (-3*k1*w(1) - k2*w(3)) / (3*m1 + m2);
f(3) = w(4);
f(4) = (-k1*w(1) - k2*w(3) - m1*f(2)) / m2;
return