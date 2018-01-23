f = @(t, y, a, b) a.*sin(y) + b.*exp(-t/2);
Nh = 25;
tspan = [0, 1];
y0 = 1;
a=2; b=5;

[t3, u3] = ode_rk33(f, tspan, y0, Nh, a, b);
[t4, u4] = ode_rk4_classic(f, tspan, y0, Nh, a, b);

yconds = [1, 1]; y3_bc = [6.682941969615793e+00 u3' 1.065720569935482e+00];
S3_info = csape(t3, y3_bc, yconds);
Sy = @(t) ppval(S3_info, t3);
yy = Sy(0.55);
