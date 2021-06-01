function lcs_print(b, x, i, j)
    if i == 0 || j == 0
        return
    elseif b(i, j) == '\'
        dp.lcs_print(b, x, i - 1, j - 1);
        fprintf(num2str(x(i)))
    elseif b(i, j) == '|'
        dp.lcs_print(b, x, i - 1, j);
    else
        dp.lcs_print(b, x, i, j - 1);
    end
end
