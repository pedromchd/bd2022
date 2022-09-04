<?php

// php -c php.ini file.php
// php -S localhost:8080 -c php.ini file.php

$db = new SQLite3("../database.db");
$db->exec("PRAGMA foreign_keys = ON");
$queries = file("../sql/select.sql");
foreach ($queries as $query) {
  $results = $db->query($query);
  while ($row = $results->fetchArray()) {
    echo $row["nome"];
  }
}
$db->close();
