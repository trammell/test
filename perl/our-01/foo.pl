#!perl -l

use strict;
use warnings;
use diagnostics;

our $var = 1;
{
    local($var) = (2);
    print "\$var = $var";
}
print "\$var = $var";

__END__

$var = 2
$var = 1

