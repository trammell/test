#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2006/04/07 14:55:24 johnt Exp $

use strict;
use warnings;
use URI;

my %data = (
    howlearn => [ qw( foo bar baz ) ],
);

my $uri = URI->new("http://www.perl.com");

$uri->query_form( \%data );

print $uri->as_string;
print $uri->query;


