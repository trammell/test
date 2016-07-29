#!/usr/bin/env python2.6

"""
"""

import time

starttime = time.clock()
print(starttime)
print("hello")
time.sleep(2)
end = time.clock()
print(end)
print("%s" % (end - starttime))

print("elapsed script time: %f" % (time.clock() - starttime))


