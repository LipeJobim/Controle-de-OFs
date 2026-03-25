<?php include 'conexao.php'; ?>

<h2>Cadastrar OF</h2>
<link rel="stylesheet" href="estilo.css">

<div class="menu">
    <a href="index.php">Início</a>
</div>
<br>
<form action="salvar_of.php" method="POST">

    <input type="text" name="numero_of" placeholder="Número da OF" required>
    <select name="opd_id" required>
        <option value="">Selecione a OPD</option>
        <?php
        $opds = $conn->query("SELECT * FROM opd");
        while($o = $opds->fetch_assoc()){
            echo "<option value='{$o['id']}'>{$o['nome']}</option>";
        }
        ?>
    </select>

    <button type="submit">Registrar</button>

</form>