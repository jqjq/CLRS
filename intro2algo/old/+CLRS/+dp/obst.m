function [e, root] = obst(p, q, n)
    e = diag(q);
    w = diag(q);
    root = zeros(n);
    for l = 2:n+1
        for i = 1:n-l+2
            j = i + l - 1;
            e(i, j) = Inf;
            w(i, j) = w(i, j - 1) + p(j-1) + q(j);
            for r = i:j-1
                t = e(i, r) + e(r+1, j) + w(i, j);
                if t < e(i, j)
                    e(i, j) = t;
                    root(i, j - 1) = r;
                end
            end
        end
    end
end
