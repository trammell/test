#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Encode 'encode';
use MIME::QuotedPrint 'encode_qp';

binmode(STDOUT, ':utf8');

all("\x{263a}");
all("foo");
all("foo\r\nbar");

sub all {
    my $in = shift;
    print '-' x 40, "\n";
    print $in, "\n";
    print "\t", encode('MIME-Header', $in), "\n";
    print "\t", encode('MIME-Q', $in), "\n";
    print "\t", encode('MIME-B', $in), "\n";
    print "\t", encode_qp(encode("UTF-8", $in),"\015\012",1), "\n";
}
