#!/usr/bin/perl

# $Id: bench.pl,v 1.2 2005/08/08 18:45:58 johnt Exp $

use strict;
use warnings;
use Benchmark ':all';
use DBI;

use QueueLib ();
use QueueObj;
use QueueTie;



# define tests to run

use constant DEBUG   => 0;
use constant FIRST   => 1;
use constant COPY    => 1;
use constant COMPARE => 1;
use constant PUSH    => 1;


# define some test configuration globals

my $database  = 'test';
my $userid    = 'johnt';
my $productid = 'testprod';
my $levelid   = 'foo';



# get database handle

warn "fetching database handle...\n";
my $dbh = DBI->connect(
	"DBI:mysql:test:localhost;mysql_read_default_file=$ENV{HOME}/.my.cnf",
	undef, undef, { RaiseError => 1 }
) or die "unable to connect: ", DBI->errstr;
END { $dbh->disconnect if $dbh; }
warn "using database handle: $dbh\n";


# create the queue table
create_queue_table();


# define static counter hash

my %count = (lib => 0, obj => 0, tie => 0);


# define code to get queue via library-style interface

sub sample_lib
{
    my %args = (
		dbh       => $dbh,
		database  => $database,
		userid    => $userid,
		productid => $productid,
		levelid   => $levelid,
		type      => 'lib',
		debug     => DEBUG,
	);
	my @q = QueueLib::qvalues(%args);
	if (FIRST) { my $first = $q[0] }
	if (COPY) { my @copy = @q }
	if (PUSH and COMPARE) {
		die "ack-lib (@{[scalar @q]},$count{lib})\n" unless @q == $count{lib}
	}
	if (PUSH) {
		push @q, int rand(1000);
		&QueueLib::write_queue(%args, data => \@q);  # like push()
	}
    $count{lib}++;
}


# define code to get queue via OO interface

sub sample_obj {
	my %args = (
		dbh       => $dbh,
		database  => $database,
		userid    => $userid,
		productid => $productid,
		levelid   => $levelid,
		type      => 'obj',
		debug     => DEBUG,
	);
    my $queue_obj = QueueObj->new(%args);
	my @q = $queue_obj->qvalues;
    if (FIRST) { my $first = $q[0] }
    if (COPY) { my @copy = @q }
    if (PUSH and COMPARE) {
        die "ack-obj (@{[scalar @q]},$count{obj})\n" unless @q == $count{obj}
    }
	if (PUSH) { $queue_obj->push( int rand(1000) ) }
	undef $queue_obj;
	$count{obj}++;
}


# define code to get queue via tie() interface

sub sample_tie
{ 
	my %args = (
		dbh       => $dbh,
		database  => $database,
		userid    => $userid,
		productid => $productid,
		levelid   => $levelid,
		type      => "tie",
		debug     => DEBUG,
	);
	my @q;
	tie(@q,"QueueTie",%args) or die QueueTie::errstr();
	if (FIRST) { my $first = $q[0] }
	if (COPY) { my @copy = @q }
	if (PUSH and COMPARE) {
		die "ack-tie (@{[scalar @q]},$count{tie})\n" unless @q == $count{tie}
	}
	if (PUSH) { push @q, int rand(1000) }
	untie @q;
	$count{tie}++;
}


# run benchmark test

my $repeat = DEBUG ? 1 : 5000;

my %subs = (
    lib => sub { sample_lib; },
    obj => sub { sample_obj; },
    tie => sub { sample_tie; },
);


timethese( $repeat, \%subs );
cmpthese( $repeat, \%subs );


sub create_queue_table {
    my $sql = qq[
        CREATE TEMPORARY TABLE $database.queue (
            userid varchar(8)         NOT NULL default '',
            productid varchar(8)      NOT NULL default '',
            levelid varchar(8)        NOT NULL default '',
            type varchar(100)         NOT NULL default '',
            queue mediumtext,
            lastmoduser varchar(8)    NOT NULL default '',
            lastmoddate timestamp(14) NOT NULL,
            PRIMARY KEY (userid,productid,levelid,type)
        )
    ];
    $dbh->do($sql) || die 'DBI error: ', $dbh->errstr; 
}

