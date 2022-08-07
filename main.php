<?php

$db = new SQLite3("banco.db");
$db->exec("PRAGMA foreign_keys = ON");
$db->exec("INSERT INTO tabela (foo, bar) VALUES ('ABC', '123')");
$db->close();

?>
