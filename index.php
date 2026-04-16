<?php include 'conexao.php'; ?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Centro de Distribuição</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="header">
        <div class="header-content">
            <img src="img/logo.jpg" class="logo-img">
            <span class="titulo">Sistema de Controle de OFs</span>
        </div>
    </div>

    <div class="menu">
        <a href="of.php">Cadastrar OF</a>
        <a href="montador.php">Cadastrar Montador</a>
        <a href="opd.php">Cadastrar OPD</a>
        <a href="opds.php">Ver OPDs</a>
    </div>

    <div class="container">

        <h2>Lista de OFs</h2>


        <form method="GET" style="margin-bottom:20px;">

            <input type="text" name="numero_of" placeholder="Buscar OF">

            <input type="text" name="opd_nome" placeholder="Digite a OPD">

            <select name="montador_nome">
                <option value="">Todos Montadores</option>
                <?php
                $montadores = $conn->query("SELECT DISTINCT montador_nome FROM opd WHERE montador_nome IS NOT NULL");
                while ($m = $montadores->fetch_assoc()) {
                    echo "<option value='{$m['montador_nome']}'>{$m['montador_nome']}</option>";
                }
                ?>
            </select>

            <button type="submit">Filtrar</button>

        </form>

        <table>
            <tr>
                <th>OF</th>
                <th>OPD</th>
                <th>Montador</th>
                <th>Data</th>
            </tr>

            <?php

            $where = [];


            if (!empty($_GET['numero_of'])) {
                $numero = $conn->real_escape_string($_GET['numero_of']);
                $where[] = "`of`.numero_of LIKE '%$numero%'";
            }


            if (!empty($_GET['opd_nome'])) {
                $opd_nome = $conn->real_escape_string($_GET['opd_nome']);
                $where[] = "opd.nome LIKE '%$opd_nome%'";
            }


            if (!empty($_GET['montador_nome'])) {
                $montador = $conn->real_escape_string($_GET['montador_nome']);
                $where[] = "opd.montador_nome = '$montador'";
            }


            $whereSql = "";
            if (!empty($where)) {
                $whereSql = "WHERE " . implode(" AND ", $where);
            }


            $sql = "
SELECT 
    `of`.numero_of,
    opd.nome AS opd,
    opd.montador_nome AS montador,
    `of`.data_registro
FROM `of`
JOIN opd ON `of`.opd_id = opd.id
$whereSql
ORDER BY `of`.data_registro DESC
";

            $result = $conn->query($sql);

            // RESULTADO
            if ($result && $result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>
                <td>{$row['numero_of']}</td>
                <td>{$row['opd']}</td>
                <td>{$row['montador']}</td>
                <td>{$row['data_registro']}</td>
              </tr>";
                }
            } else {
                echo "<tr><td colspan='4'>Nenhuma OF encontrada</td></tr>";
            }
            ?>

        </table>

    </div>

</body>

</html>