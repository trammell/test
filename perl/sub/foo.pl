#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/03/22 14:49:37 johnt Exp $

use strict;
use warnings;

my $x = 1;   # lexical
our $y = 2;  # global
print "$x $y\n";

double($x,$y);  # succeeds

print "$x $y\n";

eval { double(3,4); }; # fails: read-only
warn $@ if $@;

sub double {
    $_ *= 2 for @_;
}

__END__

1 2
2 4
Modification of a read-only value attempted at foo.pl line 19.

