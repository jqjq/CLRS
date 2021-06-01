classdef Node < handle
    properties
        key
        data
        size
        height
        max
        color

        left
        right
        parent
        child
    end

    methods
        function obj = Node(varargin)
            import CLRS.ds.Node

            if nargin >= 1
                obj.key = varargin{1};
            end
            obj.child = Node.empty;
        end
    end
end
