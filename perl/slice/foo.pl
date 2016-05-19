#!/usr/bin/perl

use 5.12.0;

my @foo = qw/ alpha beta gamma delta epsilon /;

my $x = $foo[1,2];

print ">>$foo[2]<<\n";
print ">>@foo[1,2,3]<<\n";
print ">>$foo[1,2,3]<<\n";

my %bar = ( harry => 'Gryffindor', draco => 'Slytherin', cedric => 'Hufflepuff' );

print ">>$bar{harry}<<\n";
print ">>@bar{'harry','draco'}<<\n";
print ">>$bar{'harry','cedric'}<<\n";




