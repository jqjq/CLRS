function a = max_heapify(a, i)
    l = heap.left(i);
    r = heap.right(i);
    if l <= a.heap_size && a.data(l) > a.data(i)
        largest = l;
    else
        largest = i;
    end
    if r <= a.heap_size && a.data(r) > a.data(largest)
        largest = r;
    end
    if largest ~= i
        [a.data(i), a.data(largest)] = deal(a.data(largest), a.data(i));
        a = heap.max_heapify(a, largest);
    end
end
