#!/usr/local/bin/perl
# $Id: exp.pl,v 1.2 2006/04/07 14:55:12 johnt Exp $

use strict;
use warnings; 
my $n = $ARGV[0] || 5;
my @terms = qw( a[0][0] a[0][1] );
foreach my $i (1 .. $n-1) {
    @terms = map { ("$_ a[$i][0]","$_ a[$i][1]") } @terms;
} 
foreach my $i (0 .. $#terms) {
    print "term[$i] = $terms[$i]\n";
}

