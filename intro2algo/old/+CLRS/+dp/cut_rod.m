function [q, r] = cut_rod_alt(p, n, c)
    r = zeros(1, n);
    for j = 1:n
        q = p(j);
        for i= 1:j-1
            q = max(q, p(i)+ r(j - i) - c);
        end
        r(j) = q;
    end
end
