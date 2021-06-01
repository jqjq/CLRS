function m = matrix_chain_order_bf(p, i, j)
    if i == j
        m = 0;
    else
        m = Inf;
        for k = i:j-1
            q = la.matrix_chain_order_bf(p, i, k) + ...
                la.matrix_chain_order_bf(p, k+1, j) + ...
                p(i) * p(k+1) * p(j+1);
            if q < m
                m = q;
            end
        end
    end
end
