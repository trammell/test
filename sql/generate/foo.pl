#!/usr/bin/env perl

use strict;
use warnings;

foreach my $i (0 .. 19) {
    my $fmt = "ALTER TABLE IF EXISTS logs_p%02d SET (autovacuum_analyzle_scale_factor=0.05, autovacuum_scale_factor=0.01);\n";
    printf($fmt, $i);
}

