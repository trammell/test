#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Data::Dumper;

{
    package Fake::Session;
    use Data::Dumper;

    sub new {
        my $class = shift;
        return bless {@_}, $class;
    }

    sub dump {
        my $self = shift;
        warn Data::Dumper->Dump([$self], ['$handler']);
    }

    sub session {
        my $self = shift;
        my %s = do {
            my %hash = (_session_id => 3);
            %hash;
        };
        $self->{session} = \%s;
        $self->{session_id} = $s{_session_id};
        return $self->{session};
    }

    sub cleanup_session {
        warn "in cleanup_session\n";
        my $self = shift;
        undef $self->{session};
    }

    sub DESTROY {
        warn "in DESTROY\n";
        $_[0]->cleanup_session;
    }
}

warn "session: ", \%Some::Other::Package::session, "\n";
warn '=' x 40, "\n";
{
    warn "entering block\n";
    my %args = (foo => 1);
    my $session = Fake::Session->new(%args)->session;
    local *Some::Other::Package::session = $session;
    warn "session: ", \%Some::Other::Package::session, "\n";
    warn "leaving block\n";
}
warn '=' x 40, "\n";
warn "session: ", \%Some::Other::Package::session, "\n";
warn '=' x 40, "\n";
{
    warn "entering block\n";
    #no warnings 'once';
    my %args = (foo => 2);
    warn "constructing session handler";
    my $handler = Fake::Session->new(%args);
    warn "constructing session";
    my $session = $handler->session;
    $handler->dump;
    warn Dumper($session);
    warn "aliasing session";
    local *Some::Other::Package::session = $session;
    warn "session: ", \%Some::Other::Package::session, "\n";
    
    warn "(in block) session contains keys: ", keys(%Some::Other::Package::session);
    warn "session: ", \%Some::Other::Package::session, "\n";
    warn "leaving block\n";
}
warn '=' x 40, "\n";

warn "(out of block) session contains keys: ", keys(%Some::Other::Package::session);
warn "session: ", \%Some::Other::Package::session;
