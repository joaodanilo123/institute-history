<?php
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
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
    <div class="row">
        <a href="" class="center"><h2>Titulo</h2></a> 
    </div>

</body>

</html>