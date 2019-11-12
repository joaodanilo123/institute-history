<?php

class CFoto
{
    private $db;

    public function separateFiles(array $files)
    {
        $separated = array();

        for ($i=0; $i < count($files['name']); $i++) {
            $separated['foto'.$i] = ['name' => '', 'tmp_name' => '', 'type' => ''];
            $separated['foto'.$i]['name'] =  $files['name'][$i];
            $separated['foto'.$i]['tmp_name'] =  $files['tmp_name'][$i];
            $separated['foto'.$i]['type'] =  $files['type'][$i];
        }
        
        return $separated;
    }
    public function createFoto(string $nome, int $postagem)
    {
        $sql = "INSERT INTO foto(foto_arquivo, postagem_id) VALUES ('$nome', $postagem)";
        try {
            $this->db->query($sql);
        } catch (mysqli_sql_exception $e) {
            return false;
        }
    }

    function __construct(mysqli $conn)
    {
        $this->db = $conn;
    }
}
