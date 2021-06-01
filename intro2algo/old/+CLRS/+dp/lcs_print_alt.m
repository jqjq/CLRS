function lcs_print_alt(c, x, y)
    [i, j] = size(c);
    s = repmat('x', 1, max(i, j));
    p = i;
    while i ~= 1 && j ~= 1
        if x(i-1) == y(j-1)
            s(p) = x(i-1);
            p = p - 1;
            i = i - 1;
            j = j - 1;
        elseif c(i - 1, j) >= c(i, j - 1)
            i = i - 1;
        else
            j = j - 1;
        end
    end
    fprintf(s(p+1:end));
end
