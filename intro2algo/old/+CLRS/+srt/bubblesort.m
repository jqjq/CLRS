function a = bubblesort(a)
    for i = 1:length(a)-1
        for j = length(a):-1:i+1
            if a(j) < a(j-1)
                [a(j), a(j-1)] = deal(a(j-1), a(j));
            end
        end
    end
end
