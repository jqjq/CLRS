function arr = toposort(g)
    g.dfs();
    arr = [g.finish; 1:g.vsize];
    arr = sortrows(arr')';
    arr = arr(2,:);
end
