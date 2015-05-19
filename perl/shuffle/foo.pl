#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/04/24 20:10:57 johnt Exp $

use strict;
use warnings;


my @a = qw( 3 1 4 1 5 9 );
for (1 .. 10) {
    shuffle(\@a);
    print "@a\n";
}

# oops
my @b = qw();
eval { shuffle(\@b) };
warn $@ if $@;
print "@b\n";

sub shuffle {
    my $array = shift;
    my $i;
    for ($i = @$array; --$i;) {
        my $j = int rand ($i+1);
        next if $i == $j;
        @$array[$i,$j] = @$array[$j,$i];
    } # end for loop
}

