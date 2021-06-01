classdef BST < handle  
    properties
        root = 0;
    end

    methods
        function obj = BST()
            obj.root = 0;
        end

        function insert(obj, z)
            y = 0;
            x = obj.root;
            while x ~= 0
                y = x;
                if z.key < x.key
                    x = x.left;
                else
                    x = x.right;
                end
            end
            z.parent = y;
            if y == 0
                obj.root = z;
            elseif z.key < y.key
                y.left = z;
            else
                y.right = z;
            end
        end


        
        function x = inorder_walk(obj, x)
        end
    end
end
