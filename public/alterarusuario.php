
<?php
session_start();
include "conexao.php";
$id = $_SESSION['nome'];
$sql = "select * from usuario where usuario_id = $id";
$result = mysqli_query($conectar, $sql);
$user = mysqli_fetch_assoc($result);
mysqli_close($conectar);

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Alterar usuário</title>
<?php include "./Components/html-head.php" ?>  <!-- include do html-head.php com o visual-->
</head>
<body>
		<?php include './Components/header.php' ?> <!-- cria a aba institute-history-->
		<div class="container"> <!--da parte do div onde está os dados para o usuário editar-->
        <div class="row">
            <h2 class="header">Edição dos dados</h2>
            <div class="col s12 m6">
			<form method ="POST" action="atualizarcadastro.php" enctype="multipart/form-data">
				<input type = "hidden" name="id" value="<?php echo $id;?>" >	
				<div class="input-field">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email" required>
                    </div>

                    <div class="input-field">
                        <label for="senha1">Senha</label>
                        <input type="password" name="senha1" id="senha1" required>
                    </div>

                    <div class="input-field">
                        <label for="senha2">Confirme a Senha</label>
                        <input type="password" name="senha2" id="senha2" required>
                    </div>
                    <div class="file-field input-field">
                    <div class="btn green">
					<span>Foto do perfil</span>
                            <input type="file" name="foto" required />
                    </div>
                    <div class="file-path-wrapper">
                         <input class="file-path validate" type="text" placeholder="Nome do arquivo" />
                    </div>
                    </div>
                    <div class="row">
                        <input class="btn col s12 m12 green" type="submit" value="Editar cadastro">
                    </div>
                </form>
            </div>
            <div class="col s12 m6"> <!-- div se der erro no quando o usuário informa os dados incorretos-->
                <?php if (isset($_SESSION['erro'])):?>
                <span class="badge red white-text"><?= $_SESSION['erro'] ?></span>
                <?php endif; 
                session_destroy();
                ?>
            </div>
        </div>
    </div>
</body>

</html>
	
              
		
              