<?php include 'conexao.php';

$id = (int) $_GET['id'];

$opd = $conn->query("SELECT * FROM opd WHERE id = $id")->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalhes OPD</title>
<link rel="stylesheet" href="estilo.css">
</head>
<body>

<div class="header">
    OPD: <?php echo $opd['nome']; ?>
</div>

<div class="container">

<a class="btn" href="opds.php">← Voltar</a>

<h2>OFs dessa OPD</h2>

<table>
<tr>
    <th>OF</th>
    <th>Data</th>
</tr>

<?php

$sql = "
SELECT numero_of, data_registro
FROM `of`
WHERE opd_id = $id
ORDER BY data_registro DESC
";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()){
        echo "<tr>
                <td>{$row['numero_of']}</td>
                <td>{$row['data_registro']}</td>
              </tr>";
    }
} else {
    echo "<tr><td colspan='2'>Nenhuma OF encontrada</td></tr>";
}
?>

</table>

</div>

</body>
</html>
