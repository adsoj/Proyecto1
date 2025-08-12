-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: BaseCitas2025
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `CITAS`
--

DROP TABLE IF EXISTS `CITAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CITAS` (
  `CitNumero` int NOT NULL,
  `CItFecha` date DEFAULT NULL,
  `CitHora` time DEFAULT NULL,
  `CitPaciente` text,
  `CitMedico` text,
  `CitConsultorio` varchar(45) DEFAULT NULL,
  `CitEstado` varchar(45) DEFAULT NULL,
  `CitObservaciones` varchar(300) DEFAULT NULL,
  `MEDICOS_MedIdentificación` int NOT NULL,
  `CONSULTORIOS_ConNumero` int NOT NULL,
  `PACIENTES_PacIdentificacion` int NOT NULL,
  PRIMARY KEY (`CitNumero`),
  KEY `fk_CITAS_MEDICOS1_idx` (`MEDICOS_MedIdentificación`),
  KEY `fk_CITAS_CONSULTORIOS1_idx` (`CONSULTORIOS_ConNumero`),
  KEY `fk_CITAS_PACIENTES1_idx` (`PACIENTES_PacIdentificacion`),
  CONSTRAINT `fk_CITAS_CONSULTORIOS1` FOREIGN KEY (`CONSULTORIOS_ConNumero`) REFERENCES `CONSULTORIOS` (`ConNumero`),
  CONSTRAINT `fk_CITAS_MEDICOS1` FOREIGN KEY (`MEDICOS_MedIdentificación`) REFERENCES `MEDICOS` (`MedIdentificación`),
  CONSTRAINT `fk_CITAS_PACIENTES1` FOREIGN KEY (`PACIENTES_PacIdentificacion`) REFERENCES `PACIENTES` (`PacIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITAS`
--

LOCK TABLES `CITAS` WRITE;
/*!40000 ALTER TABLE `CITAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CITAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONSULTORIOS`
--

DROP TABLE IF EXISTS `CONSULTORIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSULTORIOS` (
  `ConNumero` int NOT NULL,
  `ConNombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ConNumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSULTORIOS`
--

LOCK TABLES `CONSULTORIOS` WRITE;
/*!40000 ALTER TABLE `CONSULTORIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONSULTORIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICOS`
--

DROP TABLE IF EXISTS `MEDICOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDICOS` (
  `MedIdentificación` int NOT NULL,
  `MedNombre` varchar(100) DEFAULT NULL,
  `MedApellidos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MedIdentificación`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICOS`
--

LOCK TABLES `MEDICOS` WRITE;
/*!40000 ALTER TABLE `MEDICOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEDICOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PACIENTES`
--

DROP TABLE IF EXISTS `PACIENTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PACIENTES` (
  `PacIdentificacion` int NOT NULL,
  `PacNombre` text,
  `PacApellidos` text,
  `PacFechaNacimiento` datetime DEFAULT NULL,
  `PacSexo` tinytext,
  PRIMARY KEY (`PacIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PACIENTES`
--

LOCK TABLES `PACIENTES` WRITE;
/*!40000 ALTER TABLE `PACIENTES` DISABLE KEYS */;
INSERT INTO `PACIENTES` VALUES (12,'prueba','prueba','2025-08-06 00:00:00','M'),(555,'Betsy','Arguello','2020-10-10 00:00:00','Femenino'),(777,'Betsy','Pera','2025-08-07 00:00:00','Femenino'),(888,'Mario','Mendoza','2025-08-08 00:00:00','M'),(12345678,'Betsy','Flora','2025-08-07 00:00:00','M');
/*!40000 ALTER TABLE `PACIENTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRATAMIENTOS`
--

DROP TABLE IF EXISTS `TRATAMIENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRATAMIENTOS` (
  `TraNumero` int NOT NULL,
  `TraFechaAsignado` datetime DEFAULT NULL,
  `TraDescripcion` text,
  `TraFechaInicio` datetime DEFAULT NULL,
  `TraFechaFin` datetime DEFAULT NULL,
  `TraObservaciones` text,
  `TraPaciente` varchar(45) DEFAULT NULL,
  `PACIENTES_PacIdentificación` int NOT NULL,
  PRIMARY KEY (`TraNumero`),
  KEY `fk_TRATAMIENTOS_PACIENTES_idx` (`PACIENTES_PacIdentificación`),
  CONSTRAINT `fk_TRATAMIENTOS_PACIENTES` FOREIGN KEY (`PACIENTES_PacIdentificación`) REFERENCES `PACIENTES` (`PacIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRATAMIENTOS`
--

LOCK TABLES `TRATAMIENTOS` WRITE;
/*!40000 ALTER TABLE `TRATAMIENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRATAMIENTOS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-12 17:18:08
