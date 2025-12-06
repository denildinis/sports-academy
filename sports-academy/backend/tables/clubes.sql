-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Dez-2025 às 17:59
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
(5, 'Clube Recreativo Kilamba Kiaxi', 'Kilamba Kiaxi', 25, 0),
(6, 'Futebol Clube Cazenga', 'Cazenga', 25, 0),
(7, 'Sporting Clube Samba', 'Samba', 25, 0),
(8, 'Atlético Clube Quiçama', 'Quiçama', 25, 0),
(9, 'Desportivo Municipal Luanda', 'Luanda', 25, 0),
(10, 'Clube Jovens Talentos Viana', 'Viana', 25, 0),

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clubes`
--
ALTER TABLE `clubes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
