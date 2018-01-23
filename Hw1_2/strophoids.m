function f = strophoids(x)
a = 0.5;
if x < 0.5
    f = x*sqrt( (a - x) / (a + x) );
end
if x > 0.5
    f = x*sqrt( (x - a) / (a + x) );
end

%(x - a) / (a + x)
%(x^2 - a^2) /(a^2 + 2*a*x + x*2)