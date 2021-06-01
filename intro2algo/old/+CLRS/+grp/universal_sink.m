function i = universal_sink(g)
    i = 1;
    j = 1;
    while i <= g.vsize && j <= g.vsize
        if g.adj(i, j) == 1
            i = i + 1;
        else
            j = j + 1;
        end
    end
    if i > g.vsize || ~is_sink(g, i)
        i = 0;
    end
end

function val = is_sink(g, k)
    for j = 1:g.vsize
        if g.adj(k, j) == 1
            val = false;
            return
        end
    end
    for i = 1:g.vsize
        if g.adj(i, k) == 0 && i ~= k
            val = false;
            return
        end
    end
    val = true;
end
