#!/usr/bin/env python2.4


for condition in [ True, False ]:

    result = condition and "result1" or "result2"
    print "(and-or) %s => %s" % (condition, result)

    result = ("result2","result1")[condition]
    print "(tuple) %s => %s" % (condition, result)


    #result = "result1" if condition else "result2"
    #print "(if-else) %s => %s" % (condition, result)



ternary = (
    (True,'bar','baz'),
    (False,'bar','baz'),
    ('foo','bar','baz'),
    ('foo',False,'baz'),
    ('foo',None,'baz'),
)

for t in ternary:
    C, exp1, exp2 = t
    print "-" * 40
    #print t
    print "trying '%s and %s or %s'" % (C, exp1, exp2)

    x = C and exp1

    print "%s and %s = %s" % (C, exp1, x)

    y = x or exp2
    print "%s or %s = %s" % (x, exp2, y)

    print "%s and %s or %s => %s" % (C, exp1, exp2, C and exp1 or exp2)



