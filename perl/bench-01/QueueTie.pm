
#
# $Id: QueueTie.pm,v 1.1 2005/05/25 17:27:00 johnt Exp $
#

package QueueTie;

use strict;
use Carp 'carp';
use vars qw[ $ERRSTR ];
$ERRSTR = "";

1;

=head1 NAME

ELC::SHRM::LS2002::TieQueue.pm - package to tie a SHRM LS 2002 queue to a Perl array

=head1 SYNOPSIS

 my @queue;
 my %args = (
     dbh => $dbh,
     database => "elc_shrm",
     userid => "johnt",
     productid => "ls2002",
	 levelid => "phr",
     type => "module1",
 );
 tie(@queue,"ELC::SHRM::LS2002::TieQueue",%args)
 	|| die ELC::SHRM::LS2002::TieQueue::errstr();

 # manipulate @queue

 my $question = pop @queue;

 # commit @queue to database

 tied(@queue)->commit || die ELC::SHRM::LS2002::TieQueue::errstr();

 # more @queue manipulations

 unshift @queue, $question_2;

 # untie @queue (forces a commit)

 untie @queue;


=head1 DESCRIPTION

This module ties the contents of a database queue to a Perl array.
The initial tie() reads from the database, and the final destruction
of the tied variable writes the queue back to the database.


=head1 TIE ARGUMENTS / OPTIONS

=head2 dbh

This argument should point to a valid DBI-compatible database handle
object.  This argument has no default, and the tie() will fail if it is
not specified.

=head2 database, productid, levelid, userid, type

These arguments specify the queue to which the array variable will be
tied.  They have no default values, and the tie() will fail if any are
left unspecified.

=head2 autocommit

The default behavior of the tie object is to commit the queue data to
the database only upon the final destruction of the object.
If argument C<autocommit> is set to a true value, the queue data will
be committed to the database after every operation that modifies the
queue object.

=head2 vivify

The default behavior of the tie object is to create an empty queue
if the initial tie fails to find the indicated queue in the database.
If argument C<vivify> is set to a false value, the tie will call die()
if the specified queue doesn't exist in the database.

=head2 debug

Set this option to a true value to enable debugging messages on STDERR.
This argument defaults to false.


=head1 ERROR HANDLING

Tied methods that return a value will return I<undef> in case of error.
Package routine errstr() returns a string containing a descriptive
error message (see the SYNOPSIS and EXAMPLES sections for usage).


=head1 EXAMPLES

=head2 Initializing several queues

 # define shared queue characteristics

 my %args = (
     dbh => $dbh,
     database => "elc_shrm",
     userid => "patm",
     productid => "ls2002",
     levelid => "sphr",
 );
 my @queue_types = ("q1","q2","q3",);
 foreach my $type (@queue_types)
 {
     my @q;
     tie(@q,"ELC::SHRM::LS2002::TieQueue", %args, type => $type);
	 untie(@q);
 }


=head1 VALID OPERATIONS

The following array-manipulation functions work with tied queues:
push(), pop(), shift(), unshift(), and splice().

In addition, the standard array-access methods, e.g. $array[3], 
@array[1,3,5] should work.  Note, however, that any "empty" array
portions are not retained upon saving; for instance, if the
following question list of six values is saved:

  1-1, 1-2, 1-4, undef, 2-10, 3-8

re-reading the list will return only five values:

  1-1, 1-2, 1-4, 2-10, 3-8

For this reason, using the push(), pop(), etc. functions is recommended,
as they should make it harder to enter empty queue values.


=head1 TO DO

 * add a queue-locking mechanism to avoid race conditions (a 'lock'
   column in the table perhaps?  A control-character (or -string)
   in the queue field?)
 * make value-saving handle "empty" values more robustly



=head1 VERSION

 $Id: QueueTie.pm,v 1.1 2005/05/25 17:27:00 johnt Exp $


=cut




sub TIEARRAY
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

	carp "TIEARRAYing\n" if $self->{debug};
	return $self->read_queue;
}

sub FETCH
{
	my ($self,$index) = @_;
	carp "FETCHing\n" if $self->{debug};
	return $self->{DATA}[$index];
}

sub FETCHSIZE
{
	my $self = shift;
	carp "FETCHSIZEing\n" if $self->{debug};
	return scalar(@{$self->{DATA}});
}

sub STORE
{
	my ($self,$index,$value) = @_;
	carp "STOREing\n" if $self->{debug};
	$self->{DATA}[$index] = $value;
	return $self->{autocommit} ? $self->write_queue : $self;
}

sub DESTROY
{
	my $self = shift;
	carp "DESTROYing...\n" if $self->{debug};
	$self->write_queue unless $self->{forbidwrite};
}

sub CLEAR
{ 
	my $self = shift;
    carp "CLEARing\n" if $self->{debug};
	@{$self->{DATA}} = ();
    return $self->{autocommit} ? $self->write_queue : $self;
}

sub PUSH
{
	my $self = shift;
	carp "PUSHing @_\n" if $self->{debug};
	push @{$self->{DATA}}, @_;
    return $self->{autocommit} ? $self->write_queue : $self;
}

sub POP
{
	my $self = shift;
    carp "POPing\n" if $self->{debug};
	return pop @{$self->{DATA}};
}

sub UNSHIFT
{
	my $self = shift;
    carp "UNSHIFTing @_\n" if $self->{debug};
    unshift @{$self->{DATA}}, @_;
    return $self;
}

sub SHIFT
{
	my $self = shift;
    carp "SHIFTing\n" if $self->{debug};
	return shift @{$self->{DATA}};
}

sub SPLICE
{
	my ($self,$offset,$length,$list) = @_;
    carp "SPLICEing\n" if $self->{debug};
	return splice(@{$self->{DATA}},$offset,$length,$list);
}

sub STORESIZE { return shift; }
sub EXTEND    { return shift; }



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
		warn "QueueTie: forcing empty queue\n" if $self->{debug};
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

