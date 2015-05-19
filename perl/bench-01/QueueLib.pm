
#
# $Id: QueueLib.pm,v 1.1 2005/05/25 17:26:59 johnt Exp $
#

package QueueLib;

use Carp;
use strict;
use vars qw[ $ERRSTR ];
$ERRSTR = "";

1;

sub qvalues
{
	my %args = @_;
	carp "QueueLib: reading queue\n" if $args{debug};
	for (qw[dbh database productid levelid userid type])
	{
		(errstr("argument $_ undefined"),return) if !defined($args{$_})
	}
	my $sql = qq[
        SELECT queue FROM $args{database}.queue
        WHERE productid = ? AND levelid = ?
		AND userid = ? AND type = ?
    ];
	my @vals = ($args{productid},$args{levelid},$args{userid},$args{type});
	my $q = $args{dbh}->selectall_arrayref($sql,{},@vals);
	(errstr("bad query"), return) unless $q && UNIVERSAL::isa($q,"ARRAY");
	if ((@$q == 1) && (@{$q->[0]} == 1))
    {
		return split " ", $q->[0][0];
    }

	if ($args{vivify})
	{
		carp "QueueLib: forcing empty queue\n" if $args{debug};
		write_queue(%args, data => [] );
		return ();
	}
	else
	{
		errstr("queue not found");
		return;
	}
}

sub push
{
	my %args = @_;
	carp "QueueLib: pushing @_\n" if $args{debug};
	my @queue = qvalues(%args);
	push @queue, @{$args{data}};
	write_queue(%args, data => [@queue]);
	return 1;
}

sub write_queue
{
	my %args = @_;
	carp "QueueLib: writing queue\n" if $args{debug};
	for (qw[dbh database productid levelid userid type data])
	{
		(errstr("argument $_ undefined"),return) unless defined $args{$_}
	}
	my $sql = qq[
		REPLACE INTO $args{database}.queue
		SET userid = ?, productid = ?, levelid = ?,
		type = ?, queue = ?, lastmoduser = ?
	];
	my @vals = ($args{userid},$args{productid},$args{levelid},$args{type},
		join(" ",@{$args{data}}),$args{userid});
	$args{dbh}->do($sql,{},@vals) ||
		(errstr("database error: @{[$args{dbh}->errstr()]}"), return);
	return 1;
}

sub errstr
{
	if (@_) { $ERRSTR = sprintf "%s: %s", (caller(1))[3], join("",@_) }
	return $ERRSTR;
}

