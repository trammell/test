#!/usr/local/bin/perl
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use Test::More 'no_plan';
use Test::MockObject::Extends;

{
    package MyClass;
    use overload q{""} => \&name;
    sub new {
        my $class = shift;
        return bless { @_ }, $class;
    }
    sub name { 'myobj' };
}


my $obj = MyClass->new();
ok($obj);
is($obj->name,'myobj');

my $mock = Test::MockObject::Extends->new('MyClass');
$mock->mock('name', sub { warn "=> 1"; "foo"; });
$mock->mock(q{""}, sub { warn "=> 2"; "bar"; });

is($mock->name,"foo");
is("$mock","bar");

__END__

I have a perl object that has defined use overload '""' => \&name; and a name
method.

In my unittests I have mocked this object, including the name method, but code
like

if (-d $object)

still gives me "Use of uninitialized value in -d ...". The mocked method is
not being executed.

My mock code:

my $CMmock = Test::MockObject::Extends->new('MyClass');
$CMmock->mock('name', sub { print "TEST!\n";});
$CMmock->mock('""', sub {print "TEST!\n";});

Other methods that I have mocked are working.

