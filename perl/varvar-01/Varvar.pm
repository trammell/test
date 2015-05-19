# $Id: Varvar.pm,v 1.3 2005/08/05 17:32:39 johnt Exp $

package Varvar;

use strict;
use warnings;
use base 'Exporter';

@Varvar::EXPORT_OK = qw/ addvar /;

sub import {
    my %args;
    my %default = (
        namespace => 'Varvar::Scratch',
    );
    if (ref($_[-1]) =~ /HASH/) {
        %args = (%default, %{ pop() });
    }
    __PACKAGE__->export_to_level(1, @_);
    $Varvar::namespace = $args{namespace};
}

sub var_exists {


}

sub create_var {


}

sub get_var {
    my $varname = shift;
  
#

    my ($sigil, $name) = ($varname =~ /^[$@%][\w]+$/);

    {
        no strict 'refs';
        

    }


    return $ref;
}


