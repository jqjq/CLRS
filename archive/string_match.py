def compare_string(str1, start1, str2, start2, length):
    for i in range(length):
        if str1[start1+i] != str2[start2+i]:
            return False
    return True

def string_match_naive(string, sub):
    n = len(sub)
    m = len(string)
    for s in range(m - n):
        if compare_string(string, s, sub, 0, n):
            return s
    return -1
