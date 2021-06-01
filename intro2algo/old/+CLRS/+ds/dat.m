classdef dat < handle  
    properties
        table = {};
    end

    methods
        function x = search(obj, k)
            x = obj.table{k};
        end

        function insert(obj, x)
            obj.table{x.key} = x;
        end

        function delete(obj, x)
            obj.table{x.key} = [];
        end

        function x = maximum(obj)
            m = -Inf;
            for i = 1:length(obj.table)
                if ~isempty(obj.table{i}) && obj.table{i}.data > m
                    m = obj.table{i}.data;
                    x = obj.table{i};
                end
            end
        end
    end
end
