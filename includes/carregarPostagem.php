<?php

include 'connection.php';

function getAutor($usuario_id){
    global $conn;
    $result = $conn->query("SELECT usuario_nome FROM usuario WHERE usuario_id = '$usuario_id'");
    return $result->fetch_array()[0];
}

function carregarPostagensFoto($limit=10){
    global $conn;
    
    $resultPostagem= $conn->query("SELECT * FROM postagem WHERE postagem_tipo = 'foto' ORDER BY postagem_data DESC LIMIT $limit");
    $arr = array();
    while ($aux = $resultPostagem->fetch_assoc()) {
        $aux['autor'] = getAutor($aux['usuario_id']);
        $aux['arquivos'] = array();
        $result = $conn->query(sprintf("SELECT foto_arquivo FROM foto WHERE postagem_id = %d", $aux['postagem_id']));
            while($aux2 = $result->fetch_assoc()){
                array_push($aux['arquivos'],$aux2['foto_arquivo']);
            }
        array_push($arr, $aux);
    }

    return ['dados' => $arr, 'linhas' => mysqli_num_rows($resultPostagem)];
}

function carregarPreview($limit=10){
    global $conn;

    $resultPreview= $conn->query("SELECT * FROM preview ORDER BY preview_id DESC LIMIT $limit");
    $arr = array();
    while($aux = $resultPreview->fetch_assoc()){
        array_push($arr, $aux);
    }

    return $arr;
}

function carregarDadosPostagem(int $id){
    global $conn;
    $resultPostagem = $conn->query("SELECT * FROM postagem WHERE postagem_id = $id");
    if(mysqli_num_rows($resultPostagem) <= 0) {
        return false;
    }
    $resultPostagem = $resultPostagem->fetch_assoc();
    $resultPostagem['arquivos'] = array();
    $result = $conn->query(sprintf("SELECT foto_arquivo FROM foto WHERE postagem_id = %d", $resultPostagem['postagem_id']));
    while($aux = $result->fetch_assoc()){
        array_push($resultPostagem['arquivos'], $aux['foto_arquivo']);
    }

    return $resultPostagem;

};
