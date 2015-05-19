#!/usr/bin/env python2.4

"""
"""

from pprint import pprint

class Foo(object):
    name = 'Fred'
    xyzzy = 'magic'
    def __getattribute__(self,attr):
        if attr == 'xyzzy':
            raise AttributeError, attr
        else:
            return object.__getattribute__(self,attr)

print Foo.xyzzy

f = Foo()
f.name
try: print f.xyzzy
except AttributeError: print "caught AttributeError accessing xyzzy"
try: print getattr(f,"xyzzy")
except AttributeError: print "caught AttributeError accessing xyzzy"



class Bar(Foo):
    def __getattribute__(self,attr):
        if attr == 'xyzzy':
            raise AttributeError, attr
        else:
            return Foo.__getattribute__(self,attr)

b = Bar()
b.name
try: print b.xyzzy
except AttributeError: print "caught AttributeError accessing xyzzy"
try: print getattr(b,"xyzzy")
except AttributeError: print "caught AttributeError accessing xyzzy"

for base in b.__class__.__bases__:
    for attr in dir(base):
        print getattr(base,attr)

