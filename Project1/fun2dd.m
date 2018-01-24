function f = fun2dd(x)

f = -2*pi^2 .* (x.^2 - sqrt(2).*x + 1/2) .* sin(sqrt(2)*pi.*x) + ...
    2.*sin(sqrt(2)*pi.*x) + 2*sqrt(2)*pi.*(2.*x - sqrt(2)) .* ...
    cos(sqrt(2) *pi.*x);

end