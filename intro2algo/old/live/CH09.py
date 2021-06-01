# -*- coding: utf-8 -*-
"""
Created on Mon Aug 26 12:21:54 2019

@author: qj
"""



def randomized_select(a, p, r, i):
    while r - p > 1:
        q = randomized_partition(a, p, r)
        k = q - p
        if i == k:
            return a[q]
        if i < k:
            r = q
        else:
            p = q + 1
            i -= k + 1
    return a[p]
