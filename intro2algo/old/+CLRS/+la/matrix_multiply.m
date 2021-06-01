function c = matrix_multiply(a, b)
    [arow, acol] = size(a);
    [brow, bcol] = size(b);
    if acol ~= brow
        throw(MException('CLRS:matrix','incompatible dimensions'))
    else
        c = zeros(arow, bcol);
        for i = 1:arow
            for j = 1:bcol
                for k = 1:acol
                    c(i,j) = c(i, j) + a(i,k) * b(k, j);
                end
            end
        end
    end
end
