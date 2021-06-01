function new_graph = undirect(g)
    checked = false(g.vsize);
    new_adj = cell(1, g.vsize);
    for u = 1:g.vsize
        for i = 1:length(g.adj{u})
            v = g.adj{u}(i);
            if u ~= v && ~checked(u, v)
                checked(u, v) = true;
                checked(v, u) = true;
                new_adj{u} = [new_adj{u}, v];
                new_adj{v} = [new_adj{v}, u];
            end
        end
    end
    new_graph = grp.Graph(new_adj);
end
