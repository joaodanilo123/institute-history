<?php

class Server
{
    public static function existInPOST(array $elements)
    {
        global $_POST;
        global $_SERVER;

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $ok = false;
            $totalElem = count($elements);
            for($i=0; $i < $totalElem; $i++) { 
                if (!isset($_POST[$elements[$i]])) {
                    $ok = false;
                } elseif ($i == $totalElem - 1) { 
                    $ok =  true;
                }
            }

            return $ok;

        } else {
            return false;
        }
    }
    public static function userIsLogged()
    {
        global $_SESSION;

        return isset($_SESSION['id']);
    }

    public static function createDirPostagem(string $path, string $user, string $titulo)
    {
        $local = "$path/$user/$titulo/";
        mkdir($local, 0777);

        return $local;
    }
}
