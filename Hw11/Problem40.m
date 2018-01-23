%% Problem 40: parametric functions

%a.) plot parametric curve
a = 1; b = 0.5; c = 0.5;

fun_x = @(t) a*cos(t).*(b + cos(t));
fun_y = @(t) a*sin(t).*(c + cos(t));

axis([-0.5, 2.5, -1.5, 1.5]);
axis equal
t = 0:0.01:2*pi;
plot(fun_x(t), fun_y(t));


%b.) find arc length

x_prime = @(t) -a*b.*sin(t) - 2*a.*sin(t).*cos(t);
y_prime = @(t) a*c.*cos(t) + a.*cos(t).^2 - a.*sin(t).^2;

integrand = @(t) sqrt((x_prime(t)).^2 + (y_prime(t)).^2);
a1 = 0; a2 = 2*pi;

arc_length = quadrature_comp(integrand, a1, a2, 100, ...
    @quadrature_GL, 3)




