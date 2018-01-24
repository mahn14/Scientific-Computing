% Problem 2: Halley's Comet

%% a.) Reduce to IVP of 1st order ODEs
            %in the matlab function halley.m

%% b.) Solve IVP

tspan = [0, 100]; 
w0 = [0.325514 -9.096111 -0.459460 -6.916686 0.166229 -1.305721];
options=odeset('RelTol',1.e-8, 'AbsTol', 1.e-8); %from notes
[t, w] = ode45(@halley, tspan, w0, options);
x = w(:, 1);
y = w(:, 3);
z = w(:, 5);

answer_b = [x(100) y(100) z(100)]';

%% c.) Plot and find closest distance from comet to sun
    
    % Plotting
r = sqrt(x.^2 + y.^2 + z.^2);
%plot(t,r)

    % Finding next closest approach to sun
xd = w(:,2); yd = w(:,4); zd = w(:,6);

r = @(t) sqrt(x(t).^2 + y(t).^2 + z(t).^2);

rd = @(t) (x(t).*xd(t) + y(t).*yd(t) + z(t).*zd(t)) / ...
    sqrt(x(t).^2 + y(t).^2 + z(t).^2);

[zero_c, res_c, niter_c] = secant(rd, 72, 73, 10^(-8), 100);
    
%% d.) Cubic Spline Interpolation

Sx = spline(t, [xd(1) x' xd(end)]);
Sy = spline(t, [yd(1) y' yd(end)]);
Sz = spline(t, [zd(1) z' zd(end)]);


answer_d = [ppval(Sx,50) ppval(Sy,50) ppval(Sz,50)]';

%% e.) Cubic Hermite Interpolation

lala = [4.992357733514915e+01 5.048556299480465e+01 ... 
    5.104754865446017e+01];
[~,c] = ismember(lala, t, 'R2012a');
c;

px = @(a) hermite_interp(a, lala, ... 
    [x(441) x(442) x(443)], [xd(441) xd(442) xd(443)], 0);

py = @(a) hermite_interp(a, lala, ... 
    [y(441) y(442) y(443)], [yd(441) yd(442) yd(443)], 0);

pz = @(a) hermite_interp(a, lala, ... 
    [z(441) z(442) z(443)], [zd(441) zd(442) zd(443)], 0);

answer_e = [px(50) py(50) pz(50)]';


%% f.) Cubic Spline Plot and Integration

    % Plotting
tt = 0:0.01:3;
Syf = @(t) ppval(Sy, t);
yy = Syf(tt);
Szf = @(t) ppval(Sz, t);
zz = Szf(tt);
%plot(tt, yy, 'b', tt, zz, 'r')
%axis([0, 3, -4, 6])

    % Finding intersection of y(t), z(t) interpolants
F = @(t) Syf(t) - Szf(t);
t0 = 0.35; t1 = 0.3;
tol = 10^(-8); nmax = 100;
[zero, res, niter] = secant(F, t0, t1, tol, nmax);

    % Integrate
Area_y1 = quadrature_comp(Syf, 0, zero, 25, @quadrature_GL, 3);
Area_y2 = quadrature_comp(Syf, zero, 3, 25, @quadrature_GL, 3);
Area_z1 = quadrature_comp(Szf, 0, zero, 25, @quadrature_GL, 3);
Area_z2 = quadrature_comp(Szf, zero, 3, 25, @quadrature_GL, 3);

answer_f = (Area_z1 - Area_y1) + (Area_y2 - Area_z2);




