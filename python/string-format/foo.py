"""
https://stackoverflow.com/questions/7934620/python-dots-in-the-name-of-variable-in-a-format-string#comment9695339_7934969
https://docs.python.org/3/library/stdtypes.html#str.format
https://docs.python.org/3/library/string.html#formatstrings
https://docs.python.org/3/library/string.html#formatspec
"""

import sys

def err(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

try:
    err('Name: {person.name}'.format(**{'person.name': 'Adam'}))
except:
    pass

try:
    x = { 'person' : { 'name' : 'Bob' }}
    err('Name: {person.name}'.format(**x))
except:
    pass

try:
    x = { 'person.name' : 'Carl' }
    err('Name: {person.name}'.format(**x))
except:
    pass

# What is happening here? I think the leading 0 in the replacement field
# chooses the first argument to format(), and the '[person.name]' chooses that
# key from the dict. More at
# https://docs.python.org/3/library/string.html#format-examples
try:
    err('Name: {0[person.name]}'.format({'person.name': 'Dave'}))
except:
    pass

try:
    x = { 'person.name' : 'Eddie' }
    err('Name: {0[person.name]}'.format(x))
except:
    pass

# test the above hypothesis, should print "George"
try:
    x = { 'person.name' : 'Freddie' }
    y = { 'person.name' : 'George' }
    err('Name: {1[person.name]}'.format(x, y))
except:
    pass


# Do we need these shenanigans with f-strings?
try:
    x = { 'person.name' : 'Hal' }
    err(f"""Name: {x['person.name']}""")
except:
    pass







