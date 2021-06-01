function i = online_hiring(a, k)
    best = max(a(1:k));
    for i = k+1:length(a)
        if a(i) > best
            return
        end
    end
end
