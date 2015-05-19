#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Config::Crontab;
use Data::Dumper;

my $ct = new Config::Crontab;
$ct->read;

$_->active(0) for $ct->select(-command_re => 'echo');

$ct->write;

#warn Dumper($ct);
print `crontab -l`

