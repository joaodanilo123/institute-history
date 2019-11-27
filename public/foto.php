<?php
include '../includes/CrudPostagem.class.php';
include '../includes/CrudFotos.class.php';
include '../includes/Server.class.php';
include '../includes/connection.php';
include '../includes/listarComentario.php';

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
$curtir   = $usuario_logado ? "curtir.php?p=" . $_GET['id'] . "&u=" . $_SESSION['id'] : false;
$curtidas = $cPostagem->getCurtidas($_GET['id']);

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
            <div class="col s12 m10 offset-m1 resumo">
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
                <a class="modal-trigger col s12 m6" href="#modal<?= $a ?>"><img src="<?= $path ?>" class="responsive-img"></a>

                <div id="modal<?= $a ?>" class="modal">
                    <div class="modal-content">
                        <img src="<?= $path ?>" class="responsive-img">
                    </div>
                </div>
            <?php endforeach ?>
        </div>

        <div class="divider"></div>
        <div class="row">
            <?php if ($usuario_logado) : ?>
                <div class="col s2">
                    <div class="card-panel">
                        <button title="Curtir" class="btn-floating btn-large waves-effect waves-light curtir green" onclick="curtir()"><i class="material-icons">thumb_up</i></button>
                        <span id="curtida-display"><?= $curtidas ?></span>
                    </div>
                </div>
                <div class="card-panel col s8 row">
                    <div class="col s12">
                        <form class="row col s12 valign-wrapper" action="../includes/comentar.php" method="post">
                            <div class="col s10 input-field">
                                <textarea id="textarea1" name="comentario" required class="materialize-textarea"></textarea>
                                <label for="textarea1">Escreva um comentário</label>
                            </div>
                            <input type="hidden" name="postagem" value="<?= $_GET['id'] ?>">
                            <input type="submit" class="btn green material-icons" value="send">
                        </form>
                    </div>
                </div>
                <div class="col s2">
                    <div class="card-panel center">
                        <a class="modal-trigger btn-floating btn-large waves-effect waves-light curtir red" href="#modaldenuncia"><i class="material-icons">flag</i></a>
                        <form action="../includes/denunciar.php" id="modaldenuncia" class="modal" method="post">
                            <div class="modal-content">
                                <h4>Denunciar postagem</h4>
                                <div class="row">
                                    <div class="input-field">
                                        <input type="text" name="motivo" id="motivo">
                                        <label for="motivo">Qual o motivo da denúncia?</label>
                                    </div>
                                    <input type="hidden" name="postagem" value="<?=$_GET['id']?>">         
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="modal-action modal-close waves-effect waves-red btn red darken-3" value="Confirmar">
                                <a href="#!" class="modal-action modal-close waves-effect waves-red btn red darken-3">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            <?php endif; ?>
            <div class="row">
                <ul class="collection col s12">
                    <?php
                    $comentarios = listarComentario($_GET['id']);
        
                    foreach ($comentarios as $comentario) :
                        $autor = $cPostagem->getAutor($comentario['usuario_id']);
                        $foto = $comentario['foto'];
                        $src = "../users/$autor/$foto";
                        ?>
                        <li class="collection-item avatar">
                            <img src="<?= $src ?>" class="circle">
                            <span class="title"><?= $autor  ?></span>
                            <p><?= $comentario['c_texto'] ?></p>
                        </li>
                    <?php endforeach; ?>
                </ul>

            </div>
        </div>
    </div>

    <script>
        function curtir() {
            var http = new XMLHttpRequest()
            http.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById('curtida-display').innerHTML = this.responseText
                }
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