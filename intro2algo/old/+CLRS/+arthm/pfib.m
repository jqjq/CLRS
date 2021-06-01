function n = pfib(n)
    if n <= 1
        return
    else
        parfor i = 1:2
             a(i) = arthm.pfib(n - i);
        end
        n = a(1) + a(2);
    end
end
