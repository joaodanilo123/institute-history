<nav>
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="./nova-foto.php">Nova Foto</a></li>
        <li><a href="./novo-video.php">Novo Vídeo</a></li>
    </ul>
    <div class="nav-wrapper green z-depth-4 padding-top">
        <a href="." class="brand-logo"><img src="../css/logo.png"></a>
        <a href="#" data-target="mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li><a href="#">Vídeos</a></li>
            <li><a href="./fotos.php">Fotos</a></li>
            <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Postar<i class="material-icons right">arrow_drop_down</i></a></li>
            <?php if ($usuario_logado) : ?>
                <li><a href="../includes/logout.php" class="red dark-2 btn">Sair</a></li>
            <?php else : ?>
                <li><a href="login.php" class="blue dark-2 btn">Login</a></li>
                <li><a href="cadastro.php" class="blue dark-2 btn">Cadastro</a></li>
            <?php endif; ?>
        </ul>
    </div>
</nav>
<ul class="sidenav" id="mobile">
    <?php if ($usuario_logado) include './Components/sidenav-user.php'; ?>
    <li><a href="#">Vídeos</a></li>
    <li><a href="./fotos.php">Fotos</a></li>
    <?php if ($usuario_logado) : ?>
        <li><a href="../includes/logout.php">Logout</a></li>
    <?php else : ?>
        <li><a href="login.php">Login</a></li>
        <li><a href="cadastro.php">Cadastre-se</a></li>
    <?php endif; ?>
</ul>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems, {});
    });

    document.addEventListener('DOMContentLoaded', function() {
        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems, {hover : true, coverTrigger: false});
    });
    
</script>