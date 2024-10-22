#!/usr/bin/perl

# https://imranontech.com/2007/01/24/using-fizzbuzz-to-find-developers-who-grok-coding/

use strict;
use warnings;
use Carp::Assert;

my %x = (
    3 => 'Fizz',
    5 => 'Buzz',
);


# print(metafizzbuzz(\%x, $_), "\n") for 1 .. 10;

sub metafizzbuzz {
    my $conf = shift;
    my $i = shift;

    my @primes = sort keys %$conf;

    my $word = join "", map { $conf->{$_} } grep { $i % $_ == 0 } @primes;

    return $word || "$i";
}

seven: {
    my %y = ( 3 => 'Fizz', 5 => 'Buzz', 7 => 'Razz');
    assert(metafizzbuzz(\%y, 5) eq 'Buzz');
    assert(metafizzbuzz(\%y, 3) eq 'Fizz');
    assert(metafizzbuzz(\%y, 10) eq 'Buzz');
    assert(metafizzbuzz(\%y, 9) eq 'Fizz');
    assert(metafizzbuzz(\%y, 11) eq '11');
    assert(metafizzbuzz(\%y, 15) eq 'FizzBuzz');
    assert(metafizzbuzz(\%y, 7) eq 'Razz');
    assert(metafizzbuzz(\%y, 14) eq 'Razz');
    assert(metafizzbuzz(\%y, 21) eq 'FizzRazz');
    assert(metafizzbuzz(\%y, 35) eq 'BuzzRazz');
    assert(metafizzbuzz(\%y, 105) eq 'FizzBuzzRazz');
    print metafizzbuzz(\%y, 104), "\n";
    print metafizzbuzz(\%y, 105), "\n";
    print metafizzbuzz(\%y, 106), "\n";
}

