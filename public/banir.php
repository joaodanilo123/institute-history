<?php
include "../includes/connection.php";
include "../includes/CrudPostagem.class.php";
$usuario = $_GET['id'];
$crud = new CPostagem($conn);
$postagens = $crud->getPostagemIdByUser($usuario);

for ($i=0; $i < count($postagens); $i++) { 
    $crud->deletePostagem($postagens[$i]);
}
$sql = "DELETE FROM usuario WHERE usuario_id = $usuario";
$conn->query($sql);
