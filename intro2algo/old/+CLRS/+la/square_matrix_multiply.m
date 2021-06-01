function c = square_matrix_multiply(a, b)
    [m, ~] = size(a);
    n = 2 ^ ceil(log2(m));
    pad_a = zeros(n);
    pad_b = zeros(n);
    pad_a(1:m,1:m) = a;
    pad_b(1:m,1:m) = b;
    c = strassen_method(pad_a, pad_b);
    c = c(1:m,1:m);
end

function c = strassen_method(a, b)
    [n, ~] = size(a);
    if n == 1
        c = a * b;
    else
        mid = n / 2;
        a11 = a(1:mid, 1:mid);
        a12 = a(1:mid, mid+1:n);
        a21 = a(mid+1:n, 1:mid);
        a22 = a(mid+1:n, mid+1:n);
        b11 = b(1:mid, 1:mid);
        b12 = b(1:mid, mid+1:n);
        b21 = b(mid+1:n, 1:mid);
        b22 = b(mid+1:n, mid+1:n);

        s1 = b12 - b22;
        s2 = a11 + a12;
        s3 = a21 + a22;
        s4 = b21 - b11;
        s5 = a11 + a22;
        s6 = b11 + b22;
        s7 = a12 - a22;
        s8 = b21 + b22;
        s9 = a11 - a21;
        s10 = b11 + b12;

        p1 = strassen_method(a11, s1);
        p2 = strassen_method(s2, b22);
        p3 = strassen_method(s3, b11);
        p4 = strassen_method(a22, s4);
        p5 = strassen_method(s5, s6);
        p6 = strassen_method(s7, s8);
        p7 = strassen_method(s9, s10);

        c(1:mid, 1:mid) = p5 + p4 - p2 + p6;
        c(1:mid, mid+1:n) = p1 + p2;
        c(mid+1:n, 1:mid) = p3 + p4;
        c(mid+1:n, mid+1:n) = p5 + p1 - p3 - p7;
    end
end
