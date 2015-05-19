#!/usr/bin/env python2.4

"""
"""

from pprint import pprint

class Foo(object):
    name = 'Fred'

    def __get__(self,instance,owner):
        raise AttributeError, 'AttributeError: get'

    def get_xyzzy(self):
        raise AttributeError, 'AttributeError: xyzzy'

    xyzzy = property(get_xyzzy)


print Foo.xyzzy

f = Foo()
f.name
try: print f.xyzzy
except AttributeError, e: print e
try: print getattr(f,"xyzzy")
except AttributeError, e: print e

class Bar(Foo):
    def __getattribute__(self,attr):
        if attr == 'xyzzy':
            raise AttributeError, 'AttributeError: xyzzy 2'
        else:
            return Foo.__getattribute__(self,attr)

b = Bar()
b.name
try: print b.xyzzy
except AttributeError, e: print e
try: print getattr(b,"xyzzy")
except AttributeError, e: print e

for base in b.__class__.__bases__:
    for attr in dir(base):
        print getattr(base,attr)

