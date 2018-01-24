function f = fun2ddd(x)

f = -2*sqrt(2)*pi^3 .* (x.^2 - sqrt(2).*x + 1/2) .* cos(sqrt(2)*pi.*x) - ... 
    6*pi^2 .* (2.*x - sqrt(2)) .* sin(sqrt(2)*pi.*x) + ... 
    6*sqrt(2)*pi.*cos(sqrt(2)*pi.*x);

end