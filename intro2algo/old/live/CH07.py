import random, operator

# Chapter 7

# 7.1

def quicksort(a, p, r):
    if r - p > 1:
        q = partition(a, p, r)
        quicksort(a, p, q)
        quicksort(a, q+1, r)

def partition(a, p, r):
    x = a[r-1]
    i = p - 1
    for j in range(p, r-1):
        if a[j] <= x:
            i += 1
            a[i], a[j] = a[j], a[i]
    a[i+1], a[r-1] = a[r-1], a[i+1]
    return i + 1

# Exercise 7.1-2

def partition(a, p, r, cmp=operator.lt):
    x = a[r-1]
    i = p
    flag = False
    for j in range(p, r-1):
        if cmp(x, a[j]):
            continue
        if a[j] == x:
            flag = not flag
            if flag:
                continue
        a[i], a[j] = a[j], a[i]
        i += 1
    a[i], a[r-1] = a[r-1], a[i]
    return i

# Exercise 7.1-4

def quicksort_dec(a, p, r):
    if r - p > 1:
        q = partition(a, p, r, cmp=operator.gt)
        quicksort_dec(a, p, q)
        quicksort_dec(a, q+1, r)

# 7.3

def randomized_partition(a, p, r):
    i = random.randint(p, r-1)
    a[r-1], a[i] = a[i], a[r-1]
    return partition(a, p, r)

def randomized_quicksort(a, p, r):
    if r - p > 1:
        q = randomized_partition(a, p, r)
        randomized_quicksort(a, p, q)
        randomized_quicksort(a, q+1, r)

# Problem 7-1

def hoare_partition(a, p, r):
    x = a[p]
    i = p - 1
    j = r
    while True:
        while True:
            j -= 1
            if a[j] <= x:
                break
        while True:
            i += 1
            if a[i] >= x:
                break
        if i < j:
            a[i], a[j] = a[j], a[i]
        else:
            return i

def hoare_quicksort(a, p, r):
    if r - p > 1:
        q = hoare_partition(a, p, r)
        quicksort(a, p, q)
        quicksort(a, q, r)

# Problem 7-2

def partition3(a, p, r):
    x = a[r-1]
    q = t = p
    for j in range(p, r-1):
        if a[j] <= x:
            a[t], a[j] = a[j], a[t]
            if a[t] < x:
                a[q], a[t] = a[t], a[q]
                q += 1
            t += 1
    a[t], a[r-1] = a[r-1], a[t]
    t += 1
    return q, t
    
def randomized_partition3(a, p, r):
    i = random.randint(p, r-1)
    a[r-1], a[i] = a[i], a[r-1]
    return partition3(a, p, r)
    
def quicksort3(a, p, r):
    if r - p > 1:
        q, t = partition(a, p, r)
        quicksort(a, p, q)
        quicksort(a, t, r)

# Problem 7-4

def tail_recursive_quicksort(a, p, r):
    while r - p > 1:
        q = partition(a, p, r)
        tail_recursive_quicksort(a, p, q)
        p = q + 1

def tail_recursive_quicksort(a, p, r):
    while r - p > 1:
        q = partition(a, p, r)
        if q - p <= r - q - 1:
            tail_recursive_quicksort(a, p, q)
            p = q + 1
        else:
            tail_recursive_quicksort(a, q+1, r)
            r = q

# Problem 7-6

class Interval(list):

    def __init__(self, a, b):
        self.append(a)
        self.append(b)

    def __lt__(self, other):
        return self[1] < other[0]

    def __le__(self, other):
        return not other < self

    def __gt__(self, other):
        return other < self

    def __ge__(self, other):
        return not self < other

    def __eq__(self, other):
        return not self != other

    def __ne__(self, other):
        return other < self or self < other

    def __mul__(self, other):
        return Interval(max(self[0], other[0]), min(self[1], other[1]))

def interval_partition(a, p, r):
    x = Interval(a[r-1][0], a[r-1][1])
    q = t = p
    for j in range(p, r-1):
        if a[j] <= x:
            a[t], a[j] = a[j], a[t]
            if a[t] < x:
                a[q], a[t] = a[t], a[q]
                q += 1
            else:
                x *= a[t]
            t += 1
    a[t], a[r-1] = a[r-1], a[t]
    t += 1
    return q, t
