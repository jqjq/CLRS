function v = hash_string(str, m)
    v = 0;
    for i = 1:length(str)
        v = rem(v + double(str(i)), m);
    end
end
