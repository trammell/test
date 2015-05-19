#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use POSIX;

#showloc('de');
showloc('en_GB');
showloc('en_GB.ISO8859-1');

sub showloc {
    my $show = shift;
    my $loc = POSIX::setlocale(&POSIX::LC_ALL, $show);
    print "Locale = $loc\n";
    my $lconv = POSIX::localeconv();
#   print "decimal_point    = ",  $lconv->{decimal_point},     "\n";
#   print "thousands_sep    = ",  $lconv->{thousands_sep},     "\n";
#   print "grouping = ",          $lconv->{grouping},          "\n";
    print "int_curr_symbol  = ",  $lconv->{int_curr_symbol},   "\n";
    print "currency_symbol  = ",  $lconv->{currency_symbol},   "\n";
}
