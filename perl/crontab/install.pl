#!/usr/bin/perl

# installs a crontab entry that echoes some output

use strict;
use warnings FATAL => 'all';
use Config::Crontab;
use Data::Dumper;

my $ct = new Config::Crontab;

$ct->read;
$ct->write;

#warn Dumper($ct);

print `crontab -l`
