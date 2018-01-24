function f = halleys(t, w)
f = zeros(size(w));
r = sqrt((w(1))^2 + (w(3))^2 + (w(5))^2);
new = 4*pi^2;
f(1) = w(2);
f(2) = (-new*w(1))/(r^3);
f(3) = w(4);
f(4) = (-new*w(3))/(r^3);
f(5) = w(6);
f(6) = (-new*w(5))/(r^3);
return