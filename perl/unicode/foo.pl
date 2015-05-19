#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2006/06/16 17:25:24 johnt Exp $

use strict;
use warnings;
use utf8;

# see perluniintro, "Questions With Answers"

my $x = "ab\x80c";
my $y = "\x{100}";
my $z = "$x = $y";

binmode(STDOUT, ':utf8');
print $z;

print '$x is utf8' if utf8::is_utf8($x);
print '$y is utf8' if utf8::is_utf8($y);
print '$z is utf8' if utf8::is_utf8($z);

