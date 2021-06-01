function result = monge_minimum(mat)
    [m, n] = size(mat);
    if m == 1
        result = find_min(mat, 1, n);
    else
        result = zeros(1, m);
        even_mins = la.monge_minimum(mat(2:2:m,:));
        j = 1;
        stop = 1;
        for i = 1:2:m-1
            start = stop;
            stop = even_mins(j);
            result(i) = find_min(mat(i,:), start, stop);
            result(i+1) = stop;
            j = j + 1;
        end
        if rem(m, 2) == 1
            result(m) = find_min(mat(m,:), stop, n);
        end
    end
end

function smallest = find_min(row, start, stop)
    smallest = start;
    for i = start+1:stop
        if row(i) < row(smallest)
            smallest = i;
        end
    end
end
