CREATE DATABASE  institute_history;
USE institute_history;

-- Estrutura da tabela `foto`

CREATE TABLE foto(
  foto_id smallint(3) NOT NULL,
  foto_arquivo varchar(255) NOT NULL,
  fp_id smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Estrutura da tabela `foto_postagem`
CREATE TABLE `foto_postagem` (
  fp_id smallint(3) NOT NULL,
  fp_titulo varchar(80) NOT NULL,
  fp_resumo varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Estrutura da tabela `memoria`
CREATE TABLE memoria (
  memoria_id smallint(3) NOT NULL,
  memoria_titulo varchar(50) NOT NULL,
  memoria_texto text NOT NULL,
  usuario_id smallint(3) NOT NULL,
  memoria_data date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Estrutura da tabela `preview`
CREATE TABLE preview (
  preview_id smallint(3) NOT NULL,
  preview_resumo varchar(255) NOT NULL,
  preview_foto varchar(255) DEFAULT NULL,
  preview_url varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Estrutura da tabela `usuario`
CREATE TABLE usuario (
  usuario_nome varchar(50) NOT NULL,
  usuario_email varchar(50) NOT NULL,
  usuario_senha char(32) NOT NULL,
  usuario_foto varchar(1000) NOT NULL,
  usuario_admin bit(1) NOT NULL DEFAULT b'0',
  usuario_id smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Extraindo dados da tabela `usuario`
INSERT INTO `usuario` (`usuario_nome`, `usuario_email`, `usuario_senha`, `usuario_foto`, `usuario_admin`, `usuario_id`) VALUES
('JoÃ£o', 'jddiedrich@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'eu.jpg', b'0', 5),
('Leon', 'leon@gmail.com', '202cb962ac59075b964b07152d234b70', 'WIN_20190327_16_36_32_Pro.jpg', b'0', 6),
('Ana', 'ana@gmail.com', '202cb962ac59075b964b07152d234b70', '18404-gente-que-da-prioridade-aos-sentimentos-article_gallery-2.jpg', b'0', 7);

-- Estrutura da tabela `videos`
CREATE TABLE videos (
  video_id smallint(3) NOT NULL,
  video_titulo varchar(50) NOT NULL,
  video_resumo varchar(255) NOT NULL,
  video_arquivo varchar(50) NOT NULL,
  usuario_id smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE foto
ADD PRIMARY KEY (foto_id),
ADD KEY fp_id (fp_id);

ALTER TABLE foto_postagem
ADD PRIMARY KEY (fp_id);

ALTER TABLE memoria
ADD PRIMARY KEY (memoria_id),
ADD KEY usuario_id (usuario_id);

ALTER TABLE preview
ADD PRIMARY KEY (preview_id);

ALTER TABLE usuario
ADD PRIMARY KEY (usuario_id),
ADD UNIQUE KEY email (usuario_email);

ALTER TABLE videos
ADD PRIMARY KEY (video_id),
ADD KEY usuario_id (usuario_id);

ALTER TABLE foto
MODIFY foto_id smallint(3) NOT NULL AUTO_INCREMENT;

ALTER TABLE memoria
MODIFY memoria_id smallint(3) NOT NULL AUTO_INCREMENT;

ALTER TABLE preview
MODIFY preview_id smallint(3) NOT NULL AUTO_INCREMENT;

ALTER TABLE usuario
  MODIFY usuario_id smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE videos
  MODIFY video_id smallint(3) NOT NULL AUTO_INCREMENT;

-- Limitadores para a tabela `foto`
--
ALTER TABLE foto
ADD CONSTRAINT foto_ibfk_1 FOREIGN KEY (fp_id) REFERENCES foto_postagem (fp_id);

--
-- Limitadores para a tabela `memoria`
--
ALTER TABLE memoria
  ADD CONSTRAINT memoria_ibfk_1 FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id);

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE videos
  ADD CONSTRAINT videos_ibfk_1 FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id);

select * from usuario