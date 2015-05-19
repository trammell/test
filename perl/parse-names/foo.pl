#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2007/08/17 19:06:44 johnt Exp $

use strict;
use warnings;
use Text::CSV_XS;

#shrm-ls-20070606.txt
while (<>) {
    #chomp;
    #warn "$_";
    die csv()->error_input unless csv()->parse($_);
    print +(csv()->fields())[9];
}

my $CSV;
sub csv {
    $CSV ||= Text::CSV_XS->new({ binary => 1 });
    return $CSV;
}


