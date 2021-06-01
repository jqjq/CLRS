classdef IntervalTree < CLRS.ds.RBTree
    methods
        function x = search_open(obj, i)

        end

        function x = search_exactly(obj, i)

        end

        function x = search_min(obj, i)
            x = obj.search_min_aux(obj.root, i);
        end

        function x = search_min_aux(obj, x, i)
            if x.left ~= obj.nil && x.left.max >= i.low
                y = obj.search_min_aux(x.left, i);
                if y ~= obj.nil
                    x = y;
                elseif ~i.overlap(x.int)
                    x = obj.nil;
                end
            elseif ~i.overlap(x.int)
                x = search_min_aux(x.right, i);
            end
        end

        function x = search_all(obj, i)

        end

        function x = search_exactly(obj, i)

        end
    end
end
