function f = fun_gravity_flow(theta, v, X, Del_y)

f = zeros(20, 1);
    %first 19 elements of f
for n = 1:19
    f(n) = sin(theta(n+1))/v(n+1) - sin(theta(n))/v(n);
end

    %20th element of f
sum = 0;
for i = 1:20
    sum = sum + tan(theta(i));
end
f(20) = Del_y * sum - X;

end