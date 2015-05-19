
from pickle import dump

class MyObject(object):
    primes = (2,3,5,7,11)
    def __init__(self,foo=1,bar='quux'):
        self.foo = foo
        self.bar = bar
    def emit(self):
        print(self.foo)
        print(self.bar)



obj = {
    'this': [ 'is', 'a' ],
    'relatively': { 'complicated': 'object' },
    'with': ('a', MyObject()),
}

fh = open('pickle.dat','w')

dump(obj,fh)


