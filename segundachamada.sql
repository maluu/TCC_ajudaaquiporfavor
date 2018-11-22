-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 22-Nov-2018 às 16:39
-- Versão do servidor: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `segundachamada`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `matricula` int(32) DEFAULT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `cod_curso` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `nome` varchar(80) DEFAULT NULL,
  `cod_disciplina` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pedido`
--

CREATE TABLE `Pedido` (
  `motivo` varchar(80) DEFAULT NULL,
  `dt_inicial` date DEFAULT NULL,
  `cod_pedido` int(11) NOT NULL,
  `curso` varchar(80) DEFAULT NULL,
  `disciplina` varchar(80) DEFAULT NULL,
  `turma` varchar(80) DEFAULT NULL,
  `professor` varchar(80) DEFAULT NULL,
  `anexo` varchar(1000) DEFAULT NULL,
  `fk_matricula` int(32) DEFAULT NULL,
  `estado` int(20) DEFAULT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Extraindo dados da tabela `Pedido`
--

INSERT INTO `Pedido` (`motivo`, `dt_inicial`, `cod_pedido`, `curso`, `disciplina`, `turma`, `professor`, `anexo`, `fk_matricula`, `estado`, `descricao`) VALUES
('das', '2018-10-03', 1, 'asda', 'asd', 'asdas', 'asd', '30102018100227Captura de tela de 2018-09-03 10-26-52.png', 0, NULL, NULL),
('ah tava votando no bolsomistoquente', '2018-10-02', 2, 'informatica', 'projeto', '3info1', 'kelly', '30102018100401Captura de tela de 2018-09-03 09-53-36.png', 0, NULL, NULL),
(NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, 0, 1, 'Deferido'),
(NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, 0, 2, 'Indeferido'),
('Bla', '2018-10-26', 7, 'info', 'bla', '3info1', 'Ivo', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo` int(10) NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo`, `descricao`) VALUES
(1, 'Aluno'),
(2, 'Coordenador'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `cod_turma` int(30) NOT NULL,
  `cod_curso` int(30) DEFAULT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `ano` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`cod_turma`, `cod_curso`, `nome`, `ano`) VALUES
(1, 10203040, '3Informatica1', '3info1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `nome` varchar(80) DEFAULT NULL,
  `senha` varchar(80) DEFAULT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `idtipo_usuario` int(32) NOT NULL,
  `matricula` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`nome`, `senha`, `foto`, `email`, `idtipo_usuario`, `matricula`) VALUES
('Maria Luiza', 'malu', NULL, 'malu@gmail.com', 2, 2016301520),
('Guilherme Cipriano', 'cipriano', NULL, 'guuilherme.cp@live.com', 1, 2016301626);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`cod_curso`),
  ADD KEY `matricula` (`matricula`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`cod_disciplina`);

--
-- Indexes for table `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`cod_pedido`),
  ADD KEY `fk_matricula` (`fk_matricula`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`cod_turma`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `user_id` (`idtipo_usuario`),
  ADD KEY `idtipo_usuario` (`idtipo_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `cod_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `cod_turma` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `matricula` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2016301627;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_idtipousuario` FOREIGN KEY (`idtipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
