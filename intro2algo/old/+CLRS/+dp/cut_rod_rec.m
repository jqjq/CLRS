function [q, r] = cut_rod_rec(p, n)
    r = -Inf(1, n);
    [q, r] = cut_rod_aux(p, n, r);
end

function [q, r] = cut_rod_aux(p, n, r)
    if n == 0
        q = 0;
    elseif r(n) >= 0
        q = r(n);
    else
        q = -Inf;
        for i = 1:n
            [val, r] = cut_rod_aux(p, n - i, r);
            q = max(q, p(i) + val);
        end
        r(n) = q;
    end
end
