<?php
session_start();
include_once '../includes/CrudPostagem.class.php';
include_once '../includes/CrudFotos.class.php';
include_once '../includes/Server.class.php';
include_once '../includes/connection.php';

$usuario_logado = Server::userIsLogged();
$cPostagem      = new CPostagem($conn);
$cFoto          = new CFoto($conn);

$postagens = $cPostagem->carregarPostagemId(10, 'foto');

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
        <?php for ($i = 0; $i < count($postagens); $i++) : ?>
            <?php

                $id = $postagens[$i];
                $postagem = $cPostagem->getPostagem($id);
                $autor = $cPostagem->getAutor($postagem['usuario_id']);
                $url = "./foto.php?id=$id";
                $titulo = $postagem['postagem_titulo'];
                $resumo = $postagem['postagem_resumo'];
                $data = $postagem['postagem_data'];
                $arquivo = $cFoto->getFotoArquivos($id)[0];

                ?>

            <div class="divider col s12"></div>
            <a href="<?= $url ?>" class="center col s12">
                <h2><?= $titulo ?></h2>
            </a>
            <div class="col s12 center">
                <img class="responsive-img postagem-foto" src="<?= "../users/$autor/$titulo/$arquivo" ?>">
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