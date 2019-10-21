<nav>
    <div class="nav-wrapper green z-depth-4 padding-top">
        <a href="." class="brand-logo center times"><img src="../css/logo.png" alt="" srcset=""></a>
        <a href="#" data-target="mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li><a href="#">Vídeos</a></li>
            <li><a href="#">Memórias</a></li>
            <li><a href="#">Fotos</a></li>
            <?php if ($usuario_logado) : ?>
                <li><a href="../includes/logout.php">Logout</a></li>
            <?php else : ?>
                <li><a href="login.php">Login</a></li>
            <?php endif; ?>
        </ul>
    </div>
</nav>
<ul class="sidenav" id="mobile">
    <?php if ($usuario_logado) include './Components/sidenav-user.php'; ?>
    <li><a href="#">Vídeos</a></li>
    <li><a href="#">Memórias</a></li>
    <li><a href="#">Fotos</a></li>
    <?php if ($usuario_logado) : ?>
        <li><a href="../includes/logout.php">Logout</a></li>
    <?php else : ?>
        <li><a href="login.php">Login</a></li>
    <?php endif; ?>
</ul>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var options = {}
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems, options);
    });
</script>