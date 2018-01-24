function f = lagrange_char(x, x_nodes, k, d_order)

if d_order == 0
    x_no_k = [x_nodes(1:k-1), x_nodes(k+1:end)];
    coef = poly(x_no_k);
    phi_k = @(t) polyval(coef, t)/polyval(coef, x_nodes(k));
    f = phi_k(x);
end

if d_order == 1
    x_no_k = [x_nodes(1:k-1), x_nodes(k+1:end)];
    coef = poly(x_no_k);
    phi_k = @(t) polyval(coef, t)/polyval(coef, x_nodes(k));
    coef_d = polyder(coef/polyval(coef, x_nodes(k)));
    phi_kd = @(t) polyval(coef_d, t);
    f = phi_kd(x);
end