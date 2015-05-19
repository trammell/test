#!/usr/local/bin/perl
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use CGI qw/:standard/;

my $css = qq/
p {
    border: thin solid black;
    orphans: 10;
    widows: 10;
}
p + p {
    page-break-before: always;
}
/;

print
    start_html(
        -title=>'css-page-break-test',
        -style => { -code => $css }
    ),
    h1('A Simple Example'),
    p(lorem()),
    p(lorem()),
    p(lorem()),
    hr;

sub lorem {
    return <<"LOREM";
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum hendrerit,
odio a dictum dapibus, leo magna tempus leo, id sollicitudin ligula erat ac
nulla. Nunc luctus, urna at sagittis elementum, magna sapien vulputate dui,
sed dignissim velit risus sit amet odio. Quisque sed tellus vitae mi pharetra
dignissim. Fusce nisi tellus, volutpat sit amet tincidunt sed, suscipit vel
dolor. Quisque viverra nunc et risus scelerisque et blandit quam laoreet.
Quisque mattis condimentum nisl eu feugiat. Aenean vestibulum magna id augue
scelerisque eleifend. Aliquam euismod nunc eu eros venenatis commodo. Aenean
purus nunc, scelerisque non ullamcorper sit amet, mattis sed nunc. Fusce vel
turpis nisi, quis iaculis magna. Ut ultricies sapien eu nisi euismod
dignissim. Quisque tristique odio id est dignissim non faucibus risus
fringilla. Praesent vel quam sem. Cras id porttitor ligula. Vestibulum eget
purus vitae enim mattis consequat vitae quis ante. Suspendisse potenti. Donec
iaculis nulla ac diam vehicula venenatis. Donec mollis imperdiet hendrerit.
Integer purus lacus, auctor eu tempor ac, pharetra eu ligula. Aliquam erat
volutpat.

Donec et imperdiet felis. Maecenas id augue velit, vitae sagittis massa.
Aliquam id quam sit amet nibh blandit tempor. Morbi ac orci lectus, commodo
porta lectus. Nullam sollicitudin rutrum suscipit. Ut molestie eros magna, non
condimentum nunc. Proin at lacus quis dui molestie faucibus. Quisque aliquet
suscipit iaculis. Aliquam erat volutpat. Sed eget lorem quis risus tempus
cursus quis vestibulum enim. Maecenas pulvinar odio ac mauris suscipit
molestie. Ut ac felis ut urna consequat lacinia. Nullam massa metus,
adipiscing quis bibendum in, lacinia sit amet lectus. Ut ac sapien risus. Cras
pellentesque condimentum elementum. Curabitur vitae sem at est rhoncus
accumsan ut ac quam. Vestibulum purus nisl, semper vel congue quis, aliquet
nec nunc. Mauris quam ante, pulvinar at accumsan eu, vestibulum a magna.
Curabitur eleifend risus rutrum ipsum lacinia ut fringilla sem sollicitudin.
LOREM
}
