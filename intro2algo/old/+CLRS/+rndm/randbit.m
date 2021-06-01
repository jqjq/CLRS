function x = randbit()
    while true
        x = biased_randbit();
        y = biased_randbit();
        if x ~= y
            return
        end
    end
end

function bit = biased_randbit()
    bit = logical(randi([0, 2]));
end
