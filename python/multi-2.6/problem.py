#!/usr/bin/env python2.4

"""
"""


class MyClass(object):

    def __init__(self, a, b):
        print 'MyClass.__init__', a, b
        try:
            super(MyClass, self).__init__()
        except Exception, e:
            print 'error in MyClass.__init__:', e


class AnotherClass(object):

    def __init__(self, a, b):
        print 'AnotherClass.__init__', a, b
        try:
            super(AnotherClass, self).__init__()
        except Exception, e:
            print 'error in AnotherClass.__init__:', e


class MultiClass(MyClass, AnotherClass):

    def __init__(self, a, b):
        print 'MultiClass.__init__', a, b
        super(MultiClass, self).__init__(a, b)


obj = MultiClass(6, 7)
