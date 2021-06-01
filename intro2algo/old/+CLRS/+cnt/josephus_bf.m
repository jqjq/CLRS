function josephus_bf(n, m)
    import CLRS.ds.OSTree CLRS.ds.Node

    dummy = Node;
    x = dummy;
    for j = 1:n
        x.next = Node(j);
        x.next.prev = x;
        x = x.next;
    end
    x.next = dummy.next;
    x.next.prev = x;
    for k = 1:n
        for i = 1:m
            x = x.next;
        end
        fprintf('%d ', x.key);
        x.prev.next = x.next;
        x.next.prev = x.prev;
    end
end
