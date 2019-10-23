-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Out-2019 às 14:36
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atividade_trigger`
--
CREATE DATABASE IF NOT EXISTS `atividade_trigger` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `atividade_trigger`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `f_id` smallint(3) NOT NULL,
  `f_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`f_id`, `f_nome`) VALUES
(1, 'Pedro'),
(3, 'Ana'),
(4, 'Rafael'),
(5, 'Lucas'),
(6, 'Eliza'),
(7, 'Vitor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `f_p`
--

CREATE TABLE `f_p` (
  `p_id` smallint(3) NOT NULL,
  `f_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `p_id` smallint(3) NOT NULL,
  `p_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`p_id`, `p_nome`) VALUES
(1, 'Site da empresa'),
(2, 'Marketing do novo produto');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `f_p`
--
ALTER TABLE `f_p`
  ADD KEY `p_id` (`p_id`),
  ADD KEY `f_id` (`f_id`);

--
-- Indexes for table `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`p_id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `f_p`
--
ALTER TABLE `f_p`
  ADD CONSTRAINT `f_p_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `projeto` (`p_id`),
  ADD CONSTRAINT `f_p_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `funcionario` (`f_id`);
--
-- Database: `biologia`
--
CREATE DATABASE IF NOT EXISTS `biologia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `biologia`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `jogador_id` tinyint(3) NOT NULL,
  `jogador_nome` varchar(100) NOT NULL,
  `jogador_senha` char(32) NOT NULL,
  `jogador_recorde` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`jogador_id`, `jogador_nome`, `jogador_senha`, `jogador_recorde`) VALUES
(10, 'JoÃ£o', '202cb962ac59075b964b07152d234b70', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `prof_id` int(3) NOT NULL,
  `prof_nome` varchar(250) NOT NULL,
  `prof_senha` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`prof_id`, `prof_nome`, `prof_senha`) VALUES
(1, 'candida', '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `questao`
--

CREATE TABLE `questao` (
  `id` int(3) NOT NULL,
  `enunciado` varchar(500) NOT NULL,
  `op_1` varchar(500) NOT NULL,
  `op_2` varchar(500) NOT NULL,
  `op_3` varchar(500) NOT NULL,
  `op_4` varchar(500) NOT NULL,
  `op_5` varchar(500) NOT NULL,
  `respondida` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `questao`
--

INSERT INTO `questao` (`id`, `enunciado`, `op_1`, `op_2`, `op_3`, `op_4`, `op_5`, `respondida`) VALUES
(8, 'Qual destas plantas ficou conhecida por ser usada na fabricaÃ§Ã£o de papel?(mÃ©dia-difÃ­cil)', 'Palmeira', 'Samambaia', 'Louro', 'Nenhuma das alternativas', 'Cannabis', 0),
(9, 'Quais os benefÃ­cios da cannabis para a saÃºde?(fÃ¡cil)', 'Cura as frieiras dos pÃ©s ', 'Faz bem para o tratamento de pele', 'Faz bem para os olhos ', 'Ajuda no crescimento do cabelo', 'Ajuda com distÃºrbios psÃ­quicos e ajuda no combate ao cÃ¢ncer', 0),
(10, 'Qual a origem do Louro?(DifÃ­cil)', 'Deserto', 'Muitas partes do mundo ', ' Ãfrica ', 'TrÃ³picos', 'Ãsia Menor', 0),
(11, 'Quais as caracterÃ­sticas da babosa?(mÃ©dio)', ' Uma planta que tem seus galhos secos separados de suas â€œcascasâ€ de cor marrom-avermelhadas, muito perfumadas. Essa Ã¡rvore Ã© nativa do antigo CeilÃ£o, atual Sri Lanka, ao sul da Ãndia.', ' Planta herbÃ¡cea ou subarbustiva, perene, de atÃ© 1,5 metros de altura. Folhas suculentas e aromÃ¡ticas, de sabor muito amargo. Ã‰ uma Ã¡rvore do Chile cujas folhas secas e quebradiÃ§as com cheiro de mastruÃ§o sÃ£o encontradas no comÃ©rcio, mas nÃ£o Ã© cultivado no Brasil.', 'A planta Ã© perene, de 5 a 20 metros de altura e o seu tronco Ã© geralmente reto. As folhas sÃ£o coriÃ¡ceas, de cor verde-escura, aroma muito agradÃ¡vel, formato oval, de 3 a 9 centÃ­metros de comprimento por 4 centÃ­metros de largura, margens ligeiramente onduladas, superfÃ­cie lisa e brilhante nas duas faces.', 'Ã‰ uma planta rica em iodo, ferro, enxofre, fÃ³sforo, vitamina A, C, E e complexo B. Seus nutrientes sÃ£o importantes para o funcionamento correto da glÃ¢ndula tireÃ³ide, evitam a fadiga e ajudam na manutenÃ§Ã£o da saÃºde da pele e na formaÃ§Ã£o dos ossos e dentes.', ' Planta herbÃ¡cea suculenta, de atÃ© 1 metro de altura. Quando cortadas deixam escorrer um suco viscoso, amarelado, e muito amargo. AlÃ©m de ser cultivada para fins medicinais, cosmÃ©ticos e ornamentais, cresce tambÃ©m de forma espontÃ¢nea em toda a regiÃ£o nordeste brasileira.', 0),
(12, 'Qual o nome cientÃ­fico do louro?(DifÃ­cil)', 'Taraxacum Officinale', 'Nasturtium Officinale ', 'Aloe Vera', 'Cinnamomum Verum', 'Laurus Nobilis', 0),
(13, 'Qual destas plantas Ã© conhecida por seu efeito anti-inflamatÃ³rio, alÃ©m de ser popular por conta de seu sabor?(FÃ¡cil)', 'Babosa', 'Louro', 'AgriÃ£o', 'Cannabis', 'HortelÃ£', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`jogador_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`prof_id`);

