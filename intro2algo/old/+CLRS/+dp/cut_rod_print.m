function cut_rod_print(p, n)
    [~, s] = cut_rod(p, n);
    while n > 0
        fprintf('%d ', s(n));
        n = n - s(n);
    end
end

function [r, s] = cut_rod(p, n)
    r = zeros(1, n);
    s = zeros(1, n);
    for j = 1:n
        q = p(j);
        s(j) = j;
        for i= 1:j-1
            if q < p(i) + r(j-i)
                q = p(i) + r(j-i);
                s(j) = i;
            end
        end
        r(j) = q;
    end
end
