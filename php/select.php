<?php

// php -c php.ini file.php
// php -S localhost:8080 -c php.ini file.php

$db = new SQLite3("../lista" . $_GET["lista"] . "/database.db");
$db->exec("PRAGMA foreign_keys = ON");
$queries = file("../lista" . $_GET["lista"] . "/sql/select.sql");
foreach ($queries as $query) {
  echo $query . "<br>";
  $results = $db->query($query);
  while ($row = $results->fetchArray()) {
    foreach ($row as $key => $value) {
      if (gettype($key) === "string") {
        echo "{$key}: {$value} - ";
      }
    }
    echo "<br>";
  }
  echo "<br>";
}
$db->close();
