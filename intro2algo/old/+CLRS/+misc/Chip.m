classdef Chip < handle
    properties (Access = private)
        good = true;
    end

    methods
        function obj = Chip(varargin)
            if nargin == 1
                obj.good = varargin{1};
            end
        end

        function result = test(obj, other)
            if obj.good
                result = other.good;
            else
                result = logical(randi([0, 1]));
            end
        end
    end

    methods (Static)
        function chip = find_good(curr_chips)
            next_chips(length(curr_chips)) = misc.Chip();
            while length(curr_chips) > 1
                next_len = 0;
                for i = 1:2:length(curr_chips)-1
                    first = curr_chips(i);
                    second = curr_chips(i + 1);
                    if first.test(second) == second.test(first)
                        next_len = next_len + 1;
                        next_chips(next_len) = first;
                    end
                end
                if rem(length(curr_chips), 2) == 1 && ...
                        rem(next_len, 2) == 0
                    next_len = next_len + 1;
                    next_chips(next_len) = curr_chips(end);
                end
                curr_chips = next_chips(1:next_len);
            end
            chip = curr_chips(1);
        end
    end
end
