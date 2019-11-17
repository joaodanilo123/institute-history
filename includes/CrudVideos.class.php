<?php

class CVideo
{
    private $db;

    public function createVideo(string $nome, int $postagem)
    {
        $sql = "INSERT INTO video(video_arquivo, postagem_id) VALUES ('$nome', $postagem)";
        try {
            $this->db->query($sql);
        } catch (mysqli_sql_exception $e) {
            return $e;
        }
    }

    public function getVideoArquivos(int $postagemID){
        $sql = "SELECT video_arquivo FROM video WHERE postagem_id = $postagemID";
        $result = $this->db->query($sql);
        return $result->fetch_assoc()['video_arquivo'];
    }

    function __construct(mysqli $conn)
    {
        $this->db = $conn;
    }
}
