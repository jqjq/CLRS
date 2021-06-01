function [b, c] = lcs(x, y)
    m = length(x);
    n = length(y);
    b = repmat('x', m, n);
    c = zeros(m+1, n+1);
    for i = 1:m
        for j = 1:n
            if x(i) == y(j)
                c(i+1,j+1) = c(i, j) + 1;
                b(i, j) = '\';
            elseif c(i,j+1) >= c(i+1,j)
                c(i+1,j+1) = c(i,j + 1);
                b(i, j) = '|';
            else
                c(i+1,j+1) = c(i+1,j);
                b(i, j) = '-';
            end
        end
    end
end
