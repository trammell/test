#!/usr/bin/php
<?php

create_foo();
create_bar();


/* create an in-memory DB and attach foo, bar */
$pdo = new PDO('sqlite::memory:');
$pdo->query("ATTACH 'db.foo' AS foo");
$pdo->query("ATTACH 'db.bar' AS bar");

$sql = "SELECT * FROM foo.t1 JOIN bar.t2 ON t1.id = t2.id";
foreach ($pdo->query($sql) as $row) {
    var_export($row);
}

function create_foo() {
    $pdo = new PDO('sqlite:db.foo');
    $pdo->query("CREATE TABLE t1 (id INTEGER PRIMARY KEY ASC, name varchar(100))");
    $pdo->query("REPLACE INTO t1 VALUES (1, 'fred')");
    $pdo->query("REPLACE INTO t1 VALUES (2, 'barney')");
}

function create_bar() {
    $pdo = new PDO('sqlite:db.bar');
    $pdo->query("CREATE TABLE t2 (id INTEGER PRIMARY KEY ASC, name phone(100))");
    $pdo->query("INSERT INTO t2 VALUES (1, '111-2222')");
    $pdo->query("INSERT INTO t2 VALUES (2, '333-4444')");
}

