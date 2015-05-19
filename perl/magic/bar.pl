#!/usr/local/bin/perl
# $Id: bar.pl,v 1.2 2006/06/14 15:25:16 johnt Exp $

use strict;
use warnings;
use subs 'cleanup';
use Storable 'retrieve';
use Data::Dumper;

require 'dumpfile.pl';

local $Data::Dumper::Sortkeys = 1;
local $Data::Dumper::Useqq    = 1;

END { cleanup }

for my $len (0 .. 20) {
    warn "creating file of length $len...\n";
    my $name = mk_file($len);
    warn "calling retrieve()...\n";
    my $data = eval { retrieve($name); };
    if ($@) {
        warn $@;
        warn "Storable::retrieve() failed for file '$name'";
        warn "Current contents of file '$name' are:\n";
        warn Data::Dumper->Dump([ dumpfile($name) ], ['dump']);
    }
}

# create a file of length "len"
sub mk_file {
    my $len = shift;
    my $name = 'testbar.tmp';
    open(my $fh, q(>), $name) or die $!;
    print $fh 'a' x $len;
    close $fh;
    return $name;
}

sub cleanup {
    my $name = mk_file(0);
    unlink $name;
}

