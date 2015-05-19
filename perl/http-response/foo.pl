#!/usr/local/bin/perl
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use HTTP::Response;

my $resp = HTTP::Response->new(200);

print $resp->as_string, "\n";

if ($resp->is_success) {
    print "success\n";
}
else {
    print "fail\n";
}

