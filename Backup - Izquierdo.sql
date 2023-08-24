-- MariaDB dump 10.19-11.0.2-MariaDB, for osx10.18 (x86_64)
--
-- Host: localhost    Database: clubsocial
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barrio`
--

DROP TABLE IF EXISTS `barrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barrio` (
  `id_barrio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_barrio` varchar(40) NOT NULL,
  PRIMARY KEY (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrio`
--

LOCK TABLES `barrio` WRITE;
/*!40000 ALTER TABLE `barrio` DISABLE KEYS */;
INSERT INTO `barrio` VALUES
(1,'Palermo'),
(2,'Recoleta'),
(3,'Belgrano'),
(4,'San Telmo'),
(5,'La Boca'),
(6,'Caballito'),
(7,'Villa Crespo'),
(8,'Almagro'),
(9,'Flores'),
(10,'Villa Urquiza'),
(11,'Colegiales'),
(12,'Nuñez'),
(13,'Saavedra'),
(14,'Barracas'),
(15,'Boedo'),
(16,'San Nicolás'),
(17,'San Cristobal'),
(18,'Villa Devoto'),
(19,'Villa del Parque'),
(20,'Villa Lugano');
/*!40000 ALTER TABLE `barrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobertura` (
  `id_cobertura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cobertura` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cobertura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura`
--

LOCK TABLES `cobertura` WRITE;
/*!40000 ALTER TABLE `cobertura` DISABLE KEYS */;
INSERT INTO `cobertura` VALUES
(1,'Federada Salud'),
(2,'Galeno'),
(3,'Swiss Medical'),
(4,'Medicus');
/*!40000 ALTER TABLE `cobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `id_cuota` int(11) NOT NULL AUTO_INCREMENT,
  `valor_cuota` decimal(10,2) NOT NULL,
  `fecha_cuota` date DEFAULT NULL,
  PRIMARY KEY (`id_cuota`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
INSERT INTO `cuotas` VALUES
(1,1000.00,'2023-07-01'),
(2,1500.00,'2023-08-11');
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_agregar_nueva_cuota
AFTER INSERT ON cuotas
FOR EACH ROW														
INSERT INTO log_registro_de_cuotas (id_cuota, valor_cuota, fecha_cuota, usuario, fechahora)
VALUES(
NEW.id_cuota, NEW.valor_cuota, NEW.fecha_cuota, USER(), NOW()
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_barrio` int(11) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `id_barrio` (`id_barrio`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`id_barrio`) REFERENCES `barrio` (`id_barrio`),
  CONSTRAINT `direcciones_ibfk_2` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES
(1,'Hauk',66010,19,1),
(2,'Farwell',7278,19,1),
(3,'Mayfield',57643,18,1),
(4,'Schurz',684,11,1),
(5,'Oak',68,10,1),
(6,'Warner',441,19,1),
(7,'Dahle',1,17,1),
(8,'Eastwood',12,2,1),
(9,'Donald',8791,4,1),
(10,'Warner',28778,4,1),
(11,'Prentice',63414,19,1),
(12,'Rigney',3,19,1),
(13,'Pawling',52690,18,1),
(14,'Arrowood',284,11,1),
(15,'Corry',36384,1,1),
(16,'Brown',5,1,1),
(17,'Gulseth',5031,2,1),
(18,'Corben',7704,18,1),
(19,'Continental',863,18,1);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_disciplina` varchar(20) NOT NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES
(1,'Fútbol'),
(2,'Basket'),
(3,'Natación'),
(4,'Taekwondo'),
(5,'Futsal');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES
(1,'dwharton0@aboutads.info'),
(2,'fgrindrod1@mapquest.com'),
(3,'cminney2@walmart.com'),
(4,'mchallinor3@dropbox.com'),
(5,'agoly4@usatoday.com'),
(6,'fpatty5@opera.com'),
(7,'dscala6@gravatar.com'),
(8,'hrowsell7@addthis.com'),
(9,'eyepiskopov8@prnewswire.com'),
(10,'ccowle9@alexa.com'),
(11,'apoytherasa@google.com.uk'),
(12,'bfitkinb@ibm.com'),
(13,'nklicherc@chron.com'),
(14,'fbrunnd@ucsd.edu'),
(15,'jnultye@constantcontact.com'),
(16,'baddingtonf@fda.gov'),
(17,'mtettherg@skype.com'),
(18,'bkewzickh@webnode.com'),
(19,'jdevoielsi@vimeo.com'),
(20,'tmulqueenyj@xrea.com');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES
(1,'Activo'),
(2,'Moroso'),
(3,'Baja');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_registro_de_cuotas`
--

DROP TABLE IF EXISTS `log_registro_de_cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_registro_de_cuotas` (
  `id_registro_de_cuotas` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuota` int(11) DEFAULT NULL,
  `valor_cuota` decimal(10,2) NOT NULL,
  `fecha_cuota` date DEFAULT NULL,
  `usuario` varchar(40) DEFAULT NULL,
  `fechahora` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_registro_de_cuotas`),
  KEY `id_cuota` (`id_cuota`),
  CONSTRAINT `log_registro_de_cuotas_ibfk_1` FOREIGN KEY (`id_cuota`) REFERENCES `cuotas` (`id_cuota`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_registro_de_cuotas`
--

LOCK TABLES `log_registro_de_cuotas` WRITE;
/*!40000 ALTER TABLE `log_registro_de_cuotas` DISABLE KEYS */;
INSERT INTO `log_registro_de_cuotas` VALUES
(1,2,1500.00,'2023-08-11','root@localhost','2023-08-11 18:35:42');
/*!40000 ALTER TABLE `log_registro_de_cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) DEFAULT NULL,
  `id_profesion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `id_socio` (`id_socio`),
  KEY `id_profesion` (`id_profesion`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES
(1,1,1),
(2,4,6),
(3,5,3),
(4,6,5),
(5,7,6),
(6,12,1);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nueva_sede`
--

DROP TABLE IF EXISTS `nueva_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nueva_sede` (
  `id_nueva_sede` int(11) NOT NULL AUTO_INCREMENT,
  `id_sede` int(11) NOT NULL,
  `nombre_sede` varchar(20) NOT NULL,
  `calle` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_barrio` int(11) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `usuario` varchar(40) DEFAULT NULL,
  `fechahora` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_nueva_sede`),
  KEY `id_sede` (`id_sede`),
  KEY `id_barrio` (`id_barrio`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `nueva_sede_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`),
  CONSTRAINT `nueva_sede_ibfk_2` FOREIGN KEY (`id_barrio`) REFERENCES `barrio` (`id_barrio`),
  CONSTRAINT `nueva_sede_ibfk_3` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nueva_sede`
--

LOCK TABLES `nueva_sede` WRITE;
/*!40000 ALTER TABLE `nueva_sede` DISABLE KEYS */;
INSERT INTO `nueva_sede` VALUES
(1,5,'Ricardo Bochini','Bochini',751,6,1,'root@localhost','2023-08-11 18:14:23');
/*!40000 ALTER TABLE `nueva_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nuevo_socio`
--

DROP TABLE IF EXISTS `nuevo_socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nuevo_socio` (
  `id_nuevo_socio` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `documento_socio` int(11) NOT NULL,
  `nombre_socio` varchar(100) NOT NULL,
  `apellido_socio` varchar(100) NOT NULL,
  `fecha_nacimiento_socio` date NOT NULL,
  `usuario` varchar(40) DEFAULT NULL,
  `fechahora` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_nuevo_socio`),
  UNIQUE KEY `documento_socio` (`documento_socio`),
  KEY `id_socio` (`id_socio`),
  CONSTRAINT `nuevo_socio_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nuevo_socio`
--

LOCK TABLES `nuevo_socio` WRITE;
/*!40000 ALTER TABLE `nuevo_socio` DISABLE KEYS */;
INSERT INTO `nuevo_socio` VALUES
(1,21,33333333,'Ezequiel','Izquierdo','1984-10-25','root@localhost','2023-08-11 18:13:21'),
(2,22,44444444,'Mario','Baracus','1950-05-20','root@localhost','2023-08-11 18:13:21'),
(10,39,21986140,'Emiliano','Martinez','1992-09-02','root@localhost','2023-08-19 00:44:28'),
(11,40,21226785,'Nicolás','Otamendi','1988-02-12','root@localhost','2023-08-19 00:44:28'),
(12,41,21567122,'Cristian','Romero','1998-04-27','root@localhost','2023-08-19 00:44:28'),
(13,42,21727852,'Nahuel','Molina','1998-04-06','root@localhost','2023-08-19 00:44:28'),
(14,43,21874969,'Nicolas','Tagliafico','1992-08-31','root@localhost','2023-08-19 00:44:28'),
(15,44,21975407,'Rodrigo','De Paul','1994-04-25','root@localhost','2023-08-19 00:44:28'),
(16,45,21221933,'Leandro','Paredes','1994-06-29','root@localhost','2023-08-19 00:44:28'),
(17,46,21564428,'Enzo','Fernandez','2001-01-27','root@localhost','2023-08-19 00:44:28');
/*!40000 ALTER TABLE `nuevo_socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) DEFAULT NULL,
  `id_cuota` int(11) DEFAULT NULL,
  `monto_pagado` decimal(10,2) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_socio` (`id_socio`),
  KEY `id_cuota` (`id_cuota`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_cuota`) REFERENCES `cuotas` (`id_cuota`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES
(1,1,1,1000.00,'2023-08-01'),
(2,2,1,1000.00,'2023-08-03'),
(3,3,1,1000.00,'2023-08-01'),
(4,4,1,1000.00,'2023-07-01'),
(5,5,1,1000.00,'2023-08-01'),
(6,6,1,1000.00,'2023-08-01'),
(7,7,1,1000.00,'2023-02-01'),
(8,8,1,1000.00,'2023-08-01'),
(9,9,1,1000.00,'2023-08-01'),
(10,10,1,1000.00,'2023-08-01'),
(11,11,1,1000.00,'2023-08-01'),
(12,12,1,1000.00,'2023-05-01'),
(13,13,1,1000.00,'2023-08-01'),
(14,14,1,1000.00,'2023-08-01'),
(15,15,1,1000.00,'2023-02-01'),
(16,16,1,1000.00,'2023-08-01'),
(17,17,1,1000.00,'2023-08-01'),
(18,18,1,1000.00,'2023-07-01'),
(19,19,1,1000.00,'2023-08-01'),
(20,20,1,1000.00,'2023-06-01');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `plantel_futbol_vw`
--

DROP TABLE IF EXISTS `plantel_futbol_vw`;
/*!50001 DROP VIEW IF EXISTS `plantel_futbol_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `plantel_futbol_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio`,
  1 AS `nombre_disciplina` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `planteles`
--

DROP TABLE IF EXISTS `planteles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planteles` (
  `id_plantel` int(11) NOT NULL AUTO_INCREMENT,
  `id_disciplina` int(11) DEFAULT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_plantel`),
  KEY `id_disciplina` (`id_disciplina`),
  KEY `id_socio` (`id_socio`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_medico` (`id_medico`),
  KEY `id_sede` (`id_sede`),
  CONSTRAINT `planteles_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `planteles_ibfk_2` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  CONSTRAINT `planteles_ibfk_3` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `planteles_ibfk_4` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `planteles_ibfk_5` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planteles`
--

LOCK TABLES `planteles` WRITE;
/*!40000 ALTER TABLE `planteles` DISABLE KEYS */;
INSERT INTO `planteles` VALUES
(1,1,6,1,6,1),
(2,2,17,2,1,2),
(3,3,15,4,3,3),
(4,4,13,4,4,4),
(5,5,10,5,1,1),
(6,1,9,1,6,1);
/*!40000 ALTER TABLE `planteles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL AUTO_INCREMENT,
  `profesion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES
(1,'Traumatologo'),
(2,'Director Tecnico'),
(3,'Enfermera'),
(4,'Profesor'),
(5,'Kinesiologo'),
(6,'Psicologo');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) DEFAULT NULL,
  `id_disciplina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `id_socio` (`id_socio`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socios` (`id_socio`),
  CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES
(1,19,1),
(2,20,2),
(4,11,4),
(5,2,5),
(6,3,1);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(30) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES
(1,'Buenos Aires'),
(2,'Córdoba'),
(3,'Santa Fe'),
(4,'Mendoza'),
(5,'Tucumán'),
(6,'Entre Ríos'),
(7,'Salta'),
(8,'Chaco'),
(9,'Corrientes'),
(10,'Santiago del Estero'),
(11,'Jujuy'),
(12,'Río Negro'),
(13,'Neuquén'),
(14,'Formosa'),
(15,'San Juan'),
(16,'Chubut'),
(17,'Misiones'),
(18,'San Luis'),
(19,'La Pampa'),
(20,'Catamarca'),
(21,'La Rioja'),
(22,'Tierra del Fuego'),
(23,'Santa Cruz');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sede` varchar(20) NOT NULL,
  `calle` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_barrio` int(11) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sede`),
  KEY `id_barrio` (`id_barrio`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`id_barrio`) REFERENCES `barrio` (`id_barrio`),
  CONSTRAINT `sede_ibfk_2` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES
(1,'Lionel Messi','Nova',4,19,1),
(2,'Diego Maradona','Butterfield',422,18,1),
(3,'Gabriel Batistuta','Atwood',78,11,1),
(4,'Juan Roman Riquelme','Clemons',509,1,1),
(5,'Ricardo Bochini','Bochini',751,6,1);
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_agregar_nueva_sede
AFTER INSERT ON sede
FOR EACH ROW														
INSERT INTO nueva_sede (id_sede, nombre_sede, calle, numero, id_barrio, id_provincia, usuario, fechahora)
VALUES(
NEW.id_sede, NEW.nombre_sede, NEW.calle, NEW.numero, NEW.id_barrio, NEW.id_provincia, USER(), NOW()
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL AUTO_INCREMENT,
  `documento_socio` int(11) NOT NULL,
  `nombre_socio` varchar(40) NOT NULL,
  `apellido_socio` varchar(40) NOT NULL,
  `fecha_nacimiento_socio` date NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `sexo` enum('F','M','X') DEFAULT NULL,
  `id_cobertura` int(11) DEFAULT NULL,
  `id_telefono` int(11) DEFAULT NULL,
  `id_email` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_socio`),
  UNIQUE KEY `documento_socio` (`documento_socio`),
  KEY `id_direccion` (`id_direccion`),
  KEY `id_cobertura` (`id_cobertura`),
  KEY `id_telefono` (`id_telefono`),
  KEY `id_email` (`id_email`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`),
  CONSTRAINT `socios_ibfk_2` FOREIGN KEY (`id_cobertura`) REFERENCES `cobertura` (`id_cobertura`),
  CONSTRAINT `socios_ibfk_3` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`),
  CONSTRAINT `socios_ibfk_4` FOREIGN KEY (`id_email`) REFERENCES `email` (`id_email`),
  CONSTRAINT `socios_ibfk_5` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES
(1,58986140,'Jeana','Phizackarley','1983-04-17',1,'F',1,1,1,1),
(2,34226785,'Nikki','Ledingham','2005-01-24',2,'M',2,2,2,1),
(3,17567122,'Doroteya','Gallanders','1960-08-02',3,'M',3,3,3,1),
(4,79727852,'Vittorio','Bonnick','1994-07-21',4,'M',4,4,4,2),
(5,2874969,'Clemmy','Pauel','1999-10-08',5,'F',1,5,5,1),
(6,18975407,'Eolanda','Vern','2002-03-17',6,'M',2,6,6,1),
(7,95221933,'Bennie','Hundey','1955-10-28',7,'F',3,7,7,3),
(8,88564428,'Nolie','Girardot','1971-10-04',8,'F',4,8,8,1),
(9,313416,'Lind','Griffin','2002-02-08',9,'M',1,9,9,1),
(10,602672,'Solly','McCuaig','1985-12-09',10,'M',2,10,10,1),
(11,35518643,'Fleur','Giametti','1964-08-02',11,'M',3,11,11,1),
(12,32115666,'Isa','Clearley','1956-03-19',12,'F',4,12,12,3),
(13,42878546,'Ange','Andrea','1978-08-20',12,'M',4,13,13,1),
(14,40769951,'Kathryn','Tudbald','1971-08-25',13,'F',1,14,14,1),
(15,68180712,'Miner','Ashwood','1978-05-16',14,'M',2,15,15,3),
(16,95816007,'Waiter','Schofield','1979-04-15',15,'M',3,16,16,1),
(17,67958272,'Bary','Elacoate','1984-07-05',16,'M',4,17,17,1),
(18,37037693,'Omar','Vasilyevski','1986-09-25',17,'M',1,18,18,2),
(19,58834314,'Davide','Brouard','1971-01-24',18,'M',2,18,19,1),
(20,11594254,'Spense','Arcase','1971-06-05',19,'M',3,20,20,2),
(21,33333333,'Ezequiel','Izquierdo','1984-10-25',1,'M',3,1,3,NULL),
(22,44444444,'Mario','Baracus','1950-05-20',1,'M',3,2,4,NULL),
(39,21986140,'Emiliano','Martinez','1992-09-02',NULL,'M',1,NULL,NULL,NULL),
(40,21226785,'Nicolás','Otamendi','1988-02-12',NULL,'M',1,NULL,NULL,NULL),
(41,21567122,'Cristian','Romero','1998-04-27',NULL,'M',1,NULL,NULL,NULL),
(42,21727852,'Nahuel','Molina','1998-04-06',NULL,'M',1,NULL,NULL,NULL),
(43,21874969,'Nicolas','Tagliafico','1992-08-31',NULL,'M',1,NULL,NULL,NULL),
(44,21975407,'Rodrigo','De Paul','1994-04-25',NULL,'M',1,NULL,NULL,NULL),
(45,21221933,'Leandro','Paredes','1994-06-29',NULL,'M',1,NULL,NULL,NULL),
(46,21564428,'Enzo','Fernandez','2001-01-27',NULL,'M',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER tr_agregar_nuevo_socio
AFTER INSERT ON socios
FOR EACH ROW														
INSERT INTO nuevo_socio (id_socio, documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, usuario, fechahora)
VALUES(
NEW.id_socio, NEW.documento_socio, NEW.nombre_socio, NEW.apellido_socio, NEW.fecha_nacimiento_socio, USER(), NOW()
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `socios_hombres_vw`
--

DROP TABLE IF EXISTS `socios_hombres_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_hombres_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_hombres_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `socios_medicos_vw`
--

DROP TABLE IF EXISTS `socios_medicos_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_medicos_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_medicos_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `id_medico`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio`,
  1 AS `profesion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `socios_mujeres_vw`
--

DROP TABLE IF EXISTS `socios_mujeres_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_mujeres_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_mujeres_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `socios_por_edad_vw`
--

DROP TABLE IF EXISTS `socios_por_edad_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_por_edad_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_por_edad_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio`,
  1 AS `edad` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `socios_profesores_vw`
--

DROP TABLE IF EXISTS `socios_profesores_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_profesores_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_profesores_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `id_profesor`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio`,
  1 AS `nombre_disciplina` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `socios_villa_del_parque_vw`
--

DROP TABLE IF EXISTS `socios_villa_del_parque_vw`;
/*!50001 DROP VIEW IF EXISTS `socios_villa_del_parque_vw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `socios_villa_del_parque_vw` AS SELECT
 1 AS `id_socio`,
  1 AS `nombre_socio`,
  1 AS `apellido_socio`,
  1 AS `nombre_barrio` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` int(11) NOT NULL,
  PRIMARY KEY (`id_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES
(1,40261719),
(2,62459032),
(3,88731337),
(4,93062148),
(5,39029176),
(6,12549321),
(7,48091815),
(8,18275399),
(9,60882820),
(10,14586242),
(11,98286518),
(12,69831762),
(13,72347857),
(14,58053396),
(15,91554176),
(16,98298639),
(17,68742419),
(18,48579543),
(19,42155533),
(20,97493691);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clubsocial'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_estado_socio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_estado_socio`(dni INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE estado_socio VARCHAR(50);
	SET estado_socio = (
		SELECT e.estado
		FROM estados e
        JOIN socios s ON s.id_estado = e.id_estado
        WHERE s.documento_socio = dni
			);
	RETURN estado_socio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_socio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_socio`(id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE apellido_y_nombre VARCHAR(50);
	SET apellido_y_nombre = (
		SELECT CONCAT(apellido_socio, ", ", nombre_socio)
		FROM socios
        WHERE id_socio = id
			);
	RETURN apellido_y_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_socio_dni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_socio_dni`(dni INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE apellido_y_nombre VARCHAR(50);
	SET apellido_y_nombre = (
		SELECT CONCAT(apellido_socio, ", ", nombre_socio)
		FROM socios
        WHERE documento_socio = dni
			);
	RETURN apellido_y_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_nueva_profesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nueva_profesion`(IN profesion_param VARCHAR(50))
BEGIN
    INSERT INTO clubsocial.profesion (profesion)
    VALUES (profesion_param);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenamiento_socios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenamiento_socios`(IN campo_orden CHAR(20), IN orden VARCHAR(4))
BEGIN
	IF campo_orden <> '' THEN
		SET @ordenamiento = CONCAT(' ORDER BY ', campo_orden, ' ', orden);				
	ELSE 
		SET @ordenamiento = '';
	END IF;

	SET @consulta = CONCAT( 'SELECT id_socio, nombre_socio, apellido_socio, FLOOR(DATEDIFF(CURDATE(), fecha_nacimiento_socio) / 365) AS edad FROM socios', @ordenamiento);

	PREPARE statement FROM @consulta;
	EXECUTE statement;
	DEALLOCATE PREPARE statement;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `plantel_futbol_vw`
--

/*!50001 DROP VIEW IF EXISTS `plantel_futbol_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `plantel_futbol_vw` AS (select `s`.`id_socio` AS `id_socio`,`s`.`nombre_socio` AS `nombre_socio`,`s`.`apellido_socio` AS `apellido_socio`,`d`.`nombre_disciplina` AS `nombre_disciplina` from ((`socios` `s` join `planteles` `pl` on(`s`.`id_socio` = `pl`.`id_socio`)) join `disciplina` `d` on(`pl`.`id_disciplina` = `d`.`id_disciplina`)) where `pl`.`id_disciplina` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_hombres_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_hombres_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_hombres_vw` AS (select `socios`.`id_socio` AS `id_socio`,`socios`.`nombre_socio` AS `nombre_socio`,`socios`.`apellido_socio` AS `apellido_socio` from `socios` where `socios`.`sexo` like ucase('%M%') and !(`socios`.`id_socio` in (select `profesor`.`id_socio` from `profesor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_medicos_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_medicos_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_medicos_vw` AS (select `s`.`id_socio` AS `id_socio`,`m`.`id_medico` AS `id_medico`,`s`.`nombre_socio` AS `nombre_socio`,`s`.`apellido_socio` AS `apellido_socio`,`p`.`profesion` AS `profesion` from ((`medico` `m` join `socios` `s` on(`m`.`id_socio` = `s`.`id_socio`)) join `profesion` `p` on(`p`.`id_profesion` = `m`.`id_profesion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_mujeres_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_mujeres_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_mujeres_vw` AS (select `socios`.`id_socio` AS `id_socio`,`socios`.`nombre_socio` AS `nombre_socio`,`socios`.`apellido_socio` AS `apellido_socio` from `socios` where `socios`.`sexo` like ucase('%F%') and !(`socios`.`id_socio` in (select `profesor`.`id_socio` from `profesor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_por_edad_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_por_edad_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_por_edad_vw` AS (select `socios`.`id_socio` AS `id_socio`,`socios`.`nombre_socio` AS `nombre_socio`,`socios`.`apellido_socio` AS `apellido_socio`,floor((to_days(curdate()) - to_days(`socios`.`fecha_nacimiento_socio`)) / 365) AS `edad` from `socios`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_profesores_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_profesores_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_profesores_vw` AS (select `s`.`id_socio` AS `id_socio`,`p`.`id_profesor` AS `id_profesor`,`s`.`nombre_socio` AS `nombre_socio`,`s`.`apellido_socio` AS `apellido_socio`,`d`.`nombre_disciplina` AS `nombre_disciplina` from (((`profesor` `p` join `socios` `s` on(`p`.`id_socio` = `s`.`id_socio`)) join `planteles` `pl` on(`pl`.`id_disciplina` = `p`.`id_disciplina`)) join `disciplina` `d` on(`d`.`id_disciplina` = `pl`.`id_disciplina`)) group by `p`.`id_profesor`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `socios_villa_del_parque_vw`
--

/*!50001 DROP VIEW IF EXISTS `socios_villa_del_parque_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `socios_villa_del_parque_vw` AS (select `s`.`id_socio` AS `id_socio`,`s`.`nombre_socio` AS `nombre_socio`,`s`.`apellido_socio` AS `apellido_socio`,`b`.`nombre_barrio` AS `nombre_barrio` from ((`socios` `s` join `direcciones` `d` on(`s`.`id_direccion` = `d`.`id_direccion`)) join `barrio` `b` on(`d`.`id_barrio` = `b`.`id_barrio`)) where `b`.`id_barrio` = 19) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 14:29:15
