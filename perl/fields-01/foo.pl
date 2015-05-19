#!perl -l

use strict;
use warnings;
$^W = 1;
$| = 1;

{
    package Foo;
    use fields qw/ foo bar _Foo_private /;
    sub new {
        print "\@_: @_";
        my Foo $self = shift;
        print "\$self: $self";
        unless (ref $self) {
            $self = fields::new($self);
            $self->{_Foo_private} = "this is Foo's secret";
        }
        $self->{foo} = 10;
        $self->{bar} = 20;
        return $self;
    }
}

print for keys %Foo::FIELDS;

my $var = Foo->new;
$var->{foo} = 42; 

# this will generate an error
#$var->{zap} = 42;

# subclassing
{
    package Bar;
    use base 'Foo';
    use fields qw(baz _Bar_private);        # not shared with Foo
    sub new {
        my $class = shift;
        my $self = fields::new($class);
        $self->SUPER::new();                # init base fields
        $self->{baz} = 10;                  # init own fields
        $self->{_Bar_private} = "this is Bar's secret";

        # change Foo fields

        $self->{foo} = 137;
        $self->{bar} = 99;
        #$self->{_Foo_private} = "new secret for Foo";
        return $self;
    }
}

my $x = Bar->new;
$x->{baz} = 3.14;
$x->{_Bar_private} = 'shamalamadingdong';
print $x->{_Bar_private};

