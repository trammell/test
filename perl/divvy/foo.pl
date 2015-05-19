#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2006/04/07 14:55:09 johnt Exp $

use strict;
use warnings;

my $width = 6.0;
my $cols = 8;

my $w = $width / $cols;
my $w2 = 0.5 * $w;

for(my $x = $w2; $x < $width; $x += $w) {
    print $x;
}


