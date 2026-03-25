<?php
include 'conexao.php';

$numero_of = $_POST['numero_of'];
$opd_id = $_POST['opd_id'];

$stmt = $conn->prepare("INSERT INTO `of` (numero_of, opd_id) VALUES (?, ?)");
$stmt->bind_param("si", $numero_of, $opd_id);

if (!$stmt->execute()) {
    die("Erro: " . $stmt->error);
}

header("Location: index.php");