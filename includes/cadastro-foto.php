<?php 
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;

if ($usuario_logado) {
    include './connection.php';

    $titulo = $_POST['titulo'];
    $resumo = $_POST['resumo'];
    $fotos = $_FILES['fotos'];
    $usuario_id = $_SESSION['id'];
    $usuario = $_SESSION['nome'];
    $data = date("Y-m-d H:i:s");

    
    $query = "INSERT INTO postagem(`postagem_titulo`, `usuario_id`, `postagem_data`, `postagem_resumo`, `postagem_tipo`) VALUES ('$titulo', '$usuario_id','$data', '$resumo', 'foto')";
    $conn->query($query);

    $pastaPostagem = "../users/$usuario/$titulo/";
    mkdir($pastaPostagem, 0777);

    $query = "SELECT postagem_id FROM postagem WHERE `postagem_titulo` = '$titulo'";
    $result = $conn->query($query);
    if (mysqli_errno($conn)) {
        print(mysqli_error($conn));
    }

    $postagemID = mysqli_fetch_assoc($result)['postagem_id'];

    print_r($fotos);

    for ($i=0; $i < count($fotos['name']); $i++) { 
        $arquivo = $fotos['name'][$i];
        print_r($fotos);
        $query = "INSERT INTO foto(foto_arquivo, postagem_id) VALUES ('$arquivo', '$postagemID')";
        $conn->query($query) or die();
        
        if(move_uploaded_file($fotos['tmp_name'][$i], $pastaPostagem.$arquivo)){
            header('Location: ../public/');
            exit();
        }
    }

} else {
    header('Location: ../public');
}
