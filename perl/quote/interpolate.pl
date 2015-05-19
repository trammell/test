#!/usr/local/bin/perl
# $Id: interpolate.pl,v 1.1 2007/05/02 16:53:46 johnt Exp $
# View opcode tree via 'perl -MO=Concise interpolate.pl'

$x = 'Hello ' . $planet;
$y = "Hello $planet";

