<?php
session_start(); // a função session_start cia uma sessão que passa um id via get ou post
if (isset($_SESSION['nome'])) { // isset informa se a variável é existente, não sendo nula
    header('Location: ../');
}
$usuario_logado = false;
?>
<!DOCTYPE html>
<html>

<head>
    <?php include "./Components/html-head.php" ?>
    <!-- include do html-head.php com o visual-->
    <title>Login - Institute History</title>
</head>

<body>
    <div class="container">
        <div class="row valign wrapper">
            <br><br><br><br>
            <h2>Login</h2>
            <div class="col s12 m6">
                <form action="../includes/login-validator.php" method="POST">

                    <div class="input-field">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email">
                    </div>

                    <div class="input-field">
                        <label for="senha">Senha</label>
                        <input type="password" name="senha" id="senha">
                    </div>
                    <div class="row">
                        <input class="btn col s12 m12 green" type="submit" value="Entrar">
                    </div>
                </form>
                <?php if (isset($_SESSION['erro_de_login'])) : ?>
                    <span class="badge red white-text">Email ou senha incorretos</span>
                    <?php session_destroy(); ?>
                <?php endif; ?>
            </div>
            <div class="col s12 m6">
                <div class="container">
                    <h5>Não tem uma conta? <a href="cadastro.php">Cadastre-se</a></h5>
                </div>
            </div>
        </div>
    </div>

</body>

</html>