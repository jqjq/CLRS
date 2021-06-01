function a = randint(a, b)
    diff = b - a;
    digit = fix(log2(diff)) + 1;
    while true
        num = 0;
        for i = 1:digit
            num = 2 * num + randi([0, 1]);
        end
        if num <= diff
            a = a + num;
            return
        end
    end
end
