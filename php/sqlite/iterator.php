#!/usr/bin/php
<?php

/* create an in-memory DB and attach foo, bar */
$pdo = new PDO('sqlite::memory:');
$pdo->query("CREATE TABLE x (id INTEGER PRIMARY KEY ASC, name varchar(100))");
$pdo->query("INSERT INTO x VALUES (1, 'fred')");
$pdo->query("INSERT INTO x VALUES (2, 'barney')");
$pdo->query("INSERT INTO x VALUES (3, 'wilma')");
$pdo->query("INSERT INTO x VALUES (4, 'betty')");

/* get the results the old-fashioned way */
$stmt = $pdo->prepare('SELECT id, name FROM x WHERE id > ?');
$stmt->execute(array(2));
foreach ($stmt as $row) {
    var_export($row);
}



/* embed the query in an object, then iterate over the object with foreach */

class A implements IteratorAggregate {
    public $stmt;
    public function __construct(\PDO $pdo) {
        $this->stmt = $pdo->prepare('SELECT id, name FROM x WHERE id > ?');
        $this->stmt->execute(array(2));
        $this->stmt->setFetchMode(\PDO::FETCH_ASSOC);
        #echo "{$this->stmt}\n";
    }
    public function getIterator() {
        #$foo = new ArrayObject(array(1,2,3,4,5));
        #return new IteratorIterator($foo);
        return new IteratorIterator($this->stmt);
    }
}

echo "Iterating ...\n";
$a = new A($pdo);
foreach ($a as $row) {
    var_export($row);
}