--
-- Indexes for table `questao`
--
ALTER TABLE `questao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jogador`
--
ALTER TABLE `jogador`
  MODIFY `jogador_id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `prof_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questao`
--
ALTER TABLE `questao`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Database: `foxish`
--
CREATE DATABASE IF NOT EXISTS `foxish` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `foxish`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `aluno_id` int(11) NOT NULL,
  `aluno_name` varchar(40) NOT NULL,
  `aluno_senha` varchar(32) NOT NULL,
  `aluno_email` varchar(40) NOT NULL,
  `aluno_foto` varchar(200) NOT NULL,
  `aluno_xp` int(9) NOT NULL,
  `aluno_nivel` int(3) NOT NULL DEFAULT '1',
  `aluno_fluencia` enum('Iniciante','Aprendiz','Mediano','Fluente','GODLIKE') NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`aluno_id`, `aluno_name`, `aluno_senha`, `aluno_email`, `aluno_foto`, `aluno_xp`, `aluno_nivel`, `aluno_fluencia`, `data_cadastro`) VALUES
(2, 'Jonas', '202cb962ac59075b964b07152d234b70', 'jonas@gmail.com', 'eu.jpg', 0, 0, 'Iniciante', '2019-09-10 11:02:07'),
(3, 'Pedro', '202cb962ac59075b964b07152d234b70', 'Pedro@gmail.com', 'eu.jpg', 0, 0, 'Iniciante', '2019-09-10 19:25:16'),
(4, 'Ana', '202cb962ac59075b964b07152d234b70', 'ana@gmail.com', 'eu.jpg', 0, 0, 'Iniciante', '2019-09-10 19:25:34'),
(5, 'Kamile', '36fa64a76908b8489e7a89d5c72857c0', 'kami@gmail.com', 'O-que-as-pessoas-felizes-tÃªm-em-comum-site-830x450.jpg', 0, 0, 'Iniciante', '2019-09-11 09:11:54'),
(6, 'Leon', '5c443b2003676fa5e8966030ce3a86ea', 'leon@gmail.com', 'Toni+perfil.png', 0, 3, 'Mediano', '2019-09-11 09:13:02'),
(8, 'juan', 'a94652aa97c7211ba8954dd15a3cf838', 'juan@gmail.com', 'Toni+perfil.png', 0, 1, 'Iniciante', '2019-09-11 15:17:28'),
(9, 'juan1', 'e744f57da9e5a4bb6ec8ba3bc0ad3e4e', 'juan1@gmail.com', 'Toni+perfil.png', 0, 1, 'Iniciante', '2019-09-11 15:18:11'),
(10, 'lolo', '7ce8636c076f5f42316676f7ca5ccfbe', 'lo@gmail.com', 'O-que-as-pessoas-felizes-tÃªm-em-comum-site-830x450.jpg', 0, 1, 'Iniciante', '2019-09-11 15:18:49'),
(11, 'ana maria', '25f9e794323b453885f5181f1b624d0b', 'ana@gmail.com', 'Toni+perfil.png', 0, 1, 'Iniciante', '2019-09-12 09:51:39'),
(12, 'uiu', '202cb962ac59075b964b07152d234b70', 'dsaisa@hotmail.com', 'Toni+perfil.png', 0, 1, 'Iniciante', '2019-09-12 11:03:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `nome_chat` varchar(100) DEFAULT NULL,
  `turma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `chat`
