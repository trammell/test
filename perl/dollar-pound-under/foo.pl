#!/usr/bin/perl -l

use strict;
use warnings FATAL => 'all';

@_ = qw( foo bar baz );
print $#_;

@_ = ();
print $#_;

1;

__END__


