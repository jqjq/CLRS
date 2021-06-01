function q = matrix_chain_order_rec(p)
    n = length(p) - 1;
    m = Inf(n);
    [q, ~] = lookup_chain(m, p, 1, n);
end

function [q, m] = lookup_chain(m, p, i, j)
    if m(i, j) < Inf
        q = m(i, j);
    elseif i == j
        m(i, j) = 0;
        q = 0;
    else
        for k = i:j-1
            [q1, m] = lookup_chain(m, p, i, k);
            [q2, m] = lookup_chain(m, p, k+1, j);
            q = q1 + q2 + p(i)*p(k+1)*p(j+1);
            if q < m(i, j)
                m(i, j) = q;
            end
        end
        q = m(i, j);
    end
end
