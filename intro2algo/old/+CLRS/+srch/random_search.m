function i = random_search(a, v)
    n = length(a);
    checked = false(1, n);
    unchecked = n;
    while unchecked > 0
        i = randi([1, n]);
        if checked(i)
            continue
        elseif a(i) == v
            return
        else
            checked(i) = true;
            unchecked = unchecked - 1;
        end
    end
    i = 0;
end
