<?php
session_start();
$usuario_logado = isset($_SESSION['nome']) ? 1 : 0;
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include "./Components/html-head.php"; ?>
    <title>Nova Foto - Institute History</title>
    <style>
        .add-foto {
            float: left;
            height: 200px;
            width: 200px;
        }

        .add-foto .btn {
            width: 50px;
            height: 50px;
            position: absolute;
            left: 75px;
            top: 80px;
            z-index: 1000;
            padding: 5px;
            background: rgba(76, 175, 80, 0.7);
        }

        .add-foto .btn:hover {
            background: rgba(76, 175, 80, 1);
            color: white;
        }
    </style>
</head>

<body>
    <?php include "./Components/header.php"; ?>
    <div class="container">
        <div class="row">
            <h2 class="header">Nova foto</h2>
            <div class="col s12">
                <form action="" method="POST" enctype="multipart/form-data">
                    <div class="input-field">
                        <input type="text" name="titulo" id="titulo">
                        <label for="titulo">Titulo da postagem</label>
                    </div>
                    <div id="fotos">
                        <div class="file-field input-field add-foto">
                            <img class="preview" width="200" height="200">
                            <div class="btn">
                                <span><i class="material-icons">add</i></span>
                                <input type="file" name="foto0" required />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <input class="btn col s12 m12 green" type="submit" value="cadastrar">
                    </div>
                </form>
            </div>
            <div class="col s12 m6">
                <?php if (isset($_SESSION['erro'])) : ?>
                    <span class="badge red white-text"><?= $_SESSION['erro'] ?></span>
                <?php endif;
                session_destroy();
                ?>
            </div>
        </div>

    </div>
    <script>
        var previews = document.querySelectorAll('.preview');
        var inputs = document.querySelectorAll('input[type=file]');

        inputs.forEach(element => {
            element.mudado = false;
        })


        function newFileInput(index_foto) {
            document.getElementById('fotos').innerHTML +=
                '<div class="file-field input-field add-foto"><img class="preview" width="200" height="200"><div class="btn"><span><i class="material-icons">add</i></span><input type="file" name="foto' + index_foto + '" required /></div></div> '
        }

        function addEvent() {
            inputs.forEach((value, index) => {
                value.addEventListener('change', (e) => {
                    const fileToUpload = e.target.files.item(0);
                    const reader = new FileReader();
                    reader.onload = e => previews[index].src = e.target.result;
                    reader.readAsDataURL(fileToUpload);
                    newFileInput(index + 1)
                    previews = document.querySelectorAll('.preview');
                    inputs = document.querySelectorAll('input[type=file]');
                    addEvent();
                });
            });
        }

        addEvent()
    </script>
</body>

</html>