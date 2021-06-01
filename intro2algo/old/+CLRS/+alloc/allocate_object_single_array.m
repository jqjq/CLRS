function x = allocate_object_single_array
    global free memory
    if free == 0
        throw(MException('MATLAB:alloc:outOfSpace','out of space'))
    else
        x = free;
        free = memory(x+1);
    end
end
