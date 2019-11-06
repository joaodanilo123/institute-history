<?php
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php"; ?>
    <title>Nova Foto - Institute History</title>
</head>

<body>
    <?php include "./Components/header.php"; ?>
    <div class="container">
        <div class="row">
            <h2 class="header">Nova foto</h2>
            <div class="col s12">
                <form action="../includes/cadastro-foto.php" method="POST" enctype="multipart/form-data" class="row">
                    <div class="input-field col s12">
                        <input type="text" name="titulo" id="titulo">
                        <label for="titulo">Titulo da postagem</label>
                    </div>
                    <div class="input-field col s12">
                        <textarea id="textarea" class="materialize-textarea" name="resumo"></textarea>
                        <label for="textarea">O que essa foto significa?</label>
                    </div>


                    <div class="file-field input-field col s12">
                        <div class="btn">
                            <span>Selecione uma ou mais fotos</span>
                            <input type="file" name="fotos[]" multiple>
                        </div>
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" placeholder="nome do arquivo">
                        </div>
                    </div>

                    <div class="row">
                        <input class="btn col s12 m12 green" type="submit" value="cadastrar">
                    </div>
                </form>
            </div>
            <div class="col s12 m6">
                <?php if (isset($_SESSION['erro'])) : ?>
                    <span class="badge red white-text"><?= $_SESSION['erro'] ?></span>
                <?php
                    session_destroy();
                endif;
                ?>
            </div>
        </div>
    </div>
</body>

</html>