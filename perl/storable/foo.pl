#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2006/06/09 18:13:26 johnt Exp $

use strict;
use warnings;
use Storable;

eval { retrieve "/dev/null"; };
warn $@ if $@;

eval { retrieve "/dev/zero"; };
warn $@ if $@;


