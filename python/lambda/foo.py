#!/usr/bin/env python2.6

"""
"""

def bar(x1, x2, x3):
    print x1, x2, x3

foo = lambda ((a,b),c): bar(int(a),int(b),int(c))

a = ((123, 456), 1)
foo(a)


baz = lambda a,b,c: bar(int(a),int(b),int(c))

baz(a)



