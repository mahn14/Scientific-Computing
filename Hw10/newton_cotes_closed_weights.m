function w = newton_cotes_closed_weights(a, b, n)
cn = zeros(1, n+1);
if n == 1
    cn(1) = 1/2; 
    cn(2) = cn(1);
elseif n == 2
    cn(1) = 1/6; 
    cn(2) = 4/6;
    cn(3) = cn(1);
elseif n == 3
    cn(1) = 1/8; 
    cn(2) = 3/8;
    cn(3) = cn(2);
    cn(4) = cn(1);
elseif n == 4
    cn(1) = 7/90;
    cn(2) = 16/45;
    cn(3) = 2/15;
    cn(4) = cn(2);
    cn(5) = cn(1);
elseif n == 5
    cn(1) = 19/288;
    cn(2) = 25/96;
    cn(3) = 25/144;
    cn(4) = cn(3);
    cn(5) = cn(2);
    cn(6) = cn(1);
end
w = (b-a)*cn;
return;

    