function [low, high, max_so_far] = maximum_subarray_bf(a)
    n = length(a);
    max_so_far = -Inf;    
    for l = 1:n
        sum = 0;
        for h = l:n
            sum = sum + a(h);
            if sum > max_so_far
                [low, high, max_so_far] = deal(l, h, sum);
            end
        end
    end
end
