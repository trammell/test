#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2006/04/07 14:55:23 johnt Exp $

use strict;
use warnings;
use SQL::Abstract;

my $sql = SQL::Abstract->new;

{
    my $courseid = 1;
    my @pre      = (1 .. 3);
    my %where = (
        courseid  => $courseid,
        zipprefix => [ -in => \@pre ],
    );
    my ($stmt, @bind) = $sql->select('mlsrc', 'contact', \%where, []);
    print $stmt;
    print " => @bind";
}

{
    my @member_where = (
        [ 'question_id.part_id' => 456 ],
        [ 'question_id.part_id' => 789 ],
    );
    my %where = (
        pool_id     => 123,
        usage_count => { '>=' => 0 },
        '-nest'     => \@member_where
    );
    my ($stmt, @bind) = $sql->select('mlsrc', 'contact', \%where, []);
    print $stmt;
    print " => @bind";
}

