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

A number is a palindrome if the digits read the same backwards as forwards: 1,
88, 343, 234565432, and so on. What is the sum of the digits in the number of
palindromes less than a googol (10^100)? That is, count all the palindromes
greater than zero and less than a googol, then sum all the digits in that
number, not the sum of the digits in all the palindromes. What's your answer?
They actually posed it as "write a program to compute the sum of the digits,
etc," and were interested in the shortest program, but I prefer it as a pure
math question.

