<?php
session_start();
include "./connection.php";
include "./CrudPostagem.class.php";
$crud = new CPostagem($conn);

$email = $_POST['email'];
$senha = $_POST['senha'];
$nfoto = $_FILES['foto']['name'];
$usuario = $_SESSION['id'];
$autor = $crud->getAutor($usuario);

if (!empty($email)) {
    $sql = "UPDATE usuario SET usuario_email = '$email' WHERE usuario_id = $usuario";
    mysqli_query($conn, $sql);
}

if (!empty($senha)) {
    $senha = md5($_POST['senha']);
    $sql = "UPDATE usuario SET usuario_senha = '$senha' WHERE usuario_id = $usuario";
    mysqli_query($conn, $sql);
}

if (!empty($nfoto)) {
    $sql = "SELECT usuario_foto FROM usuario WHERE usuario_id = $usuario";
    $foto = $conn->query($sql)->fetch_assoc()['usuario_foto'];
    $pastaUser = "../users/$autor/";
    rename("../users/$autor", $pastaUser );
    unlink($pastaUser . $foto);

    $sql = "UPDATE usuario SET usuario_nome = '$nome', usuario_email = '$email', usuario_senha = '$senha', usuario_foto = '$nfoto' WHERE usuario_id = $usuario";
    mysqli_query($conn, $sql);
    move_uploaded_file($_FILES['foto']['tmp_name'], $pastaUser . $nfoto);
    $_SESSION['foto'] = $nfoto;
}

//header("Location: ../public/");
