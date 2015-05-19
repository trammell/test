#!/usr/bin/env python2.4

"""
"""

def thousands_with_commas(i):
    s = ''
    while i > 999:
        r = i % 1000
        i = i // 1000
        s = (",%03d" % r) + s
    if i:
        s = str(i) + s

    print s
    return s


if __name__ == '__main__':
    assert thousands_with_commas(1001) == '1,001'
    assert thousands_with_commas(1234) == '1,234'
    assert thousands_with_commas(123456789) == '123,456,789'
    assert thousands_with_commas(12) == '12'
    assert thousands_with_commas(123) == '123'
    assert thousands_with_commas(999) == '999'
    assert thousands_with_commas(1000) == '1,000'


