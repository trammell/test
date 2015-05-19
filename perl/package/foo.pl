#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2006/09/06 17:29:25 johnt Exp $

package main;
use strict;
use warnings;

Mammal->showpkg;
Dog->showpkg;
Mutt->showpkg;

package Mammal;
sub showpkg {
    my $class = shift;
    my $package = __PACKAGE__;
    warn "showpkg: class=$class, package=$package\n";
}

package Dog;
use base 'Mammal';

package Mutt;
use base 'Dog';

