<?php include 'conexao.php'; ?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar OPD</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>

<div class="header">
    Sistema de Controle de OFs
</div>

<div class="menu">
    <a href="index.php">Início</a>
    <a href="of.php">Cadastrar OF</a>
    <a href="montador.php">Cadastrar Montador</a>
</div>

<div class="container">

    <h2>Cadastrar OPD</h2>

    <form action="salvar_opd.php" method="POST">

    <input type="text" name="nome" placeholder="Nome da OPD" required>

    <input type="text" name="montador_nome" placeholder="Montador (opcional)">

    <button type="submit">Salvar</button>

</form>

</div>

</body>
</html>