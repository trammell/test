<?php

$aaa = new \ArrayObject(array('uno','dos','tres'));

foreach ($aaa as $a) {
    echo ">>$a<<\n";
    echo $aaa->getIterator()->key();
}

