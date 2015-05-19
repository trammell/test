#!/usr/local/bin/perl
# $Id: partition.pl,v 1.1 2007/08/17 19:06:43 johnt Exp $

use strict;
use warnings;
use DateTime;

my $foo = DateTime->today;
my $bar = $foo->clone->add( days => 1 );

print "$_\n" for partition($foo, $bar, 10);

sub partition {
    my ($start, $end, $n) = @_;
    my $s = $start->epoch;
    my $e = $end->epoch;
    my $i = int( ($e - $s) / $n );    # interval
    return map DateTime->from_epoch(epoch => $s + $i * $_), 0 .. $n;
}


