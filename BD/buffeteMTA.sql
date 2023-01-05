-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: buffete
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `abogado`
--

DROP TABLE IF EXISTS `abogado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abogado` (
  `id_abogado` int(11) NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `RFC` varchar(50) DEFAULT NULL,
  `cedula` varchar(50) DEFAULT NULL,
  `id_grado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_abogado`),
  UNIQUE KEY `RFC` (`RFC`),
  KEY `id_grado` (`id_grado`),
  CONSTRAINT `abogado_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `estudio` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abogado`
--

LOCK TABLES `abogado` WRITE;
/*!40000 ALTER TABLE `abogado` DISABLE KEYS */;
INSERT INTO `abogado` VALUES (1,'Herrera','Torres','Juan','HTJ10547HM','1243567',1),(2,'Corona','Navarro','Leonardo','CNL32546NM','7689764',1),(3,'Ruiz','Valdes','Maria','RVM21678HM','2313567',2),(4,'Guzman','Acosta','Sebastian','GAS7865HM6','9867546',3),(5,'Hernandez','Aguilar','Santiago','HAS9854JK4','2156787',4),(6,'Carrillo','Aguirre','Daniel','CAD56435HM','3427865',4),(7,'Antuna','Alvarado','Ruben','AAR19286CM','5678765',3),(8,'Cordova','Leon','Elizabeth','CLE20450FM','1829919',3),(9,'Martinez','Manjarrez','Lizbeth','MAML000912JM2','2003456',4),(10,'Ochoa','Olague','Isabel','OOI780716HCC','3096542',4),(11,'Gomez','Vazquez','Mayra Leticia','GOVM870813DY9','33453355',2),(12,'Rodriguez ','Hernandez','Maria del Carmen','ROHC901020RS6','5674002',4);
/*!40000 ALTER TABLE `abogado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `abogado_inserta` AFTER INSERT ON `abogado` FOR EACH ROW BEGIN
INSERT INTO audita_abogado (operacion, usuario, fecha,  new_id_abogado, new_paterno,  new_materno, new_nombre,  new_RFC,  new_id_grado)
VALUES ('insertar', current_user(), now(), new.id_abogado, new.paterno,  new.materno, new.nombre,  new.RFC,  new.id_grado);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `abogado_actualiza` AFTER UPDATE ON `abogado` FOR EACH ROW BEGIN
INSERT INTO audita_abogado(operacion, usuario, fecha,  new_id_abogado, new_paterno,  new_materno, new_nombre,  new_RFC,  new_id_grado, old_id_abogado, old_paterno, old_materno,  old_nombre,  old_RFC, old_id_grado )
VALUES ('Actualizado', current_user(), now(), new.id_abogado, new.paterno,  new.materno, new.nombre,  new.RFC,  new.id_grado, old.id_abogado, old.paterno, old.materno,  old.nombre,  old.RFC, old.id_grado);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `abogado_elimina` AFTER DELETE ON `abogado` FOR EACH ROW BEGIN
INSERT INTO audita_abogado (operacion, usuario, fecha, old_id_abogado, old_paterno, old_materno,  old_nombre,  old_RFC, old_id_grado  )
VALUES ('Eliminado', current_user(), now(), old.id_abogado, old.paterno, old.materno,  old.nombre,  old.RFC, old.id_grado  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asesora`
--

DROP TABLE IF EXISTS `asesora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asesora` (
  `id_asesoria` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `tema` varchar(70) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_asunto` int(11) DEFAULT NULL,
  `asesor` int(11) DEFAULT NULL,
  `asesorado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_asesoria`),
  KEY `id_asunto` (`id_asunto`),
  KEY `asesor` (`asesor`),
  KEY `asesorado` (`asesorado`),
  CONSTRAINT `asesora_ibfk_1` FOREIGN KEY (`id_asunto`) REFERENCES `asunto` (`id_asunto`),
  CONSTRAINT `asesora_ibfk_2` FOREIGN KEY (`asesor`) REFERENCES `abogado` (`id_abogado`),
  CONSTRAINT `asesora_ibfk_3` FOREIGN KEY (`asesorado`) REFERENCES `abogado` (`id_abogado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesora`
--

LOCK TABLES `asesora` WRITE;
/*!40000 ALTER TABLE `asesora` DISABLE KEYS */;
INSERT INTO `asesora` VALUES (1,'2017-11-05','Divorcios','13:00:00',4,1,7),(2,'2019-06-17','Testamentos','10:00:00',2,2,6),(3,'2016-07-23','Juicios','09:00:00',5,3,5),(4,'2018-08-27','Regularizacion de propiedades ','14:00:00',3,4,4),(5,'2019-04-05','Cumplimientos de pensiones alimenticias','15:00:00',1,5,3);
/*!40000 ALTER TABLE `asesora` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asesora_inserta` AFTER INSERT ON `asesora` FOR EACH ROW BEGIN
INSERT INTO audita_asesora (operacion, usuario, fecha, new_fecha, new_tema, new_hora,  new_id_asunto, new_asesor,  new_asesorado)
VALUES ('insertar', current_user(), now(), new.fecha, new.tema, new.hora,  new.id_asunto, new.asesor,  new.asesorado);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asesora_actualiza` AFTER UPDATE ON `asesora` FOR EACH ROW BEGIN
INSERT INTO audita_asesora(operacion, usuario, fecha,  new_fecha, new_tema, new_hora,  new_id_asunto, new_asesor,  new_asesorado, old_fecha,  old_tema, old_hora, old_id_asunto, old_asesor,  old_asesorado )
VALUES ('Actualizado', current_user(), now(),  new.fecha, new.tema, new.hora,  new.id_asunto, new.asesor,  new.asesorado, old.fecha,  old.tema, old.hora, old.id_asunto, old.asesor,  old.asesorado );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asesora_elimina` AFTER DELETE ON `asesora` FOR EACH ROW BEGIN
INSERT INTO audita_asesora (operacion, usuario, fecha, old_fecha,  old_tema, old_hora, old_id_asunto, old_asesor,  old_asesorado)
VALUES ('Eliminado', current_user(), now(), old.fecha, old.tema, old.hora, old.id_asunto, old.asesor, old.asesorado);  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asunto`
--

DROP TABLE IF EXISTS `asunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asunto` (
  `id_asunto` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_demandado` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_tipo_asu` int(11) DEFAULT NULL,
  `id_abogado` int(11) DEFAULT NULL,
  `F_inicio` date DEFAULT NULL,
  `F_final` date DEFAULT NULL,
  PRIMARY KEY (`id_asunto`),
  KEY `id_abogado` (`id_abogado`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_demandado` (`id_demandado`),
  KEY `id_estado` (`id_estado`),
  KEY `id_tipo_asu` (`id_tipo_asu`),
  CONSTRAINT `asunto_ibfk_1` FOREIGN KEY (`id_abogado`) REFERENCES `abogado` (`id_abogado`),
  CONSTRAINT `asunto_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `asunto_ibfk_3` FOREIGN KEY (`id_demandado`) REFERENCES `demandado` (`id_demandado`),
  CONSTRAINT `asunto_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `asunto_ibfk_5` FOREIGN KEY (`id_tipo_asu`) REFERENCES `tipo_asunto` (`id_tipo_asunto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asunto`
--

LOCK TABLES `asunto` WRITE;
/*!40000 ALTER TABLE `asunto` DISABLE KEYS */;
INSERT INTO `asunto` VALUES (1,4,6,1,5,1,'2019-04-03','2020-05-29'),(2,5,5,1,4,2,'2019-06-15','2020-03-23'),(3,7,2,6,3,3,'2018-08-25','2019-09-06'),(4,2,11,2,3,4,'2017-11-02','2019-10-18'),(5,3,6,1,1,5,'2016-07-21','2018-08-16'),(6,13,14,2,4,11,'2023-01-10','2023-01-10');
/*!40000 ALTER TABLE `asunto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asunto_inserta` AFTER INSERT ON `asunto` FOR EACH ROW BEGIN
INSERT INTO audita_asunto (operacion, usuario, fecha,  new_id_asunto, new_id_cliente, new_id_demandado, new_id_estado, new_id_tipo_asu,  new_id_abogado, new_f_inicio, new_f_final)
VALUES ('insertar', current_user(), now(), new.id_asunto, new.id_cliente, new.id_demandado, new.id_estado, new.id_tipo_asu,  new.id_abogado, new.f_inicio, new.f_final);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asunto_actualiza` AFTER UPDATE ON `asunto` FOR EACH ROW BEGIN
INSERT INTO audita_asunto(operacion, usuario, fecha, new_id_asunto, new_id_cliente, new_id_demandado, new_id_estado, new_id_tipo_asu,  new_id_abogado, new_f_inicio, new_f_final, old_id_asunto, old_id_cliente, old_id_demandado, old_id_estado, old_id_tipo_asu,  old_id_abogado, old_f_inicio, old_f_final)
VALUES ('Actualizado', current_user(), now(), new.id_asunto, new.id_cliente, new.id_demandado, new.id_estado, new.id_tipo_asu,  new.id_abogado, new.f_inicio, new.f_final,  old.id_asunto, old.id_cliente, old.id_demandado, old.id_estado, old.id_tipo_asu,  old.id_abogado, old.f_inicio, old.f_final);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `asunto_elimina` AFTER DELETE ON `asunto` FOR EACH ROW BEGIN
INSERT INTO audita_asunto (operacion, usuario, fecha, old_id_asunto, old_id_cliente, old_id_demandado, old_id_estado, old_id_tipo_asu,  old_id_abogado, old_f_inicio, old_f_final)  
VALUES ('Eliminado', current_user(), now(), old.id_asunto, old.id_cliente, old.id_demandado, old.id_estado, old.id_tipo_asu,  old.id_abogado, old.f_inicio, old.f_final);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audiencia`
--

DROP TABLE IF EXISTS `audiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiencia` (
  `id_audiencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_lugar` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `resolucion` varchar(50) DEFAULT NULL,
  `id_asunto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_audiencia`),
  KEY `id_asunto` (`id_asunto`),
  KEY `id_lugar` (`id_lugar`),
  CONSTRAINT `audiencia_ibfk_1` FOREIGN KEY (`id_asunto`) REFERENCES `asunto` (`id_asunto`),
  CONSTRAINT `audiencia_ibfk_2` FOREIGN KEY (`id_lugar`) REFERENCES `lugar` (`id_lugar`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiencia`
--

LOCK TABLES `audiencia` WRITE;
/*!40000 ALTER TABLE `audiencia` DISABLE KEYS */;
INSERT INTO `audiencia` VALUES (1,5,'2020-01-10','13:00:00','sestencia',1),(2,1,'2018-02-24','10:00:00','autos',4),(3,6,'2017-10-02','15:00:00','decretos',5),(4,4,'2018-10-28','09:00:00','decretos',3),(5,3,'2020-09-10','12:00:00','autos',2);
/*!40000 ALTER TABLE `audiencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audiencia_inserta` AFTER INSERT ON `audiencia` FOR EACH ROW BEGIN
INSERT INTO audita_audiencia (operacion, usuario, fecha, new_id_audiencia, new_id_lugar, new_fecha,  new_hora, new_resolucion, new_id_asunto)
VALUES ('insertar', current_user(), now(), new.id_audiencia, new.id_lugar, new.fecha,  new.hora, new.resolucion, new.id_asunto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audiencia_actualiza` AFTER UPDATE ON `audiencia` FOR EACH ROW BEGIN
INSERT INTO audita_audiencia(operacion, usuario, fecha, new_id_audiencia, new_id_lugar, new_fecha,  new_hora, new_resolucion, new_id_asunto, old_id_audiencia,  old_id_lugar, old_fecha,  old_hora,  old_resolucion, old_id_asunto)
VALUES ('Actualizado', current_user(), now(), new.id_audiencia, new.id_lugar, new.fecha,  new.hora, new.resolucion, new.id_asunto, old.id_audiencia,  old.id_lugar, old.fecha,  old.hora,  old.resolucion, old.id_asunto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `audiencia_elimina` AFTER DELETE ON `audiencia` FOR EACH ROW BEGIN
INSERT INTO audita_audiencia (operacion, usuario, fecha,  old_id_audiencia,  old_id_lugar, old_fecha,  old_hora,  old_resolucion, old_id_asunto)
VALUES ('Eliminado', current_user(), now(), old.id_audiencia,  old.id_lugar, old.fecha,  old.hora,  old.resolucion, old.id_asunto);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `audita_abogado`
--

DROP TABLE IF EXISTS `audita_abogado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_abogado` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_abogado` int(11) DEFAULT NULL,
  `new_paterno` varchar(50) DEFAULT '--------',
  `new_materno` varchar(50) DEFAULT '--------',
  `new_nombre` varchar(50) DEFAULT '--------',
  `new_RFC` varchar(50) DEFAULT '--------',
  `new_id_grado` int(11) DEFAULT NULL,
  `old_id_abogado` int(11) DEFAULT NULL,
  `old_paterno` varchar(50) DEFAULT '--------',
  `old_materno` varchar(50) DEFAULT '--------',
  `old_nombre` varchar(50) DEFAULT '--------',
  `old_RFC` varchar(50) DEFAULT '--------',
  `old_id_grado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_abogado`
--

LOCK TABLES `audita_abogado` WRITE;
/*!40000 ALTER TABLE `audita_abogado` DISABLE KEYS */;
INSERT INTO `audita_abogado` VALUES ('Eliminado','root@localhost','2022-01-05 04:09:20',NULL,'--------','--------','--------','--------',NULL,10,'Ochoa','Olague','Isabel','OOI7876HCC',4),('insertar','root@localhost','2022-01-05 05:57:46',11,'Gonzalez','Medina','Elizabeth','GME092423',2,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',1,'Herrera','Torres','Juan','HTJ10547HM',1,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',2,'Corona','Navarro','Leonardo','CNL32546NM',1,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',3,'Ruiz','Valdes','Maria','RVM21678HM',2,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',4,'Guzman','Acosta','Sebastian','GAS7865HM6',3,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',5,'Hernandez','Aguilar','Santiago','HAS9854JK4',4,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',6,'Carrillo','Aguirre','Daniel','CAD56435HM',4,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',7,'Antuna','Alvarado','Ruben','AAR19286CM',3,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',8,'Cordova','Leon','Elizabeth','CLE20450FM',3,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',9,'Martinez','Manjarrez','Lizbeth','MML00912JM',4,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2022-01-06 16:25:56',10,'Ochoa','Olague','Isabel','OOI7876HCC',4,NULL,'--------','--------','--------','--------',NULL),('insertar','root@localhost','2023-01-03 17:54:21',11,'Gomez','Vazquez','Mayra Leticia','GOVM870813DY9',2,NULL,'--------','--------','--------','--------',NULL),('Actualizado','root@localhost','2023-01-03 17:54:44',10,'Ochoa','Olague','Isabel','OOI780716HCC',4,10,'Ochoa','Olague','Isabel','OOI7876HCC',4),('Actualizado','root@localhost','2023-01-03 17:59:00',9,'Martinez','Manjarrez','Lizbeth','MAML000912JM2',4,9,'Martinez','Manjarrez','Lizbeth','MML00912JM',4),('insertar','root@localhost','2023-01-04 15:56:55',12,'Rodriguez ','Hernandez','Maria del Carmen','ROHC901020RS6',4,NULL,'--------','--------','--------','--------',NULL);
/*!40000 ALTER TABLE `audita_abogado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_asesora`
--

DROP TABLE IF EXISTS `audita_asesora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_asesora` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_fecha` date DEFAULT NULL,
  `new_tema` varchar(70) DEFAULT '--------',
  `new_hora` time DEFAULT NULL,
  `new_id_asunto` int(11) DEFAULT NULL,
  `new_asesor` int(11) DEFAULT NULL,
  `new_asesorado` int(11) DEFAULT NULL,
  `old_fecha` date DEFAULT NULL,
  `old_tema` varchar(70) DEFAULT '--------',
  `old_hora` time DEFAULT NULL,
  `old_id_asunto` int(11) DEFAULT NULL,
  `old_asesor` int(11) DEFAULT NULL,
  `old_asesorado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_asesora`
--

LOCK TABLES `audita_asesora` WRITE;
/*!40000 ALTER TABLE `audita_asesora` DISABLE KEYS */;
INSERT INTO `audita_asesora` VALUES ('insertar','root@localhost','2022-01-05 03:48:42','2022-01-26','Testamento','03:48:42',2,7,1,NULL,'--------',NULL,NULL,NULL,NULL),('Eliminado','root@localhost','2022-01-05 03:52:18',NULL,'--------',NULL,NULL,NULL,NULL,'2022-01-15','Penal','03:45:03',2,4,2),('Eliminado','root@localhost','2022-01-05 03:52:21',NULL,'--------',NULL,NULL,NULL,NULL,'2022-01-26','Testamento','03:48:42',2,7,1),('Eliminado','root@localhost','2022-01-05 03:52:23',NULL,'--------',NULL,NULL,NULL,NULL,'2022-01-21','Divorcio','03:45:41',1,2,5),('insertar','root@localhost','2022-01-05 04:01:42','2022-01-21','Demanda','14:01:16',2,5,2,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 13:29:54','2022-01-15','Divorcio','13:29:25',3,6,2,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:38','2017-11-05','Divorcios','13:00:00',4,1,7,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:38','2019-06-17','Testamentos','10:00:00',2,2,6,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:38','2016-07-23','Juicios','09:00:00',5,3,5,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:38','2018-08-27','Regularizacion de propiedades ','14:00:00',3,4,4,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:38','2019-04-05','Cumplimientos de pensiones alimenticias','15:00:00',1,5,3,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:56','2017-11-05','Divorcios','13:00:00',4,1,7,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:56','2019-06-17','Testamentos','10:00:00',2,2,6,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:56','2016-07-23','Juicios','09:00:00',5,3,5,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:56','2018-08-27','Regularizacion de propiedades ','14:00:00',3,4,4,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:26:56','2019-04-05','Cumplimientos de pensiones alimenticias','15:00:00',1,5,3,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:31:32','2017-11-05','Divorcios','13:00:00',4,1,7,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:31:32','2019-06-17','Testamentos','10:00:00',2,2,6,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:31:32','2016-07-23','Juicios','09:00:00',5,3,5,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:31:32','2018-08-27','Regularizacion de propiedades ','14:00:00',3,4,4,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:31:32','2019-04-05','Cumplimientos de pensiones alimenticias','15:00:00',1,5,3,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:32:10','2017-11-05','Divorcios','13:00:00',4,1,7,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:32:10','2019-06-17','Testamentos','10:00:00',2,2,6,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:32:10','2016-07-23','Juicios','09:00:00',5,3,5,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:32:10','2018-08-27','Regularizacion de propiedades ','14:00:00',3,4,4,NULL,'--------',NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:32:10','2019-04-05','Cumplimientos de pensiones alimenticias','15:00:00',1,5,3,NULL,'--------',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `audita_asesora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_asunto`
--

DROP TABLE IF EXISTS `audita_asunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_asunto` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_asunto` int(11) DEFAULT NULL,
  `new_id_cliente` int(11) DEFAULT NULL,
  `new_id_demandado` int(11) DEFAULT NULL,
  `new_id_estado` int(11) DEFAULT NULL,
  `new_id_tipo_asu` int(11) DEFAULT NULL,
  `new_id_abogado` int(11) DEFAULT NULL,
  `new_f_inicio` date DEFAULT NULL,
  `new_f_final` date DEFAULT NULL,
  `old_id_asunto` int(11) DEFAULT NULL,
  `old_id_cliente` int(11) DEFAULT NULL,
  `old_id_demandado` int(11) DEFAULT NULL,
  `old_id_estado` int(11) DEFAULT NULL,
  `old_id_tipo_asu` int(11) DEFAULT NULL,
  `old_id_abogado` int(11) DEFAULT NULL,
  `old_f_inicio` date DEFAULT NULL,
  `old_f_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_asunto`
--

LOCK TABLES `audita_asunto` WRITE;
/*!40000 ALTER TABLE `audita_asunto` DISABLE KEYS */;
INSERT INTO `audita_asunto` VALUES ('insertar','root@localhost','2022-01-04 19:02:11',2,4,1,2,2,7,'2021-12-08','2022-01-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-05 04:05:25',3,5,1,1,3,7,'2022-01-13','2022-01-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:07',9,4,6,1,5,1,'2019-04-03','2020-05-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:07',10,5,5,1,4,2,'2019-06-15','2020-03-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:07',11,7,2,3,7,3,'2018-08-25','2019-09-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:07',12,2,1,2,6,4,'2017-11-02','2019-10-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:07',13,3,6,1,1,5,'2016-07-21','2018-08-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:31',1,4,6,1,5,1,'2019-04-03','2020-05-29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:31',2,5,5,1,4,2,'2019-06-15','2020-03-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:31',3,7,2,3,7,3,'2018-08-25','2019-09-06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:31',4,2,1,2,6,4,'2017-11-02','2019-10-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 16:24:31',5,3,6,1,1,5,'2016-07-21','2018-08-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Actualizado','root@localhost','2023-01-03 23:15:53',4,2,11,2,3,4,'2017-11-02','2019-10-18',4,2,1,2,6,4,'2017-11-02','2019-10-18'),('insertar','root@localhost','2023-01-04 01:03:59',6,13,14,2,4,11,'2023-01-10','2023-01-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Actualizado','root@localhost','2023-01-04 15:36:26',3,7,2,3,9,3,'2018-08-25','2019-09-06',3,7,2,3,7,3,'2018-08-25','2019-09-06'),('Actualizado','root@localhost','2023-01-04 15:37:23',3,7,2,6,3,3,'2018-08-25','2019-09-06',3,7,2,3,9,3,'2018-08-25','2019-09-06'),('Actualizado','root@localhost','2023-01-04 15:37:25',3,7,2,6,3,3,'2018-08-25','2019-09-06',3,7,2,6,3,3,'2018-08-25','2019-09-06');
/*!40000 ALTER TABLE `audita_asunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_audiencia`
--

DROP TABLE IF EXISTS `audita_audiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_audiencia` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_audiencia` int(11) DEFAULT NULL,
  `new_id_lugar` int(11) DEFAULT NULL,
  `new_fecha` date DEFAULT NULL,
  `new_hora` time DEFAULT NULL,
  `new_resolucion` varchar(50) DEFAULT '--------',
  `new_id_asunto` int(11) DEFAULT NULL,
  `old_id_audiencia` int(11) DEFAULT NULL,
  `old_id_lugar` int(11) DEFAULT NULL,
  `old_fecha` date DEFAULT NULL,
  `old_hora` time DEFAULT NULL,
  `old_resolucion` varchar(50) DEFAULT '--------',
  `old_id_asunto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_audiencia`
--

LOCK TABLES `audita_audiencia` WRITE;
/*!40000 ALTER TABLE `audita_audiencia` DISABLE KEYS */;
INSERT INTO `audita_audiencia` VALUES ('insertar','root@localhost','2022-01-06 13:24:19',1,2,'2022-01-13','17:23:00','Penal',2,NULL,NULL,NULL,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:28:41',1,5,'2020-01-10','13:00:00','sestencia',1,NULL,NULL,NULL,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:28:41',2,1,'2018-02-24','10:00:00','autos',4,NULL,NULL,NULL,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:28:41',3,6,'2017-10-02','15:00:00','decretos',5,NULL,NULL,NULL,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:28:41',4,4,'2018-10-28','09:00:00','decretos',3,NULL,NULL,NULL,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:28:41',5,3,'2020-09-10','12:00:00','autos',2,NULL,NULL,NULL,NULL,'--------',NULL);
/*!40000 ALTER TABLE `audita_audiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_cliente`
--

DROP TABLE IF EXISTS `audita_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_cliente` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_cliente` int(11) DEFAULT NULL,
  `new_paterno` varchar(50) DEFAULT '--------',
  `new_materno` varchar(50) DEFAULT '--------',
  `new_nombre` varchar(50) DEFAULT '--------',
  `new_CURP` varchar(50) DEFAULT '--------',
  `new_RFC` varchar(50) DEFAULT '--------',
  `old_id_cliente` int(11) DEFAULT NULL,
  `old_paterno` varchar(50) DEFAULT '--------',
  `old_materno` varchar(50) DEFAULT '--------',
  `old_nombre` varchar(50) DEFAULT '--------',
  `old_CURP` varchar(50) DEFAULT '--------',
  `old_RFC` varchar(50) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_cliente`
--

LOCK TABLES `audita_cliente` WRITE;
/*!40000 ALTER TABLE `audita_cliente` DISABLE KEYS */;
INSERT INTO `audita_cliente` VALUES ('insertar','root@localhost','2022-01-05 01:03:18',16,'Saldana','Samperio','Alicia','SSALONR130798MMCLIE','SSAMPORRD',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',2,'Carvajal',' Vargas','Alexander','CAVA950518HDFRRL12','CAVA950518',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',3,'Rodr?guez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',4,'Castiblanco ','Salgado','Daniel Andr?s','CASD850912HDFSLN02','CASD850912',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',5,'Lopez',' Rodriguez','Diana carolina','LORD920515MDFPDN08','LORD920515',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',6,'Camargo',' Vargas','Hugo andr?s','CAVH820130HDFMRG28','CAVH820130',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',9,'Perez',' Moreno','Maria Margarita','PEMM880524MDFRRR09','PEMM880524',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 16:36:03',10,'Castellanos',' Rojas','Oscar Fabian','CARO890830HDFSJS10','CARO890830',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',2,'Carvajal',' Vargas','Alexander','CAVA950518HDFRRL12','CAVA950518',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',3,'Rodr?guez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',4,'Castiblanco ','Salgado','Daniel Andr?s','CASD850912HDFSLN02','CASD850912',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',5,'Lopez',' Rodriguez','Diana carolina','LORD920515MDFPDN08','LORD920515',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',6,'Camargo',' Vargas','Hugo andr?s','CAVH820130HDFMRG28','CAVH820130',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',9,'Perez',' Moreno','Maria Margarita','PEMM880524MDFRRR09','PEMM880524',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:27:25',10,'Castellanos',' Rojas','Oscar Fabian','CARO890830HDFSJS10','CARO890830',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:40:40',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',2,'Carvajal',' Vargas','Alexander','CAVA950518HDFRRL12','CAVA950518',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',3,'Rodr?guez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',4,'Castiblanco ','Salgado','Daniel Andr?s','CASD850912HDFSLN02','CASD850912',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',5,'Lopez',' Rodriguez','Diana carolina','LORD920515MDFPDN08','LORD920515',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',6,'Camargo',' Vargas','Hugo andr?s','CAVH820130HDFMRG28','CAVH820130',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',9,'Perez',' Moreno','Maria Margarita','PEMM880524MDFRRR09','PEMM880524',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 21:42:18',10,'Castellanos',' Rojas','Oscar Fabian','CARO890830HDFSJS10','CARO890830',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 22:33:17',11,'Garcia','Silverio','Esther','GSIEGTEDMMLIV','SIEGTYDVGJD34',NULL,'--------','--------','--------','--------','--------'),('insertar','root@localhost','2022-01-06 22:36:57',12,'Garcia','Silverio','Alberto','ABSEGTEDMMLIV','ABSGTYDVGJD34',NULL,'--------','--------','--------','--------','--------'),('Actualizado','root@localhost','2023-01-03 18:08:32',3,'Rodriguez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810',3,'Rodr?guez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810'),('insertar','root@localhost','2023-01-03 18:10:03',13,'Rofriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8',NULL,'--------','--------','--------','--------','--------'),('Actualizado','root@localhost','2023-01-03 18:11:20',13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8',13,'Rofriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8'),('Actualizado','root@localhost','2023-01-03 18:13:04',13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8',13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8'),('Actualizado','root@localhost','2023-01-03 18:13:24',13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8',13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8'),('Actualizado','root@localhost','2023-01-03 18:15:24',11,'Garcia','Silverio','Esther','GSIEGTEDMMLIV','SIEGTYDVGJD34',11,'Garcia','Silverio','Esther','GSIEGTEDMMLIV','SIEGTYDVGJD34'),('Actualizado','root@localhost','2023-01-03 18:16:58',12,'Martinez','Rosas','Alberto','MARA780524HVZSRQ90','MARA780524XG3',12,'Garcia','Silverio','Alberto','ABSEGTEDMMLIV','ABSGTYDVGJD34'),('Eliminado','root@localhost','2023-01-03 19:15:33',NULL,'--------','--------','--------','--------','--------',10,'Castellanos',' Rojas','Oscar Fabian','CARO890830HDFSJS10','CARO890830'),('Eliminado','root@localhost','2023-01-03 19:19:57',NULL,'--------','--------','--------','--------','--------',9,'Perez',' Moreno','Maria Margarita','PEMM880524MDFRRR09','PEMM880524'),('Actualizado','root@localhost','2023-01-03 19:20:39',7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218RT3',7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218'),('Actualizado','root@localhost','2023-01-03 19:20:58',6,'Camargo',' Vargas','Hugo andres','CAVH820130HDFMRG28','CAVH820130',6,'Camargo',' Vargas','Hugo andr?s','CAVH820130HDFMRG28','CAVH820130'),('Actualizado','root@localhost','2023-01-03 19:21:20',4,'Castiblanco ','Salgado','Daniel Armando','CASD850912HDFSLN02','CASD850912',4,'Castiblanco ','Salgado','Daniel Andr?s','CASD850912HDFSLN02','CASD850912'),('Actualizado','root@localhost','2023-01-03 20:07:41',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201JY8',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201'),('Actualizado','root@localhost','2023-01-03 20:07:43',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201JY8',1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201JY8'),('Actualizado','root@localhost','2023-01-04 16:44:35',8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728LL1',8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728');
/*!40000 ALTER TABLE `audita_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_contacto`
--

DROP TABLE IF EXISTS `audita_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_contacto` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_contacto` int(11) DEFAULT NULL,
  `new_id_cliente` int(11) DEFAULT NULL,
  `new_id_medio` int(11) DEFAULT NULL,
  `old_id_contacto` int(11) DEFAULT NULL,
  `old_id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_contacto`
--

LOCK TABLES `audita_contacto` WRITE;
/*!40000 ALTER TABLE `audita_contacto` DISABLE KEYS */;
INSERT INTO `audita_contacto` VALUES ('insertar','root@localhost','2022-01-05 01:03:20',7,16,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:40:41',1,1,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',2,2,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',3,3,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',4,4,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',5,5,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',6,6,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',7,7,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',8,8,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',9,9,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 21:43:24',10,10,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 22:33:18',11,11,NULL,NULL,NULL),('insertar','root@localhost','2022-01-06 22:36:58',12,12,NULL,NULL,NULL),('insertar','root@localhost','2023-01-03 18:10:03',13,13,NULL,NULL,NULL),('Eliminado','root@localhost','2023-01-03 19:12:16',NULL,NULL,NULL,10,10),('Eliminado','root@localhost','2023-01-03 19:19:56',NULL,NULL,NULL,9,9);
/*!40000 ALTER TABLE `audita_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_correo`
--

DROP TABLE IF EXISTS `audita_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_correo` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_contacto` int(11) DEFAULT NULL,
  `new_cuenta` int(11) DEFAULT NULL,
  `old_id_contacto` int(11) DEFAULT NULL,
  `old_cuenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_correo`
--

LOCK TABLES `audita_correo` WRITE;
/*!40000 ALTER TABLE `audita_correo` DISABLE KEYS */;
INSERT INTO `audita_correo` VALUES ('insertar','root@localhost','2022-01-05 01:03:20',7,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:40:41',1,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',2,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',3,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',4,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',5,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',6,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',7,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',8,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',9,0,NULL,NULL),('insertar','root@localhost','2022-01-06 21:44:33',10,0,NULL,NULL),('insertar','root@localhost','2022-01-06 22:33:18',11,0,NULL,NULL),('insertar','root@localhost','2022-01-06 22:36:58',12,0,NULL,NULL),('insertar','root@localhost','2023-01-03 18:10:55',13,0,NULL,NULL),('Actualizado','root@localhost','2023-01-03 18:11:20',13,0,13,0),('Actualizado','root@localhost','2023-01-03 18:13:05',13,0,13,0),('Actualizado','root@localhost','2023-01-03 18:13:25',13,0,13,0),('Actualizado','root@localhost','2023-01-03 18:15:25',11,0,11,0),('Actualizado','root@localhost','2023-01-03 18:16:58',12,0,12,0),('Eliminado','root@localhost','2023-01-03 19:10:15',NULL,NULL,10,0),('Eliminado','root@localhost','2023-01-03 19:19:56',NULL,NULL,9,0),('Actualizado','root@localhost','2023-01-03 19:20:39',7,0,7,0),('Actualizado','root@localhost','2023-01-03 19:20:58',6,0,6,0),('Actualizado','root@localhost','2023-01-03 19:21:20',4,0,4,0),('Actualizado','root@localhost','2023-01-03 20:07:41',1,0,1,0),('Actualizado','root@localhost','2023-01-03 20:07:43',1,0,1,0),('Actualizado','root@localhost','2023-01-04 16:44:36',8,0,8,0);
/*!40000 ALTER TABLE `audita_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_demandado`
--

DROP TABLE IF EXISTS `audita_demandado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_demandado` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_demandado` int(11) DEFAULT NULL,
  `new_direccion` varchar(50) DEFAULT '--------',
  `new_id_tipo` int(11) DEFAULT NULL,
  `old_id_demandado` int(11) DEFAULT NULL,
  `old_direccion` varchar(50) DEFAULT '--------',
  `old_id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_demandado`
--

LOCK TABLES `audita_demandado` WRITE;
/*!40000 ALTER TABLE `audita_demandado` DISABLE KEYS */;
INSERT INTO `audita_demandado` VALUES ('insertar','root@localhost','2022-01-04 19:00:10',1,'calle huanacatl mz29 lt 15 barrio herreros',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-05 20:07:02',2,'',1,NULL,'--------',NULL),('Eliminado','root@localhost','2022-01-05 20:07:24',NULL,'--------',NULL,2,'',1),('insertar','root@localhost','2022-01-05 23:09:19',4,'Av 24 Lt 59 Mz 23',2,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',11,'calle huanacatl mz29 lt 15 barrio herreros',1,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',12,'calle azul mz 23 lt 67 barrio carpintero',1,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',13,'calle benito juarez mz 23 lt 15 venustiano carranz',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',14,'calle vicente mz 30 lt 34  san juan ',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',15,'calle pajaro mz12 lt 56 san pedro',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',16,'calle tomacatli mz 15 lt 76  san miguel',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',17,'calle manzano mz 16 lt 43 castillo',2,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',18,'calle san miguel mz30 lt 87  aragon',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',19,'calle  sor juana mz 23 lt 45   vicente',4,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:15:39',20,'calle tetocani mz 12 lt 15 herreros',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',1,'calle huanacatl mz29 lt 15 barrio herreros',1,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',2,'calle azul mz 23 lt 67 barrio carpintero',1,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',3,'calle benito juarez mz 23 lt 15 venustiano carranz',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',4,'calle vicente mz 30 lt 34  san juan ',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',5,'calle pajaro mz12 lt 56 san pedro',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',6,'calle tomacatli mz 15 lt 76  san miguel',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',7,'calle manzano mz 16 lt 43 castillo',2,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',8,'calle san miguel mz30 lt 87  aragon',3,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',9,'calle  sor juana mz 23 lt 45   vicente',4,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 16:18:26',10,'calle tetocani mz 12 lt 15 herreros',5,NULL,'--------',NULL),('insertar','root@localhost','2022-01-06 22:41:06',11,'C Azucena Mz 29 Lt 3',3,NULL,'--------',NULL),('insertar','root@localhost','2023-01-03 23:42:41',12,'AV Las torres s/n barrio orfebres',2,NULL,'--------',NULL),('insertar','root@localhost','2023-01-03 23:43:32',13,'calle 4 mz 1 lt 14 villa xochitenco',3,NULL,'--------',NULL),('insertar','root@localhost','2023-01-03 23:56:47',14,'Av Manuel Alas s/n Barrio Vidrieros',1,NULL,'--------',NULL),('Actualizado','root@localhost','2023-01-04 00:30:24',4,'calle vicente mz 30 lt 34  san juan ',5,4,'calle vicente mz 30 lt 34  san juan ',5),('Actualizado','root@localhost','2023-01-04 00:32:28',5,'Carretera Federal Mexico-Texcoco Km 21',2,5,'calle pajaro mz12 lt 56 san pedro',5),('Actualizado','root@localhost','2023-01-04 00:40:18',5,'Carretera Federal Mexico-Texcoco Km 21',4,5,'Carretera Federal Mexico-Texcoco Km 21',2),('Actualizado','root@localhost','2023-01-04 00:40:20',5,'Carretera Federal Mexico-Texcoco Km 21',4,5,'Carretera Federal Mexico-Texcoco Km 21',4),('Actualizado','root@localhost','2023-01-04 00:56:06',3,'calle benito juarez mz 23 lt 15 venustiano carranz',3,3,'calle benito juarez mz 23 lt 15 venustiano carranz',3),('Actualizado','root@localhost','2023-01-04 00:56:09',3,'calle benito juarez mz 23 lt 15 venustiano carranz',3,3,'calle benito juarez mz 23 lt 15 venustiano carranz',3),('Actualizado','root@localhost','2023-01-04 00:58:07',3,'calle benito juarez mz 23 lt 15 venustiano carranz',3,3,'calle benito juarez mz 23 lt 15 venustiano carranz',3),('Actualizado','root@localhost','2023-01-04 00:59:00',5,'Carretera Federal Mexico-Texcoco Km 21',4,5,'Carretera Federal Mexico-Texcoco Km 21',4),('Actualizado','root@localhost','2023-01-04 00:59:23',8,'calle san miguel mz30 lt 87  aragon',3,8,'calle san miguel mz30 lt 87  aragon',3),('insertar','root@localhost','2023-01-04 15:27:32',15,'AV Paseo de la Reforma #254 Colonia Insurgentes',12,NULL,'--------',NULL),('Actualizado','root@localhost','2023-01-04 15:28:58',15,'Calle Francisco Tamagno #223 Colonia Vallejo',12,15,'AV Paseo de la Reforma #254 Colonia Insurgentes',12),('Actualizado','root@localhost','2023-01-04 15:29:16',15,'Calle Francisco Tamagno #223 Colonia Vallejo',12,15,'Calle Francisco Tamagno #223 Colonia Vallejo',12),('Actualizado','root@localhost','2023-01-04 15:29:18',15,'Calle Francisco Tamagno #223 Colonia Vallejo',12,15,'Calle Francisco Tamagno #223 Colonia Vallejo',12);
/*!40000 ALTER TABLE `audita_demandado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_empresa`
--

DROP TABLE IF EXISTS `audita_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_empresa` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_demandado` int(11) DEFAULT NULL,
  `new_razon_social` varchar(50) DEFAULT '--------',
  `old_id_demandado` int(11) DEFAULT NULL,
  `old_razon_social` varchar(50) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_empresa`
--

LOCK TABLES `audita_empresa` WRITE;
/*!40000 ALTER TABLE `audita_empresa` DISABLE KEYS */;
INSERT INTO `audita_empresa` VALUES ('insertar','root@localhost','2022-01-06 16:20:21',4,'Banamex',NULL,'--------'),('insertar','root@localhost','2022-01-06 16:20:21',5,'Coca cola',NULL,'--------'),('insertar','root@localhost','2022-01-06 16:20:21',7,'Bimbo',NULL,'--------'),('insertar','root@localhost','2022-01-06 16:20:21',8,'Uber ',NULL,'--------'),('insertar','root@localhost','2022-01-06 16:20:21',10,'Cinemex',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:27:14',1,' ',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:27:14',2,'  ',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:27:14',3,'  ',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:27:14',6,'  ',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:27:14',9,' ',NULL,'--------'),('insertar','root@localhost','2022-01-06 22:41:07',11,'',NULL,'--------'),('Eliminado','root@localhost','2023-01-03 23:17:26',NULL,'--------',1,' '),('Eliminado','root@localhost','2023-01-03 23:17:39',NULL,'--------',2,'  '),('Eliminado','root@localhost','2023-01-03 23:17:44',NULL,'--------',3,'  '),('Eliminado','root@localhost','2023-01-03 23:17:52',NULL,'--------',6,'  '),('Eliminado','root@localhost','2023-01-03 23:18:04',NULL,'--------',9,' '),('Eliminado','root@localhost','2023-01-03 23:18:11',NULL,'--------',11,''),('insertar','root@localhost','2023-01-03 23:43:05',12,'Muebleria Las Torres',NULL,'--------'),('insertar','root@localhost','2023-01-03 23:43:54',13,'Auto pinturas El peñon',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 00:30:24',4,'Citibanamex',4,'Banamex'),('Actualizado','root@localhost','2023-01-04 00:32:28',5,'Coca cola',5,'Coca cola'),('Eliminado','root@localhost','2023-01-04 00:38:17',NULL,'--------',7,'Bimbo'),('Eliminado','root@localhost','2023-01-04 00:39:05',NULL,'--------',8,'Uber '),('Actualizado','root@localhost','2023-01-04 00:40:18',5,'Coca cola (FEMSA)',5,'Coca cola'),('Actualizado','root@localhost','2023-01-04 00:40:20',5,'Coca cola (FEMSA)',5,'Coca cola (FEMSA)'),('insertar','root@localhost','2023-01-04 15:28:26',15,'Call center Ahorra Seguros',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 15:28:58',15,'Call center Ahorra Seguros',15,'Call center Ahorra Seguros'),('Actualizado','root@localhost','2023-01-04 15:29:16',15,'Call center Ahorra Seguros',15,'Call center Ahorra Seguros'),('Actualizado','root@localhost','2023-01-04 15:29:18',15,'Call center Ahorra Seguros',15,'Call center Ahorra Seguros');
/*!40000 ALTER TABLE `audita_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_estado`
--

DROP TABLE IF EXISTS `audita_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_estado` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_estado` int(11) DEFAULT NULL,
  `new_descripcion` varchar(70) DEFAULT '--------',
  `old_id_estado` int(11) DEFAULT NULL,
  `old_descripcion` varchar(70) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_estado`
--

LOCK TABLES `audita_estado` WRITE;
/*!40000 ALTER TABLE `audita_estado` DISABLE KEYS */;
INSERT INTO `audita_estado` VALUES ('Insertar','root@localhost','2023-01-04 14:00:58',4,'Archivo Muerto',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:01:58',5,'Liberado',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 15:16:39',3,'Transferido',3,'Tranferido'),('Actualizado','root@localhost','2023-01-04 15:17:19',4,'Asignado',4,'Archivo Muerto'),('Eliminado','root@localhost','2023-01-04 15:18:54',NULL,'--------',4,'Asignado'),('Insertar','root@localhost','2023-01-04 15:19:09',6,'Asignado',NULL,'--------');
/*!40000 ALTER TABLE `audita_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_estudio`
--

DROP TABLE IF EXISTS `audita_estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_estudio` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_grado` int(11) DEFAULT NULL,
  `new_descripcion` varchar(70) DEFAULT '--------',
  `old_id_grado` int(11) DEFAULT NULL,
  `old_descripcion` varchar(70) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_estudio`
--

LOCK TABLES `audita_estudio` WRITE;
/*!40000 ALTER TABLE `audita_estudio` DISABLE KEYS */;
INSERT INTO `audita_estudio` VALUES ('Insertar','root@localhost','2023-01-04 14:06:29',5,'Licenciatura',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:06:37',6,'Carrera Tecnica',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:06:59',7,'Pasantia',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 15:26:00',6,'Tecnico Superior Universitario',6,'Carrera Tecnica'),('Actualizado','root@localhost','2023-01-04 15:26:02',6,'Tecnico Superior Universitario',6,'Tecnico Superior Universitario'),('Eliminado','root@localhost','2023-01-04 15:26:09',NULL,'--------',5,'Licenciatura');
/*!40000 ALTER TABLE `audita_estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_facebook`
--

DROP TABLE IF EXISTS `audita_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_facebook` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_contacto` int(11) DEFAULT NULL,
  `new_usuario` varchar(50) DEFAULT '--------',
  `old_id_contacto` int(11) DEFAULT NULL,
  `old_usuario` varchar(50) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_facebook`
--

LOCK TABLES `audita_facebook` WRITE;
/*!40000 ALTER TABLE `audita_facebook` DISABLE KEYS */;
INSERT INTO `audita_facebook` VALUES ('Insertar','root@localhost','2022-01-05 01:03:20',7,'Alicia S',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:40:41',1,'Adriana Hernandez',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',2,'Alex Vargas',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',3,'Camilo Rodr?guez ',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',4,'Dani Salgado',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',5,'Carolina Lopez ',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',6,'Camargo  Vargas',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',7,'Guillermo Zubieta',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',8,'Maria Bustos',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',9,'Mari Moreno',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:45:06',10,'Oscar Rojas',NULL,'--------'),('Insertar','root@localhost','2022-01-06 22:33:18',11,'',NULL,'--------'),('Insertar','root@localhost','2022-01-06 22:36:58',12,'Albert Mtz',NULL,'--------'),('Insertar','root@localhost','2023-01-03 18:10:55',13,'Christian Soto',NULL,'--------'),('Actualizado','root@localhost','2023-01-03 18:11:20',13,'Christian Soto',13,'Christian Soto'),('Actualizado','root@localhost','2023-01-03 18:13:05',13,'Ferando Soto',13,'Christian Soto'),('Actualizado','root@localhost','2023-01-03 18:13:24',13,'Fernando Soto',13,'Ferando Soto'),('Actualizado','root@localhost','2023-01-03 18:15:24',11,'Esther Garcia Silverio',11,''),('Actualizado','root@localhost','2023-01-03 18:16:58',12,'Albert Mtz',12,'Albert Mtz'),('Eliminado','root@localhost','2023-01-03 19:06:49',NULL,'--------',10,'Oscar Rojas'),('Eliminado','root@localhost','2023-01-03 19:19:56',NULL,'--------',9,'Mari Moreno'),('Actualizado','root@localhost','2023-01-03 19:20:39',7,'Guillermo Zubieta',7,'Guillermo Zubieta'),('Actualizado','root@localhost','2023-01-03 19:20:58',6,'Camargo  Vargas',6,'Camargo  Vargas'),('Actualizado','root@localhost','2023-01-03 19:21:20',4,'Dani Salgado',4,'Dani Salgado'),('Actualizado','root@localhost','2023-01-03 20:07:41',1,'Adriana Hernandez',1,'Adriana Hernandez'),('Actualizado','root@localhost','2023-01-03 20:07:43',1,'Adriana Hernandez',1,'Adriana Hernandez'),('Actualizado','root@localhost','2023-01-04 16:44:35',8,'Camila Bustos',8,'Maria Bustos');
/*!40000 ALTER TABLE `audita_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_lugar`
--

DROP TABLE IF EXISTS `audita_lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_lugar` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_lugar` int(11) DEFAULT NULL,
  `new_descripcion` varchar(70) DEFAULT '--------',
  `old_id_lugar` int(11) DEFAULT NULL,
  `old_descripcion` varchar(70) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_lugar`
--

LOCK TABLES `audita_lugar` WRITE;
/*!40000 ALTER TABLE `audita_lugar` DISABLE KEYS */;
INSERT INTO `audita_lugar` VALUES ('Insertar','root@localhost','2022-01-05 19:47:45',1,'Oficina del ministerio p?blico Neza',NULL,'--------'),('Insertar','root@localhost','2022-01-05 19:47:45',2,'Oficina del ministerio p?blico Chimalhuacan',NULL,'--------'),('Insertar','root@localhost','2022-01-05 19:47:45',3,'Oficina del ministerio p?blico Los reyes ',NULL,'--------'),('Insertar','root@localhost','2022-01-05 19:47:45',4,'Oficina del ministerio p?blico Chalco',NULL,'--------'),('Insertar','root@localhost','2022-01-05 19:47:45',5,'Oficina del ministerio p?blico Xochimilco ',NULL,'--------'),('Insertar','root@localhost','2022-01-05 19:47:45',6,'Oficina del ministerio p?blico CDMX',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',1,'Oficina del ministerio publico Neza',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',2,'Oficina del ministerio publico Chimalhuacan',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',3,'Oficina del ministerio publico Los reyes ',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',4,'Oficina del ministerio publico Chalco',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',5,'Oficina del ministerio publico Xochimilco ',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:27:37',6,'Oficina del ministerio publico CDMX',NULL,'--------'),('Insertar','root@localhost','2022-01-06 19:45:47',7,'Oficinas Toluca',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:16:21',8,'Oficina del Ministerio Publico Texcoco',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:16:40',9,'Oficina del Ministerio Publico Colonia Centro',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:17:58',11,'Oficina del Ministerio Publico Balderas',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:18:33',12,'Oficinas del Ministerio Publico La Raza',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 15:06:31',7,'Oficinas del Ministerio Publico Toluca',7,'Oficinas Toluca'),('Actualizado','root@localhost','2023-01-04 15:06:34',7,'Oficinas del Ministerio Publico Toluca',7,'Oficinas del Ministerio Publico Toluca'),('Eliminado','root@localhost','2023-01-04 15:11:15',NULL,'--------',2,'Oficina del ministerio publico Chimalhuacan');
/*!40000 ALTER TABLE `audita_lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_persona`
--

DROP TABLE IF EXISTS `audita_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_persona` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_demandado` int(11) DEFAULT NULL,
  `new_paterno` varchar(50) DEFAULT '--------',
  `new_materno` varchar(50) DEFAULT '--------',
  `new_nombre` varchar(50) DEFAULT '--------',
  `old_id_demandado` int(11) DEFAULT NULL,
  `old_paterno` varchar(50) DEFAULT '--------',
  `old_materno` varchar(50) DEFAULT '--------',
  `old_nombre` varchar(50) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_persona`
--

LOCK TABLES `audita_persona` WRITE;
/*!40000 ALTER TABLE `audita_persona` DISABLE KEYS */;
INSERT INTO `audita_persona` VALUES ('Insertar','root@localhost','2022-01-04 19:00:10',1,'Hernandez','Monterrosa','Adriana Carolina',NULL,'--------','--------','--------'),('Eliminado','root@localhost','2022-01-05 20:05:49',NULL,'--------','--------','--------',1,'Hernandez','Monterrosa','Adriana Carolina'),('Insertar','root@localhost','2022-01-05 23:09:19',4,'Martinez','Hernandez','Josias',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',1,'Acosta','Torres','Laura Susana',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',2,'Aguayo','Gonzalez','Alvaro',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',3,'Aguilar','Navarro','Sara Gloria',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',4,'Aguirre','Cruz','Carlos Alberto',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',5,'Almeda',' Valdes','Jose Alvaro',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',6,'Alvarado','Cabrero','Maria Lucinda',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',7,'Alvarez','Cordero','Jesus',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',8,'?ngeles','Angeles','Josefina Mar?a',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',9,'Araico','Laguillo','Maria Dolores ',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 16:19:09',10,'Arcila','Herrera','Manuel',NULL,'--------','--------','--------'),('Insertar','root@localhost','2022-01-06 22:41:06',11,'Martinez','Martinez','Oseas',NULL,'--------','--------','--------'),('Insertar','root@localhost','2023-01-03 23:58:20',14,'Garces','Salazar','Francisco Javier',NULL,'--------','--------','--------'),('Actualizado','root@localhost','2023-01-04 00:58:07',3,'Aguilar','Navarrete','Sara Gloria',3,'Aguilar','Navarro','Sara Gloria'),('Actualizado','root@localhost','2023-01-04 00:59:00',5,'Almeyda','Valdez','Jose Alvaro',5,'Almeda',' Valdes','Jose Alvaro'),('Actualizado','root@localhost','2023-01-04 00:59:23',8,'Angeles','Angeles','Josefina Maria',8,'?ngeles','Angeles','Josefina Mar?a'),('Eliminado','root@localhost','2023-01-04 01:02:14',NULL,'--------','--------','--------',7,'Alvarez','Cordero','Jesus');
/*!40000 ALTER TABLE `audita_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_telefono`
--

DROP TABLE IF EXISTS `audita_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_telefono` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_contacto` int(11) DEFAULT NULL,
  `new_numero` int(11) DEFAULT NULL,
  `old_id_contacto` int(11) DEFAULT NULL,
  `old_numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_telefono`
--

LOCK TABLES `audita_telefono` WRITE;
/*!40000 ALTER TABLE `audita_telefono` DISABLE KEYS */;
INSERT INTO `audita_telefono` VALUES ('Insertar','root@localhost','2022-01-05 01:03:20',7,74539746,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',2,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',3,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',4,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',5,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',6,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',7,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',8,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',9,2147483647,NULL,NULL),('Insertar','root@localhost','2022-01-06 21:45:38',10,2147483647,NULL,NULL);
/*!40000 ALTER TABLE `audita_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_tipo`
--

DROP TABLE IF EXISTS `audita_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_tipo` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_tipo` int(11) DEFAULT NULL,
  `new_descripcion` varchar(50) DEFAULT '--------',
  `old_id_tipo` int(11) DEFAULT NULL,
  `old_descripcion` varchar(50) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_tipo`
--

LOCK TABLES `audita_tipo` WRITE;
/*!40000 ALTER TABLE `audita_tipo` DISABLE KEYS */;
INSERT INTO `audita_tipo` VALUES ('Insertar','root@localhost','2023-01-04 14:30:16',6,'Abuso de Confianza',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:30:25',8,'Usurpación de identidad',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:30:35',9,'Allanamiento de morada',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:31:04',11,'Daños y perjuicios',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:31:42',12,'Despido no justificado',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:32:07',13,'Difamacion',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:32:29',14,'Abuso de poder',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:32:47',15,'violencia domestica',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:32:54',16,'Maltrato animal',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:33:38',17,'Explotacion laboral',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:34:04',18,'Manejo y/o consumo de estupefacientes',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:34:28',19,'Lavado de dinero',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:34:48',20,'Explotacion sexual',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:34:56',21,'Pornografia infantil',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:35:40',22,'Narcotrafico-Narcomenudeo',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:36:18',23,'Publicidad falsa',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 14:44:58',15,'Violencia intrafamiliar (domestica)',15,'violencia domestica'),('Actualizado','root@localhost','2023-01-04 14:45:52',18,'Venta y/o consumo de estupefacientes',18,'Manejo y/o consumo de estupefacientes'),('Eliminado','root@localhost','2023-01-04 14:47:50',NULL,'--------',16,'Maltrato animal');
/*!40000 ALTER TABLE `audita_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audita_tipo_asunto`
--

DROP TABLE IF EXISTS `audita_tipo_asunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audita_tipo_asunto` (
  `operacion` varchar(30) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `new_id_tipo_asunto` int(11) DEFAULT NULL,
  `new_descripcion` varchar(70) DEFAULT '--------',
  `old_id_tipo_asunto` int(11) DEFAULT NULL,
  `old_descripcion` varchar(70) DEFAULT '--------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audita_tipo_asunto`
--

LOCK TABLES `audita_tipo_asunto` WRITE;
/*!40000 ALTER TABLE `audita_tipo_asunto` DISABLE KEYS */;
INSERT INTO `audita_tipo_asunto` VALUES ('Insertar','root@localhost','2022-01-06 16:21:56',1,'Juicios laborales',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',2,'Asuntos penales Diversos',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',3,'Elaboracion de todo tipo de contrato',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',4,'Juicios para asuntos testamentarios o intestamentarios',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',5,'Cumplimientos de pensiones alimenticias',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',6,'Divorcios',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',7,'Regularizacion de propiedades',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',8,'Cobranzas de pagar?s y otros titulos de credito',NULL,'--------'),('Insertar','root@localhost','2022-01-06 16:21:56',9,'Controversias familiares ociviles de cualquier tipo',NULL,'--------'),('Insertar','root@localhost','2022-01-06 21:10:38',10,'Deudas',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:24:52',11,'Violencia Intrafamiliar',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:25:09',12,'Pensiones',NULL,'--------'),('Insertar','root@localhost','2023-01-04 14:25:17',13,'Seguros de vida',NULL,'--------'),('Actualizado','root@localhost','2023-01-04 14:55:16',8,'Cobranzas de pagares y otros titulos de credito',8,'Cobranzas de pagar?s y otros titulos de credito'),('Actualizado','root@localhost','2023-01-04 14:55:37',12,'Pensiones jubilados',12,'Pensiones'),('Eliminado','root@localhost','2023-01-04 14:57:18',NULL,'--------',8,'Cobranzas de pagares y otros titulos de credito'),('Eliminado','root@localhost','2023-01-04 14:57:31',NULL,'--------',11,'Violencia Intrafamiliar');
/*!40000 ALTER TABLE `audita_tipo_asunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `CURP` varchar(50) DEFAULT NULL,
  `RFC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `CURP` (`CURP`),
  UNIQUE KEY `RFC` (`RFC`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Hernandez','Monterrosa','Adriana Carolina','HEMA991201MDFRND05','HEMA991201JY8'),(2,'Carvajal',' Vargas','Alexander','CAVA950518HDFRRL12','CAVA950518'),(3,'Rodriguez ','Botero','Camilo','ROBC870810HDFDTM25','ROBC870810'),(4,'Castiblanco ','Salgado','Daniel Armando','CASD850912HDFSLN02','CASD850912'),(5,'Lopez',' Rodriguez','Diana carolina','LORD920515MDFPDN08','LORD920515'),(6,'Camargo',' Vargas','Hugo andres','CAVH820130HDFMRG28','CAVH820130'),(7,'Marin',' Zubieta','Jose Guillermo','MAZJ860218HDFRBS15','MAZJ860218RT3'),(8,'Nieto',' Bustos','Maria Camila','NIBM950728MDFTSR03','NIBM950728LL1'),(11,'Garcia','Silverio','Esther','GSIEGTEDMMLIV','SIEGTYDVGJD34'),(12,'Martinez','Rosas','Alberto','MARA780524HVZSRQ90','MARA780524XG3'),(13,'Rodriguez','Soto','Christian Fernando','ROSC830327HDFSDF02','ROSC830327DX8');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_inserta` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
INSERT INTO audita_cliente (operacion, usuario, fecha, new_id_cliente, new_paterno, new_materno, new_nombre, new_CURP, new_RFC )
VALUES ('insertar', current_user(), now(), new.id_cliente, new.paterno, new.materno, new.nombre, new.CURP, new.RFC );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_actualiza` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
INSERT INTO audita_cliente(operacion, usuario, fecha, new_id_cliente, new_paterno, new_materno, new_nombre, new_CURP, new_RFC, old_id_cliente, old_paterno, old_materno, old_nombre, old_CURP, old_RFC)
VALUES ('Actualizado', current_user(), now(), new.id_cliente, new.paterno, new.materno, new.nombre, new.CURP, new.RFC, old.id_cliente, old.paterno, old.materno,  old.nombre, old.CURP, old.RFC);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_elimina` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
INSERT INTO audita_cliente (operacion, usuario, fecha, old_id_cliente, old_paterno, old_materno,  old_nombre, old_CURP, old_RFC)
VALUES ('Eliminado', current_user(), now(), old.id_cliente, old.paterno, old.materno,  old.nombre, old.CURP, old.RFC);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(11,11),(12,12),(13,13);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contacto_inserta` AFTER INSERT ON `contacto` FOR EACH ROW BEGIN
INSERT INTO audita_contacto (operacion, usuario, fecha,  new_id_contacto,  new_id_cliente)
VALUES ('insertar', current_user(), now(), new.id_contacto,  new.id_cliente);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contacto_actualiza` AFTER UPDATE ON `contacto` FOR EACH ROW BEGIN
INSERT INTO audita_contacto(operacion, usuario, fecha,  new_id_contacto,  new_id_cliente,  old_id_contacto, old_id_cliente)
VALUES ('Actualizado', current_user(), now(), new.id_contacto,  new.id_cliente,  old.id_contacto, old.id_cliente);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contacto_elimina` AFTER DELETE ON `contacto` FOR EACH ROW BEGIN
INSERT INTO audita_contacto (operacion, usuario, fecha, old_id_contacto, old_id_cliente) 
VALUES ('Eliminado', current_user(), now(), old.id_contacto, old.id_cliente);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correo` (
  `id_contacto` int(11) DEFAULT NULL,
  `cuenta` varchar(50) DEFAULT NULL,
  UNIQUE KEY `cuenta` (`cuenta`),
  KEY `id_contacto` (`id_contacto`),
  CONSTRAINT `correo_ibfk_1` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES (1,'hernan_adriana@gmail.com'),(2,'varga_alex@gmail.com'),(3,'rodriguez_bo_cam@gmail.com'),(4,'salga_dani@gmail.com'),(5,'diana_perez@gmail.com'),(6,'hugo_andres_vargas@gmail.com'),(7,'joss_marin_@gmail.com'),(8,'mari.nieto@gmail.com'),(11,'esther_mtx@gmail.com'),(12,'alberto.martinez@gmail.com'),(13,'chrstian_soto_1983@live.com');
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `correo_inserta` AFTER INSERT ON `correo` FOR EACH ROW BEGIN
INSERT INTO audita_correo (operacion, usuario, fecha, new_id_contacto, new_cuenta)
VALUES ('insertar', current_user(), now(), new.id_contacto, new.cuenta);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `correo_actualiza` AFTER UPDATE ON `correo` FOR EACH ROW BEGIN
INSERT INTO audita_correo(operacion, usuario, fecha, new_id_contacto, new_cuenta, old_id_contacto, old_cuenta)
VALUES ('Actualizado', current_user(), now(), new.id_contacto, new.cuenta, old.id_contacto, old.cuenta);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `correo_elimina` AFTER DELETE ON `correo` FOR EACH ROW BEGIN
INSERT INTO audita_correo(operacion, usuario, fecha,  old_id_contacto, old_cuenta)
VALUES ('Eliminado', current_user(), now(),  old.id_contacto, old.cuenta);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `demandado`
--

DROP TABLE IF EXISTS `demandado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandado` (
  `id_demandado` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(150) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_demandado`),
  UNIQUE KEY `direccion` (`direccion`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `demandado_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandado`
--

LOCK TABLES `demandado` WRITE;
/*!40000 ALTER TABLE `demandado` DISABLE KEYS */;
INSERT INTO `demandado` VALUES (1,'calle huanacatl mz29 lt 15 barrio herreros',1),(2,'calle azul mz 23 lt 67 barrio carpintero',1),(3,'calle benito juarez mz 23 lt 15 venustiano carranza',3),(4,'calle vicente mz 30 lt 34  san juan ',5),(5,'Carretera Federal Mexico-Texcoco Km 21',4),(6,'calle tomacatli mz 15 lt 76  san miguel',3),(7,'calle manzano mz 16 lt 43 castillo',2),(8,'calle san miguel mz30 lt 87  aragon',3),(9,'calle  sor juana mz 23 lt 45   vicente',4),(10,'calle tetocani mz 12 lt 15 herreros',5),(11,'C Azucena Mz 29 Lt 3',3),(12,'AV Las torres s/n barrio orfebres',2),(13,'calle 4 mz 1 lt 14 villa xochitenco',3),(14,'Av Manuel Alas s/n Barrio Vidrieros',1),(15,'Calle Francisco Tamagno #223 Colonia Vallejo',12);
/*!40000 ALTER TABLE `demandado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `demandado_inserta` AFTER INSERT ON `demandado` FOR EACH ROW BEGIN
INSERT INTO audita_demandado (operacion, usuario, fecha,  new_id_demandado, new_direccion, new_id_tipo)
VALUES ('insertar', current_user(), now(), new.id_demandado, new.direccion, new.id_tipo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `demandado_actualiza` AFTER UPDATE ON `demandado` FOR EACH ROW BEGIN
INSERT INTO audita_demandado(operacion, usuario, fecha,  new_id_demandado, new_direccion, new_id_tipo,  old_id_demandado, old_direccion,  old_id_tipo)
VALUES ('Actualizado', current_user(), now(), new.id_demandado, new.direccion, new.id_tipo, old.id_demandado, old.direccion,  old.id_tipo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `demandado_elimina` AFTER DELETE ON `demandado` FOR EACH ROW BEGIN
INSERT INTO audita_demandado(operacion, usuario, fecha,  old_id_demandado, old_direccion,  old_id_tipo)
VALUES ('Eliminado', current_user(), now(),  old.id_demandado, old.direccion,  old.id_tipo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_demandado` int(11) DEFAULT NULL,
  `razon_social` varchar(50) DEFAULT NULL,
  KEY `id_demandado` (`id_demandado`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`id_demandado`) REFERENCES `demandado` (`id_demandado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (4,'Citibanamex'),(5,'Coca cola (FEMSA)'),(10,'Cinemex'),(12,'Muebleria Las Torres'),(13,'Auto pinturas El peñon'),(15,'Call center Ahorra Seguros');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empresa_inserta` AFTER INSERT ON `empresa` FOR EACH ROW BEGIN
INSERT INTO audita_empresa (operacion, usuario, fecha,  new_id_demandado, new_razon_social)
VALUES ('insertar', current_user(), now(), new.id_demandado, new.razon_social);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empresa_actualiza` AFTER UPDATE ON `empresa` FOR EACH ROW BEGIN
INSERT INTO audita_empresa(operacion, usuario, fecha, new_id_demandado, new_razon_social, old_id_demandado, old_razon_social)  
VALUES ('Actualizado', current_user(), now(), new.id_demandado, new.razon_social, old.id_demandado, old.razon_social); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `empresa_elimina` AFTER DELETE ON `empresa` FOR EACH ROW BEGIN
INSERT INTO audita_empresa(operacion, usuario, fecha,  old_id_demandado, old_razon_social)
VALUES ('Eliminado', current_user(), now(), old.id_demandado, old.razon_social); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (2,'Archivado'),(6,'Asignado'),(1,'En tramite'),(5,'Liberado'),(3,'Transferido');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estado_inserta` AFTER INSERT ON `estado` FOR EACH ROW BEGIN
INSERT INTO audita_estado(operacion, usuario, fecha,  new_id_estado,  new_descripcion)
                VALUES ('Insertar', current_user(), now(), new.id_estado,  new.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estado_actualiza` AFTER UPDATE ON `estado` FOR EACH ROW BEGIN
INSERT INTO audita_estado(operacion, usuario, fecha,  new_id_estado,  new_descripcion, old_id_estado,  old_descripcion)
VALUES ('Actualizado', current_user(), now(), new.id_estado,  new.descripcion, old.id_estado,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estado_elimina` AFTER DELETE ON `estado` FOR EACH ROW BEGIN
INSERT INTO audita_estado(operacion, usuario, fecha, old_id_estado,  old_descripcion) 
VALUES ('Eliminado', current_user(), now(),  old.id_estado,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudio` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_grado`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (3,'Doctorado'),(2,'Maestria'),(7,'Pasantia'),(4,'Posgrado'),(6,'Tecnico Superior Universitario'),(1,'Universidad');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estudio_inserta` AFTER INSERT ON `estudio` FOR EACH ROW BEGIN
INSERT INTO audita_estudio(operacion, usuario, fecha,   new_id_grado,  new_descripcion)
                VALUES ('Insertar', current_user(), now(), new.id_grado,  new.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estudio_actualiza` AFTER UPDATE ON `estudio` FOR EACH ROW BEGIN
INSERT INTO audita_estudio(operacion, usuario, fecha, new_id_grado,  new_descripcion,  old_id_grado,  old_descripcion)
VALUES ('Actualizado', current_user(), now(),  new.id_grado,  new.descripcion, old.id_grado,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estudio_elimina` AFTER DELETE ON `estudio` FOR EACH ROW BEGIN
INSERT INTO audita_estudio(operacion, usuario, fecha, old_id_grado,  old_descripcion)
VALUES ('Eliminado', current_user(), now(), old.id_grado,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facebook`
--

DROP TABLE IF EXISTS `facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook` (
  `id_contacto` int(11) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_contacto` (`id_contacto`),
  CONSTRAINT `facebook_ibfk_1` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook`
--

LOCK TABLES `facebook` WRITE;
/*!40000 ALTER TABLE `facebook` DISABLE KEYS */;
INSERT INTO `facebook` VALUES (1,'Adriana Hernandez'),(2,'Alex Vargas'),(3,'Camilo Rodr?guez '),(4,'Dani Salgado'),(5,'Carolina Lopez '),(6,'Camargo  Vargas'),(7,'Guillermo Zubieta'),(8,'Camila Bustos'),(11,'Esther Garcia Silverio'),(12,'Albert Mtz'),(13,'Fernando Soto');
/*!40000 ALTER TABLE `facebook` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facebook_inserta` AFTER INSERT ON `facebook` FOR EACH ROW BEGIN
INSERT INTO audita_facebook(operacion, usuario, fecha,  new_id_contacto,  new_usuario)
                VALUES ('Insertar', current_user(), now(),  new.id_contacto,  new.usuario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facebook_actualiza` AFTER UPDATE ON `facebook` FOR EACH ROW BEGIN
INSERT INTO audita_facebook(operacion, usuario, fecha, new_id_contacto,  new_usuario, old_id_contacto,  old_usuario)
VALUES ('Actualizado', current_user(), now(), new.id_contacto,  new.usuario, old.id_contacto,  old.usuario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `facebook_elimina` AFTER DELETE ON `facebook` FOR EACH ROW BEGIN
INSERT INTO audita_facebook(operacion, usuario, fecha, old_id_contacto,  old_usuario)
VALUES ('Eliminado', current_user(), now(), old.id_contacto,  old.usuario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugar` (
  `id_lugar` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_lugar`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (11,'Oficina del Ministerio Publico Balderas'),(6,'Oficina del ministerio publico CDMX'),(4,'Oficina del ministerio publico Chalco'),(9,'Oficina del Ministerio Publico Colonia Centro'),(3,'Oficina del ministerio publico Los reyes '),(1,'Oficina del ministerio publico Neza'),(8,'Oficina del Ministerio Publico Texcoco'),(5,'Oficina del ministerio publico Xochimilco '),(12,'Oficinas del Ministerio Publico La Raza'),(7,'Oficinas del Ministerio Publico Toluca');
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lugar_insertar` AFTER INSERT ON `lugar` FOR EACH ROW BEGIN
INSERT INTO audita_lugar(operacion, usuario, fecha,   new_id_lugar,  new_descripcion)
                VALUES ('Insertar', current_user(), now(), new.id_lugar,  new.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lugar_actualizar` AFTER UPDATE ON `lugar` FOR EACH ROW BEGIN
INSERT INTO audita_lugar(operacion, usuario, fecha, new_id_lugar,  new_descripcion,  old_id_lugar,  old_descripcion)
VALUES ('Actualizado', current_user(), now(),  new.id_lugar,  new.descripcion, old.id_lugar,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `lugar_eliminar` AFTER DELETE ON `lugar` FOR EACH ROW BEGIN
INSERT INTO audita_lugar(operacion, usuario, fecha, old_id_lugar,  old_descripcion)
VALUES ('Eliminado', current_user(), now(), old.id_lugar,  old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_demandado` int(11) DEFAULT NULL,
  `paterno` varchar(50) DEFAULT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  KEY `id_demandado` (`id_demandado`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_demandado`) REFERENCES `demandado` (`id_demandado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Acosta','Torres','Laura Susana'),(2,'Aguayo','Gonzalez','Alvaro'),(3,'Aguilar','Navarrete','Sara Gloria'),(4,'Aguirre','Cruz','Carlos Alberto'),(5,'Almeyda','Valdez','Jose Alvaro'),(6,'Alvarado','Cabrero','Maria Lucinda'),(8,'Angeles','Angeles','Josefina Maria'),(9,'Araico','Laguillo','Maria Dolores '),(10,'Arcila','Herrera','Manuel'),(11,'Martinez','Martinez','Oseas'),(14,'Garces','Salazar','Francisco Javier');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `persona_insertar` AFTER INSERT ON `persona` FOR EACH ROW BEGIN
INSERT INTO audita_persona (operacion, usuario, fecha, new_id_demandado, new_paterno, new_materno, new_nombre)
                VALUES ('Insertar', current_user(), now(),new.id_demandado, new.paterno, new.materno, new.nombre);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `persona_actualizar` AFTER UPDATE ON `persona` FOR EACH ROW BEGIN
INSERT INTO audita_persona (operacion, usuario, fecha, new_id_demandado, new_paterno, new_materno, new_nombre, old_id_demandado, old_paterno, old_materno, old_nombre)
VALUES ('Actualizado', current_user(), now(), new.id_demandado, new.paterno, new.materno, new.nombre,old.id_demandado, old.paterno, old.materno, old.nombre);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `persona_eliminar` AFTER DELETE ON `persona` FOR EACH ROW BEGIN
INSERT INTO audita_persona (operacion, usuario, fecha,  old_id_demandado, old_paterno, old_materno, old_nombre)
VALUES ('Eliminado', current_user(), now(),  old.id_demandado, old.paterno, old.materno, old.nombre);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `id_contacto` int(11) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  UNIQUE KEY `numero` (`numero`),
  KEY `id_contacto` (`id_contacto`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'5522325324'),(2,'5527335424'),(3,'5564665425'),(4,'5626755426'),(5,'5522395427'),(6,'5522835428'),(7,'5534343429'),(8,'5529534330'),(11,'545035432'),(12,'551000432'),(13,'5610023030');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (6,'Abuso de Confianza'),(14,'Abuso de poder'),(9,'Allanamiento de morada'),(4,'Asalto'),(2,'Corrupcion'),(11,'Daños y perjuicios'),(12,'Despido no justificado'),(13,'Difamacion'),(3,'Estafa'),(17,'Explotacion laboral'),(20,'Explotacion sexual'),(5,'Fuga'),(19,'Lavado de dinero'),(22,'Narcotrafico-Narcomenudeo'),(1,'Pension'),(21,'Pornografia infantil'),(23,'Publicidad falsa'),(8,'Usurpación de identidad'),(18,'Venta y/o consumo de estupefacientes'),(15,'Violencia intrafamiliar (domestica)');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_insertar` AFTER INSERT ON `tipo` FOR EACH ROW BEGIN
INSERT INTO audita_tipo (operacion, usuario, fecha,  new_id_tipo,new_descripcion)
                VALUES ('Insertar', current_user(), now(), new.id_tipo,new.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_actualizar` AFTER UPDATE ON `tipo` FOR EACH ROW BEGIN
INSERT INTO audita_tipo (operacion, usuario, fecha,  new_id_tipo,new_descripcion, old_id_tipo, old_descripcion)
VALUES ('Actualizado', current_user(), now(),new.id_tipo,new.descripcion,old.id_tipo, old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_eliminar` AFTER DELETE ON `tipo` FOR EACH ROW BEGIN
INSERT INTO audita_tipo(operacion, usuario, fecha, old_id_tipo, old_descripcion)
VALUES ('Eliminado', current_user(), now(), old.id_tipo, old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_asunto`
--

DROP TABLE IF EXISTS `tipo_asunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_asunto` (
  `id_tipo_asunto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_asunto`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_asunto`
--

LOCK TABLES `tipo_asunto` WRITE;
/*!40000 ALTER TABLE `tipo_asunto` DISABLE KEYS */;
INSERT INTO `tipo_asunto` VALUES (2,'Asuntos penales Diversos'),(9,'Controversias familiares ociviles de cualquier tipo'),(5,'Cumplimientos de pensiones alimenticias'),(10,'Deudas'),(6,'Divorcios'),(3,'Elaboracion de todo tipo de contrato'),(1,'Juicios laborales'),(4,'Juicios para asuntos testamentarios o intestamentarios'),(12,'Pensiones jubilados'),(7,'Regularizacion de propiedades'),(13,'Seguros de vida');
/*!40000 ALTER TABLE `tipo_asunto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_asunto_insertar` AFTER INSERT ON `tipo_asunto` FOR EACH ROW BEGIN
INSERT INTO audita_tipo_asunto (operacion, usuario, fecha,  new_id_tipo_asunto,new_descripcion)
                VALUES ('Insertar', current_user(), now(), new.id_tipo_asunto,new.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_asunto_actualizar` AFTER UPDATE ON `tipo_asunto` FOR EACH ROW BEGIN
INSERT INTO audita_tipo_asunto (operacion, usuario, fecha,  new_id_tipo_asunto,new_descripcion, old_id_tipo_asunto, old_descripcion)
VALUES ('Actualizado', current_user(), now(),new.id_tipo_asunto, new.descripcion, old.id_tipo_asunto, old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tipo_asunto_eliminar` AFTER DELETE ON `tipo_asunto` FOR EACH ROW BEGIN
INSERT INTO audita_tipo_asunto(operacion, usuario, fecha, old_id_tipo_asunto, old_descripcion)
VALUES ('Eliminado', current_user(), now(), old.id_tipo_asunto, old.descripcion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `n_usuario` varchar(50) DEFAULT NULL,
  `u_password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'JaredAg','241101'),(2,'JimT','1234'),(3,'jerry','jerry1992');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 19:07:52
