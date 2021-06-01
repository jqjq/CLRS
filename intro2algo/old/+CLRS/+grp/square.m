function new_graph = square(g)
    if iscell(g.adj)
        checked = false(g.vsize);
        new_adj = cell(1, g.vsize);
        for u = 1:g.vsize
            for v = g.adj{u}
                if ~checked(u, v)
                    checked(u, v) = true;
                    new_adj{u} = [new_adj{u}, v];
                end
                for x = g.adj{v}
                    if ~checked(u, x)
                        checked(u, x) = true;
                        new_adj{u} = [new_adj{u}, x];
                    end
                end
            end
        end
    else
        new_adj = logical(g.adj^2 + g.adj);
    end
    new_graph = grp.Graph(new_adj);
end
