<?php

// php -c php.ini file.php
// php -S localhost:8080 -c php.ini file.php

$db = new SQLite3("../database.db");
$db->exec("PRAGMA foreign_keys = ON");
$queries = explode(";", file_get_contents("../sql/lista" . $_GET["lista"] . "/insert.sql"));
foreach ($queries as $query) {
  $db->exec($query);
  echo $db->changes() . " linhas(s) incluída(s). ";
  echo $db->lastInsertRowID() . " é o código da última linha incluída.<br>";
}
$db->close();
