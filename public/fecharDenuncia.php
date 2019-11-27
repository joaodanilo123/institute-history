<?php 
include "../includes/connection.php";
$id = $_GET['id'];

$conn->query("UPDATE denuncia SET denuncia_aberta = 0 WHERE denuncia_id = $id");
exit();