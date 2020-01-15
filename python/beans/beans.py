#!/usr/bin/env python3

"""
http://www.cs.cmu.edu/~mbolum/research/pdf/research02.txt

> Given a can of black and white coffee beans, do the following:  Pull out two
> beans: if both are the same color, replace them with a white bean. If the two
> are different, replace them with a black bean. What color is the last bean?

The oddness/evenness of the number of black beans will persist at each step. So
if you start with an even number of black beans, there can only be 0, 2, 4, ...
beans near the end, never 1.

This is easier to see if we build all possible cans of beans, starting with a
bean of a chosen color.

* replace a random white bean with either bb or ww
* replace a random black bean with bw

Starting with one white bean we have these possibilities:

1. w
2. bb, ww
3. bbw, www
4. bbbb, bbww, wwww

You see that when we grow the can of beans, we can only add black beans two at
a time.

Starting with one black bean:

1. b
2. bw
3. bbb, bww
4. bbbw, bwww

In general:

> grow: (b, w) => (b, w+1), (b+2, w-1)

or even better

> reduce: (b, w) => (b, w-1), (b-2, w+1)

"""

def beans():
    pass
    


def reduce(can):
    pass




if __name__ == '__main__':
    beans()
