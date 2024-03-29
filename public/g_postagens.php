<?php
session_start();
include "../includes/connection.php";
include "../includes/CrudPostagem.class.php";
include "../includes/CrudFotos.class.php";
include "../includes/Server.class.php";

$usuario_logado = Server::userIsLogged();


if (!$usuario_logado) header("Location: ./login.php");
$crud = new CPostagem($conn);
$cf = new CFoto($conn);

$postagens = $crud->getPostagemIdByUser($_SESSION['id']);

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php" ?>
</head>

<body>
    <?php if (isset($_GET['salva'])) : ?>
        <script>
            M.toast({
                html: 'Postagem Salva!'
            })
        </script>
    <?php endif; ?>
    <?php include "./Components/header.php" ?>
    <div class="container">
        <ul class="collapsible">
            <?php if ($postagens) : foreach ($postagens as $id) : ?>
                    <?php
                            $fotos = $cf->getFotoArquivos($id);
                            $postagem = $crud->getPostagem($id);
                            $titulo = $postagem['postagem_titulo'];
                            $resumo = $postagem['postagem_resumo'];
                            $data = $postagem['postagem_data'];
                            $autor = $crud->getAutor($postagem['usuario_id']);
                            
                            ?>
                    <li>
                        <div class="collapsible-header row" id="header_postagem<?= $id ?>">
                            <h5 class="col m6"><?= $titulo ?></h5>
                            <h6 class="col m6"><?= $data ?></h6>
                        </div>
                        <div class="collapsible-body white" id="body_postagem<?= $id ?>">
                            <form action="./salvar_postagem.php" method="post">
                                <table class="table">
                                    <tr>
                                        <th>Titulo</th>
                                        <td><input type="text" name="ntitulo" value="<?= $titulo ?>"></td>
                                    </tr>
                                    <tr>
                                        <th>Resumo</th>
                                        <td><textarea id="textarea" class="materialize-textarea" name="resumo"><?= $resumo ?></textarea></td>
                                    </tr>
                                    <input type="hidden" name="otitulo" value="<?= $titulo ?>">
                                    <input type="hidden" name="id" value="<?= $id ?>">
                                </table>
                                <div class="row">
                                <?php foreach ($fotos as $arquivo) : ?>
                                    <?php
                                        $path = "../users/$autor/$titulo/$arquivo";
                                    ?>
                                    <img src="<?= $path ?>" class="responsive-img col s12 m6">
                                <?php endforeach ?>
                                </div>  
                                <div class="row">
                                    <div class="col m6">
                                        <input type="submit" class="btn" value="Salvar alterações">
                                    </div>
                                    <div class="col m6">
                                        <input type="button" value="excluir essa postagem" class="btn red" onclick="excluirPostagem(<?= $id ?>)">
                                    </div>
                                </div>
                            </form>

                        </div>
                    </li>
                <?php endforeach;
                else : ?>

                <div class="card-panel">
                    <h3>Você não possui nenhuma postagem :(</h3>
                    <h5>Crie uma <a href="nova-foto.php">aqui</a></h5>
                </div>

            <?php endif ?>
        </ul>

    </div>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            const options = {};
            var elems = document.querySelectorAll('.collapsible');
            var instances = M.Collapsible.init(elems, options);
        });

        function excluirPostagem(id) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById('header_postagem' + id).style.display = 'none';
                    document.getElementById('body_postagem' + id).style.display = 'none';
                }
            };
            xhttp.open("GET", "excluir_postagem.php?id=" + id);
            xhttp.send();
        }
    </script>
</body>

</html>