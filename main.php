<?php

$db = new SQLite3("banco.db");
$db->exec("PRAGMA foreign_keys = ON");
$queries = explode(";", "lista10.sql");
foreach($queries as $query) {
  $db->exec($query);
};
$db->close();

?>
