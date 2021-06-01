function cost = random_hiring(a)
    a = random.randomize(a);
    best = -Inf;
    cost = 0;
    for i = 1:length(a)
        if a(i) > best
            best = a(i);
            cost = cost + 1;
        end
    end
end
