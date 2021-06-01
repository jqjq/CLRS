function chord = intersect_chord(chord)
    n = length(chord); 
    point = reshape(chord, n*2, 1);
    point = [point, [zeros(n, 1); ones(n, 1)]];
    point = sortrows(point);
    intsct = 0;
    for pt = point
        
    end
end
