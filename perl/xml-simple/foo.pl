#!/usr/local/bin/perl
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use XML::Simple 'XMLout';

my %opts = (NoAttr => 1, RootName => 'learner');


# display the learner
my %learner = (
    first_name    => 'Fred',
    last_name     => 'Jones',
    email_address => 'johnt@holmescorp.com',
    product       => 'The XYZ Product',
);

print XMLout(\%learner, %opts );
print "\n\n";

# display the coordinator
my %coordinator = (
    first_name    => 'Fred',
    last_name     => 'Jones',
    email_address => 'johnt@holmescorp.com',
    product       => 'The XYZ Product',
    quantity      => 20,
);
$opts{RootName} = 'coordinator';
print XMLout(\%coordinator, %opts );
