<?php

ini_set('display_errors','on');
error_reporting(E_ALL);

/*
Ez a 2_login.html-hez tartozik.
döntse el a script, hogy beléphet-e vagy sem, az adatbázis alapján
A jelszavak megegyeznek a felhasználó névvel(demo,demo2,stb).
(A jelszavak md5 hash-el vannak tárolva (salt nélkül))

írja ki, hogy "OK" vagy "access denied"
*/

require_once ("dbConnect.php");

$username = isset($_POST['login_form']['username']) && $_POST['login_form']['username'] ? trim($_POST['login_form']['username']) : "";
$password = isset($_POST['login_form']['password']) && $_POST['login_form']['password'] ? trim($_POST['login_form']['password']) : "";
$accessDeniedMessage = "access denied";

if (!$username || !$password) {
    echo $accessDeniedMessage;
    exit;
}

$query = $conn->prepare("SELECT 1 FROM user WHERE username = :username AND password = :password AND active = 1");
$query->execute(['username' => $username, 'password' => md5($password)]);
$user = $query->fetchAll(PDO::FETCH_ASSOC);

if (!$user) {
    echo $accessDeniedMessage;
    exit;
}

echo "OK";
