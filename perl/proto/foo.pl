#!perl -l

use strict;
use warnings;
use constant PI => 3.14159;

my $x = PI-1;
print $x;

my $y = foo()-1;
print $y;

my @array = (1 .. 10);
print length(@array);

sub foo {
    return 2.71828;
}

