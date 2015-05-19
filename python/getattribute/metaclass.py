#!/usr/bin/env python2.4

"""
"""


class BrokenMeta(type):
    def __getattribute__(self, attr):
        if attr == 'xyzzy':
            raise AttributeError, 'xyzzy'
        else:
            return object.__getattribute__(self,attr)

class Foo(object):
    __metaclass__ = BrokenMeta
    name = "Fred"
    xyzzy = "magic"

class Bar(Foo):
    pass

b = Bar()
for base in b.__class__.__bases__:
    for attr in dir(base):
        print "getting attr: '%s'" % attr
        getattr(base,attr)

