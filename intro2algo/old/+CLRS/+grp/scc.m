function sets = scc(g)
    sets = ds.Sets(g.vsize);
    for u = 1:g.vsize
        for v = g.adj{u}
            sets.union(u, v);
        end
    end
end
