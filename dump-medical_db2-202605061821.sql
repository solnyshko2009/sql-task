-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medical_db2
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysis` (
  `analysis_id` int NOT NULL AUTO_INCREMENT,
  `patient_uuid` char(36) NOT NULL,
  `run_id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `phenotype` text,
  `pipeline` varchar(100) DEFAULT NULL,
  `reference_genome` varchar(50) DEFAULT NULL,
  `mean_coverage` decimal(10,2) DEFAULT NULL,
  `coverage_percent` decimal(10,5) DEFAULT NULL,
  `reads_count` bigint DEFAULT NULL,
  `uniformity` decimal(10,5) DEFAULT NULL,
  `date_analysis` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `results_shared` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`analysis_id`),
  KEY `idx_analysis_patient` (`patient_uuid`),
  KEY `idx_analysis_run` (`run_id`),
  KEY `idx_analysis_project` (`project_id`),
  KEY `idx_analysis_diagnosis` (`diagnosis_id`),
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`patient_uuid`) REFERENCES `patient` (`patient_uuid`),
  CONSTRAINT `analysis_ibfk_2` FOREIGN KEY (`run_id`) REFERENCES `sequencingrun` (`run_id`),
  CONSTRAINT `analysis_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `analysis_ibfk_4` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis`
--

LOCK TABLES `analysis` WRITE;
/*!40000 ALTER TABLE `analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `diagnosis_code` varchar(10) NOT NULL,
  PRIMARY KEY (`diagnosis_id`),
  UNIQUE KEY `diagnosis_code` (`diagnosis_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `family_id` int NOT NULL AUTO_INCREMENT,
  `family_code` varchar(50) NOT NULL,
  `is_consanguineous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `uk_family_code` (`family_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentchild`
--

DROP TABLE IF EXISTS `parentchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parentchild` (
  `child_uuid` char(36) NOT NULL,
  `parent_uuid` char(36) NOT NULL,
  PRIMARY KEY (`child_uuid`,`parent_uuid`),
  KEY `parent_uuid` (`parent_uuid`),
  CONSTRAINT `parentchild_ibfk_1` FOREIGN KEY (`child_uuid`) REFERENCES `patient` (`patient_uuid`) ON DELETE CASCADE,
  CONSTRAINT `parentchild_ibfk_2` FOREIGN KEY (`parent_uuid`) REFERENCES `patient` (`patient_uuid`) ON DELETE CASCADE,
  CONSTRAINT `check_not_self` CHECK ((`child_uuid` <> `parent_uuid`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentchild`
--

LOCK TABLES `parentchild` WRITE;
/*!40000 ALTER TABLE `parentchild` DISABLE KEYS */;
/*!40000 ALTER TABLE `parentchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `partner_id` int NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(255) NOT NULL,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `partner_name` (`partner_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_uuid` char(36) NOT NULL,
  `uin1` varchar(50) DEFAULT NULL,
  `sex` enum('XX','XY') NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `relationship` varchar(20) DEFAULT NULL,
  `family_id` int NOT NULL,
  `card_number` varchar(50) DEFAULT NULL,
  `partner_id` int DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  PRIMARY KEY (`patient_uuid`),
  UNIQUE KEY `uin1` (`uin1`),
  KEY `family_id` (`family_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `family` (`family_id`) ON DELETE CASCADE,
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`partner_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequencingrun`
--

DROP TABLE IF EXISTS `sequencingrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequencingrun` (
  `run_id` int NOT NULL AUTO_INCREMENT,
  `run_number` varchar(100) NOT NULL,
  `sequencing_type` varchar(50) NOT NULL,
  `date_sequencing` date NOT NULL,
  `file_path` text NOT NULL,
  PRIMARY KEY (`run_id`),
  UNIQUE KEY `run_number` (`run_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequencingrun`
--

LOCK TABLES `sequencingrun` WRITE;
/*!40000 ALTER TABLE `sequencingrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequencingrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medical_db2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-06 18:21:48
