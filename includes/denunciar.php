<?php

session_start();
include "connection.php";

$postagem = $_POST['postagem'];
$resumo = $_POST['motivo'];

$sql = "INSERT INTO denuncia(denuncia_descricao, postagem_id, denuncia_aberta) VALUES ('$resumo','$postagem', 1)";
$conn->query($sql);
header('Location: ../public/foto.php?id='.$postagem);
