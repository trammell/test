# $Id: 10-basic.t,v 1.1 2005/08/05 17:16:48 johnt Exp $

use strict;
use warnings;
use Varvar 'addvar';
use Test::More;

my $foo = '@mylist_jkl';

addvar($foo);   # add @mylist_jkl to scratch scope






