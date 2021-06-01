classdef RBTree < handle
    properties
        nil
        root
    end

    methods
        function obj = RBTree()
            import CLRS.ds.Node

            obj.nil = Node();
            obj.nil.color = 1; % 1 = black, 0 = red
            obj.root = obj.nil;
        end

        function insert(obj, z)
            y = obj.nil;
            x = obj.root;
            while x ~= obj.nil
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

        function transplant(obj, u, v)
            if u.parent == obj.nil
                obj.root = v;
            elseif u == u.parent.left
                u.parent.left = v;
            else
                u.parent.right = v;
            end
            v.parent = u.parent;
        end

        function delete_fixup(obj, x)
            while x ~= obj.root && x.color == 1
                if x == x.parent.left
                    w = x.parent.right;
                    if w.color == 0
                        w.color = 1;
                        x.parent.color = 0;
                        obj.left_rotate(x.parent);
                        w = x.parent.right;
                    end
                    if w.left.color == 1 && w.right.color == 1
                        w.color = 0;
                        x = x.parent;
                    else
                        if w.right.color == 1
                            w.left.color = 1;
                            w.color = 0;
                            obj.right_rotate(w);
                            w = x.parent.right;
                        end
                        w.color = x.parent.color;
                        x.parent.color = 1;
                        w.right.color = 1;
                        obj.left_rotate(x.parent);
                        return
                    end
                else
                    w = x.parent.left;
                    if w.color == 0
                        w.color = 1;
                        x.parent.color = 0;
                        obj.right_rotate(x.parent);
                        w = x.parent.left;
                    end
                    if w.left.color == 1 && w.right.color == 1
                        w.color = 0;
                        x = x.parent;
                    else
                        if w.left.color == 1
                            w.right.color = 1;
                            w.color = 0;
                            obj.left_rotate(w);
                            w = x.parent.left;
                        end
                        w.color = x.parent.color;
                        x.parent.color = 1;
                        w.left.color = 1;
                        obj.right_rotate(x.parent);
                        return
                    end
                end
            end
            x.color = 1;
        end
    end
end
