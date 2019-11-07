<?php 
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;

function cadastrarFotos($nfotos, $array, $postagemID, $pasta){
    global $conn;

    for ($i=0; $i < $nfotos; $i++) { 
        $arquivo = $array['name'][$i];
        $query = "INSERT INTO foto(foto_arquivo, postagem_id) VALUES ('$arquivo', '$postagemID')";
        $conn->query($query) or die();
        
        if(move_uploaded_file($array['tmp_name'][$i], $pasta.$arquivo) and $i === $nfotos - 1){
            header('Location: ../public/?fotos=' . $array[$i]);
            exit();
        }
    }
}   

if ($usuario_logado) {
    include './connection.php';

    $titulo = $_POST['titulo'];
    $resumo = $_POST['resumo'];
    $fotos = $_FILES['fotos'];
    $nfotos = count($fotos['name']);
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

    $urlPostagem = "./foto.php?id=$postagemID";
    $urlFoto = $pastaPostagem . $fotos['name'][0];
    $previewQuery = "INSERT INTO preview(`preview_resumo`, `preview_foto`, `preview_url`) VALUES ('$titulo','$urlFoto', '$urlPostagem')";
    $conn->query($previewQuery);

    cadastrarFotos($nfotos, $fotos, $postagemID, $pastaPostagem);
    
} else {
    header('Location: ../public');
}
