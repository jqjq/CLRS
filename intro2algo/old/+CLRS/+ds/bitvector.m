classdef bitvector < handle  
    properties
        array = uint64(0)
    end

    methods
        function x = search(obj, k)
            x = bitget(obj.array, k);
        end

        function insert(obj, k)
            obj.array = bitset(obj.array, k);
        end

        function delete(obj, k)
            obj.array = bitset(obj.array, k, 0);
        end
    end
end
