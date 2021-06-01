function free_object(x)
    global free next
    if x < free
        next(x) = free;
        free = x;
    else
        behind = free;
        front = next(free);
        while front ~= 0 && x > front
            behind = front;
            front = next(front);
        end
        next(behind) = x;
        next(x) = front;
    end
end
