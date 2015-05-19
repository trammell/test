#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use List::Util 'sum';
use bigint;

# get the number of palindromes with up to 99 digits
my $sum = sum map { npal($_) } 1 .. 100;

# calculate the sum of digits in the sum
print "sum = ", sum(split //, $sum);

# The trick: given a number of length "n", there are 9 * 10^(n/2 - 1)
# palindromes if "n" is even, 9 * 10^((n-1)/2) if "n" is odd.
sub npal {
    my $nd = shift;
    my $pow = ($nd % 2 == 0) ? ($nd / 2) - 1 : ($nd - 1) / 2;
    return 9 * 10 ** $pow;
}

__END__

http://nedbatchelder.com/blog/201103/two_pi_day_puzzles_from_pycon.html

The education question was a puzzle presented to middle-school kids, who were
asked to write programs to find the answer. Imagine a set of stairs with n
steps from bottom to top. You can walk up the stairs by taking every step, or
by skipping a single step any time you want. You can't skip more than one step
at a time. How many different ways are there to walk up a flight of n steps?
For example, representing a step as t and a skip as k, you could do a flight
of 3 steps as ttt, tk, kt, and 4 steps could be tttt, ttk, tkt, ktt, or kk.

