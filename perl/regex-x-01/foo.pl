#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my $err_re = qr{
    452 .* sys.comcast.net .* (
        comcast \s* blocked \s* for \s* spam
        |
        one \s* or \s* more \s* dnsbls
    )
}ixms;

my $e1 = '452 {hash}.sys.comcast.net comcast a.b.c.d Comcast Blocked for spam. Please see http://postmaster.comcast.net/{hash}.php#BL000000';

if ($e1 =~ m/$err_re/) {
    warn "matches e1";
}

my $e2 = '452 resimta-po-24v.sys.comcast.net comcast 54.164.255.241 found on one or more DNSBLs, see http://postmaster.comcast.net/smtp-error-codes.php#BL000010';

if ($e2 =~ m/$err_re/) {
    warn "matches e2";
}
