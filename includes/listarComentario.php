<?php

function getUsuarioFoto($id){
    global $conn;
    $sql = "SELECT usuario_foto FROM usuario WHERE usuario_id = $id";
    $result = $conn->query($sql)->fetch_assoc();

    return $result['usuario_foto'];
}

function listarComentario(int $id)
{
    global $conn;

    $sql = "SELECT * FROM comentario WHERE postagem_id = $id ORDER BY c_data DESC";
    $arr = array();
    $result = $conn->query($sql);
    while ($row = $result->fetch_assoc()) {
        $row['foto'] = getUsuarioFoto($row['usuario_id']);
        array_push($arr, $row);
    }

    return $arr;
}
