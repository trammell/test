

"""
the goal: write code that satisfies this assertion:

    assert g(12)(5)(8)(1)(3) == 29
"""

def g(i):
    return g2

def g2(i):
    return g3

def g3(i):
    return g4

def g4(i):
    return g5

def g5(i):
    return 29

print(g(12))
print(g(12)(5))
print(g(12)(5)(8))
print(g(12)(5)(8)(1))
print(g(12)(5)(8)(1)(3))

assert g(12)(5)(8)(1)(3) == 29

