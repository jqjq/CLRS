function [low, high, sum] = maximum_subarray_rec(a, low, high)
    if high == low
        sum = a(low);
        return
    else
        mid = fix((low + high)/2);
        [left_low, left_high, left_sum] = ...
            srch.maximum_subarray(a, low, mid);
        [right_low, right_high, right_sum] = ...
            srch.maximum_subarray(a, mid + 1, high);
        [cross_low, cross_high, cross_sum] = ...
            max_crossing_subarray(a, low, mid, high);
        if left_sum >= right_sum && left_sum >= cross_sum
            [low, high, sum] = deal(left_low, left_high, left_sum);
        elseif right_sum >= left_sum && right_sum >= cross_sum
            [low, high, sum] = deal(right_low, right_high, right_sum);
        else
            [low, high, sum] = deal(cross_low, cross_high, cross_sum);
        end
    end
end

function [max_left, max_right, sum] = ...
    max_crossing_subarray(a, low, mid, high)

    left_sum = -Inf;
    sum = 0;
    for i = mid:-1:low
        sum = sum + a(i);
        if sum > left_sum
            left_sum = sum;
            max_left = i;
        end
    end
    right_sum = -Inf;
    sum = 0;
    for j = mid+1:high
        sum = sum + a(j);
        if sum > right_sum
            right_sum = sum;
            max_right = j;
        end
    end
    sum = left_sum + right_sum;
end
