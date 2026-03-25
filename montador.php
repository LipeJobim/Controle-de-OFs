<?php include 'conexao.php'; ?>

<h2>Cadastrar Montador</h2>
<link rel="stylesheet" href="estilo.css">

<div class="menu">
    <a href="index.php">Início</a>
</div>
<br>
<form action="salvar_montador.php" method="POST">

<input type="text" name="nome" placeholder="Nome do montador" required>
    
<select name="montagem_id" required>
    <option value="">Selecione a Montagem</option>
    <?php
    $montagens = $conn->query("SELECT * FROM montagem");
    while($m = $montagens->fetch_assoc()){
        echo "<option value='{$m['id']}'>Montagem {$m['numero']}</option>";
    }
    ?>
</select>

<button type="submit">Salvar</button>

</form>