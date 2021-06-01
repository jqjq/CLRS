function cut_rod_print_rec(p, n)
    r = -Inf(1, n);
    s = zeros(1, n);
    [val, ~, s] = cut_rod_aux(p, n, r, s);
    fprintf('The optimal value is %d and the cuts are at ', val);
    j = n;
    while j > 0
        fprintf('%d ', s(j));
        j = j - s(j);
    end
end

function [q, r, s] = cut_rod_aux(p, n, r, s)
    if n == 0
        q = 0;
    elseif r(n) >= 0
        q = r(n);
    else
        q = -Inf;
        for i = 1:n
            [val, r, s] = cut_rod_aux(p, n - i, r, s);
            if q < p(i) + val
                q = p(i) + val;
                s(n) = i;
            end
        end
        r(n) = q;
    end
end
