<?php

$mega = 1 << 20;
echo $mega . "\n";
echo memory_get_usage() . "\n";
$msg = sprintf("Memory usage: %.3f MB", memory_get_usage() / $mega);
echo $msg . "\n";

