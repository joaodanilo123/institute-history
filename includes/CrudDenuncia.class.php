<?php

class CDenuncia
{
    private $db;
    private $numDenuncias;

    public function __construct(mysqli $conn)
    {
        $this->db = $conn;
        $this->numDenuncias = numDenuncias();
    }

    public function createDenuncia(int $usuario_id, int $postagem_id, string $descricao)
    {
        $sql = "INSERT INTO denuncia(usuario_id, postagem_id, denuncia_descricao, denuncia_aberta) VALUES ($usuario_id, $postagem_id, '$descricao' , 0)";
        try {
            $this->db->query($sql);
        } catch (mysqli_sql_exception $e) {
            return false;
        }
    }

    public function carregarDenuncia(int $denuncia_id){
        $sql = "SELECT * FROM denuncia WHERE denuncia_id = $denuncia_id";
        return $this->db->query($sql)->fetch_assoc();
    }

    public function fecharDenuncia(int $denuncia_id){
        $sql = "UPDATE denuncia SET denuncia_aberta = 0 WHERE denuncia_id = $denuncia_id";
    }

    private function numDenuncias()
    {
        $sql = "SELECT denuncia_id FROM denuncia";
        return $this->db->query($sql)->num_rows;
    }

    public function getNumDenuncias(){
        return $this->numDenuncias;
    }
}
