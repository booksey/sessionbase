<?php

require_once "dbConnect.php";

/*
1.
Kérdezd le az adatbázisból az ÖSSZES rendelést, úgy hogy csatold is hozzá a megjegyzéseket
elég az SQL lekérdezés
*/

$query = "SELECT * FROM rendeles r LEFT JOIN rendeles_megjegyzes rm ON r.id = rm.rendeles_id";

/*
2.
* Módosítsd azon rendelések státuszát amelyek feldolgozásra várnak(0), az új státusz feldolgozva legyen(1).
*/
$query = $conn->prepare("UPDATE rendeles SET status_id = :active WHERE status_id = :inactive");
$query->execute(['active' => 1, 'inactive' => 0]);

/*
3.
Kérdezd le az adatbázisból az egyes rendelések (VÉG)összegeit
elég az SQL lekérdezés
 */

 $query = "SELECT r.id rendeles_id, SUM(darab * egysegar) vegosszeg FROM rendeles r LEFT JOIN rendeles_tetel rt ON r.id = rt.rendeles_id GROUP BY r.id";