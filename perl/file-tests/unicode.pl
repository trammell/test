#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my $file = shift;

# are unicode files binary or text?
if (-T $file) { warn "File '$file' is text"; }
if (-B $file) { warn "File '$file' is binary"; }

