function josephus(n, m)
    import CLRS.ds.OSTree CLRS.ds.Node

    t = OSTree();
    for j = 1:n
        x = Node(j);
        t.insert(x)
    end
    j = 1;
    for k = n:-1:1
        j = rem(j + m - 2, k) + 1;
        x = t.select(j);
        fprintf('%d ', x.key);
        t.delete(x);
    end
end
