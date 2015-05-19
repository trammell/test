#!/usr/local/bin/perl -l

use strict;
use warnings FATAL => 'all';

binmode STDOUT, ':utf8';

my $quebec = "Qu\x{e9}bec";
print $quebec;

for my $ch (split //, $quebec) {
    printf qq{"%s" %3d 0x%02x\n}, $ch, (ord($ch)) x 2;
}

(my $foo = $quebec) =~ s{Qu.*bec}{Quebec};
print $foo;

(my $bar = $quebec) =~ s/Qu\x{e9}bec/Quebec/;
print $bar;

