classdef dllist < handle
    properties
        head = 0
    end
    methods
        function x = search(l, k)
            x = l.head;
            while x ~= 0 && x.key ~= k
                x = x.next;
            end
        end
        function insert(l, x)
            x.next = l.head;
            if l.head ~= 0
                l.head.prev = x;
            end
            l.head = x;
            x.prev = 0;
        end
        function delete(l, x)
            if x.prev ~= 0
                x.prev.next = x.next;
            else
                l.head = x.next;
            end
            if x.next ~= 0
                x.next.prev = x.prev;
            end
        end
    end
end
