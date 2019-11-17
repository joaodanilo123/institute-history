<?php
include '../includes/connection.php';
include '../includes/CrudPostagem.class.php';

$crud = new CPostagem($conn);
$crud->curtir($_REQUEST['p'], $_REQUEST['u']);
echo $crud->getCurtidas($_REQUEST['p']);