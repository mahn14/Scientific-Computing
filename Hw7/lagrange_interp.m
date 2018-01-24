function p = lagrange_interp(z, x, y, d_order)
%z is data for interp, x and y are data

if d_order == 0
    p = 0;
    for k = 1:length(x)
        p = p + y(k)*lagrange_char(z, x, k, d_order);      
    end
elseif d_order == 1
    p = 0;
    for k = 1:length(x)
        p = p + y(k)*lagrange_char(z, x, k, d_order); 
    end
else
    print('d_order must be 0 or 1')
end

    