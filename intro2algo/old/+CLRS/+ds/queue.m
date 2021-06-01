classdef queue < handle
    properties
        tail = 1
        head = 1
        data
    end
    methods
        function q = queue(n)
            q.data = zeros(1, n);
        end
        function x = dequeue(q)
            if q.tail == q.head
                throw(MException('MATLAB:queue','underflow'))
            end
            x = q.data(q.head);
            if q.head == length(q.data)
                q.head = 1;
            else
                q.head = q.head + 1;
            end
        end
        function x = popright(q)
            if q.tail == q.head
                throw(MException('MATLAB:queue','underflow'))
            end
            if q.tail == 1
                q.tail = length(q.data);
            else
                q.tail = q.tail - 1;
            end
            x = q.data(q.tail);
        end
        function enqueue(q, x)
            q.data(q.tail) = x;   
            if q.tail == length(q.data)
                q.tail = 1;
            else
                q.tail = q.tail + 1;
            end
            if q.tail == q.head
                throw(MException('MATLAB:queue','overflow'))
            end
        end
        function pushleft(q, x)
            if q.head == 1
                q.head = length(q.data);
            else
                q.head = q.head - 1;
            end
            if q.tail == q.head
                throw(MException('MATLAB:queue','overflow'))
            end
            q.data(q.head) = x;     
        end
    end
end
