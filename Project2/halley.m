%% 
function f = halley(t, w)

f = zeros(size(w));
r = sqrt(w(1)^2 + w(3)^2 + w(5)^2);
u = 4*pi^2;
f(1) = w(2);
f(2) = -u * w(1) / r^3;
f(3) = w(4);
f(4) = -u*w(3) / r^3;
f(5) = w(6);
f(6) = -u*w(5) / r^3;

return