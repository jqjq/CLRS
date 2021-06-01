function [m, s] = matrix_chain_order(p)
    n = length(p) - 1;
    m = zeros(n);
    s = zeros(n);
    for l = 2:n
        for i = 1:n-l+1
            j = i + l - 1;
            m(i, j) = Inf;
            for k = i:j-1
                q = m(i, k) + m(k+1, j) + p(i)*p(k+1)*p(j+1);
                if q < m(i, j)
                    m(i, j) = q;
                    s(i, j) = k;
                end
            end
        end
    end
end
