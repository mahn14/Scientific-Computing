function f = fun2d(x)

f = sqrt(2)*pi .* (x.^2 - sqrt(2).*x + 1/2) .* ...
    cos(sqrt(2).*pi.*x) + (2.*x - sqrt(2)) .* sin(sqrt(2).*pi.*x);

end