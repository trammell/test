#!/usr/bin/env python2.4

"""
"""


class Foo(object):

    bar = {}
    bar['x'] = "apple"
    bar['y'] = "banana"

    def __call__(self):
        print self.bar['x']




f = Foo()
f()

