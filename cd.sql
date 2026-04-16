
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `montador` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `montagem_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `montador` (`id`, `nome`, `montagem_id`) VALUES
(1, 'Fulano', 1),
(2, 'Ciclano', 1);



CREATE TABLE `montagem` (
  `id` int NOT NULL,
  `numero` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `montagem` (`id`, `numero`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);



CREATE TABLE `of` (
  `id` int NOT NULL,
  `numero_of` varchar(50) DEFAULT NULL,
  `opd_id` int DEFAULT NULL,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `of` (`id`, `numero_of`, `opd_id`, `data_registro`) VALUES
(1, '100000', 1, '2026-03-25 01:41:24'),
(2, '100100', 1, '2026-03-25 01:51:23'),
(3, '200000', 2, '2026-03-25 02:03:08');



CREATE TABLE `opd` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `montador_nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `opd` (`id`, `nome`, `montador_nome`) VALUES
(1, '000001', 'Fulano'),
(2, '000002', 'Ciclano');


ALTER TABLE `montador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `montagem_id` (`montagem_id`);


ALTER TABLE `montagem`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `of`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_of` (`numero_of`),
  ADD KEY `opd_id` (`opd_id`);


ALTER TABLE `opd`
  ADD PRIMARY KEY (`id`);




ALTER TABLE `montador`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `montagem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `of`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `opd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `montador`
  ADD CONSTRAINT `montador_ibfk_2` FOREIGN KEY (`montagem_id`) REFERENCES `montagem` (`id`);


ALTER TABLE `of`
  ADD CONSTRAINT `of_ibfk_1` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;
