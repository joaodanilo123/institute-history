<div class="card">
    <style>
        .foto-perfil {
            border-radius: 10px;
            width: 100%;
            height: 200px;
        }
    </style>
    <img src="../users/<?= $_SESSION['nome'] ?>/<?= $_SESSION['foto'] ?>" class="foto-perfil" />
    <span class="card-title"></span>
    <div class="card-content">
        <p><?= $_SESSION['nome'] ?></p>
    </div>
    <div class="card-action">
        <a href="nova-foto.php">Nova Foto</a>
    </div>
    <div class="card-action">
        <a href="#">Novo Vídeo</a>
    </div>
    <div class="card-action">
        <a href="./g_postagens.php">Minhas postagens</a>
    </div>
    <div class="card-action">
        <a href="./editar-perfil.php">Editar perfil</a>
    </div>
    <?php if ($_SESSION['admin']) : ?>
        <div class="card-action">
            <a href="admin.php">Administração</a>
        </div>
    <?php endif ?>
</div>