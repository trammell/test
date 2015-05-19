#!/usr/local/bin/perl
# $Id: foo.pl,v 1.4 2006/06/12 19:28:09 johnt Exp $

use strict;
use warnings;
use Storable 'retrieve';
use Data::Dumper;
local $Data::Dumper::Sortkeys = 1;

my $file = $ARGV[0] || die "I need a filename\n";
my $data = eval { retrieve($file); };
if ($@) {
    warn $@;
    warn "Storable::retrieve() failed for file '$file'";
    warn "Current contents of file '$file' are:\n";
    warn Data::Dumper->Dump([ dumpfile($file) ], ['dump']);
}

Data::Dumper->Dump([$data], ['data']);

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

