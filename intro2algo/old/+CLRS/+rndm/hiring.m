function cost = hiring(a)
    best = -Inf;
    cost = 0;
    for i = 1:length(a)
        if a(i) > best
            best = a(i);
            cost = cost + 1;
        end
    end
end
