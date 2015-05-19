#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/05/25 16:04:53 johnt Exp $

use strict;
use warnings;

eval { exit(1); };   # this is the exit() that is called!!!!

exit(0);  # we never get here

__END__

% perl foo.pl
% echo $?
1
%

