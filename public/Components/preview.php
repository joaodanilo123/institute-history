<?php 
$previews = carregarPreview();
?>
<div class="z-depth-4 white col s12 l7 offset-l1 opacidade-anim">
    <div class="header">
        <h5>Últimas postagens</h5>
    </div>
    <div class="row">
    <?php for ($i=0; $i < count($previews) ; $i++):?>
        <?php 
        
        $foto =  $previews[$i]['preview_foto']; 
        $url = $previews[$i]['preview_url'];
        $titulo = $previews[$i]['preview_resumo'];
        
        ?>
        <div class="col m12 l4">
            <div class="card medium hoverable">
                <div class="card-image">
                    <img src="<?= $foto ?>"/>
                </div>
                <div class="card-content">
                    <p><?= $titulo ?></p>
                </div>
                <div class="card-action">
                    <a href="<?= $url ?>">Ir para o artigo</a>
                </div>
            </div>
        </div>
    <?php endfor;?>
    </div>
</div>