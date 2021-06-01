classdef OSTree < CLRS.ds.RBTree
    methods
        function obj = OSTree()
            import CLRS.ds.Node

            obj.nil = Node();
            obj.nil.color = 1; % 1 = black, 0 = red
            obj.nil.size = 0;
            obj.root = obj.nil;
        end

        function insert(obj, z)
            y = obj.nil;
            x = obj.root;
            while x ~= obj.nil
                x.size = x.size + 1;
                y = x;
                if z.key < x.key
                    x = x.left;
                else
                    x = x.right;
                end
            end
            z.parent = y;
            if y == obj.nil
                obj.root = z;
            elseif z.key < y.key
                y.left = z;
            else
                y.right = z;
            end
            z.left = obj.nil;
            z.right = obj.nil;
            z.color = 0;
            z.size = 1;
            obj.insert_fix(z);
        end

        function delete(obj, z)
            y = z;
            y_original_color = y.color;
            if z.left == obj.nil
                x = z.right;
                obj.transplant(z, z.right);
            elseif z.right == obj.nil
                x = z.left;
                obj.transplant(z, z.left);
            else
                y = obj.minimum(z.right);
                y_original_color = y.color;
                x = y.right;
                if y.parent == z
                    x.parent = y;
                else
                    obj.transplant(y, y.right);
                    y.right = z.right;
                    y.right.parent = y;
                end
                obj.transplant(z, y);
                y.left = z.left;
                y.left.parent = y;
                y.color = z.color;
                y.size = z.size;
            end
            p = x.parent;
            while p ~= obj.nil
                p.size = p.size - 1;
                p = p.parent;
            end
            if y_original_color == 1
                obj.delete_fixup(x);
            end
        end

        function x = minimum(obj, x)
            while x.left ~= obj.nil
                x = x.left;
            end
        end

        function x = select(obj, i)
            x = obj.root;
            while true
                r = x.left.size + 1;
                if i == r
                    return
                elseif i < r
                    x = x.left;
                else
                    x = x.right;
                    i = i - r;
                end
            end
        end

        function x = select_rec(obj, x, i)
            r = x.left.size + 1;
            if i == r
                return
            elseif i < r
                x = obj.select_rec(x.left, i);
            else
                x = obj.select_rec(x.right, i - r);
            end
        end

        function r = rank(obj, x)
            r = x.left.size + 1;
            y = x;
            while y ~= obj.root
                if y == y.parent.right
                    r = r + y.parent.left.size + 1;
                end
                y = y.parent;
            end
        end

        function r = key_rank(obj, x, key)
            if x.key == key
                r = x.left.size + 1;
            elseif x.key > key
                r = obj.key_rank(x.left, key);
            else
                r = obj.key_rank(x.right, key) + x.left.size + 1;
            end
        end

        function x = successor(obj, x, i)
            r = obj.rank(x);
            s = r + i;
            x = obj.select(s);
        end

        function print(obj, node)
            if node == obj.nil
                fprintf('* ');
            else
                fprintf('(');
                obj.print(node.left);
                if node.color == 1
                    fprintf('[%d:%d]', node.key, node.size);
                else
                    fprintf('%d:%d ', node.key, node.size);
                end
                obj.print(node.right);
                fprintf(') ');
            end
        end

        function left_rotate(obj, x)
            y = x.right;
            x.right = y.left;
            if y.left ~= obj.nil
                y.left.parent = x;
            end
            y.parent = x.parent;
            if x.parent == obj.nil
                obj.root = y;
            elseif x == x.parent.left
                x.parent.left = y;
            else
                x.parent.right = y;
            end
            y.left = x;
            x.parent = y;
            y.size = x.size;
            x.size = x.left.size + x.right.size + 1;
        end

        function right_rotate(obj, y)
            x = y.left;
            y.left = x.right;
            if x.right ~= obj.nil
                x.right.parent = y;
            end
            x.parent = y.parent;
            if y.parent == obj.nil
                obj.root = x;
            elseif y == y.parent.left
                y.parent.left = x;
            else
                y.parent.right = x;
            end
            x.right = y;
            y.parent = x;
            x.size = y.size;
            y.size = y.left.size + y.right.size + 1;
        end

        function insert_fix(obj, z)
            while z.parent.color == 0
                if z.parent == z.parent.parent.left
                    y = z.parent.parent.right;
                    if y.color == 0
                        z.parent.color = 1;
                        y.color = 1;
                        z.parent.parent.color = 0;
                        z = z.parent.parent;
                    else
                        if z == z.parent.right
                            z = z.parent;
                            obj.left_rotate(z);
                        end
                        z.parent.color = 1;
                        z.parent.parent.color = 0;
                        obj.right_rotate(z.parent.parent);
                    end
                else
                    y = z.parent.parent.left;
                    if y.color == 0
                        z.parent.color = 1;
                        y.color = 1;
                        z.parent.parent.color = 0;
                        z = z.parent.parent;
                    else
                        if z == z.parent.left
                            z = z.parent;
                            obj.right_rotate(z);
                        end
                        z.parent.color = 1;
                        z.parent.parent.color = 0;
                        obj.left_rotate(z.parent.parent);
                    end
                end
            end
            obj.root.color = 1;
        end
    end
end
