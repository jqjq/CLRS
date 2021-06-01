classdef AVLTree < handle
    properties
        root
        nil
    end

    methods
        function obj = AVLTree()
            import ds.Node

            obj.nil = Node();
            obj.nil.height = -1;
            obj.root = obj.nil;
        end

        function insert(obj, z)
            obj.root = obj.insert_aux(obj.root, z);
        end
    end

    methods  (Access = private)
        function x = insert_aux(obj, x, z)
            if x == obj.nil
                z.height = 0;
                z.left = obj.nil;
                z.right = obj.nil;
                x = z;
                return
            elseif z.key < x.key
                y = obj.insert_aux(x.left, z);
                x.left = y;
                x.height = max(x.left.height, x.right.height) + 1;
            else
                y = obj.insert_aux(x.right, z);
                x.right = y;
                x.height = max(x.left.height, x.right.height) + 1;
            end
            x = obj.balance(x);
        end

        function y = left_rotate(~, x)
            y = x.right;
            x.right = y.left;
            y.left = x;
            x.height = max(x.left.height, x.right.height) + 1;
            y.height = max(y.left.height, y.right.height) + 1;
        end

        function x = right_rotate(~, y)
            x = y.left;
            y.left = x.right;
            x.right = y;
            x.height = max(x.left.height, x.right.height) + 1;
            y.height = max(y.left.height, y.right.height) + 1;
        end

        function x = balance(obj, x)
            if abs(x.left.height - x.right.height) <= 1
                return
            elseif x.left.height > x.right.height
                y = x.left;
                if y.left.height < y.right.height
                    x.left = obj.left_rotate(y);
                end
                x = obj.right_rotate(x);
            else
                y = x.right;
                if y.left.height > y.right.height
                    x.right = obj.right_rotate(y);
                end
                x = obj.left_rotate(x);
            end
        end
    end
end
