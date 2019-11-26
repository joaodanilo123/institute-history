<?php
session_start();
include "../includes/connection.php";
include "../includes/CrudPostagem.class.php";
include "../includes/Server.class.php";

$crud = new CPostagem($conn);
$crud->updatePostagem($_POST['id'], $_POST['resumo'], $_POST['ntitulo'], $_POST['otitulo'], $_SESSION['id']);
header("Location: g_postagens.php?salva=1");
