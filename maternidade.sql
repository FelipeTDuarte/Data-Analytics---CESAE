-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2020 às 11:07
-- Versão do servidor: 10.4.16-MariaDB
-- versão do PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maternidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bebe`
--

CREATE TABLE `bebe` (
  `n_registo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `hora_nasc` datetime NOT NULL,
  `peso` double NOT NULL,
  `altura` double NOT NULL,
  `cc_mae` varchar(11) NOT NULL,
  `cedula_medico` varchar(11) NOT NULL,
  `nif_enferm` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enfermeira`
--

CREATE TABLE `enfermeira` (
  `nif` char(9) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `Telefone` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mae`
--

CREATE TABLE `mae` (
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `cc` varchar(11) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  `data_nascimento` date NOT NULL,
  `acompanhante` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `cedula` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `especialidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bebe`
--
ALTER TABLE `bebe`
  ADD PRIMARY KEY (`n_registo`);

--
-- Índices para tabela `enfermeira`
--
ALTER TABLE `enfermeira`
  ADD PRIMARY KEY (`nif`);

--
-- Índices para tabela `mae`
--
ALTER TABLE `mae`
  ADD PRIMARY KEY (`cc`);

--
-- Índices para tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bebe`
--
ALTER TABLE `bebe`
  MODIFY `n_registo` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
