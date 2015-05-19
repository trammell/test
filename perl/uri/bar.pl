#!/usr/local/bin/perl -l
# $Id: bar.pl,v 1.1 2006/04/07 14:55:24 johnt Exp $

use strict;
use warnings;
use HTTP::Request::Common;

my $uri = URI->new("http://www.perl.com");
my %data = (
    howlearn => [ qw( foo bar baz ) ],
);
my $referer = 'referer.html';

my $request = HTTP::Request::Common::POST($uri, Content => \%data);
$request->header(Referer => $referer) if $referer;
warn($request->as_string);

