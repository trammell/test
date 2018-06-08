#!/usr/bin/env python3

"""
Sample LRUCache code. See https://docs.python.org/3/library/functools.html
for gory details.
"""

from functools import lru_cache
import time

@lru_cache(maxsize=4)
def slowadd(a,b):
    """Add two numbers, poorly."""
    time.sleep(1)
    return a + b

start_time = time.time()
print("1 + 1 = %d" % slowadd(1,1))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("1 + 1 = %d" % slowadd(1,1))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("1 + 1 = %d" % slowadd(1,1))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("1 + 2 = %d" % slowadd(1,2))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("2 + 1 = %d" % slowadd(2,1))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("2 + 2 = %d" % slowadd(2,2))
print("--- %s seconds ---\n" % (time.time() - start_time))

print(slowadd.cache_info())

start_time = time.time()
print("2 + 3 = %d" % slowadd(2,3))
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("1 + 1 = %d" % slowadd(1,1))
print("--- %s seconds ---\n" % (time.time() - start_time))


@lru_cache(maxsize=4)
def one():
    time.sleep(1)
    return 1

start_time = time.time()
print("one() = %d" % one())
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("one() = %d" % one())
print("--- %s seconds ---\n" % (time.time() - start_time))

start_time = time.time()
print("one() = %d" % one())
print("--- %s seconds ---\n" % (time.time() - start_time))
