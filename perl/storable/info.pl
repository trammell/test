#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Storable;

warn Data::Dumper->Dump([Storable::file_magic(shift)], ['*magic']);
