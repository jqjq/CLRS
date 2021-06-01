classdef Interval < handle
    properties
        low
        high
    end

    methods
        function obj = Interval(low, high)
            obj.low = low;
            obj.high = high;
        end
    end
end
