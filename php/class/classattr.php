<?php

class aaa {
    public static $foo = 'fleedle';
}

class bbb {
    function __construct($a) {
        $this->a = $a;
    }
    public function bar() {
        return $this->a->foo;
    }
}

echo aaa::$foo, "\n";


$a = new aaa();
echo $a::$foo, "\n";

$b = new bbb($a);
echo $b->bar();


