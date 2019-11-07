<?php
session_start();
include_once '../includes/carregarPostagem.php';
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
$fotos = carregarPostagensFoto();

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php" ?>
    <style>
        .postagem-foto {
            min-height: 200px;
            max-height: 300px;
        }
    </style>
</head>

<body>
    <div class="row">
        <?php include "./Components/header.php"; ?>
    </div>
    <div class="row postagem">
        <?php for ($i = 0; $i < $fotos['linhas']; $i++) : ?>
            <?php 
            
            $id = $fotos['dados'][$i]['postagem_id'];
            $url = "./foto.php?id=$id";
            $titulo = $fotos['dados'][$i]['postagem_titulo'] ;
            $resumo = $fotos['dados'][$i]['postagem_resumo'] ;
            $data = $fotos['dados'][$i]['postagem_data'] ;
            $autor = $fotos['dados'][$i]['autor'];
            $arquivo = $fotos['dados'][$i]['arquivos'][0];
            
            ?>
            
            <div class="divider col s12"></div>
            <a href="<?= $url ?>" class="center col s12">
                <h2><?= $titulo ?></h2>
            </a>
            <div class="col s12 center">
                <img class="responsive-img postagem-foto" 
                src="<?= "../users/$autor/$titulo/$arquivo" ?>"
                >
            </div>
            <div class="col s12 m6 offset-m3 truncate center">
                <span><?= $resumo ?></span>
            </div>
            <div class="col s12 m6 offset-m3 center">
                <span><?= $autor ?></span>
            </div>
            <div class="col s12 m6 offset-m3 center">
                <span><?= $data ?></span>
            </div>
            <div class="divider col s12"></div>
        <?php endfor;  ?>
    </div>
    
</body>

</html>