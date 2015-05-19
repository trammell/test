# $Id: getdbh.pl,v 1.1 2005/06/13 16:10:15 johnt Exp $

use strict;
use warnings;
use DBI;

sub get_dbh {
    my $dbh = DBI->connect(
        "DBI:mysql:elc_shrm:localhost;mysql_read_default_file=$ENV{HOME}/.my.cnf",
        my $user, my $password, { RaiseError => 1 }
    ) or die 'DBI error: ', DBI->errstr;
    END { $dbh->disconnect if $dbh }
    return $dbh;
}

1;

