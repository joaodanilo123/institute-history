<?php
session_start();
$usuario_logado = false; //ou seja, para fazer o cadastro, o usuário não está logado no sistema
include "./Components/html-head.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Cadastro</title>
</head>
<body>
   <?php include './Components/header.php' ?>
    <div class="container">
        <div class="row">
            <h2 class="header">Cadastro</h2>
            <div class="col s12 m6">
                <form action="../includes/cadastro-validator.php" method="POST" enctype="multipart/form-data"> 
                
                    <div class="input-field">
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" id="nome" required>
                    </div>
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
                        <input class="btn col s12 m12 green" type="submit" value="cadastrar">
                    </div>
                </form>
            </div>
            <div class="col s12 m6">
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