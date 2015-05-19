
#
# $Id: QueueObj.pm,v 1.1 2005/05/25 17:27:00 johnt Exp $
#

package QueueObj;

use strict;
use Carp 'carp';
use vars qw[ $ERRSTR ];
$ERRSTR = "";

1;

sub new
{
	my ($class,%args) = @_;
	for (qw[dbh database productid levelid userid type])
	{
		(errstr("argument $_ undefined"),return) unless defined($args{$_})
	}
	my $self = bless { %args, DATA => [] }, $class;
	my %defaults = ( autocommit => 0, debug => 0, vivify => 1 );
	while (my ($k,$v) = each %defaults)
	{
		$self->{$k} = $v unless exists $self->{$k}
	}
	carp "in QueueObj constructor\n" if $self->{debug};
	return $self->read_queue;
}

sub qvalues
{
	my $self = shift;
	carp "returning queue values\n" if $self->{debug};
	return @{$self->{DATA}};
}

sub push
{
	my $self = shift;
	carp "pushing @_\n" if $self->{debug};
	push @{$self->{DATA}}, @_;
    return $self->{autocommit} ? $self->write_queue : $self;
}

sub DESTROY
{
	return $_[0]->write_queue;
}

#
# internal "utility" methods
#

sub read_queue
{
    my $self = shift;
	carp "reading queue\n" if $self->{debug};
    for (qw[dbh database productid levelid userid type DATA])
    {
        (errstr("argument $_ undefined"),return) if !defined($self->{$_})
    }
    my $sql = qq[
        SELECT queue FROM $self->{database}.queue
        WHERE productid = ? AND levelid = ?
		AND userid = ? AND type = ?
    ];
    my $q = $self->{dbh}->selectall_arrayref(
        $sql,{},$self->{productid},$self->{levelid},$self->{userid},$self->{type}
    );
    (errstr("bad query"), return) unless $q && UNIVERSAL::isa($q,"ARRAY");
    if ((@$q == 1) && (@{$q->[0]} == 1))
    {
        @{$self->{DATA}} = split(" ",$q->[0][0]);
		return $self;
    }

	if ($self->{vivify})
	{
		carp "making empty queue in database\n" if $self->{debug};
		@{$self->{DATA}} = ();
		return $self->write_queue;
	}
	else
	{
		$self->{forbidwrite}++;
		errstr("queue not found");
		return;
	}
}

sub commit
{
	return $_[0]->write_queue;
}

sub write_queue
{
	my $self = shift;
	carp "writing queue\n" if $self->{debug};
    for (qw[dbh database productid levelid userid type DATA])
    {
        (errstr("argument $_ undefined"),return) if !defined($self->{$_})
    }
    my $sql = qq[
        REPLACE INTO $self->{database}.queue
		SET userid = ?, productid = ?, levelid = ?,
		type = ?, queue = ?, lastmoduser = ?
    ];
    my @bind = (
        $self->{userid},
        $self->{productid},
		$self->{levelid},
        $self->{type},
        join(" ",@{$self->{DATA}}),
		$self->{userid},
    );
    $self->{dbh}->do($sql,{},@bind) ||
        (errstr("database error: @{[$self->{dbh}->errstr()]}"), return);
    return $self;
}

sub errstr
{
	if (@_) { $ERRSTR = sprintf "%s: %s", (caller(1))[3], join("",@_) }
	return $ERRSTR; 
}


