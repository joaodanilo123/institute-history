<?php
session_start();
include "../includes/connection.php";
include "../includes/Server.class.php";

$usuario_logado = Server::userIsLogged();
$atuallog = $_SESSION['id'];

?>

<html>

<head>
	<?php include './Components/html-head.php' ?>
	<title>Administração</title>
	<style>
		.circle {
			border: 1px solid black;
		}

		.lista {
			border: solid black;
			border-width: 0px 1px 0px 0px;
			height: 100%;
		}
	</style>
</head>

<body>
	<?php include "./Components/header.php" ?>
	<div class="row">
		<div class="col s12 m3 lista">
			<h3>Usuários cadastrados:</h3>
			<?php
			$consulta = "SELECT usuario_nome, usuario_email, usuario_foto, usuario_id FROM usuario";
			$con = mysqli_query($conn, $consulta);
			?>
			<?php while ($dado = $con->fetch_array()) : ?>
				<?php
					$url = "../users/" . $dado["usuario_nome"] . "/" . $dado["usuario_foto"];
					?>
				<ul class="collection">
					<li class="collection-item avatar valign-wrapper" id="user<?= $dado['usuario_id'] ?>">
						<img src="<?= $url ?>" class="circle">
						<span class="title"><?= $dado["usuario_nome"] ?></span>
						<a href="#!" onclick="banir(<?= $dado['usuario_id'] ?>)" class="secondary-content red-text"><span>banir</span></a>
					</li>
				</ul>
			<?php endwhile; ?>
		</div>
		<div class="col s12 m9">
			<h3>Denúncias:</h3>
			<?php
			$consulta = "SELECT denuncia_descricao, postagem_id, denuncia_id, denuncia_aberta FROM denuncia";
			$con = mysqli_query($conn, $consulta);
			?>
			<ul class="collection">
				<?php while ($dado = $con->fetch_array()) : ?>
					<?php
						//$url = "../users/" . $dado["usuario_nome"] . "/" . $dado["usuario_foto"];
						?>

					<li class="collection-item">
						<div>
							"<?= $dado["denuncia_descricao"] ? $dado["denuncia_descricao"] : "Não Há Descrição" ?>"
							<?php if ($dado['denuncia_aberta']) : ?>
								<div class="secondary-content" id="secondary<?=$dado['denuncia_id']?>">
									<a href="#!" onclick="fechardenuncia(<?= $dado['denuncia_id'] ?>)"><span class="new badge blue" data-badge-caption="">Encerrar denúncia</span></a>
									<a href="#!"><span class="new badge blue" data-badge-caption="">Ir para postagem</span></a>
								</div>
							<?php else : ?>
								<div  class="secondary-content">
									<span>Denúncia encerrada</span>
								</div>
							<?php endif ?>
						</div>
					</li>

				<?php endwhile; ?>
			</ul>
		</div>
	</div>
	<script>
		function banir(id){
			http = new XMLHttpRequest();
			http.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("user"+id).innerHTML = "<h5>Banido</h5>"
				}
			}
			http.open("GET", "banir.php?id=" + id, true);
			http.send();
		}

		function fechardenuncia(id) {
			http = new XMLHttpRequest();
			http.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("secondary"+id).innerHTML = "<span>Denúncia encerrada</span>"
				}
			}
			http.open("GET", "fecharDenuncia.php?id=" + id, true);
			http.send();
		}
	</script>
</body>

</html>