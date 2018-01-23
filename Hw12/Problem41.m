%% Problem 41

% a.) implement 4-stage Runge-Katta method

% b.)
f = @(t, y, a, b) a.*sin(y) + b.*exp(-t/2);
Nh = 25;
tspan = [0, 1];
y0 = 1;
a=1; b=1;

[t3, u3] = ode_rk33(f, tspan, y0, Nh, a, b);
[t4, u4] = ode_rk4_classic(f, tspan, y0, Nh, a, b);

tt = 0.28; 
i3 = find(abs(t3 - tt) <= eps);
i4 = find(abs(t4 - tt) <= eps);
u3(i3);
u4(i4);

tt = 0.76; 
i3 = find(abs(t3 - tt) <= eps);
i4 = find(abs(t4 - tt) <= eps);
u3(i3);
u4(i4);

tt = 1.00; 
i3 = find(abs(t3 - tt) <= eps);
i4 = find(abs(t4 - tt) <= eps);
u3(i3);
u4(i4);

% c.) 
a = 2; b = 5;
[t3, u3] = ode_rk33(f, tspan, y0, Nh, a, b);
[t4, u4] = ode_rk4_classic(f, tspan, y0, Nh, a, b);

tt = [0.28, 0.76, 1.00];
i3 = []; i4 = [];
ans3 = []; ans4 = [];
for i = 1:3
    i3(i) = find(abs(t3 - tt(i)) <= eps);
    i4(i) = find(abs(t4 - tt(i)) <= eps);
    ans3c(i) = u3(i3(i));
    ans4c(i) = u4(i4(i));
end

% d.)
rk30 = f(0, 1, a, b);
rk40 = f(0, 1, a, b);
rk31 = f(1, ans3c(3), a, b);
rk41 = f(1, ans4c(3), a, b);

% e.)
yconds = [1, 1]; y3_bc = [rk30 u3' rk31];
S3_info = csape(t3, y3_bc, yconds);
Sy3 = @(t) ppval(S3_info, t3);

yconds = [1, 1]; y4_bc = [rk40 u4' rk41];
S4_info = csape(t4, y4_bc, yconds);
Sy4 = @(t) ppval(S4_info, t4);


% f.)
A = quadrature_comp(Sy3, 0, 1, 25, ...
    @quadrature_GL, 3);
B = quadrature_comp(Sy4, 0, 1, 25, ...
    @quadrature_GL, 3);
A = A-1;
B = B-1;


% g.)
yconds = [1 1];
bc3 = [rk30 u3' rk31];
S_info3 = csape(t3, bc3, yconds);
Sy3 = @(t3) ppval(S_info3, t3);

fun3 = @(t3) sqrt(1 + Sy3(t3).^2);

arclength3 = quadrature_comp(fun3, 0, 1, 25, ...
    @quadrature_GL, 3);

        %%%%%%%%%%
yconds = [1 1];
bc4 = [rk40 u3' rk41];
S_info4 = csape(t4, bc4, yconds);
Sy4 = @(t4) ppval(S_info4, t4);

fun4 = @(t4) sqrt(1 + (Sy4(t4)).^2);

arclength4 = quadrature_comp(fun4, 0, 1, 25, ...
    @quadrature_GL, 3);



