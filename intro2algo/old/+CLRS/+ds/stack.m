classdef stack < handle
    properties
        top = 0
        data
    end
    methods
        function s = stack(n)
            s.data = zeros(1, n);
        end
        function v = empty(s)
            if s.top == 0
                v = true;
            else
                v = false;
            end
        end
        function push(s, x)
            s.top = s.top + 1;
            s.data(s.top) = x;
        end
        function x = pop(s)
            if s.empty()
                throw(MException('MATLAB:stack','underflow'))
            else
                s.top = s.top - 1;
            end
            x = s.data(s.top+1);
        end
    end
end
