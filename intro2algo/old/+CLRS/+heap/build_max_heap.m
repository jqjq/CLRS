function a = build_max_heap(a)
    a = struct('data', a, 'heap_size', length(a));
    for i = fix(a.heap_size/2):-1:1
        a = heap.max_heapify(a, i);
    end
end
