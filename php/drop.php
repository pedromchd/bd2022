<?php

// php -c php.ini file.php
// php -S localhost:8080 -c php.ini file.php

$db = new SQLite3("../database.db");
$db->exec("PRAGMA foreign_keys = OFF");
$queries = explode(";", file_get_contents("../sql/lista" . $_GET["lista"] . "/drop.sql"));
foreach ($queries as $query) {
  $db->exec($query);
}
$db->close();
