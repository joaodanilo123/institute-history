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
            move_uploaded_file($key['tmp_name'], $dir.$key['name']);
        } catch (\Throwable $th) {
            echo $th;
        }
        
    }

    header('Location: ../public');
}



/*echo $postagem;


    $query = "SELECT postagem_id FROM postagem WHERE `postagem_titulo` = '$titulo'";
    $result = $conn->query($query);
    if (mysqli_errno($conn)) {
        print(mysqli_error($conn));
    }
    $postagemID = mysqli_fetch_assoc($result)['postagem_id'];

    $urlPostagem = "./foto.php?id=$postagemID";
    $urlFoto = $pastaPostagem . $fotos['name'][0];
    $previewQuery = "INSERT INTO preview(`preview_resumo`, `preview_foto`, `preview_url`) VALUES ('$titulo','$urlFoto', '$urlPostagem')";
    $conn->query($previewQuery);

    cadastrarFotos($nfotos, $fotos, $postagemID, $pastaPostagem);
    
} else {
    header('Location: ../public');
}*/
