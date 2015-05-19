#!/usr/bin/env python2.4

"""
"""


class MyClass(object):

    def __init__(self, a, b):
        print 'MyClass.__init__', a, b
        #super(MyClass, self).__init__(a, b)        # works in 2.4
        super(MyClass, self).__init__()             # works in 2.6

obj = MyClass(6, 7)
