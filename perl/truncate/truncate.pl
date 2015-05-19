#!/usr/bin/perl

package main;

use strict;
use warnings FATAL => 'all';

my $epsilon = 0.0001;

unless (caller()) {
    while (<>) {
        chomp;
        my @values = split(/\t/, $_);

#my ($content_id, $hint, $correct_answer, $tolerance, $related) = split(/\t/, $_);
        $values[2] = trunc($values[2]);
        $values[3] = trunc($values[3]);
        $values[4] ||= q();
        print join("\t", @values), "\n";

#$correct_answer = trunc($correct_answer);
#$tolerance = trunc($tolerance);
#print join "\t", ($content_id, $hint, $correct_answer, $tolerance, $related);
#print "\n";
    }
}

sub trunc {
    my $x = shift;
    if ($x =~ /000000\d/) {
        $x =~ s/000000\d+//;
        return $x + 0.0;
    }
    if ($x =~ /(\d)999999/) {
        my $y = $1;
        $y++;
        $x =~ s/\d999999\d+/$y/;
        return $x + 0.0;
    }
    return $x;
}

no warnings;
911;
