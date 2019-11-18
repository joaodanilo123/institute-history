
<?php
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
include '../includes/carregarPostagem.php';
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<?php include "./Components/html-head.php" ?>
<style>
.input-field .prefix.active {
     color: white;
}
</style>
</head>

<body>
    <div class="row">
        <?php include "./Components/header.php"; ?>
    </div>
    <div class="row">
        <form action="buscar.php" method="post" class="card-panel z-depth-4 white col s12 l10 offset-l1 opacidade-anim">
            <div class="input-field">
                <button class="material-icons prefix btn green center">search</button>
                <input type="text" name="busca" id="busca">
                <label for="busca">Buscar Postagem</label>
            </div>
        </form>
    </div>
    <div class="row">
        <?php include './Components/preview.php'; ?>

        <?php if ($usuario_logado) : ?>
            <div class="z-depth-4 white col l2 offset-l1 hide-on-med-and-down opacidade-anim">
                <?php include "./Components/card-usuario.php"; ?>
            </div>
            <div class="col m1 hide-on-small-and-down"></div>
        <?php endif; ?>
    </div>

</body>

</html>