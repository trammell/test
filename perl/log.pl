#!/usr/bin/env perl
# vim: set at et ts=4 :

my @x = (
    2, 2.5, 3, 3.5, 4, 4.5, 5, 6, 7, 8, exp(2)
);

for my $x (@x) {
    printf("%f %f\n", $x, f($x));
}

sub log10 {
    my $n = shift;
    return log($n)/log(10);
}

sub f {
    my $x = shift;
    return log($x) - 4 / log($x);
}


