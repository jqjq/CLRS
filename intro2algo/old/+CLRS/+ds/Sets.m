classdef Sets < handle
    properties
        parent
        rank
    end

    methods
        function obj = Sets(n)
            obj.parent = 1:n;
            obj.rank = zeros(1, n);
        end

        function obj = union(obj, x, y)
            obj.link(obj.find(x), obj.find(y));
        end

        function link(obj, x, y)
            if obj.rank(x) > obj.rank(y)
                obj.parent(y) = x;
            else
                obj.parent(x) = y;
                if obj.rank(x) == obj.rank(y)
                    obj.rank(y) = obj.rank(y) + 1;
                end
            end
        end

        function p = find(obj, x)
            if x ~= obj.parent(x)
                obj.parent(x) = obj.find(obj.parent(x));
            end
            p = obj.parent(x);
        end

        function val = same(obj, x, y)
            val = obj.find(x) == obj.find(y);
        end
    end
end
