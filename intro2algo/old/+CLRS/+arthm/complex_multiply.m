function [x, y] = complex_multiply(a, b, c, d)
    m1 = (a + b) * (c + d);
    m2 = a * c;
    m3 = b * d;
    [x, y] = deal(m2 - m3, m1 - m2 - m3);
end
