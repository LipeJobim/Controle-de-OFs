<?php
$conn = new mysqli("localhost", "root", "root", "CD");

if ($conn->connect_error) {
    die("Erro: " . $conn->connect_error);
}
?>