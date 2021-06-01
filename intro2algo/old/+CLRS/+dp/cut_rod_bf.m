function q = cut_rod_bf(p, n)
    if n == 0
        q = 0;
    else
        q = -Inf;
        for i = 1:n
            q = max(q, p(i) + dp.cut_rod_rec(p, n - i));
        end
    end
end
