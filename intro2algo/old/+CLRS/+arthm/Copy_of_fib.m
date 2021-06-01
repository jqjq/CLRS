function n = fib(n)
    if n <= 1
        return
    else
        x = arthm.fib(n - 1);
        y = arthm.fib(n - 2);
        n = x + y;
    end
end
