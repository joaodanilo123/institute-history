<?php
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
include '../includes/carregarPostagem.php';
$dados = carregarDadosPostagem($_GET['id']);

if(!$dados){
    header("Location: ./index.php");
}

$titulo = $dados['postagem_titulo'];
$resumo = $dados['postagem_resumo'];
$data = $dados['postagem_data'];
$autor = getAutor($dados['usuario_id']);
$arquivos = $dados['arquivos'];

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php" ?>
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
            <p class="col s12 m8 offset-m2">
                <?= $resumo ?>
            </p>
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
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.modal');
            var instances = M.Modal.init(elems, {});
        });
    </script>
</body>

</html>