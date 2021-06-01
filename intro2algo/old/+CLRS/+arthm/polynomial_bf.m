function y = polynomial_bf(a, x)
    y = 0;
    for i = 0:length(a)-1
        y = y + a(i+1) * x ^ i;
    end
end
