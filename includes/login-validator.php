<?php

if (isset($_POST['email']) and isset($_POST['senha'])) { 

    include 'connection.php';
    session_start();

    $email = $_POST['email'];
    $senha = md5($_POST['senha']);

    $sql = "SELECT usuario_nome, usuario_foto FROM usuario WHERE usuario_email = '$email' AND usuario_senha = '$senha'";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0){
        $row = mysqli_fetch_assoc($result);
        $_SESSION['nome'] = $row['usuario_nome'];
        $_SESSION['foto'] = $row['usuario_foto'];
        header('Location: ../public/index.php');
    } else {
        $_SESSION['erro_de_login'] = true;
        header('Location: ../public/login.php');
    }

} else {
    header('Location: ../public/login.php');
}
