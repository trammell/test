#!/usr/local/bin/perl -l
# $Id: curdate.pl,v 1.1 2007/08/17 19:05:29 johnt Exp $

use strict;
use warnings;
use SQL::Abstract;

my %where = (
    associationid => 'apa',
    productid     => [qw( pt2007 fp2007 )],
    surveyname    => 'quickcomment',
    lastmoddate   => [
        -and =>
        \">= SUBDATE(CURDATE(), INTERVAL 7 DAY)",
        \"< CURDATE()",
    ],
);

my ($sql, @bind) = SQL::Abstract->new->select( 'survey2',[qw( surveydata )], \%where );

print "\n$sql\n\n@bind\n\n";

