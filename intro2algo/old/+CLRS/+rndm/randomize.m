function a = randomize(a)
    n = length(a);
    for i = 1:n
        j = randi([i, n]);
        [a(i), a(j)] = deal(a(j), a(i));
    end
end
