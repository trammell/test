#!/usr/bin/php
<?php

/* create an in-memory DB, create tables in different databases, populate
 * them and run a join...
 */

$pdo = new PDO('sqlite::memory:');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->query("ATTACH DATABASE ':memory:' AS db1");   /* this is how we create an in-memory DB in SQLite */
$pdo->query("ATTACH DATABASE ':memory:' AS db2");

$pdo->query("CREATE TABLE db1.t1 (id INTEGER PRIMARY KEY ASC, name varchar(100))");
$pdo->query("REPLACE INTO db1.t1 VALUES (1, 'fred')");
$pdo->query("REPLACE INTO db1.t1 VALUES (2, 'barney')");
$pdo->query("REPLACE INTO db1.t1 VALUES (3, 'wilma')");
$pdo->query("REPLACE INTO db1.t1 VALUES (4, 'pebbles')");

$pdo->query("CREATE TABLE db2.t2 (id INTEGER PRIMARY KEY ASC, t1_id INTEGER, phone VARCHAR(100))");
$pdo->query("INSERT INTO db2.t2 (t1_id, phone) VALUES (1, '111-2222')");
$pdo->query("INSERT INTO db2.t2 (t1_id, phone) VALUES (2, '333-4444')");
$pdo->query("INSERT INTO db2.t2 (t1_id, phone) VALUES (3, '555-6666')");
$pdo->query("INSERT INTO db2.t2 (t1_id, phone) VALUES (3, '777-1212')"); /* Wilma gots 2 phones yo */

# $sth = $pdo->prepare('SELECT * FROM db1.t1');
# if ($sth->execute()) {
#     while ($row = $sth->fetch()) { var_export($row); }
# }

/* join the databases */
$sql = "SELECT * FROM db1.t1 JOIN db2.t2 ON t1.id = t2.t1_id";
foreach ($pdo->query($sql) as $row) {
    var_export($row);
    print "\n";
}
