<?php

include 'connection.php';

function getAutor($usuario_id){
    global $conn;
    $result = $conn->query("SELECT usuario_nome FROM usuario WHERE usuario_id = '$usuario_id'");
    return $result->fetch_array()[0];
}

function carregarPostagensFoto($limit=10){
    global $conn;
    
    $resultPostagem= $conn->query("SELECT * FROM postagem WHERE postagem_tipo = 'foto' ORDER BY postagem_data LIMIT $limit");
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
