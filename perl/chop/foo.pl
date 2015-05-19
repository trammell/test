#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.2 2006/04/07 14:55:06 johnt Exp $

use strict;
use warnings;

$b=chop($a="128");

print "$a";
print "$b";
print "&", $a & $b;

print $b != ($a & $b) ? "Just another " : "Perl hacker!";
print $b != ($a & $b) ? "Just another " : "Perl hacker!";


