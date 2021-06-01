function mid = binary_search(a, v, low, high)
    while low <= high
        mid = fix((low+high)/2);
        if v == a(mid)
            return
        elseif v > a(mid)
            low = mid + 1;
        else
            high = mid - 1;
        end
    end
    mid = 0;
end
