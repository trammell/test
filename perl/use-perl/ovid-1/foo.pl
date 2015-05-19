#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:04:15 johnt Exp $

use strict;
use warnings;

foreach my $in (undef, 0, 1, q(), qw( gbr GBR )) {
    my $out = foo($_);
    $in = defined $in ? $in : '(undef)', foo($_);
    printf "foo(%s) = '%s'\n", defined $_ ? $_ : '(undef)', foo($_);
}

sub foo {
    my $country = shift;
    my $result = $country eq 'gbr' ? '' : uc "[$country]" if $country;
    return $result;
}


