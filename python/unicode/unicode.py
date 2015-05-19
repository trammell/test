#!/usr/bin/env python2.4
# vim: set fileencoding=utf-8 :

"""
Tests of Unicode conversion routines.  Would be nice to do these as doctests,
but formatting escape codes in doctests is painful.

http://en.wikipedia.org/wiki/ISO/IEC_8859-1

"""

import unittest
#from hc.quiz.pdf.uniconvert import uniconvert

smart_quote = "’"   # U+2019 => _utf8(e2 80 99)
apics_cruft = """stem= ’“”é When the <i>APICS Dictionary</i>, 11th"""

print repr(smart_quote)

class TestUnicode(unittest.TestCase):

    def test_quoting(self):
        self.assertEqual('foo',u'foo')
        self.assertEqual('foo',u"foo")
        self.assertEqual("foo",u'foo')
        self.assertEqual(u'foo',u'foo')
        self.assertEqual(u"foo",u'foo')
        self.assertEqual(u"foo",u"foo")
        self.assertNotEqual(u"foo",u"bar")

    def test_smart_quote(self):
        sq = smart_quote
        self.assertEqual(repr(sq),r"'\xe2\x80\x99'")
        self.assertNotEqual(repr(sq),'\xe2\x80\x99')

#    def test_utf8(self):
#        self.assertEqual(uniconvert("\xc3\xa9"),u"\xe9")
#
#    def test_latin1(self):
#        eee = "\xe9\xe9\xe9"    # Latin1 encoding of "é"
#        self.assertEqual(uniconvert(eee),u'\xe9\xe9\xe9')   # no change?
#
#    def test_apics_cruft(self):
#        print uniconvert(apics_cruft)
#
#
#
#
#    >>> uniconvert("\u2021\xe9")      # Latin1 encoding of "é"
#    u'\u2021\\xe9'
#
#    >>> uniconvert("\xe9\xe9\xe9")    # Latin1 encoding of "é"
#    u'\\xe9\\xe9\\xe9'
#
#    >>> uniconvert("\xc3\xa9")        # UTF8 encoding of "é"
#    u'\\xe9'
#
#    >>> uniconvert("\xe2\x80\x99")    # UTF8 encoding of U+2019 (smart apostrophe)
#    u'\u2019'
#
#    >>> uniconvert("\u2021\xe9")      # Latin1 encoding of "é"
#    u'\u2021\\xe9'
#

if __name__ == '__main__':
    unittest.main()

