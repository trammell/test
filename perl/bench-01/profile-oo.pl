#!/usr/bin/perl

# $Id: profile-oo.pl,v 1.1 2005/08/08 18:45:58 johnt Exp $

use strict;
use warnings;
use Benchmark ':all';
use DBI;

use QueueObj;

# define tests to run

use constant DEBUG => 0;
use constant FIRST => 1;
use constant COPY => 1;
use constant COMPARE => 1;
use constant PUSH => 0;


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

# define OO interface routine

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

# run benchmark test

my $repeat = $debug ? 1 : 5000;

for (1 .. $repeat) {
    sample_obj;
}




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

