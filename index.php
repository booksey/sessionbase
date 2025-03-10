<?php

try {
    $host = 'db';
    $dbname = 'database';
    $user = 'sessionbase';
    $pass = 'sb871234';
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";
    $conn = new PDO($dsn, $user, $pass);
    echo 'Database connected successfully';
} catch (\Throwable $t) {
    echo 'Error: ' . $t->getMessage();
    echo '<br />';
}
