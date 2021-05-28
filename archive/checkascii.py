from string import printable

with open('part7/ch32/index.rst') as f:
    for lno, line in enumerate(f):
        for cno, c in enumerate(line):
            if c not in printable:
                print(lno, '-', cno, '-', hex(ord(c)), '-', c)
