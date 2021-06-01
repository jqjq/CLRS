function c = matrix_chain_multiply(a, s, i, j)
    if i == j
        c = a{i};
    else
        c = la.matrix_chain_multiply(a, s, i, s(i,j)) * ...
            la.matrix_chain_multiply(a, s, s(i,j)+1, j);
    end
end
