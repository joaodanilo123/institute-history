<?php
include "../includes/connection.php";
include "../includes/CrudPostagem.class.php";
include "../includes/Server.class.php";
session_start();

if (!Server::existInPOST(['busca'])) header('Location: ./');
$busca = $_POST['busca'];
$usuario_logado = Server::userIsLogged();

$crud = new CPostagem($conn);
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php" ?>
    <title>Busca</title>
</head>

<body>
    <?php include "./Components/header.php" ?>
    <h3>Postagens contendo "<?=$busca?>":</h3>
    <div class="container">
        <?php
        
        $sql = "SELECT * FROM postagem WHERE postagem_titulo LIKE '%$busca%' ORDER BY postagem_data DESC";
        $result = $conn->query($sql);
        while ($row = $result->fetch_assoc()) :
            $titulo = $row['postagem_titulo'];
            $resumo = $row['postagem_resumo'];
            $data = $row['postagem_data'];
            $autor = $crud->getAutor($_SESSION['id']);
            $url = "./foto.php?id=" . $row['postagem_id'];
            ?>
            <div class="row card-panel z-depth-4 white opacidade-anim">
                <div class="col s12 m8">
                    <a href="<?= $url ?>">
                        <h5><?= $titulo ?></h5>
                    </a>
                    <span class="truncate"><?= $resumo ?></span>
                </div>
                <div class="col s12 m4">
                    <h6><?=$autor?></h6>
                    <h6><?=$data?></h6>
                </div>

            </div>
        <?php endwhile; ?>
    </div>

</body>

</html>