#!/usr/bin/perl

# http://stackoverflow.com/questions/3195174/what-does-package-foo-mean

use strict;
use warnings;
use Data::Dumper;

{
    package Foo::Foo;
    sub get_user {
        my $user = __PACKAGE__->{user};
        if (!defined $user) {
            $user = "fred";
            __PACKAGE__->{user} = $user;
        }
        return $user;
    }
}

print "some package:\n";
print Dumper({%Foo::});
print Dumper({%Foo::Foo::});

print ">", Foo::Foo->get_user, "<\n";
print Dumper({%Foo::});
print Dumper({%Foo::Foo::});
print Dumper({%Foo::Foo});
