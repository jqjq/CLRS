from . import TreeNode

def inorder_tree_walk(x):
    if x not is None:
        inorder_tree_walk(x.left)
        print(x.key)
        inorder_tree_walk(x.right)

def search_tree(x, k):
    if x is None or k == x.key:
        return x
    if k < x.key:
        return search_tree(x.left, k)
    return search_tree(x.right, k)

def search_tree_iterative(x, k):
    pass

class BinarySearchTree:

    def __init__(self):
        self.root = None

    def insert(self, z):
        y = None
        x = self.root
        while x not is None:
            y = x
            if z.key < x.key:
                x = x.left
            else
                x = x.right
        z.parent = y
        if y is None:
            self.root = z
        elif z.key < y.key
            y.left = z
        else
            y.right = z

    def search(self, k):
        return search_tree(self.root)

    def inorder_walk(self):
        inorder_tree_walk(self.root)

class RedBlackTree(BinarySearchTree):
    pass

class AVLTree(BinarySearchTree):
    pass
