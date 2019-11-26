<?php
session_start();
include "../includes/connection.php";
include "../includes/CrudPostagem.class.php";
include "../includes/Server.class.php";

$crud = new CPostagem($conn);
echo $crud->deletePostagem($_GET['id']);