<?php
include 'conexao.php';

$nome = $_POST['nome'];
$montador = !empty($_POST['montador_nome']) ? $_POST['montador_nome'] : NULL;

$stmt = $conn->prepare("INSERT INTO opd (nome, montador_nome) VALUES (?, ?)");
$stmt->bind_param("ss", $nome, $montador);
$stmt->execute();

header("Location: opds.php");