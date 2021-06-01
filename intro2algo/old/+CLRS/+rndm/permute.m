function a = permute(a)
    n = length(a);
    exist = false(1, n^3);
    p = zeros(1, n);
    for i = 1:n
        while true
            key = randi([1, n^3]);
            if ~exist(key)
                exist(key) = true;
                break
            end
        end
        p(i) = randi([1, n^3]);
    end
    p = sortrows([p; a]')';
    a = p(2,:);
end
