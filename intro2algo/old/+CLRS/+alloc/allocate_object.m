function x = allocate_object
    global free next
    if free == 0
        throw(MException('MATLAB:alloc:outOfSpace','out of space'))
    else
        x = free;
        free = next(x);
    end
end
