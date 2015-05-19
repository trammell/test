#!/usr/local/bin/perl -l
# $Id: lc.pl,v 1.1 2007/08/17 19:04:34 johnt Exp $

use strict;
use warnings;

# see perluniintro, "Questions With Answers"

my $x = "\x{c9}lan";   # Elan with acute accent on E

binmode(STDOUT, ':utf8');
print $x;
print lc($x);

# print '$x is utf8' if utf8::is_utf8($x);
# print '$y is utf8' if utf8::is_utf8($y);
# print '$z is utf8' if utf8::is_utf8($z);
# 
