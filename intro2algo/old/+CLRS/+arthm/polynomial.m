function y = polynomial(a, x)
    y = 0;
    for i = length(a):-1:1
        y = a(i) + x * y;
    end
end
