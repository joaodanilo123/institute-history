<?php

class CPostagem{
    private $db;

    public function createPostagem(string $titulo, string $resumo, int $usuario, string $tipo){
        $data = date("Y-m-d H:i:s");
        $sql = "INSERT INTO postagem(`postagem_titulo`, `usuario_id`, `postagem_data`, `postagem_resumo`, `postagem_tipo`) VALUES ('$titulo', $usuario,'$data', '$resumo', '$tipo')";
        try {
            $this->db->query($sql);
            $getLastid = $this->db->query("SELECT postagem_id FROM postagem WHERE `postagem_data` = '$data'");
            return $getLastid->fetch_assoc()['postagem_id'];
        } catch (mysqli_sql_exception $e) {
            return $e;
        }
    }

    public function getPostagem(int $id){

    }

    function __construct(mysqli $conn)
    {
        $this->db = $conn;
    }
}

