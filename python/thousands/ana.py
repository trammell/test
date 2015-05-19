#!/usr/bin/env python2.4

"""
Code to solve tests at
http://www.willmcgugan.com/blog/tech/2009/12/21/python-developer-programming-tests/
"""

words = [ w.rstrip() for w in open('/usr/share/dict/words') ]

an = {}

for w in words:
    key = "".join(sorted(w))
    #if key == "opst":
    #    print w
    #    print an.get(key,[])
    x = an.setdefault(key,[])
    x.append(w)

def ana(word):
    return an.get("".join(sorted(word)),[])

if __name__ == "__main__":
    print ana("pots")
    print '--'
    print ana("train")
    print '--'
    print ana('drive')
    print '--'
    print ana('python')


