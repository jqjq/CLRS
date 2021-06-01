classdef BTree < handle
    properties
        root
        degree
    end

    methods
        function obj = BTree(degree)
            import CLRS.ds.Node

            obj.degree = degree;
            x = Node();
            x.color = true;
            x.size = 0;
            obj.root = x;
        end

        function print(obj, x)
            fprintf('[')
            if x.color
                for i = 1:x.size
                    fprintf('%c,', x.key(i));
                end
                
            else
                for i = 1:x.size
                    obj.print(x.child(i));
                    fprintf('%c,', x.key(i));
                end
                obj.print(x.child(x.size+1));
            end
            fprintf(']')
        end

        function [x, i] = search(obj, x, k)
            i = 1;
            while i <= x.size && k > x.key(i)
                i = i + 1;
            end
            if i <= x.size && k == x.key(i)
                return
            elseif x.color
                [x, i] = deal(0, 0);
            else
                [x, i] = obj.search(x.child(i), k);
            end
        end

        function insert(obj, k)
            import CLRS.ds.Node

            r = obj.root;
            if r.size == 2*obj.degree - 1
                s = Node();
                obj.root = s;
                s.color = false;
                s.size = 0;
                s.child(1) = r;
                obj.split_child(s, 1);
                obj.insert_nonfull(s, k);
            else
                obj.insert_nonfull(r, k);
            end
        end

        function delete(obj, k)
            r = obj.root;
            obj.delete_nonmin(r, k);
            if ~r.color && r.size == 0
                obj.root = r.child(1);
            end
        end

        function insert_nonfull(obj, x, k)
            i = x.size;
            if x.color
                while i >= 1 && k < x.key(i)
                    x.key(i+1) = x.key(i);
                    i = i - 1;
                end
                x.key(i+1) = k;
                x.size = x.size + 1;
            else
                while i >= 1 && k < x.key(i)
                    i = i - 1;
                end
                i = i + 1;
                if x.child(i).size == 2*obj.degree - 1
                    obj.split_child(x, i);
                    if k > x.key(i)
                        i = i + 1;
                    end
                end
                obj.insert_nonfull(x.child(i), k);
            end
        end

        function k = delete_nonmin(obj, x, k)
            if x.color
                % the key k is in node x and x is a leaf
                if k == Inf
                    i = x.size;
                    k = x.key(i);
                elseif k == -Inf
                    i = 1;
                    k = x.key(1);
                else
                    i = find(x.key == k, 1, 'last');
                end
                x.key(i:x.size-1) = x.key(i+1:x.size);
                x.size = x.size - 1;
            else
                i = x.size;
                while i >= 1 && k < x.key(i)
                    i = i - 1;
                end
                if i >= 1 && k == x.key(i)
                    % the key k is in node x, and x is an internal node
                    y = x.child(i);
                    if y.size >= obj.degree
                        x.key(i) = obj.delete_nonmin(y, Inf);
                    else
                        z = x.child(i+1);
                        if z.size >= obj.degree
                            x.key(i) = obj.delete_nonmin(z, -Inf);
                        else
                            obj.merge_child(x, i);
                            obj.delete_nonmin(y, k);
                        end
                    end
                else
                    % the key k is not present in internal node x
                    i = i + 1;
                    y = x.child(i);
                    if y.size >= obj.degree
                        k = obj.delete_nonmin(y, k);
                    else
                        if i <= x.size && x.child(i+1).size >= obj.degree
                            obj.left_rotate(x, i);
                            k = obj.delete_nonmin(y, k);
                        elseif i > 1 && x.child(i-1).size >= obj.degree
                            obj.right_rotate(x, i-1);
                            k = obj.delete_nonmin(y, k);
                        elseif i <= x.size
                            obj.merge_child(x, i);
                            k = obj.delete_nonmin(y, k);
                        else
                            obj.merge_child(x, i - 1);
                            k = obj.delete_nonmin(x.child(i-1), k);
                        end
                    end
                end
            end
        end

        function split_child(obj, x, i)
            import CLRS.ds.Node

            t = obj.degree;
            z = Node();
            y = x.child(i);
            z.color = y.color;
            z.size = t - 1;
            for j = 1:t-1
                z.key(j) = y.key(j+t);
            end
            if ~y.color
                for j = 1:t
                    z.child(j) = y.child(j+t);
                end
            end
            y.size = obj.t - 1;
            for j = x.size+1:-1:i+1
                x.child(j+1) = x.child(j);
            end
            x.child(i+1) = z;
            for j = x.size:-1:i
                x.key(j+1) = x.key(j);
            end
            x.key(i) = y.key(t);
            x.size = x.size + 1;
        end

        function merge_child(obj, x, i)
            y = x.child(i);
            z = x.child(i+1);
            t = obj.degree;
            y.key(t) = x.key(i);
            y.key(1+t:2*t-1) = z.key(1:t-1);
            if ~y.color
                y.child(1+t:2*t) = z.child(1:t);
            end
            y.size = 2*t - 1;
            x.child(i+1:x.size) = x.child(i+2:x.size+1);
            x.key(i:x.size-1) = x.key(i+1:x.size);
            x.size = x.size - 1;
        end

        function left_rotate(~, x, i)
            y = x.child(i);
            z = x.child(i+1);
            y.size = y.size + 1;
            z.size = z.size - 1;
            y.key(y.size) = x.key(i);
            x.key(i) = z.key(1);
            z.key(1:z.size) = z.key(2:z.size+1);
            if ~y.color
                y.child(y.size+1) = z.child(1);
                z.child(1:z.size+1) = z.child(2:z.size+2);
            end
        end

        function right_rotate(~, x, i)
            y = x.child(i);
            z = x.child(i+1);
            y.size = y.size - 1;
            z.size = z.size + 1;
            z.key(2:z.size) = z.key(1:z.size-1);
            z.key(1) = x.key(i);
            x.key(i) = y.key(y.size+1);
            if ~z.color
                z.child(2:z.size+1) = z.child(1:z.size);
                z.child(1) = y.child(y.size+1);
            end
        end
    end
end
