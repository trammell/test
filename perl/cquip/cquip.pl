#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use DB_File;
use List::Util 'maxstr';

my @az = ('a' .. 'z');
my %DB;

while (<>) {
    my $c = canon($_);
    $DB{canon}{$_} = $c;
    $DB{rcanon}{$c} = $_;
}

sub canon {
    my @x = grep { /a-z'/ } split //, lc shift();
    my (%m, @y);
    while (@x) {
        my $x = shift @x;
        next unless $x =~ /a-z'/;
        my $i = scalar(keys %m);
        $m{$x} ||= $az[$i];
        push @y, $m{$x};
    }
    return join '', @y;
}

1;

