-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Nov-2022 às 20:58
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cesaeex7`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` float NOT NULL,
  `taxa_iva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `preco`, `taxa_iva`) VALUES
(1, 'Couve Flor', 2.49, 22),
(2, 'Leite magro Mimosa', 1, 12),
(3, 'Leite com chocolate', 0.45, 22),
(4, 'Picanha', 11.23, 22),
(5, 'Dourada da Madeira', 9.85, 22);

-- --------------------------------------------------------

--
-- Estrutura da tabela `talao`
--

CREATE TABLE `talao` (
  `id_talao` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `talao`
--

INSERT INTO `talao` (`id_talao`, `data`) VALUES
(1, '2022-11-13'),
(2, '2022-11-02'),
(3, '2022-11-11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `talao_produto`
--

CREATE TABLE `talao_produto` (
  `id_talao_produto` int(11) NOT NULL,
  `id_talao` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `talao_produto`
--

INSERT INTO `talao_produto` (`id_talao_produto`, `id_talao`, `id_produto`, `quantidade`) VALUES
(1, 1, 3, 12),
(2, 1, 4, 2.45),
(3, 2, 1, 4.5),
(4, 2, 5, 1.5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `talao`
--
ALTER TABLE `talao`
  ADD PRIMARY KEY (`id_talao`);

--
-- Índices para tabela `talao_produto`
--
ALTER TABLE `talao_produto`
  ADD PRIMARY KEY (`id_talao_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `talao`
--
ALTER TABLE `talao`
  MODIFY `id_talao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `talao_produto`
--
ALTER TABLE `talao_produto`
  MODIFY `id_talao_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
