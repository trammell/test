#!perl

use strict;
use warnings;
use diagnostics;

my $foo = <<FOO;

  This
  is a
  string
  with multiple
  lines

FOO

open(my $fh, '<', \$foo) || die "Can't open in-memory filehandle";

while (<$fh>) {
    print $_;

}


