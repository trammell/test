#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';
use Digest::MD5 'md5_hex';

my $key = '9ec4c12949a4f31474f299058ce2b22a';

my $text = qq{USCYBERCOM plans, coordinates, integrates, synchronizes and
    conducts activities to: direct the operations and defense of specified
    Department of Defense information networks and; prepare to, and when
    directed, conduct full spectrum military cyberspace operations in order to
    enable actions in all domains, ensure US/Allied freedom of action in
    cyberspace and deny the same to our adversaries.};

$text =~ s/\s+/ /g;

if (md5_hex($text) eq $key) {
    say "matches";
} else {
    say "fails";
}
