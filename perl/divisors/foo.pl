#!/usr/bin/perl -l

# see e.g. http://thedailywtf.com/Articles/Nerds,-Jocks,-and-Lockers.aspx

use strict;
use warnings FATAL => 'all';

for my $i (1 .. 100) {
    my @d = divisors($i);
    my $nd = scalar @d;
    my $mod2 = $nd % 2;
    print "$i => $mod2 ($nd:@d)";
}

sub divisors {
    my $n = shift;
    return grep { $n % $_ == 0 } 1 .. $n;
}

1;

__END__


