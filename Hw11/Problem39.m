%% Problem 39: composite GL for surface area

a = 0; b = 1;
c = 0; d = 1;
n_s = 2;

M = 4;

integrand = @(x,y) sqrt(1 + (x.^2 + y.^2) / (9 - x.^2 - y.^2));

int_val = quadrature_comp(@quad_2D_on_y_fixed, a, b, M, ...
    @quadrature_GL, n_s, ...
    integrand, c, d, M, @quadrature_GL, n_s);

