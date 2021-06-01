function [invs, a] = inversion(a, p, r)
    invs = 0;
    if p < r
        q = fix((p + r)/2);
        [inv, a] = srt.inversion(a, p, q);
        invs = invs + inv;
        [inv, a] = srt.inversion(a, q+1, r);
        invs = invs + inv;
        [inv, a] = merge(a, p, q, r);
        invs = invs + inv;
    end
end

function [inv, a] = merge(a, p, q, r)
    n1 = q - p + 1;
    left = [a(p:q), Inf];
    right = [a(q+1:r), Inf];
    i = 1;
    j = 1;
    inv = 0;
    for k = p:r
        if right(j) < left(i)
            inv = inv + n1 - i + 1;
            a(k) = right(j);
            j = j + 1;
        else
            a(k) = left(i);
            i = i + 1;
        end
    end
end