--

INSERT INTO `chat` (`id_chat`, `nome_chat`, `turma_id`) VALUES
(4, 'turma bruno', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `id_msg` int(11) NOT NULL,
  `texto_msg` varchar(1000) DEFAULT NULL,
  `autor_msg` varchar(1000) DEFAULT NULL,
  `id_chat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`id_msg`, `texto_msg`, `autor_msg`, `id_chat`) VALUES
(1, 'OlÃ¡', 'Bruno', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof`
--

CREATE TABLE `prof` (
  `prof_id` int(11) NOT NULL,
  `prof_name` varchar(200) NOT NULL,
  `prof_senha` varchar(32) NOT NULL,
  `prof_email` varchar(200) NOT NULL,
  `prof_localtrabalho` varchar(200) NOT NULL,
  `prof_foto` varchar(200) NOT NULL,
  `data_cadastro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prof`
--

INSERT INTO `prof` (`prof_id`, `prof_name`, `prof_senha`, `prof_email`, `prof_localtrabalho`, `prof_foto`, `data_cadastro`) VALUES
(1, 'Joao', '202cb962ac59075b964b07152d234b70', 'Joao@gmail.com', 'IFFar', 'eu.jpg', '2019-09-10 18:25:10'),
(2, 'Bruno', 'e3928a3bc4be46516aa33a79bbdfdb08', 'bruno@gmail.com', 'roncalli', '18404-gente-que-da-prioridade-aos-sentimentos-article_gallery-2.jpg', '2019-09-11 09:02:27'),
(3, 'Augusto', '8bcc25c96aa5a71f7a76309077753e67', 'augus@gmail.com', 'roncall', '18404-gente-que-da-prioridade-aos-sentimentos-article_gallery-2.jpg', '2019-09-11 09:54:03'),
(4, 'Nicoly Gaier', 'e10adc3949ba59abbe56e057f20f883e', 'nicgaier@gmail.com', 'Loja', 'Toni+perfil.png', '2019-09-11 10:49:36'),
(5, 'bbvnbn', '4607e782c4d86fd5364d7e4508bb10d9', 'bbvnbn@gmail.com', 'Loja', 'O-que-as-pessoas-felizes-tÃªm-em-comum-site-830x450.jpg', '2019-09-12 09:54:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `questao`
--

CREATE TABLE `questao` (
  `id` int(3) NOT NULL,
  `enunciado` varchar(800) NOT NULL,
  `op_1` varchar(250) NOT NULL,
  `op_2` varchar(250) NOT NULL,
  `op_3` varchar(250) NOT NULL,
  `op_4` varchar(250) NOT NULL,
  `op_5` varchar(250) NOT NULL,
  `teste_turma` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `questao`
--

INSERT INTO `questao` (`id`, `enunciado`, `op_1`, `op_2`, `op_3`, `op_4`, `op_5`, `teste_turma`) VALUES
(1, 'I think she spent too much money ____ thoses clothes.', 'in', 'at', 'with', 'without', 'on', '0'),
(2, 'What\'s the _____________________ there today?', 'weather', 'time', 'clime', 'time like', 'weather like', '0'),
(3, 'There\'s a parking lot _____________ from the bookstore.', 'oposite', 'across', 'around', 'afar', 'near', '0'),
(4, 'She _________ for _________ while she was studying in the U.S.A.', 'work / he', 'work / him', 'works / he', 'work/himself', 'works / him', '0'),
(5, 'Alexander is  _______ a book right now.', 'readed', 'read', 'to read', 'reader', 'reading', '0'),
(6, '_____ you like to do in the weeknd\'s.', 'whose', 'how', 'do', 'where', 'what', '0'),
(7, 'Don\'t put your cup on the _____ of the table, someone will knock it off!', 'outside', 'end', 'boundary', 'border', 'edge', '0'),
(8, 'I don\'t like that noise. ___________ has to do _____________ about it.', 'someone / anything', 'somebody / anything', 'something / anything', 'somebody/something', 'someone / something', '0'),
(9, 'This new printer is recommended as being ___ reliable.', 'greatly', 'strongly', 'readily', 'incredibly', 'highly', '0'),
(10, 'I need to go\r\ndown town tomorrow\r\n. ____ you ______ me a ride?', 'Was/Take ', 'Was/Give', 'Will/Take', 'Will/got', 'Will/Give', '0'),
(11, ' I _________ a summer course in New York last year. I _________ how to play the drums and now I _________ in a rock band\r\nwith my cousins. My brother _________ to go\r\nto New York\r\nnext year and learn how to play the drums too.', 'take / learn / play / liked', 'am going to take / learned / play / wants', 'did take / learned / playing / does want ', 'taking/learn/am playing/liked', 'took / learned / am playing / would like', '0'),
(12, 'My wife Susan and my daughter Stephanie _________ mall rats. They _________ to the mall every week and buy things we do not need. On Saturday, they _________ a bicycle, but they don\'t know how to ride a bike! Stephanie always _________ that she _____.', 'is / are going / bought / say / likes', 'is / do go\r\n    / is going to buy / say / likes', 'are / go\r\n    / did buy\r\n    / said / liked', 'are / go\r\n    / bought\r\n    / says / would like', 'is / going / did buy / says / liked', '0'),
(13, 'Selecione a frase\r\n    correta:\r\n    ', 'When is Mrs. Baker going to finish his report?', 'When Mrs. Baker is going finish her report?', 'When\'s Mrs. Baker are going to finish her report?', 'When is Mrs. Baker going finish his report?', 'When is Mrs. Baker going to finish her report?', '0'),
(14, 'Selecione a frase\r\ncorreta:\r\n', 'Mrs. Lewis usually is tired at the\r\nend of the week', 'The Wilsons have always dinner together', 'My parents often are at home on weekends', 'Some people did not had a good 2012', 'Mr. Thompson never goes out on Mondays and Wednesdays', '0'),
(15, 'Selecione a frase\r\ncorreta:\r\n', 'Mr. Davis will give we a game console on Christmas', 'Mr. Davis will give our a game console on Christmas', 'Mr. Davis will give ours a game console on Christmas', 'Mrs. Davis will give yours a game console on Christmas', 'Mr. Davis will give us a game console on Christmas', '0'),
(16, 'Selecione a frase\r\ncorreta:\r\n', 'I would like drink some water', 'Katie and her friends usually get together at the mall on Saturdays', 'Jim was fired yesterday. We need to cheer him over', 'I waited for Brian for almost an hour, but he didn\'t show out', 'Rebecca has put in a lot of weight in the past months', '0'),
(17, 'Selecione a frase\r\n    INCORRETA:\r\n    ', 'In 2011 that company hired over 150 new employees.', 'Was there someone in the hallway?.', 'Sorry, but nobody can help you do your term paper.', 'Wasn\'t there anyone in class when you arrived?', 'There was anybody outside waiting for you, Mr. Baker.', '0'),
(18, 'Enumere\r\ncorretamente:\r\n<br><br>\r\n        1- Thanks, Julie. <br>                   \r\n        2- How much is that blouse? <br>        \r\n        3- What color is your new dress? <br>   \r\n        4- What\'s your phone number? <br>        \r\n        5- Where\'s my notebook? <br><br>\r\n(    ) It\'s red. <br>\r\n    (    ) You\'re welcome. <br>\r\n(    ) It\'s 346-7098. <br>\r\n    (    ) It\'s under the desk. <br>\r\n(    ) It\'s $19,99. <br>\r\n    ', '2, 5, 3, 4, 1', '3, 2, 4, 5, 1', '4, 3, 1, 5, 2', '3, 4, 2, 1, 5', '3, 1, 4, 5, 2', '0'),
(19, 'Enumere\r\n    corretamente:\r\n    1- Have You.           <br>                 \r\n        2-\r\n    While I was taking a shower   <br>       \r\n        3- Emma has worked for that company  <br>   \r\n        4- My present teacher is Mr. Forman    <br> \r\n        5- I have spoken to him about it       <br> <br>\r\n    (    ) For many years. <br>\r\n    (    ) I\'ve studied\r\nwith him for 6 months. <br>\r\n(    ) John was preparing dinner. <br>\r\n(    ) Polish your shoes yet? <br>\r\n(    ) Several times. <br>', '2, 5, 3, 4, 1', '3, 2, 4, 5, 1', '4, 3, 1, 5, 2', '2, 1, 3, 5, 4', '3, 4, 2, 1, 5', '0'),
(20, 'Enumere\r\ncorretamente:\r\n<br><br>\r\n    1- I\'m not enjoying my course in college <br>\r\n        2- The problem is that i have no idea of what to do<br>\r\n        3- I hope the student counselor can help me <br>\r\n        4- For now, there is nothing much I can do but keep on studying. <br>\r\n        5- this past year has been a nightmare <br> <br>\r\n    (  ) So it\'s going to be hard to choose one. <br>\r\n(  ) I hope next term things will change for the bether. <br>\r\n(  ) I thought about it very seriously. I\'m going to change it. <br>\r\n    (  ) The exams finish in three days. <br>\r\n    (  ) I have an appointment\r\n    with him tomorrow afternoon.  < br >', '3, 5, 4, 1, 2', '2, 4, 1, 2, 5', '3, 1, 5, 4, 2', '1, 4, 2, 3, 5', '2, 5, 1, 4, 3', '0'),
(21, 'Enumere\r\n    corretamente:<br><br>\r\n        1- How\'s it going? <br>\r\n        2-  How do you spell it? <br>\r\n        3- Let\'s go\r\n    shopping. <br\r\n    >\r\n        4- Goodbye. <br>\r\n        5- Thank you very much. <br> <br>\r\n    (  ) You\'  re welcome. <br>\r\n(  ) Good idea! <br>\r\n(  ) Take care. <br>\r\n(  ) T-H-O-R-N-E. <br>\r\n(  ) I\'m fine, thanks. <br> ', '3, 1, 2, 4, 5', '1, 4, 2, 5, 3', '1, 3, 5, 2, 4', '2, 5, 3, 1, 4', '3, 4, 2, 1, 5', '0'),
(22, 'Enumere\r\n    corretamente:<br><br>\r\n        1-  _________ did your parents go\r\n    last weekend\r\n    ? <br>\r\n        2-  _________ did you eat for dinner last night? <br>\r\n        3-  _________ did you need to get up early last Sunday? <br>\r\n        4-  _________ did your friends buy new clothes at the mall? <br>\r\n        5-  _________ did you have dinner\r\n    with last weekend? <br><br>\r\n    (  ) What <br>\r\n    (  ) Who <br>\r\n    (  ) Where <br>\r\n    (  ) Why <br>\r\n    (  ) When <br>', '3, 5, 2, 1, 4', '2, 1, 4, 5, 3', '2, 5, 3, 1, 4', '3, 2, 5, 4, 1', '2, 5, 1, 3, 4', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `turma_id` int(11) NOT NULL,
  `turma_nome` varchar(200) NOT NULL,
  `aluno_1` int(3) NOT NULL,
  `aluno_2` int(3) NOT NULL,
  `aluno_3` int(3) NOT NULL,
  `prof_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`turma_id`, `turma_nome`, `aluno_1`, `aluno_2`, `aluno_3`, `prof_id`) VALUES
(1, 'Turma Prof. Bruno', 2, 5, 6, 2),
(12, 'v bbvnbn', 55, 12545, 24578, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`aluno_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Indexes for table `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`id_msg`),
  ADD KEY `id_chat` (`id_chat`);

--
-- Indexes for table `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`prof_id`);

--
-- Indexes for table `questao`
--
ALTER TABLE `questao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`turma_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `aluno_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mensagem`
--
ALTER TABLE `mensagem`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prof`
--
ALTER TABLE `prof`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questao`
--
ALTER TABLE `questao`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `turmas`
--
ALTER TABLE `turmas`
  MODIFY `turma_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`turma_id`);

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `mensagem_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id_chat`);
--
-- Database: `institute_history`
--
CREATE DATABASE IF NOT EXISTS `institute_history` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `institute_history`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE `foto` (
  `foto_id` smallint(3) NOT NULL,
  `foto_arquivo` varchar(255) NOT NULL,
  `fp_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_postagem`
--

CREATE TABLE `foto_postagem` (
  `fp_id` smallint(3) NOT NULL,
  `fp_titulo` varchar(80) NOT NULL,
  `fp_resumo` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `memoria`
--

CREATE TABLE `memoria` (
  `memoria_id` smallint(3) NOT NULL,
  `memoria_titulo` varchar(50) NOT NULL,
  `memoria_texto` text NOT NULL,
  `usuario_id` smallint(3) NOT NULL,
  `memoria_data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('JoÃ£o', 'jddiedrich@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'eu.jpg', b'0', 5),
('Leon', 'leon@gmail.com', '202cb962ac59075b964b07152d234b70', 'WIN_20190327_16_36_32_Pro.jpg', b'0', 6),
('Ana', 'ana@gmail.com', '202cb962ac59075b964b07152d234b70', '18404-gente-que-da-prioridade-aos-sentimentos-article_gallery-2.jpg', b'0', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `video_id` smallint(3) NOT NULL,
  `video_titulo` varchar(50) NOT NULL,
  `video_resumo` varchar(255) NOT NULL,
  `video_arquivo` varchar(50) NOT NULL,
  `usuario_id` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `fp_id` (`fp_id`);

--
-- Indexes for table `foto_postagem`
--
ALTER TABLE `foto_postagem`
  ADD PRIMARY KEY (`fp_id`);

--
-- Indexes for table `memoria`
--
ALTER TABLE `memoria`
  ADD PRIMARY KEY (`memoria_id`),
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
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `foto_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memoria`
--
ALTER TABLE `memoria`
  MODIFY `memoria_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preview`
--
ALTER TABLE `preview`
  MODIFY `preview_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`fp_id`) REFERENCES `foto_postagem` (`fp_id`);

--
-- Limitadores para a tabela `memoria`
--
ALTER TABLE `memoria`
  ADD CONSTRAINT `memoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);
--
-- Database: `nodecrud`
--
CREATE DATABASE IF NOT EXISTS `nodecrud` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `nodecrud`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` smallint(3) NOT NULL,
  `usuario_nome` varchar(80) COLLATE utf8_swedish_ci NOT NULL,
  `usuario_senha` varchar(32) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nome`, `usuario_senha`) VALUES
(1, 'Thiago', '202cb962ac59075b964b07152d234b70'),
(2, 'Pedro', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'sf', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuaÃ§Ã£o)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"ConteÃºdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"ConteÃºdo da tabela @TABLE@ (continuaÃ§Ã£o)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"atividade_trigger\",\"table\":\"f_p\"},{\"db\":\"atividade_trigger\",\"table\":\"projeto\"},{\"db\":\"atividade_trigger\",\"table\":\"funcionario\"},{\"db\":\"atividade_trigger\",\"table\":\"funcionario projeto\"},{\"db\":\"institute_history\",\"table\":\"foto\"},{\"db\":\"institute_history\",\"table\":\"foto_postagem\"},{\"db\":\"institute_history\",\"table\":\"memoria\"},{\"db\":\"biologia\",\"table\":\"jogador\"},{\"db\":\"biologia\",\"table\":\"questao\"},{\"db\":\"biologia\",\"table\":\"professor\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-10-23 12:36:29', '{\"lang\":\"pt\",\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":288}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
