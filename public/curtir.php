<?php
include '../includes/connection.php';
include '../includes/CrudPostagem.class.php';

$crud = new CPostagem($conn);
print_r($crud->curtir($_REQUEST['p'], $_REQUEST['u']));