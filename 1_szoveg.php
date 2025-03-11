<?php

ini_set('display_errors','on');
error_reporting(E_ALL);

$szoveg = "ubuntu;as;ubeu;dubuaedv;eugbuoqw;sdfqobf;dslbuv;hiqfb;dsviqf;bh28;buas33;vhais3;7vb;bue;nb";
$findme = 'u';
$tomb = array();
$delim = ";";


/*
a $szoveg tartalmát válaszd szét a ";"-k ($delim) mentén
azokat a részeket, amiben van $findme (u) betű mentsd el a $tomb külön-külön elemeibe, sorban a 0. indextől kezdve
elég egy var_dump()
*/

$explodedText = explode($delim, $szoveg);
foreach($explodedText as $string) {
    if (preg_match("/" . $findme . "/", $string)) {
        $tomb []= $string;
    }
}

var_dump($tomb);