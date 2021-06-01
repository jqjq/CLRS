function b = permute_cyclic(a)
    n = length(a);
    b = zeros(1, n);
    offset = randi([1, n]);
    for i = 1:n
        dest = i + offset;
        if dest > n
            dest = dest - n;
        end
        b(dest) = a(i);
    end
end
