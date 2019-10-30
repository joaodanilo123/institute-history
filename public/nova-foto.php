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
        .fotos {
            padding: 10px;
        }
        .add-foto {
            float: left;
            height: 200px;
            width: 200px;
            border: 1px solid black;
        }

        .add-foto .btn {
            width: 50px;
            height: 50px;
            position: absolute;
            left: 75px;
            top: 80px;
            z-index: 1000;
            padding: 5px;
            background: rgba(76, 175, 80, 1);
            border: none;
            box-shadow: none;
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
                            <div class="btn" id="btn0">
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
        //pega todos os inputs e fotos preview
        var previews = document.querySelectorAll('.preview');
        var inputs = document.querySelectorAll('input[type=file]');

        //define todos os inputs como não alterados
        inputs.forEach(element => {
            element.mudado = false;
        })

        //função pra adionar um input de foto
        function newFileInput(index_foto) {
            document.getElementById('fotos').innerHTML +=
                '<div class="file-field input-field add-foto"><img class="preview" width="200" height="200"><div class="btn" id="btn'+ index_foto +'"><span><i class="material-icons">add</i></span><input type="file" name="btn' + index_foto + '" /></div></div> '
        }

        //função pra remover o botão de + em um preview
        function removerBtn(btnID){
            document.querySelector(`#${btnID}`).style.display = 'none';
        }

        //define um trigger pra todos os inputs(recursivamente)
        function addEvent() {
            inputs.forEach((value, index) => {
                value.addEventListener('change', (e) => {
                    //bagulhos copiados do StackOverflow
                    const fileToUpload = e.target.files.item(0);
                    const reader = new FileReader();
                    reader.onload = e => previews[index].src = e.target.result;
                    reader.readAsDataURL(fileToUpload);
                    
                    //cria novo input de foto
                    newFileInput(index + 1)
                    
                    //removove o botão de + do elemento atual na iteração
                    removerBtn('btn' + index)

                    //atualiza as variaveis iniciais
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