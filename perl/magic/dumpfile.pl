#!/usr/local/bin/perl
# $Id: dumpfile.pl,v 1.1 2006/06/14 15:22:01 johnt Exp $

package main;
use strict;
use warnings;
use Data::Dumper;
local $Data::Dumper::Sortkeys = 1;

# dump up to 1k of the file contents
sub dumpfile {
    my $name = shift;
    my %file = (
        name     => $name,
        size     => (stat($name))[7],
        'exists' => (-e $name) ? 1 : 0,
    );
    $file{data} = do {
        local $/;
        open(my $fh, q(<), $name) or die "can't open '$name': $!";
        <$fh>;
    };
    my $max = 1000;
    if (length($file{data}) > $max) {
        substr($file{data}, $max) = '[truncated]';
    }
    return \%file;
}

1;

