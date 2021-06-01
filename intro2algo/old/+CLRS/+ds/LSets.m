classdef LSets < handle
    properties
        parent
        next
        head
        tail
        weight
    end

    methods
        function obj = LSets(n)
            obj.parent = 1:n;
            obj.next = zeros(1, n);
            obj.head = 1:n;
            obj.tail = 1:n;
            obj.weight = ones(1, n);
        end

        function obj = union(obj, x, y)
            s1 = obj.parent(x);
            s2 = obj.parent(y);
            if s1 ~= s2
                if obj.weight(s1) >= obj.weight(s2)
                    obj.link(s1, s2);
                else
                    obj.link(s2, s1);
                end
            end
        end

        function link(obj, s1, s2)
            ptr = obj.head(s2);
            stop = obj.tail(s2);
            while true
                obj.parent(ptr) = s1;
                if ptr == stop
                    break
                else
                    ptr = obj.next(ptr);
                end
            end
            obj.next(obj.tail(s1)) = obj.head(s2);
            obj.tail(s1) = obj.tail(s2);
            obj.weight(s1) = obj.weight(s1) + obj.weight(s2);
            obj.head(s2) = 0;
            obj.tail(s2) = 0;
            obj.weight(s2) = 0;
        end

        function s = find(obj, x)
            s = obj.parent(x);
        end
    end
end
