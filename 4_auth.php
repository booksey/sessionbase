<?php

ini_set('display_errors','on');
error_reporting(E_ALL);

/*
Ezt azért hoztam létre, mert nem volt egyértelmű, hogy a formot ne vonjam össze a bootsrap feladattal, vagy magát az auth.php-t
*/

require_once ("dbConnect.php");

$username = isset($_POST['login_form']['username']) && $_POST['login_form']['username'] ? trim($_POST['login_form']['username']) : "";
$password = isset($_POST['login_form']['password']) && $_POST['login_form']['password'] ? trim($_POST['login_form']['password']) : "";

if (!$username || !$password) {
    return "";
}

$query = $conn->prepare("SELECT 1 FROM user WHERE username = :username AND password = :password AND active = 1");
$query->execute(['username' => $username, 'password' => md5($password)]);
$user = $query->fetchAll(PDO::FETCH_ASSOC);

if (!$user) {
    echo $accessDeniedMessage;
    exit;
}

echo "OK";
