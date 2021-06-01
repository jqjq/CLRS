classdef dllistx < handle
    properties
        nil
    end
    methods
        function l = dllistx()
            l.nil = ds.dlnode(0);
            l.nil.next = l.nil;
            l.nil.prev = l.nil;
        end
        function x = search(l, k)
            x = l.nil.next;
            while x ~= l.nil && x.key ~= k
                x = x.next;
            end
        end
        function insert(l, x)
            x.next = l.nil.next;
            l.nil.next.prev = x;
            l.nil.next = x;
            x.prev = l.nil;
        end
        function delete(~, x)
            x.prev.next = x.next;
            x.next.prev = x.prev;
        end
    end
end
