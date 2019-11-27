<?php

session_start();
include "../includes/connection.php";
include "../includes/Server.class.php";

$usuario_logado = Server::userIsLogged();
$id = $_SESSION['id'];

$consulta = "SELECT usuario_email, usuario_foto FROM usuario where usuario_id = $id";
$con = mysqli_query($conn, $consulta);

?>

<html>

<head>
	<?php include './Components/html-head.php' ?>
</head>

<body>
	<?php include "./Components/header.php" ?>
	<div class="container">
		<h1>Editar dados do perfil</h1>
		<form method="POST" action="../includes/edit-usu.php" enctype="multipart/form-data">
			<?php $dado = $con->fetch_array(); ?>
			Email: <input type="email" name="email" value="<?= $dado['usuario_email']; ?>">
			Senha:<input type="password" name="senha">
			<div class="file-field input-field">
				<div class="btn">
					<span>Nova Foto</span>
					<input type="file" name="foto">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
			<input type="hidden" name="idusu" value="<?php echo $id; ?>">

			<button class="btn">Atualizar</button>

		</form>
	</div>

</body>

</html>