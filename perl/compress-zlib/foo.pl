#!/usr/local/bin/perl

use strict;
use warnings FATAL => 'all';
use Compress::Zlib;
use Data::Dumper;

warn $Compress::Zlib::VERSION;

my $file = shift() || die("usage: $0 file");

my $gz = gzopen($file, "rb") || die "Can't open '$file': $!";

for (1,2) {
    my %x;
    $x{size} = $gz->gzread($x{buffer}, 1024);
    $x{gzeof} = $gz->gzeof;
    $Data::Dumper::Sortkeys = 1;
    warn Data::Dumper->Dump([\%x],['*dump']);
}

__END__

Script to show problem with Compress::Zlib--files that are not compressed
should be read correctly (transparently) by Compress::Zlib, but some versions
(which?  At least v1.35) of Compress::Zlib get the eof() test wrong.

