#!/usr/bin/perl

# https://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/

use strict;
use warnings;

print(fizzbuzz($_), "\n") for 1 .. 100;

sub fizzbuzz {
    my $i = shift;
    if ($_ % 15 == 0) {
	"FizzBuzz";
    }
    elsif ($_ % 5 == 0) {
	"Buzz";
    }
    elsif ($_ % 3 == 0) {
	"Fizz";
    }
    else {
	$_;
    }
}


