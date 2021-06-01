classdef Graph < handle  
    properties
        adj;
        vsize;
        parent;
        discover;
        finish;
    end

    properties (Access = private)
        color;
        time;
    end

    methods
        function obj = Graph(adj)
            obj.adj = adj;
            obj.vsize = length(adj);
        end

        function new_graph = ctranspose(obj)
            if iscell(obj.adj)
                new_adj = cell(1, obj.vsize);
                for u = 1:obj.vsize
                    for v = obj.adj{u}
                        new_adj{v} = [new_adj{v}, u];
                    end
                end
            else
                new_adj = obj.adj';
            end
            new_graph = grp.Graph(new_adj);
        end

        function dfs(obj)
            obj.color = zeros(1, obj.vsize);
            obj.parent = zeros(1, obj.vsize);
            obj.discover = zeros(1, obj.vsize);
            obj.finish = zeros(1, obj.vsize);
            obj.time = 0;
            for u = 1:obj.vsize
                if obj.color(u) == 0
                    dfs_visit(obj, u);
                end
            end
        end

        function bfs(obj, s)
            obj.color = zeros(1, obj.vsize);
            obj.parent = zeros(1, obj.vsize);
            obj.discover = zeros(1, obj.vsize);
            obj.color(s) = -1;
            queue = zeros(1, obj.vsize);
            queue(1) = s;
            tail = 1;
            head = 0;
            while tail - head > 0
                head = head + 1;
                u = queue(head);
                for v = obj.adj{u}
                    if obj.color(v) == 0
                        obj.color(v) = -1;
                        obj.discover(v) = obj.discover(u) + 1;
                        tail = tail + 1;
                        queue(tail) = v;
                        obj.parent(v) = u;
                    end
                end
                obj.color(u) = 1;
            end
        end

        function print_path(obj, s, v)
            if v == s
                fprintf('%d ', s);
            elseif obj.parent(v) == 0
                disp("no path from " + s + " to " + v + " exists");
            else
                obj.print_path(s, obj.parent(v))
                fprintf('%d ', v);
            end
        end
    end

    methods (Access = private)
        function dfs_visit(obj, u)
            obj.time = obj.time + 1;
            obj.discover(u) = obj.time;
            obj.color(u) = -1;
            for v = obj.adj{u}
                if obj.color(v) == 0
                    obj.parent(v) = u;
                    obj.dfs_visit(v);
                end
            end
            obj.color(u) = 1;
            obj.time = obj.time + 1;
            obj.finish(u) = obj.time;
        end
    end
end
