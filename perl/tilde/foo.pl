#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2006/02/01 21:16:35 johnt Exp $

use strict;
use warnings;
use Text::CSV_XS;

my $csv = Text::CSV_XS->new({ quote_char => undef, sep_char => q{~} });

my @data = qw( john trammell 75% 31-jan-2006 );

$csv->combine(@data) || die "Error combining '@data'";

print "out: '@{[ $csv->string ]}'";

