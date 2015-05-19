<?php


class foo {
    public $bar;
    function baz() { /* nada */ }
}

$a = array(new foo(), new foo());

var_export($a);


