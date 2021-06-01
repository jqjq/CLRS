function a = shellsort(a)
    n = length(a);
    gap = fix(n/2);
    while gap > 0
        for i = gap+1:n
            j = i - gap;
            while j >= 1 && a(j) > a(j+gap)
                [a(j), a(j+gap)] = deal(a(j+gap), a(j));
                j = j - gap;
            end
        end
        gap = fix(gap/2);
    end
end
