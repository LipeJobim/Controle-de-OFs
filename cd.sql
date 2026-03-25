-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/03/2026 às 03:19
-- Versão do servidor: 8.0.34
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `montador`
--

CREATE TABLE `montador` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `montagem_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `montador`
--

INSERT INTO `montador` (`id`, `nome`, `montagem_id`) VALUES
(1, 'Lucas S', 1),
(2, 'Sarará', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `montagem`
--

CREATE TABLE `montagem` (
  `id` int NOT NULL,
  `numero` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `montagem`
--

INSERT INTO `montagem` (`id`, `numero`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `of`
--

CREATE TABLE `of` (
  `id` int NOT NULL,
  `numero_of` varchar(50) DEFAULT NULL,
  `opd_id` int DEFAULT NULL,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `of`
--

INSERT INTO `of` (`id`, `numero_of`, `opd_id`, `data_registro`) VALUES
(1, '100000', 1, '2026-03-25 01:41:24'),
(2, '100100', 1, '2026-03-25 01:51:23'),
(3, '200000', 2, '2026-03-25 02:03:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `opd`
--

CREATE TABLE `opd` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `montador_nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `opd`
--

INSERT INTO `opd` (`id`, `nome`, `montador_nome`) VALUES
(1, '000001', 'Lucas S'),
(2, '000002', 'Sarará');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `montador`
--
ALTER TABLE `montador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `montagem_id` (`montagem_id`);

--
-- Índices de tabela `montagem`
--
ALTER TABLE `montagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `of`
--
ALTER TABLE `of`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_of` (`numero_of`),
  ADD KEY `opd_id` (`opd_id`);

--
-- Índices de tabela `opd`
--
ALTER TABLE `opd`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `montador`
--
ALTER TABLE `montador`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `montagem`
--
ALTER TABLE `montagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `of`
--
ALTER TABLE `of`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `opd`
--
ALTER TABLE `opd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `montador`
--
ALTER TABLE `montador`
  ADD CONSTRAINT `montador_ibfk_2` FOREIGN KEY (`montagem_id`) REFERENCES `montagem` (`id`);

--
-- Restrições para tabelas `of`
--
ALTER TABLE `of`
  ADD CONSTRAINT `of_ibfk_1` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
