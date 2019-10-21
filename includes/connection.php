<?php

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'institute_history');

/*-quando estiver rodando no servidor*/

/*define('DB_HOST', 'inf.fw.iffarroupilha.edu.br:2241');
define('DB_USER', 'joao_danilo');
define('DB_PASSWORD', '568745');
define('DB_NAME', 'joao_danilo');*/

$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) or die();