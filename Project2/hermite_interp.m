function H = hermite_interp(z, x, y, ty, d_order)

n = length(x);
H = 0;
if d_order == 0
    for i = 1:n
        A(i) = (1 - 2*(z - x(i)) * lagrange_char(x(i), x, i, 1)) * lagrange_char(z, x, i, 0)^2;
        B(i) = (z - x(i)) * lagrange_char(z, x, i, 0)^2;
        H = H + y(i)*A(i) + ty(i)*B(i);
    end
end
if d_order == 1
    for i = 1:n
        A(i) = -2*lagrange_char(x(i), x, i, 1)*lagrange_char(z, x, i, 0)^2 + ...
            (1-2*(z-x(i))*lagrange_char(x(i), x, i, 1))*2*lagrange_char(z, x, i, 0)*lagrange_char(z, x, i, 1);
        B(i) = lagrange_char(z, x, i, 0)^2 + (z - x(i))*2*lagrange_char(z, x, i, 0)*lagrange_char(z, x, i, 1);
        H = H + y(i)*A(i) + ty(i)*B(i);
    end
end
