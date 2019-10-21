<?php

if(isset($_POST['nome']) and isset($_POST['senha1']) and isset($_POST['senha2']) and isset($_POST['email']) and isset($_FILES['foto'])){
    include "connection.php";
    session_start();

    $nome = $_POST['nome'];
    $senha1 = md5($_POST['senha1']);
    $senha2 = md5($_POST['senha2']);
    $email = $_POST['email'];
    $imagem = $_FILES['foto']['name'];

    if($senha1 != $senha2){
        $_SESSION['erro'] = 'Senhas não coincidem';
        header('Location: ../public/cadastro.php');
        exit();
    }

    $sql = "SELECT email from usuarios WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_num_rows($result);

    if($row == 1){
        $_SESSION['erro'] = 'Email já está em uso';
        header('Location: ../public/cadastro.php');
        exit();
    }

    $sql = "INSERT INTO usuario(usuario_nome, usuario_senha, usuario_email, usuario_foto) VALUES ('$nome', '$senha1', '$email', '$imagem')";
    $result = mysqli_query($conn, $sql);
    
    $pastaUsuario = "../users/$nome/";
    mkdir($pastaUsuario, 0777);

    if(move_uploaded_file($_FILES['foto']['tmp_name'], $pastaUsuario.$imagem)){
        header('Location: ../public/login.php');
    }

} else {
    header('Location: ../public/');
}