# Chapter 8

# 8.2

def counting_sort(a, k):
    c = [0] * (k + 1)
    b = [None] * (len(a))
    for x in a:
        c[x] += 1
    for i in range(k):
        c[i+1] += c[i]
    for x in a[::-1]:
        b[c[x]-1] = x
        c[x] -= 1
    return b

# Exercise 8.2-4

def count(a, k):
    c = [0] * (k + 2)
    for x in a:
        c[x] += 1
    for i in range(k):
        c[i+1] += c[i]
    return c

def count_in_range(ht, a, b):
    return ht[b] - ht[a-1]

# 8.3

def radix_sort(a, k, d):
    b = [x for x in a]
    for i in range(d-1, -1, -1):
        b = stable_sort(b, k, hf=lambda x: ord(x[i])-ord('A'))
        print(b)
    return b

def stable_sort(a, k, hf=lambda x: x):
    n = len(a)
    ht = [hf(x) for x in a]
    c = [0] * (k + 1)
    b = [None] * n
    for i in range(n):
        c[ht[i]] += 1
    for i in range(k):
        c[i+1] += c[i]
    for i in range(n-1, -1, -1):
        b[c[ht[i]]-1] = a[i]
        c[ht[i]] -= 1
    return b

# 8.4

def bucket_sort(a):
    n = len(a)
    b = [[] for i in range(n)]
    for x in a:
        b[int(n * x)].append(x)
    res = []
    for l in b:
        l.sort()
        res += l
    return res




