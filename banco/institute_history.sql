-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13-Nov-2019 às 12:00
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.3
CREATE DATABASE institute_history;
use institute_history;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `institute_history`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `comentario_id` smallint(3) NOT NULL,
  `c_texto` text NOT NULL,
  `c_data` datetime NOT NULL,
  `usuario_id` smallint(3) NOT NULL,
  `postagem_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtida`
--

CREATE TABLE `curtida` (
  `usuario_id` smallint(3) NOT NULL,
  `postagem_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `curtida`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncia`
--

CREATE TABLE `denuncia` (
  `denuncia_id` smallint(3) NOT NULL,
  `postagem_id` smallint(3) NOT NULL,
  `denuncia_descricao` text NOT NULL,
  `denuncia_aberta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE `foto` (
  `foto_id` smallint(3) NOT NULL,
  `foto_arquivo` varchar(300) NOT NULL,
  `postagem_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`foto_id`, `foto_arquivo`, `postagem_id`) VALUES
(4, 'homi.jpg', 3),
(5, 'homi2.png', 3),
(6, 'muie.jpg', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagem`
--

CREATE TABLE `postagem` (
  `postagem_id` smallint(3) NOT NULL,
  `postagem_titulo` varchar(300) NOT NULL,
  `usuario_id` smallint(3) NOT NULL,
  `postagem_data` datetime NOT NULL,
  `postagem_resumo` text,
  `postagem_curtidas` smallint(3) NOT NULL,
  `postagem_tipo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `postagem`
--

INSERT INTO `postagem` (`postagem_id`, `postagem_titulo`, `usuario_id`, `postagem_data`, `postagem_resumo`, `postagem_curtidas`, `postagem_tipo`) VALUES
(3, 'Exemplo de postagem', 11, '2019-11-12 19:15:11', 'Essa foto Ã© um teste', 0, 'foto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `preview`
--

CREATE TABLE `preview` (
  `preview_id` smallint(3) NOT NULL,
  `preview_resumo` varchar(255) NOT NULL,
  `preview_foto` varchar(255) DEFAULT NULL,
  `preview_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `preview`
--

INSERT INTO `preview` (`preview_id`, `preview_resumo`, `preview_foto`, `preview_url`) VALUES
(1, 'Exemplo de postagem', '../users/Joao/Exemplo de postagem/homi.jpg', './foto.php?id=3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_nome` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  `usuario_senha` char(32) NOT NULL,
  `usuario_foto` varchar(1000) NOT NULL,
  `usuario_admin` bit(1) NOT NULL DEFAULT b'0',
  `usuario_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_nome`, `usuario_email`, `usuario_senha`, `usuario_foto`, `usuario_admin`, `usuario_id`) VALUES
('Maisa11', 'maisa@hotmail.com', '10', 'eu.jpg', b'0', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `video_id` smallint(3) NOT NULL,
  `video_arquivo` varchar(300) NOT NULL,
  `postagem_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`comentario_id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `postagem_id` (`postagem_id`);

--
-- Indexes for table `curtida`
--
ALTER TABLE `curtida`
  ADD KEY `postagem_id` (`postagem_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`denuncia_id`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`foto_id`);

--
-- Indexes for table `postagem`
--
ALTER TABLE `postagem`
  ADD PRIMARY KEY (`postagem_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `preview`
--
ALTER TABLE `preview`
  ADD PRIMARY KEY (`preview_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email` (`usuario_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `comentario_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `denuncia_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `foto_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `postagem`
--
ALTER TABLE `postagem`
  MODIFY `postagem_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `preview`
--
ALTER TABLE `preview`
  MODIFY `preview_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `curtida`
--
ALTER TABLE `curtida`
  ADD CONSTRAINT `curtida_ibfk_1` FOREIGN KEY (`postagem_id`) REFERENCES `postagem` (`postagem_id`),
  ADD CONSTRAINT `curtida_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `postagem`
--
ALTER TABLE `postagem`
  ADD CONSTRAINT `postagem_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
