<?php
$host = 'db';
try {
    $host = 'db';
    $dbname = 'database';
    $user = 'sessionbase';
    $pass = 'sb871234';
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";
    $conn = new PDO($dsn, $user, $pass);
} catch (\Throwable $t) {
    echo 'Error: ' . $t->getMessage();
    echo '<br />';
}
