function s = random_sample(m, n)
    if m == 0
        s = [];
    else
        s = rndm.random_sample(m-1, n-1);
        i = randi([1, n]);
        if ismember(i, s)
            s = [s n];
        else
            s = [s i];
        end
    end
end
