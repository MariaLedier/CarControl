-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: bancoestagiofrotas
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.2

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
  `abastecimento_id` int NOT NULL AUTO_INCREMENT,
  `abastecimento_data` date NOT NULL,
  `abastecimento_km` int NOT NULL,
  `abastecimento_litros` decimal(10,2) NOT NULL,
  `abastecimento_valor` decimal(10,2) NOT NULL,
  `abastecimento_tipo_combustivel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `abastecimento_km_media` decimal(10,2) DEFAULT NULL,
  `abastecimento_veiculo_id` int DEFAULT NULL,
  `abastecimento_usuario_id` int DEFAULT NULL,
  `abastecimento_pagamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`abastecimento_id`),
  KEY `abastecimento_veiculo_id` (`abastecimento_veiculo_id`),
  KEY `abastecimento_usuario_id` (`abastecimento_usuario_id`),
  CONSTRAINT `tb_abastecimento_ibfk_1` FOREIGN KEY (`abastecimento_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`),
  CONSTRAINT `tb_abastecimento_ibfk_2` FOREIGN KEY (`abastecimento_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_abastecimento`
--

LOCK TABLES `tb_abastecimento` WRITE;
/*!40000 ALTER TABLE `tb_abastecimento` DISABLE KEYS */;
INSERT INTO `tb_abastecimento` VALUES (1,'2026-06-16',195193,29.57,90.19,'ETANOL',NULL,5,2,'CARTAO_EMPRESARIAL'),(6,'2026-06-17',195384,23.09,70.43,'ETANOL',8.27,5,2,'CARTAO_EMPRESARIAL'),(7,'2026-06-17',207036,51.89,158.26,'ETANOL',NULL,1,2,'CARTAO_EMPRESARIAL'),(8,'2026-06-15',315769,41.64,127.00,'ETANOL',NULL,3,2,'CARTAO_EMPRESARIAL'),(9,'2026-06-16',316136,13.95,50.08,'ETANOL',26.31,3,2,'DINHEIRO'),(10,'2026-06-16',316247,39.57,140.09,'ETANOL',2.81,3,2,'DINHEIRO'),(11,'2026-06-17',316659,15.19,50.00,'ETANOL',27.12,3,2,'DINHEIRO');
/*!40000 ALTER TABLE `tb_abastecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_checklist`
--

DROP TABLE IF EXISTS `tb_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checklist` (
  `checklist_id` int NOT NULL AUTO_INCREMENT,
  `checklist_data` date NOT NULL,
  `checklist_km` int DEFAULT NULL,
  `checklist_observacoes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `checklist_veiculo_id` int NOT NULL,
  `checklist_usuario_id` int NOT NULL,
  `checklist_criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`checklist_id`),
  KEY `fk_checklist_veiculo` (`checklist_veiculo_id`),
  KEY `fk_checklist_usuario` (`checklist_usuario_id`),
  CONSTRAINT `fk_checklist_usuario` FOREIGN KEY (`checklist_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`),
  CONSTRAINT `fk_checklist_veiculo` FOREIGN KEY (`checklist_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_checklist`
--

LOCK TABLES `tb_checklist` WRITE;
/*!40000 ALTER TABLE `tb_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_checklist_item`
--

DROP TABLE IF EXISTS `tb_checklist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_checklist_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_campo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_checklist_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_item_checklist` (`item_checklist_id`),
  CONSTRAINT `fk_item_checklist` FOREIGN KEY (`item_checklist_id`) REFERENCES `tb_checklist` (`checklist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_checklist_item`
--

LOCK TABLES `tb_checklist_item` WRITE;
/*!40000 ALTER TABLE `tb_checklist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_checklist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_descarte_pneu`
--

DROP TABLE IF EXISTS `tb_descarte_pneu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_descarte_pneu` (
  `descarte_pneu_id` int NOT NULL,
  `descarte_veiculo_id` int DEFAULT NULL,
  `descarte_posicao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descarte_data_entrada` date DEFAULT NULL,
  `descarte_data_saida` date DEFAULT NULL,
  `descarte_km_entrada` int DEFAULT NULL,
  `descarte_km_saida` int DEFAULT NULL,
  `descarte_km_uso` int DEFAULT NULL,
  `descarte_dias_uso` int DEFAULT NULL,
  `descarte_marca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descarte_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`descarte_pneu_id`),
  KEY `descarte_veiculo_id` (`descarte_veiculo_id`),
  CONSTRAINT `tb_descarte_pneu_ibfk_1` FOREIGN KEY (`descarte_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_descarte_pneu`
--

LOCK TABLES `tb_descarte_pneu` WRITE;
/*!40000 ALTER TABLE `tb_descarte_pneu` DISABLE KEYS */;
INSERT INTO `tb_descarte_pneu` VALUES (15,3,'Estepe','2023-01-01','2026-06-16',315455,315455,0,1262,'HABILEAD','175/70 R14');
/*!40000 ALTER TABLE `tb_descarte_pneu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_manutencao`
--

DROP TABLE IF EXISTS `tb_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_manutencao` (
  `manutencao_id` int NOT NULL AUTO_INCREMENT,
  `manutencao_tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manutencao_data` date DEFAULT NULL,
  `manutencao_descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `manutencao_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `manutencao_km` int DEFAULT NULL,
  `manutencao_veiculo_id` int DEFAULT NULL,
  `manutencao_usuario_id` int DEFAULT NULL,
  `manutencao_data_conclusao` date DEFAULT NULL,
  `manutencao_forma_pagamento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`manutencao_id`),
  KEY `manutencao_veiculo_id` (`manutencao_veiculo_id`),
  KEY `manutencao_usuario_id` (`manutencao_usuario_id`),
  CONSTRAINT `tb_manutencao_ibfk_1` FOREIGN KEY (`manutencao_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`),
  CONSTRAINT `tb_manutencao_ibfk_2` FOREIGN KEY (`manutencao_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_manutencao`
--

LOCK TABLES `tb_manutencao` WRITE;
/*!40000 ALTER TABLE `tb_manutencao` DISABLE KEYS */;
INSERT INTO `tb_manutencao` VALUES (1,'PREVENTIVA','2026-06-03','','CONCLUIDA',195200,5,2,NULL,NULL),(2,'PREVENTIVA','2026-06-16','','CONCLUIDA',207100,1,2,NULL,NULL),(3,'PREVENTIVA','2026-06-16','','CONCLUIDA',142010,6,2,NULL,NULL),(4,'PREVENTIVA','2026-06-16','','CONCLUIDA',315500,3,2,NULL,NULL),(5,'CORRETIVA','2026-06-16','Troca de pneu — Estepe','CONCLUIDA',315455,3,2,NULL,NULL);
/*!40000 ALTER TABLE `tb_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_manutencao_item`
--

DROP TABLE IF EXISTS `tb_manutencao_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_manutencao_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_valor` decimal(10,2) DEFAULT NULL,
  `item_manutencao_id` int DEFAULT NULL,
  `item_servico_id` int DEFAULT NULL,
  `item_oficina_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_manutencao_id` (`item_manutencao_id`),
  KEY `item_servico_id` (`item_servico_id`),
  KEY `item_oficina_id` (`item_oficina_id`),
  CONSTRAINT `tb_manutencao_item_ibfk_1` FOREIGN KEY (`item_manutencao_id`) REFERENCES `tb_manutencao` (`manutencao_id`) ON DELETE CASCADE,
  CONSTRAINT `tb_manutencao_item_ibfk_2` FOREIGN KEY (`item_servico_id`) REFERENCES `tb_servico` (`servico_id`),
  CONSTRAINT `tb_manutencao_item_ibfk_3` FOREIGN KEY (`item_oficina_id`) REFERENCES `tb_oficina` (`oficina_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_manutencao_item`
--

LOCK TABLES `tb_manutencao_item` WRITE;
/*!40000 ALTER TABLE `tb_manutencao_item` DISABLE KEYS */;
INSERT INTO `tb_manutencao_item` VALUES (1,'',199.00,1,6,1),(2,'',60.00,1,3,1),(3,'',60.00,1,4,1),(4,'',150.61,2,2,3),(5,'',0.00,2,10,3),(6,'',93.06,3,2,3),(7,'',19.64,3,10,3),(8,'',715.00,4,21,3);
/*!40000 ALTER TABLE `tb_manutencao_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_marca`
--

DROP TABLE IF EXISTS `tb_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_marca` (
  `marca_id` int NOT NULL AUTO_INCREMENT,
  `marca_nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_marca`
--

LOCK TABLES `tb_marca` WRITE;
/*!40000 ALTER TABLE `tb_marca` DISABLE KEYS */;
INSERT INTO `tb_marca` VALUES (1,'Volkswagen'),(2,'Fiat'),(3,'Chevrolet'),(4,'Ford'),(5,'Toyota'),(6,'Honda'),(7,'Hyundai'),(8,'Renault'),(9,'Nissan'),(10,'Jeep');
/*!40000 ALTER TABLE `tb_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_modelo`
--

DROP TABLE IF EXISTS `tb_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_modelo` (
  `modelo_id` int NOT NULL AUTO_INCREMENT,
  `modelo_nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modelo_marca_id` int NOT NULL,
  PRIMARY KEY (`modelo_id`),
  KEY `modelo_marca_id` (`modelo_marca_id`),
  CONSTRAINT `tb_modelo_ibfk_1` FOREIGN KEY (`modelo_marca_id`) REFERENCES `tb_marca` (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_modelo`
--

LOCK TABLES `tb_modelo` WRITE;
/*!40000 ALTER TABLE `tb_modelo` DISABLE KEYS */;
INSERT INTO `tb_modelo` VALUES (1,'Gol',1),(2,'Voyage',1),(3,'Saveiro',1),(4,'Uno',2),(5,'Palio',2),(6,'Strada',2),(7,'Fiorino',2),(8,'Onix',3),(9,'Prisma',3),(10,'S10',3),(11,'Ka',4),(12,'Fiesta',4),(13,'Ranger',4),(14,'Corolla',5),(15,'Hilux',5),(16,'Civic',6),(17,'HR-V',6),(18,'HB20',7),(19,'Creta',7),(20,'Kwid',8),(21,'Duster',8),(22,'Versa',9),(23,'Frontier',9),(24,'Renegade',10),(25,'Compass',10),(26,'Polo',1);
/*!40000 ALTER TABLE `tb_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_oficina`
--

DROP TABLE IF EXISTS `tb_oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_oficina` (
  `oficina_id` int NOT NULL AUTO_INCREMENT,
  `oficina_nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `oficina_datacadastro` date DEFAULT NULL,
  `oficina_cidade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`oficina_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_oficina`
--

LOCK TABLES `tb_oficina` WRITE;
/*!40000 ALTER TABLE `tb_oficina` DISABLE KEYS */;
INSERT INTO `tb_oficina` VALUES (1,'Okubo','2026-04-23','Osvaldo Cruz'),(2,'Auto elétrica São Cristóvão','2026-04-21','Osvaldo Cruz'),(3,'Dinamicar','2026-06-16','Osvaldo Cruz '),(4,'Marani','2026-06-16','Osvaldo Cruz');
/*!40000 ALTER TABLE `tb_oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pneus`
--

DROP TABLE IF EXISTS `tb_pneus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pneus` (
  `pneus_id` int NOT NULL AUTO_INCREMENT,
  `pneus_marca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pneus_medida` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pneus_data_aquisicao` date DEFAULT NULL,
  `pneus_valor` decimal(10,2) DEFAULT NULL,
  `pneus_estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pneus_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pneus_posicao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pneus_veiculo_id` int DEFAULT NULL,
  `pneus_km_entrada` int DEFAULT NULL,
  PRIMARY KEY (`pneus_id`),
  KEY `pneus_veiculo_id` (`pneus_veiculo_id`),
  CONSTRAINT `tb_pneus_ibfk_1` FOREIGN KEY (`pneus_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pneus`
--

LOCK TABLES `tb_pneus` WRITE;
/*!40000 ALTER TABLE `tb_pneus` DISABLE KEYS */;
INSERT INTO `tb_pneus` VALUES (1,'DUNLOP','175/70 R14','2026-02-04',399.00,'Bom','EM_USO','Dianteiro Esquerdo',1,207026),(2,'DUNLOP','175/70 R14','2026-02-04',399.00,'Bom','EM_USO','Dianteiro Direito',1,207026),(3,'GOODYEAR','175/70 R14','2024-07-02',330.00,'Médio','EM_USO','Traseiro Esquerdo',1,207026),(4,'GOODYEAR','175/70 R14','2024-07-02',330.00,'Médio','EM_USO','Traseiro Direito',1,207026),(5,'MAZZINIECO7','175/70 R14','2023-01-01',150.00,'Ruim','EM_ESTOQUE','Estepe',1,207026),(6,'GOODYEAR','185/65 R15','2024-06-01',500.00,'Médio','EM_USO','Dianteiro Esquerdo',2,55700),(7,'GOODYEAR','185/65 R15','2024-06-01',500.00,'Médio','EM_USO','Dianteiro Direito',2,55700),(8,'GOODYEAR','185/65 R15','2024-06-01',500.00,'Bom','EM_USO','Traseiro Esquerdo',2,55700),(9,'GOODYEAR','185/65 R15','2024-06-01',500.00,'Bom','EM_USO','Traseiro Direito',2,55700),(10,'GOODYEAR','185/65 R15','2024-06-01',500.00,'Bom','EM_ESTOQUE','Estepe',2,55700),(11,'DUNLOP','175/70 R14','2026-06-12',399.00,'Bom','EM_USO','Dianteiro Esquerdo',3,315455),(12,'DUNLOP','175/70 R14','2026-06-12',399.00,'Bom','EM_USO','Dianteiro Direito',3,315455),(13,'DUNLOP','175/70 R14','2026-04-17',399.00,'Bom','EM_USO','Traseiro Esquerdo',3,315455),(14,'DUNLOP','175/70 R14','2026-04-17',399.00,'Bom','EM_USO','Traseiro Direito',3,315455),(15,'HABILEAD','175/70 R14','2023-01-01',150.00,'Médio','DESCARTADO',NULL,NULL,315455),(16,'MAZZINIECO7','175/70 R14','2025-11-27',320.00,'Bom','EM_USO','Dianteiro Esquerdo',4,321172),(17,'MAZZINIECO7','175/70 R14','2025-11-27',320.00,'Bom','EM_USO','Dianteiro Direito',4,321172),(18,'DURABLE CITY','175/70 R14','2025-09-09',320.00,'Bom','EM_USO','Traseiro Esquerdo',4,321172),(19,'DURABLE CITY','175/70 R14','2025-09-09',320.00,'Bom','EM_USO','Traseiro Direito',4,321172),(20,'XBRI','175/70 R14','2023-01-01',150.00,'Médio','EM_ESTOQUE','Estepe',4,321172),(21,'DUNLOP','175/70 R14','2026-06-03',399.00,'Bom','EM_USO','Dianteiro Esquerdo',5,195193),(22,'DUNLOP','175/70 R14','2026-06-03',399.00,'Bom','EM_USO','Dianteiro Direito',5,195193),(23,'DUNLOP','175/70 R14','2025-04-19',399.00,'Bom','EM_USO','Traseiro Esquerdo',5,195193),(24,'DUNLOP','175/70 R14','2025-04-19',399.00,'Bom','EM_USO','Traseiro Direito',5,195193),(25,'DUNLOP','175/70 R14','2023-01-01',200.00,'Médio','EM_ESTOQUE','Estepe',5,195193),(26,'DUNLOP','175/70 R14','2026-02-19',399.00,'Bom','EM_USO','Dianteiro Esquerdo',6,141700),(27,'DUNLOP','175/70 R14','2026-02-19',399.00,'Bom','EM_USO','Dianteiro Direito',6,141700),(28,'XBRI','175/70 R14','2025-06-01',280.00,'Médio','EM_USO','Traseiro Esquerdo',6,141700),(29,'XBRI','175/70 R14','2025-06-01',280.00,'Médio','EM_USO','Traseiro Direito',6,141700),(30,'XBRI','175/70 R14','2023-01-01',150.00,'Médio','EM_ESTOQUE','Estepe',6,141700),(31,'XBRI','175/70 R14','2026-06-16',0.00,'Bom','EM_ESTOQUE','Estepe',3,315455);
/*!40000 ALTER TABLE `tb_pneus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rodizio`
--

DROP TABLE IF EXISTS `tb_rodizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rodizio` (
  `rodizio_id` int NOT NULL AUTO_INCREMENT,
  `rodizio_data` date NOT NULL,
  `rodizio_km` int DEFAULT NULL,
  `rodizio_observacoes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `rodizio_veiculo_id` int NOT NULL,
  `rodizio_usuario_id` int NOT NULL,
  `rodizio_criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rodizio_id`),
  KEY `fk_rodizio_veiculo` (`rodizio_veiculo_id`),
  KEY `fk_rodizio_usuario` (`rodizio_usuario_id`),
  CONSTRAINT `fk_rodizio_usuario` FOREIGN KEY (`rodizio_usuario_id`) REFERENCES `tb_usuario` (`usuario_id`),
  CONSTRAINT `fk_rodizio_veiculo` FOREIGN KEY (`rodizio_veiculo_id`) REFERENCES `tb_veiculos` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rodizio`
--

LOCK TABLES `tb_rodizio` WRITE;
/*!40000 ALTER TABLE `tb_rodizio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_rodizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rodizio_item`
--

DROP TABLE IF EXISTS `tb_rodizio_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rodizio_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_pneu_id` int NOT NULL,
  `item_posicao_anterior` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_posicao_nova` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_rodizio_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_rodizio_item_rodizio` (`item_rodizio_id`),
  KEY `fk_rodizio_item_pneu` (`item_pneu_id`),
  CONSTRAINT `fk_rodizio_item_pneu` FOREIGN KEY (`item_pneu_id`) REFERENCES `tb_pneus` (`pneus_id`),
  CONSTRAINT `fk_rodizio_item_rodizio` FOREIGN KEY (`item_rodizio_id`) REFERENCES `tb_rodizio` (`rodizio_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rodizio_item`
--

LOCK TABLES `tb_rodizio_item` WRITE;
/*!40000 ALTER TABLE `tb_rodizio_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_rodizio_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servico`
--

DROP TABLE IF EXISTS `tb_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_servico` (
  `servico_id` int NOT NULL AUTO_INCREMENT,
  `servico_nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servico`
--

LOCK TABLES `tb_servico` WRITE;
/*!40000 ALTER TABLE `tb_servico` DISABLE KEYS */;
INSERT INTO `tb_servico` VALUES (1,'Troca de pneu'),(2,'Troca de óleo'),(3,'Alinhamento'),(4,'Balanceamento'),(5,'Revisão geral'),(6,'Troca de pastilha de freio'),(7,'Troca de disco de freio'),(8,'Troca de bateria'),(9,'Troca de filtro de ar'),(10,'Troca de filtro de óleo'),(11,'Troca de correia dentada'),(12,'Troca de amortecedor'),(13,'Troca de velas'),(14,'Limpeza de bicos injetores'),(15,'Troca de embreagem'),(16,'Diagnóstico eletrônico'),(17,'Troca de radiador'),(18,'Troca de fluido de freio'),(19,'Troca de fluido de arrefecimento'),(20,'Higienização do ar-condicionado'),(21,'Troca de bomba de combustível');
/*!40000 ALTER TABLE `tb_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_tipo` int DEFAULT NULL,
  `usuario_senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Vinicio',1,'123',1),(2,'Admin',2,'admin',1),(3,'Eduardo',1,'$2b$10$cyxT2HyMCERX9HD/kYD7rukvpsyuMiyondZw1G.Ru0qF27Nr8ltfu',1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_veiculos`
--

DROP TABLE IF EXISTS `tb_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_veiculos` (
  `veiculo_id` int NOT NULL AUTO_INCREMENT,
  `veiculo_placa` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `veiculo_ano` int DEFAULT NULL,
  `veiculo_renavam` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `veiculo_cor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `veiculo_kmatual` int DEFAULT NULL,
  `veiculo_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `veiculo_modelo_id` int DEFAULT NULL,
  `veiculo_tanque` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`veiculo_id`),
  KEY `veiculo_modelo_id` (`veiculo_modelo_id`),
  CONSTRAINT `tb_veiculos_ibfk_1` FOREIGN KEY (`veiculo_modelo_id`) REFERENCES `tb_modelo` (`modelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_veiculos`
--

LOCK TABLES `tb_veiculos` WRITE;
/*!40000 ALTER TABLE `tb_veiculos` DISABLE KEYS */;
INSERT INTO `tb_veiculos` VALUES (1,'GHY-3H20',2016,'01086822177','BRANCO',207036,'ATIVO',7,55.00),(2,'STJ-7B87',2024,'01396485098','BRANCO',55700,'ATIVO',26,50.00),(3,'FBJ-8H29',2021,'01240357092','BRANCO',316659,'ATIVO',7,55.00),(4,'FXG-1I04',2016,'01062396046','BRANCO',321172,'ATIVO',7,55.00),(5,'GJM-2G63',2022,'01296867916','BRANCO',195384,'ATIVO',7,55.00),(6,'RGB-6B88',2021,'01246963563','BRANCO',142000,'ATIVO',7,55.00);
/*!40000 ALTER TABLE `tb_veiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-18 22:42:26
