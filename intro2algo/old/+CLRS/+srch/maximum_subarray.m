function [low, high, max_sum] = maximum_subarray(a)
    n = length(a);
    max_sum = -Inf;
    ending_here_sum = -Inf;
    for j = 1:n
        ending_here_high = j;
        if ending_here_sum > 0
            ending_here_sum = ending_here_sum + a(j);
        else
            ending_here_low = j;
            ending_here_sum = a(j);
        end
        if ending_here_sum > max_sum
            [low, high, max_sum] = ...
                deal(ending_here_low, ending_here_high, ending_here_sum);
        end
    end
end
