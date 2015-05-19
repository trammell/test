#!/usr/local/bin/perl
# $Id: nice.pl,v 1.1 2006/08/11 18:06:17 johnt Exp $

package main;
use strict;
use warnings;

sub nice_string {
    join(
        "",
        map {
            $_ > 255
              ?    # if wide character...
              sprintf("\\x{%04X}", $_)
              :    # \x{...}
              chr($_) =~ /[[:cntrl:]]/
              ?    # else if control character ...
              sprintf("\\x%02X", $_)
              :                     # \x..
              quotemeta(chr($_))    # else quoted or as themselves
          } unpack("U*", $_[0])
    );                              # unpack Unicode characters
}

1;

