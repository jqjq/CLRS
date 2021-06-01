function obst_print(root)
    [n, ~] = size(root);
    disp("k" + root(1, n) + " is the root");
    obst_print_aux(root, 1, n);
end

function obst_print_aux(root, i, j)
    r = root(i, j);
    left = r - 1;
    if i > left
        child_print(left, r, true, true);
    else
        child_print(root(i, left), r, false, true);
        obst_print_aux(root, i, left);
    end
    right = r + 1;
    if right > j
        child_print(j, r, true, false);
    else
        child_print(root(right, j), r, false, false);
        obst_print_aux(root, right, j);
    end
end

function child_print(child, parent, is_leaf, is_left)
    s = "";
    if is_leaf
        s = s + "d";
    else
        s = s + "k";
    end
    s = s + child + " is the ";
    if is_left
        s = s + "left ";
    else
        s = s + "right";
    end
    s = s + " child of k" + parent;
    disp(s);
end
