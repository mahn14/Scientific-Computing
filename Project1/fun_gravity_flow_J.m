function J = fun_gravity_flow_J(theta, v, X, Del_y)

J = zeros(20, 20);
    %first 19 rows of J
for i = 1:19
    for j = 1:20
        J(i, j) = -cos(theta(j))/v(j) * sign(theta(j));
    end
end
    %20th row of J = 0
for j = 1:20
    J(20, j) = Del_y * (sec(theta(j)))^2;
end

end


