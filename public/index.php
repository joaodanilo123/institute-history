
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
        <div class="col s12 l7 offset-l1">
             <?php include "./Components/buscador.php" ?>
             <?php include './Components/preview.php'; ?>
        </div>
        <?php if ($usuario_logado) : ?>
            <div class="z-depth-4 white col l2 offset-l1 hide-on-med-and-down opacidade-anim">
                <?php include "./Components/card-usuario.php"; ?>
            </div>
            <div class="col m1 hide-on-small-and-down"></div>
        <?php endif; ?>
    </div>

</body>

</html>