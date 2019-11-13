<?php
include '../includes/CrudPostagem.class.php';
include '../includes/CrudFotos.class.php';
include '../includes/Server.class.php';
include '../includes/connection.php';

session_start();
$usuario_logado = Server::userIsLogged();

$cPostagem = new CPostagem($conn);
$cFoto     = new CFoto($conn);

$dados = $cPostagem->getPostagem($_GET['id']);

if (!$dados) {
    header("Location: ./index.php");
}

$titulo   = $dados['postagem_titulo'];
$resumo   = $dados['postagem_resumo'];
$data     = $dados['postagem_data'];
$autor    = $cPostagem->getAutor($dados['usuario_id']);
$arquivos = $cFoto->getFotoArquivos($_GET['id']);
$curtir   = "curtir.php?p=".$_GET['id']."&u=".$dados['usuario_id'];

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php" ?>
    <style>
        .resumo {
            font-size: 18px;
            border: solid lightgrey;
            border-width: 0px 1px;
        }
    </style>
</head>

<body>
    <div class="row">
        <?php include "./Components/header.php"; ?>
    </div>
    <div class="container">
        <div class="row">
            <h2 class="center"><?= $titulo ?></h2>
        </div>
        <div class="row">
            <div class="col s12 m8 offset-m2 resumo">
                <p>
                    <?= $resumo ?>
                </p>
            </div>
        </div>
        <div class="row">
            <?php $a = 0;
            foreach ($arquivos as $arquivo) : ?>
                <?php
                    $path = "../users/$autor/$titulo/$arquivo";
                    $a++;
                ?>
                <a class="modal-trigger col s12 m6 offset-m3" href="#modal<?= $a ?>"><img src="<?= $path ?>" class="responsive-img"></a>

                <div id="modal<?= $a ?>" class="modal">
                    <div class="modal-content">
                        <img src="<?= $path ?>" class="responsive-img">
                    </div>
                </div>
            <?php endforeach ?>
        </div>
        <div class="row">
            <button class="btn-floating btn-large waves-effect waves-light" onclick="curtir()"><i class="material-icons">thumb_up</i></button>
        </div>
        <p id='erro'></p>
        <?= $curtir ?>
    </div>
        
    <script>
        function curtir(){
            var http = new XMLHttpRequest()
            http.onreadystatechange = function(){
                document.getElementById('erro').innerHTML = this.responseText
            }
            http.open('GET', '<?= $curtir ?>')
            http.send();
        }
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.modal');
            var instances = M.Modal.init(elems, {});
        });
    </script>
</body>

</html>