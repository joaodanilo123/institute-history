<?php 

session_start();
session_destroy();

header("Location: ../public/index.php?". var_dump($_SESSION));