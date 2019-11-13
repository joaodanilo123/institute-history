<?php
session_start();
include './Server.class.php';
include './CrudFotos.class.php';
include './CrudPostagem.class.php';
include './connection.php';

if (Server::existInPOST(['titulo', 'resumo']) and Server::userIsLogged()) {

    $cFoto = new CFoto($conn);
    $cPostagem = new CPostagem($conn);

    $postagemID = $cPostagem->createPostagem($_POST['titulo'], $_POST['resumo'], $_SESSION['id'], 'foto');

    $dir = Server::createDirPostagem('../users', $_SESSION['nome'], $_POST['titulo']);
    $fotos = $cFoto->separateFiles($_FILES['fotos']);

    foreach ($fotos as $key) {
        $cFoto->createFoto($key['name'], $postagemID);
        try {
            move_uploaded_file($key['tmp_name'], $dir . $key['name']);
        } catch (\Throwable $th) {
            echo $th;
        }
    }
    $cPostagem->createPreview($postagemID, $dir, $fotos['foto0']['name'], $_POST['titulo']);
    header('Location: ../public');
}
