#!/usr/bin/env python

"""

"""

from bsearch import bsearch, rbsearch

def drive_fn(fn):
    assert(fn([],0) is None)
    assert(fn([],1) is None)

    assert(fn([1],1) == 0)
    assert(fn([1],2) is None)

    x = [1,1]
    assert(x[fn(x,1)] == 1)
    assert(fn(x,2) is None)

    assert(fn([1,2,3],2) == 1)
    assert(fn([1,2,3],2.5) is None)
    assert(fn([1,2,3],4) is None)

    x = [2,2,3,3]
    assert(x[fn(x,2)] == 2)
    assert(x[fn(x,3)] == 3)

if __name__ == '__main__':
    drive_fn(bsearch)
    drive_fn(rbsearch)

