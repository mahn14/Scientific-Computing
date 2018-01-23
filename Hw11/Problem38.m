%% Problem 38

fun_c = @(x) cos(x.^2);
fun_d = @(x) exp(-sin(x.^2)) + cos(x);
a = 0; b = pi;
M = 50; n_s = 3;
integrand = @(x, y) exp(-sin(x.^2 / 10) - y.^2 / 2);

a1 = 2.35;
a2 = 2.85;

int_val = quadrature_comp(@quad_2D_on_y_variable, a, a1, M, ...
    @quadrature_GL, n_s, ...
    integrand, fun_c, fun_d, M, @quadrature_GL, n_s);

int_val = int_val + quadrature_comp(@quad_2D_on_y_variable, a1, a2, M, ...
    @quadrature_GL, n_s, ...
    integrand, fun_c, fun_d, M, @quadrature_GL, n_s);

int_val = int_val + quadrature_comp(@quad_2D_on_y_variable, a2, b, M, ...
    @quadrature_GL, n_s, ...
    integrand, fun_c, fun_d, M, @quadrature_GL, n_s);