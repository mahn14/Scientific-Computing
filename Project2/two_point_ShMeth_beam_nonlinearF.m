%%
function F = two_point_ShMeth_beam_nonlinearF(y, f_fun, a, b, ...
    b1, b2, b3, b4, Nh, varargin)

F = zeros(size(y));

G = @(x, w) [w(2) w(3) w(4) ... 
    f_fun(x, w(1), w(2), w(3), w(4), varargin{:})]';
xspan = [a, b];

w0 = [b1; b2; y(1); y(2)];
[x, w] = ode_rk33(G, xspan, w0, Nh);
u = w(:,1); ud = w(:,2); udd = w(:,3); uddd = w(:,4);
F(1) = u(end) - b3;
F(2) = ud(end) - b4;

return