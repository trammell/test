#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Mail::Header;
use Mail::Internet;

my $h = Mail::Header->new();
$h->add("description", "moist and fluffy");

#print $h->as_string;

my $body = <<body;
Starting IFMA FMP build at Thu Sep  9 15:03:54 CDT 2010
IFMA FMP build finished at Thu Sep  9 15:06:28 CDT 2010
Got hc.contenttypes.ifma 0.1dev-r27411.
Got tgc.vocabularies 0.1.2dev-r1826.
body

my $msg = Mail::Internet->new(
    Body => [$body],
    Header => $h);


print $msg->as_string;

