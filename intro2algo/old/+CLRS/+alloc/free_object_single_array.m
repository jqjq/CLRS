function free_object_single_array(x)
    global free memory
    memory(x+1) = free;
    free = x;
end
