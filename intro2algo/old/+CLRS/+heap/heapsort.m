function a = heapsort(a)
    a = heap.build_max_heap(a);
    for i = a.heap_size:-1:2
        [a.data(1), a.data(i)] = deal(a.data(i), a.data(1));
        a.heap_size = a.heap_size - 1;
        a = heap.max_heapify(a, 1);
    end
    a = a.data;
end
