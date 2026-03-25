<?php include 'conexao.php'; ?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OPDs</title>
<link rel="stylesheet" href="estilo.css">
</head>
<body>

<div class="header">OPDs</div>
<div class="menu">
    <a href="index.php">Início</a>
</div>
<div class="container">

<h2>Lista de OPDs</h2>

<form method="GET">
    <input type="text" name="busca" placeholder="Buscar OPD">
    <button type="submit">Pesquisar</button>
</form>

<table>
<tr>
    <th>OPD</th>
    <th>Ação</th>
</tr>

<?php

$where = "";

if (!empty($_GET['busca'])) {
    $busca = $conn->real_escape_string($_GET['busca']);
    $where = "WHERE nome LIKE '%$busca%'";
}

$sql = "SELECT * FROM opd $where ORDER BY nome ASC";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<tr>
                <td>{$row['nome']}</td>
                <td>
                    <a class='btn' href='opd_detalhe.php?id={$row['id']}'>
                        Ver OFs
                    </a>
                </td>
              </tr>";
    }
} else {
    echo "<tr><td colspan='2'>Nenhuma OPD encontrada</td></tr>";
}
?>

</table>

</div>

</body>
</html>