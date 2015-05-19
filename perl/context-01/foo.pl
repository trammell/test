#!perl

use strict;
use warnings;
use diagnostics;

showcon();                            # void
my $scalar  = showcon();              # scalar
my @list    = showcon();              # list
my @list2   = scalar showcon();       # scalar
my $hashref = { blah => showcon() };  # list (needs odd number)

sub showcon {
    my $w = wantarray;
    if ($w) {
        warn "=== list context ===\n";
        return (1..2);
    }
    elsif (defined $w) {
        warn "=== scalar context ===\n";
        return 1;
    }
    else {
        warn "=== void context ===\n";
    }
}

