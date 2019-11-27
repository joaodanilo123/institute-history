<?php
function rrmdir($dir)
{
    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != "." && $object != "..") {
                if (filetype($dir . "/" . $object) == "dir") rrmdir($dir . "/" . $object);
                else unlink($dir . "/" . $object);
            }
        }
        reset($objects);
        rmdir($dir);
    }
}
class CPostagem
{
    private $db;

    public function createPostagem(string $titulo, string $resumo, int $usuario, string $tipo)
    {
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

    public function createPreview(
        int $postagemID,
        string $pastaPostagem,
        string $arquivo,
        string $titulo_postagem
    ) {
        $urlPostagem = "./foto.php?id=$postagemID";
        $urlFoto = $pastaPostagem . $arquivo;
        $previewQuery = "INSERT INTO preview(`preview_resumo`, `preview_foto`, `preview_url`) VALUES ('$titulo_postagem','$urlFoto', '$urlPostagem')";
        $this->db->query($previewQuery);
    }

    public function carregarPostagemId(int $limite = 10, string $tipo)
    {
        $sql = "SELECT postagem_id FROM postagem WHERE postagem_tipo = '$tipo' ORDER BY postagem_data DESC LIMIT $limite";
        $IDs = array();
        $query = $this->db->query($sql);
        while ($postagem = $query->fetch_assoc()) {
            array_push($IDs, $postagem['postagem_id']);
        }

        return $IDs;
    }

    public function getPostagemIdByUser(int $usuario_id)
    {
        $sql = "SELECT postagem_id FROM postagem WHERE usuario_id = $usuario_id";
        $arr = array();
        $result = $this->db->query($sql);
        if ($result->num_rows == 0) {
            return false;
        } else {
            while ($row = $result->fetch_assoc()) {
                array_push($arr, $row['postagem_id']);
            }
        }
        return $arr;
    }


    public function getPostagem(int $id)
    {
        $sql = "SELECT * FROM postagem WHERE postagem_id = $id";
        $result = $this->db->query($sql);
        if ($result->num_rows == 0) {
            return false;
        }
        return $result->fetch_assoc();
    }

    public function getAutor(int $usuario_id)
    {
        $result = $this->db->query("SELECT usuario_nome FROM usuario WHERE usuario_id = '$usuario_id'");
        return $result->fetch_array()[0];
    }

    function __construct(mysqli $conn)
    {
        $this->db = $conn;
    }

    public function curtir(int $postagemID, int $usuarioID)
    {
        try {
            $sql = "SELECT * FROM curtida WHERE postagem_id = $postagemID AND usuario_id = $usuarioID";
            if ($this->db->query($sql)->num_rows > 0) {
                $sql = "DELETE FROM curtida WHERE postagem_id = $postagemID AND usuario_id = $usuarioID";
                $this->db->query($sql);
            } else {
                $sql = "INSERT INTO curtida(postagem_id, usuario_id) VALUES ($postagemID, $usuarioID)";
                $this->db->query($sql);
            }
        } catch (\Throwable $th) {
            return $th;
        }
    }

    public function getCurtidas(int $postagemID)
    {
        $sql = "SELECT * FROM curtida WHERE postagem_id = $postagemID";
        $query = $this->db->query($sql);
        return $query->num_rows;
    }

    public function deletePostagem(int $postagemID)
    {
        try {

            $postagem = $this->getPostagem($postagemID);
            $autor = $this->getAutor($postagem['usuario_id']);
            $titulo = $postagem['postagem_titulo'];


            rrmdir("../users/$autor/$titulo/");
            $sql = "DELETE FROM preview WHERE preview_resumo = '$titulo'";
            $this->db->query($sql);
            $sql = "DELETE FROM foto WHERE postagem_id = $postagemID";
            $this->db->query($sql);
            $sql = "DELETE FROM curtida WHERE postagem_id = $postagemID";
            $this->db->query($sql);
            $sql = "DELETE FROM postagem WHERE postagem_id = $postagemID";
            $this->db->query($sql);
        } catch (\Throwable $th) {
            return $th;
        }
    }

    public function updatePostagem(int $postagemID, string $resumo, string $ntitulo, string $otitulo, int $userID)
    {
        $autor = $this->getAutor($userID);
        rename("../users/$autor/$otitulo/", "../users/$autor/$ntitulo/");

        $previewfoto = "../users/$autor/$ntitulo/homi.jpg";
        $sql = "UPDATE preview SET preview_resumo = '$ntitulo', preview_foto = '$previewfoto' WHERE preview_resumo = '$otitulo'";
        $this->db->query($sql);
        $sql = "UPDATE postagem SET postagem_resumo = '$resumo', postagem_titulo = '$ntitulo' WHERE postagem_id = $postagemID";
        $this->db->query($sql);
    }
}
