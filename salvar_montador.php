<?php
include 'conexao.php';

$nome = $_POST['nome'];
$montagem_id = $_POST['montagem_id'];

$stmt = $conn->prepare("INSERT INTO montador (nome, montagem_id) VALUES (?, ?)");
$stmt->bind_param("si", $nome, $montagem_id);

if (!$stmt->execute()) {
    die("Erro: " . $stmt->error);
}

header("Location: montador.php");