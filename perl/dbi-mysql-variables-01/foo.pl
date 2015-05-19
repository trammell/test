#!perl -l

use strict;
use warnings;
use Data::Dumper;
use ELC::DBH;

my $dbh = ELC::DBH::get_local_dbh() or die "Can't get \$dbh";

my %variables = get_variable($dbh,'inno%');
print Dumper(\%variables);

sub get_variable {
    my ($dbh,$var) = @_;
    my $sql = q[ SHOW VARIABLES LIKE ? ];
    my $rows = $dbh->selectall_arrayref($sql,undef,$var);
    map { $_->[0], $_->[1] } @$rows;
}

__END__

$VAR1 = {
          'innodb_force_recovery' => '0',
          'innodb_lock_wait_timeout' => '50',
          'innodb_log_group_home_dir' => '',
          'innodb_data_home_dir' => '',
          'innodb_log_buffer_size' => '1048576',
          'innodb_flush_method' => '',
          'innodb_log_files_in_group' => '2',
          'innodb_flush_log_at_trx_commit' => '1',
          'innodb_thread_concurrency' => '8',
          'innodb_mirrored_log_groups' => '1',
          'innodb_additional_mem_pool_size' => '1048576',
          'innodb_log_arch_dir' => '',
          'innodb_fast_shutdown' => 'ON',
          'innodb_log_archive' => 'OFF',
          'innodb_log_file_size' => '5242880',
          'innodb_file_io_threads' => '4',
          'innodb_buffer_pool_size' => '8388608',
          'innodb_data_file_path' => ''
        };

