#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/11/27 20:32:22 johnt Exp $

use strict;
use warnings;
use Data::Dumper;

ddsplit('a b c');
ddsplit('1 1 1');
ddsplit('a111a1');
ddsplit('aaaa111a1');
ddsplit('aaaa111a1cccc');

sub ddsplit {
    print Dumper( [ split /\D+/, shift ] );
}



