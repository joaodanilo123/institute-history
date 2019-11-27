<?php
session_start();
include 'connection.php';

$comentario = $_POST['comentario'];
$autor = $_SESSION['id'];
$data = date("Y-m-d H:i:s");
$postagem = $_POST['postagem'];
$sql = "INSERT INTO comentario(c_texto, c_data, usuario_id, postagem_id) VALUES ('$comentario', '$data', $autor, $postagem)";
$conn->query($sql);
echo mysqli_error($conn);
header('Location: ../public/foto.php?id=' . $postagem);