function matrix_chain_order_print(s, i, j)
    import la.matrix_chain_order_print

    if i == j
        fprintf('A%d', i);
    else
        fprintf('(');
        matrix_chain_order_print(s, i, s(i,j));
        matrix_chain_order_print(s, s(i,j)+1, j);
        fprintf(')');
    end
end
