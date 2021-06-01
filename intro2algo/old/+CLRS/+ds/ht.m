classdef ht < handle  
    properties
        flag
        prev
        next
        element
        len
        free = 1
        hash_func
    end

    methods
        function obj = ht(m, hash_func)
            obj.flag = zeros(1, m);
            obj.len = zeros(1, m);
            obj.next = [2:m, 0];
            obj.prev = 0:m-1;
            obj.hash_func = hash_func;
        end

        function x = search(obj, k)
            x = obj.table{k};
        end

        function x = random_key(obj)
            
        end

        function insert(obj, x)
            obj.table{x.key} = x;
        end

        function delete(obj, x)
            obj.table{x.key} = [];
        end
    end
end
