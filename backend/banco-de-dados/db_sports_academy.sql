-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Dez-2025 às 03:42
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_sports_academy`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atletas`
--

CREATE TABLE `atletas` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `data_nascimento` date NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `clube_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atletas`
--

INSERT INTO `atletas` (`id`, `nome`, `municipio`, `data_nascimento`, `categoria_id`, `clube_id`) VALUES
(5, 'Denil', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(6, 'Denil', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(7, 'Denil', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(8, 'Denil', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(9, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(10, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(11, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(12, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(13, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(14, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(15, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(16, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(17, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(18, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(19, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(20, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(21, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(22, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(23, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(24, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(25, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(26, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 5),
(30, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(31, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(32, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(33, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(34, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(35, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(36, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(37, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(38, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(39, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14),
(40, 'Denil Dinis', 'Kilamba Kiaxi', '2006-03-06', 3, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idade_min` int(11) NOT NULL,
  `idade_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `idade_min`, `idade_max`) VALUES
(1, 'Infantil', 7, 11),
(2, 'Júnior', 12, 17),
(3, 'Sénior', 18, 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clubes`
--

CREATE TABLE `clubes` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `municipio` varchar(150) NOT NULL,
  `total_vagas` int(11) NOT NULL DEFAULT 25,
  `total_atletas` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clubes`
--

INSERT INTO `clubes` (`id`, `nome`, `municipio`, `total_vagas`, `total_atletas`) VALUES
(1, 'Clube Atlético Viana', 'Viana', 25, 0),
(2, 'Esporte Clube Talatona', 'Talatona', 25, 0),
(3, 'Clube Desportivo Cacuaco', 'Cacuaco', 25, 0),
(4, 'União Futebol Clube Belas', 'Belas', 25, 0),
(5, 'Clube Recreativo Kilamba Kiaxi', 'Kilamba Kiaxi', 25, 26),
(6, 'Futebol Clube Cazenga', 'Cazenga', 25, 0),
(7, 'Sporting Clube Samba', 'Samba', 25, 0),
(8, 'Atlético Clube Quiçama', 'Quiçama', 25, 0),
(9, 'Desportivo Municipal Luanda', 'Luanda', 25, 0),
(10, 'Clube Jovens Talentos Viana', 'Viana', 25, 0),
(11, 'Futebol Clube Talatona', 'Talatona', 25, 0),
(12, 'Clube Estrela Cacuaco', 'Cacuaco', 25, 0),
(13, 'Clube Vitória Belas', 'Belas', 25, 0),
(14, 'Atlético Popular Kilamba Kiaxi', 'Kilamba Kiaxi', 25, 12),
(15, 'Clube Unidos Cazenga', 'Cazenga', 25, 0),
(16, 'Clube Marítimo Samba', 'Samba', 25, 0),
(17, 'Futebol Clube Diamante Quiçama', 'Quiçama', 25, 0),
(18, 'Clube Esperança Luanda', 'Luanda', 25, 0),
(19, 'Clube Atlético Jovem Viana', 'Viana', 25, 0),
(20, 'Desportivo da Cidade Talatona', 'Talatona', 25, 0),
(21, 'Clube Estrela do Sul Cacuaco', 'Cacuaco', 25, 0),
(22, 'Clube Olímpico Belas', 'Belas', 25, 0),
(23, 'Clube União Esportiva Kilamba Kiaxi', 'Kilamba Kiaxi', 25, 0),
(24, 'Futebol Clube Horizonte Cazenga', 'Cazenga', 25, 0),
(25, 'Clube Atlântico Samba', 'Samba', 25, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atletas`
--
ALTER TABLE `atletas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clube_id` (`clube_id`),
  ADD KEY `fk_categoria` (`categoria_id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atletas`
--
ALTER TABLE `atletas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clubes`
--
ALTER TABLE `clubes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atletas`
--
ALTER TABLE `atletas`
  ADD CONSTRAINT `atletas_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `atletas_ibfk_2` FOREIGN KEY (`clube_id`) REFERENCES `clubes` (`id`),
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
