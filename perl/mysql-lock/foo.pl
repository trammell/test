#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/09/19 16:13:24 johnt Exp $

use strict;
use warnings;
use DBI;

create_forktest();

if (fork()) {
    my $dbh = dbh(); # get parent dbh
    warn "PARENT: starting\n";
    $dbh->do('LOCK TABLE forktest READ');
    for (1 .. 5) {
        warn "PARENT: ... sleeping $_ of 5\n";
        sleep 1;
    }
    $dbh->do('UNLOCK TABLES');
    my ($count) = $dbh->selectrow_array('SELECT COUNT(*) FROM forktest WHERE x=?', undef, 2);
    warn "PARENT: count=$count\n";
    warn "PARENT: exiting\n";
    $dbh->disconnect;
}
else {
    warn "CHILD: starting\n";
    sleep(1);
    my $dbh = dbh();
    #DBI->trace(1);
    eval {
        local $SIG{ALRM} = sub { die "CHILD: timeout!"; };
        alarm(2);
        warn "CHILD: db connection succeeded\n" if $dbh;
        $dbh->do('INSERT INTO forktest (x) VALUES (1), (2), (3)');
        $dbh->commit;
        warn "CHILD: inserted data.\n";
        alarm(0);
    };
    warn $@ if $@;
    warn "CHILD: exiting.\n";
    $dbh->disconnect;
}

sub dbh {
    my %opts = (
        AutoCommit               => 0,
        RaiseError               => 1,
        mysql_read_default_file  => '/usr/local/elc/etc/my.cnf',
        mysql_read_default_group => 'utf8_client',
    );
    DBI->connect('dbi:mysql:test', undef, undef, \%opts);
}

sub create_forktest {
    my $dbh = dbh();
    $dbh->do('DROP TABLE IF EXISTS forktest');
    $dbh->do('CREATE TABLE IF NOT EXISTS forktest (x INT) ENGINE=InnoDB');
    $dbh->commit;
    $dbh->disconnect;
}

