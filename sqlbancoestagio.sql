-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bancoestagiofrotas
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_abastecimento`
--

DROP TABLE IF EXISTS `tb_abastecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_abastecimento` (
  `abastecimento_id` int(11) NOT NULL AUTO_INCREMENT,
  `abastecimento_data` date NOT NULL,
  `abastecimento_km` int(11) NOT NULL,
  `abastecimento_litros` decimal(10,2) NOT NULL,
  `abastecimento_valor` decimal(10,2) NOT NULL,
  `abastecimento_tipo_combustivel` varchar(50) DEFAULT NULL,
  `abastecimento_km_media` decimal(10,2) DEFAULT NULL,
  `abastecimento_veiculo_id` int(11) DEFAULT NULL,
  `abastecimento_usuario_id` int(11) DEFAULT NULL,
  `abastecimento_pagamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`abastecimento_id`),
  KEY `abastecimento_veiculo_id` (`abastecimento_veiculo_id`),
  KEY `abastecimento_usuario_id` (`abastecimento_usuario_id`),
  CONSTRAINT `tb_abastecimento_ibfk_1` FOREIGN KEY (`abastecimento_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`),
  CONSTRAINT `tb_abastecimento_ibfk_2` FOREIGN KEY (`abastecimento_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_checklist`
--

DROP TABLE IF EXISTS `tb_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checklist` (
  `checklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_data` date NOT NULL,
  `checklist_km` int(11) DEFAULT NULL,
  `checklist_observacoes` text DEFAULT NULL,
  `checklist_veiculo_id` int(11) NOT NULL,
  `checklist_usuario_id` int(11) NOT NULL,
  `checklist_criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`checklist_id`),
  KEY `fk_checklist_veiculo` (`checklist_veiculo_id`),
  KEY `fk_checklist_usuario` (`checklist_usuario_id`),
  CONSTRAINT `fk_checklist_usuario` FOREIGN KEY (`checklist_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`),
  CONSTRAINT `fk_checklist_veiculo` FOREIGN KEY (`checklist_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_checklist_item`
--

DROP TABLE IF EXISTS `tb_checklist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checklist_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_campo` varchar(60) NOT NULL,
  `item_status` varchar(30) NOT NULL,
  `item_checklist_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_checklist` (`item_checklist_id`),
  CONSTRAINT `fk_item_checklist` FOREIGN KEY (`item_checklist_id`) REFERENCES `tb_checklist` (`checklist_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_descarte_pneu`
--

DROP TABLE IF EXISTS `tb_descarte_pneu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_descarte_pneu` (
  `descarte_pneu_id` int(11) NOT NULL,
  `descarte_veiculo_id` int(11) DEFAULT NULL,
  `descarte_posicao` varchar(20) DEFAULT NULL,
  `descarte_data_entrada` date DEFAULT NULL,
  `descarte_data_saida` date DEFAULT NULL,
  `descarte_km_entrada` int(11) DEFAULT NULL,
  `descarte_km_saida` int(11) DEFAULT NULL,
  `descarte_km_uso` int(11) DEFAULT NULL,
  `descarte_dias_uso` int(11) DEFAULT NULL,
  `descarte_marca` varchar(100) DEFAULT NULL,
  `descarte_medida` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`descarte_pneu_id`),
  KEY `descarte_veiculo_id` (`descarte_veiculo_id`),
  CONSTRAINT `tb_descarte_pneu_ibfk_1` FOREIGN KEY (`descarte_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_manutencao`
--

DROP TABLE IF EXISTS `tb_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_manutencao` (
  `manutencao_id` int(11) NOT NULL AUTO_INCREMENT,
  `manutencao_tipo` varchar(50) DEFAULT NULL,
  `manutencao_data` date DEFAULT NULL,
  `manutencao_descricao` text DEFAULT NULL,
  `manutencao_status` varchar(30) DEFAULT NULL,
  `manutencao_km` int(11) DEFAULT NULL,
  `manutencao_veiculo_id` int(11) DEFAULT NULL,
  `manutencao_usuario_id` int(11) DEFAULT NULL,
  `manutencao_data_conclusao` date DEFAULT NULL,
  `manutencao_forma_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`manutencao_id`),
  KEY `manutencao_veiculo_id` (`manutencao_veiculo_id`),
  KEY `manutencao_usuario_id` (`manutencao_usuario_id`),
  CONSTRAINT `tb_manutencao_ibfk_1` FOREIGN KEY (`manutencao_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`),
  CONSTRAINT `tb_manutencao_ibfk_2` FOREIGN KEY (`manutencao_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_manutencao_item`
--

DROP TABLE IF EXISTS `tb_manutencao_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_manutencao_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_descricao` varchar(255) DEFAULT NULL,
  `item_valor` decimal(10,2) DEFAULT NULL,
  `item_manutencao_id` int(11) DEFAULT NULL,
  `item_servico_id` int(11) DEFAULT NULL,
  `item_oficina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_manutencao_id` (`item_manutencao_id`),
  KEY `item_servico_id` (`item_servico_id`),
  KEY `item_oficina_id` (`item_oficina_id`),
  CONSTRAINT `tb_manutencao_item_ibfk_1` FOREIGN KEY (`item_manutencao_id`) REFERENCES `tb_manutencao` (`manutencao_id`) ON DELETE CASCADE,
  CONSTRAINT `tb_manutencao_item_ibfk_2` FOREIGN KEY (`item_servico_id`) REFERENCES `tb_servico` (`servico_id`),
  CONSTRAINT `tb_manutencao_item_ibfk_3` FOREIGN KEY (`item_oficina_id`) REFERENCES `tb_oficina` (`oficina_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_marca`
--

DROP TABLE IF EXISTS `tb_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_marca` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nome` varchar(100) NOT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_modelo`
--

DROP TABLE IF EXISTS `tb_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_modelo` (
  `modelo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo_nome` varchar(100) NOT NULL,
  `modelo_marca_id` int(11) NOT NULL,
  PRIMARY KEY (`modelo_id`),
  KEY `modelo_marca_id` (`modelo_marca_id`),
  CONSTRAINT `tb_modelo_ibfk_1` FOREIGN KEY (`modelo_marca_id`) REFERENCES `tb_marca` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_oficina`
--

DROP TABLE IF EXISTS `tb_oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_oficina` (
  `oficina_id` int(11) NOT NULL AUTO_INCREMENT,
  `oficina_nome` varchar(150) NOT NULL,
  `oficina_datacadastro` date DEFAULT NULL,
  `oficina_cidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oficina_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_pneus`
--

DROP TABLE IF EXISTS `tb_pneus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pneus` (
  `pneus_id` int(11) NOT NULL AUTO_INCREMENT,
  `pneus_marca` varchar(100) DEFAULT NULL,
  `pneus_medida` varchar(50) DEFAULT NULL,
  `pneus_data_aquisicao` date DEFAULT NULL,
  `pneus_valor` decimal(10,2) DEFAULT NULL,
  `pneus_estado` varchar(50) DEFAULT NULL,
  `pneus_status` varchar(50) DEFAULT NULL,
  `pneus_posicao` varchar(20) DEFAULT NULL,
  `pneus_veiculo_id` int(11) DEFAULT NULL,
  `pneus_km_entrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`pneus_id`),
  KEY `pneus_veiculo_id` (`pneus_veiculo_id`),
  CONSTRAINT `tb_pneus_ibfk_1` FOREIGN KEY (`pneus_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_rodizio`
--

DROP TABLE IF EXISTS `tb_rodizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rodizio` (
  `rodizio_id` int(11) NOT NULL AUTO_INCREMENT,
  `rodizio_data` date NOT NULL,
  `rodizio_km` int(11) DEFAULT NULL,
  `rodizio_observacoes` text DEFAULT NULL,
  `rodizio_veiculo_id` int(11) NOT NULL,
  `rodizio_usuario_id` int(11) NOT NULL,
  `rodizio_criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rodizio_id`),
  KEY `fk_rodizio_veiculo` (`rodizio_veiculo_id`),
  KEY `fk_rodizio_usuario` (`rodizio_usuario_id`),
  CONSTRAINT `fk_rodizio_usuario` FOREIGN KEY (`rodizio_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`),
  CONSTRAINT `fk_rodizio_veiculo` FOREIGN KEY (`rodizio_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_rodizio_item`
--

DROP TABLE IF EXISTS `tb_rodizio_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rodizio_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_pneu_id` int(11) NOT NULL,
  `item_posicao_anterior` varchar(40) NOT NULL,
  `item_posicao_nova` varchar(40) NOT NULL,
  `item_rodizio_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_rodizio_item_rodizio` (`item_rodizio_id`),
  KEY `fk_rodizio_item_pneu` (`item_pneu_id`),
  CONSTRAINT `fk_rodizio_item_pneu` FOREIGN KEY (`item_pneu_id`) REFERENCES `tb_pneus` (`pneus_id`),
  CONSTRAINT `fk_rodizio_item_rodizio` FOREIGN KEY (`item_rodizio_id`) REFERENCES `tb_rodizio` (`rodizio_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_servico`
--

DROP TABLE IF EXISTS `tb_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_servico` (
  `servico_id` int(11) NOT NULL AUTO_INCREMENT,
  `servico_nome` varchar(150) NOT NULL,
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nome` varchar(100) NOT NULL,
  `usuario_tipo` int(11) DEFAULT NULL,
  `usuario_senha` varchar(255) DEFAULT NULL,
  `usuario_ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_veiculos`
--

DROP TABLE IF EXISTS `tb_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_veiculos` (
  `veiculo_id` int(11) NOT NULL AUTO_INCREMENT,
  `veiculo_placa` varchar(10) NOT NULL,
  `veiculo_ano` int(11) DEFAULT NULL,
  `veiculo_renavam` varchar(20) DEFAULT NULL,
  `veiculo_cor` varchar(50) DEFAULT NULL,
  `veiculo_kmatual` int(11) DEFAULT NULL,
  `veiculo_status` varchar(50) DEFAULT NULL,
  `veiculo_modelo_id` int(11) DEFAULT NULL,
  `veiculo_tanque` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`veiculo_id`),
  KEY `veiculo_modelo_id` (`veiculo_modelo_id`),
  CONSTRAINT `tb_veiculos_ibfk_1` FOREIGN KEY (`veiculo_modelo_id`) REFERENCES `tb_modelo` (`modelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-06 19:57:21
