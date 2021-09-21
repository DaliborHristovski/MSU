CREATE DATABASE  IF NOT EXISTS `university` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `university`;
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aktiviran_predmet`
--

DROP TABLE IF EXISTS `aktiviran_predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktiviran_predmet` (
  `AP_ID` int NOT NULL AUTO_INCREMENT,
  `KodNaPredmet` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UcebnaGodina` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IDNaVaraboten` int NOT NULL,
  PRIMARY KEY (`AP_ID`),
  KEY `KodNaPredmet` (`KodNaPredmet`),
  KEY `IDNaVaraboten` (`IDNaVaraboten`),
  CONSTRAINT `aktiviran_predmet_ibfk_1` FOREIGN KEY (`KodNaPredmet`) REFERENCES `predmet` (`KodNaPredmet`),
  CONSTRAINT `aktiviran_predmet_ibfk_2` FOREIGN KEY (`IDNaVaraboten`) REFERENCES `profesor` (`IDNaVraboten`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktiviran_predmet`
--

LOCK TABLES `aktiviran_predmet` WRITE;
/*!40000 ALTER TABLE `aktiviran_predmet` DISABLE KEYS */;
INSERT INTO `aktiviran_predmet` VALUES (1,'СТ101','2018/2019',6),(2,'СТ102','2018/2019',1),(3,'СТ103','2018/2019',6),(4,'СТ105','2018/2019',8),(5,'СТ201','2018/2019',6),(6,'СТ202','2018/2019',6),(7,'СТ203','2018/2019',5),(8,'УИ1201','2018/2019',9),(9,'СТ301','2018/2019',4),(10,'СТ302','2018/2019',1),(11,'СТ303','2018/2019',3),(12,'СТ306','2018/2019',7),(13,'СТ401','2018/2019',7),(14,'СТ402','2018/2019',4),(15,'СТ403','2018/2019',3),(16,'УИ2401','2018/2019',10),(17,'СТ501','2018/2019',2),(18,'СТ502','2018/2019',1),(19,'СТ503','2018/2019',4),(20,'СТ506','2018/2019',3),(21,'СТ601','2018/2019',5),(22,'СТ602','2018/2019',2),(23,'СТ603','2018/2019',1),(24,'СТ605','2018/2019',4),(25,'СТ101','2019/2020',6),(26,'СТ102','2019/2020',1),(27,'СТ103','2019/2020',6),(28,'СТ105','2019/2020',8),(29,'СТ201','2019/2020',6),(30,'СТ202','2019/2020',6),(31,'СТ203','2019/2020',5),(32,'УИ1201','2019/2020',9),(33,'СТ301','2019/2020',4),(34,'СТ302','2019/2020',1),(35,'СТ303','2019/2020',3),(36,'СТ306','2019/2020',7),(37,'СТ401','2019/2020',7),(38,'СТ402','2019/2020',4),(39,'СТ403','2019/2020',3),(40,'УИ2401','2019/2020',10),(41,'СТ501','2019/2020',2),(42,'СТ502','2019/2020',1),(43,'СТ503','2019/2020',4),(44,'СТ506','2019/2020',3),(45,'СТ601','2019/2020',5),(46,'СТ602','2019/2020',2),(47,'СТ603','2019/2020',1),(48,'СТ605','2019/2020',4),(49,'СТ101','2020/2021',6),(50,'СТ102','2020/2021',1),(51,'СТ103','2020/2021',6),(52,'СТ105','2020/2021',8),(53,'СТ201','2020/2021',6),(54,'СТ202','2020/2021',6),(55,'СТ203','2020/2021',5),(56,'УИ1201','2020/2021',9),(57,'СТ301','2020/2021',4),(58,'СТ302','2020/2021',1),(59,'СТ303','2020/2021',3),(60,'СТ306','2020/2021',7),(61,'СТ401','2020/2021',7),(62,'СТ402','2020/2021',4),(63,'СТ403','2020/2021',3),(64,'УИ2401','2020/2021',10),(65,'СТ501','2020/2021',2),(66,'СТ502','2020/2021',1),(67,'СТ503','2020/2021',4),(68,'СТ506','2020/2021',3),(69,'СТ601','2020/2021',5),(70,'СТ602','2020/2021',2),(71,'СТ603','2020/2021',1),(72,'СТ605','2020/2021',4);
/*!40000 ALTER TABLE `aktiviran_predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_log`
--

DROP TABLE IF EXISTS `data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `AP_ID` int NOT NULL,
  `KodNaPredmet` varchar(45) NOT NULL,
  `UcebnaGodina` varchar(45) NOT NULL,
  `IDNaVaraboten` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_log`
--

LOCK TABLES `data_log` WRITE;
/*!40000 ALTER TABLE `data_log` DISABLE KEYS */;
INSERT INTO `data_log` VALUES (1,'insert','2021-05-05 01:38:18',5,'СТ603','2020/2021',1),(2,'insert','2021-05-05 08:53:29',6,'СТ602','2020/2021',2),(3,'insert','2021-05-05 08:53:29',7,'СТ605','2020/2021',3),(8,'delete','2021-05-05 09:02:08',7,'СТ605','2020/2021',3),(11,'insert','2021-05-05 10:26:20',8,'СТ605','2020/2021',3),(14,'update_N','2021-05-05 10:47:03',8,'СТ605','2020/2021',4),(15,'update_O','2021-05-05 10:47:03',8,'СТ605','2020/2021',4),(16,'update_N','2021-05-05 10:50:26',7,'СТ605','2020/2021',4),(17,'update_O','2021-05-05 10:50:26',8,'СТ605','2020/2021',4),(18,'insert','2021-07-10 12:18:46',9,'СТ601','2020/2021',5),(19,'insert','2021-07-10 12:18:46',10,'СТ602','2020/2021',2),(20,'insert','2021-07-10 12:18:46',11,'СТ603','2020/2021',1),(21,'insert','2021-07-10 12:18:46',12,'СТ605','2020/2021',4),(22,'insert','2021-09-11 21:25:50',1,'СТ101','0.999504705',6),(23,'insert','2021-09-11 21:25:50',2,'СТ102','0.999504705',1),(24,'insert','2021-09-11 21:25:50',3,'СТ103','0.999504705',6),(25,'insert','2021-09-11 21:25:50',4,'СТ105','0.999504705',8),(26,'insert','2021-09-11 21:25:50',5,'СТ201','0.999504705',6),(27,'insert','2021-09-11 21:25:50',6,'СТ202','0.999504705',6),(28,'insert','2021-09-11 21:25:50',7,'СТ203','0.999504705',5),(29,'insert','2021-09-11 21:25:50',8,'УИ1201','0.999504705',9),(30,'insert','2021-09-11 21:25:50',9,'СТ301','0.999504705',4),(31,'insert','2021-09-11 21:25:50',10,'СТ302','0.999504705',1),(32,'insert','2021-09-11 21:25:50',11,'СТ303','0.999504705',3),(33,'insert','2021-09-11 21:25:50',12,'СТ306','0.999504705',7),(34,'insert','2021-09-11 21:25:50',13,'СТ401','0.999504705',7),(35,'insert','2021-09-11 21:25:50',14,'СТ402','0.999504705',4),(36,'insert','2021-09-11 21:25:50',15,'СТ403','0.999504705',3),(37,'insert','2021-09-11 21:25:50',16,'УИ2401','0.999504705',10),(38,'insert','2021-09-11 21:25:50',17,'СТ501','0.999504705',2),(39,'insert','2021-09-11 21:25:50',18,'СТ502','0.999504705',1),(40,'insert','2021-09-11 21:25:50',19,'СТ503','0.999504705',4),(41,'insert','2021-09-11 21:25:50',20,'СТ506','0.999504705',3),(42,'insert','2021-09-11 21:25:50',21,'СТ601','0.999504705',5),(43,'insert','2021-09-11 21:25:50',22,'СТ602','0.999504705',2),(44,'insert','2021-09-11 21:25:50',23,'СТ603','0.999504705',1),(45,'insert','2021-09-11 21:25:50',24,'СТ605','0.999504705',4),(46,'update_N','2021-09-11 21:27:34',1,'СТ101','2018/2019',6),(47,'update_O','2021-09-11 21:27:34',1,'СТ101','0.999504705',6),(48,'update_N','2021-09-11 21:27:34',2,'СТ102','2018/2019',1),(49,'update_O','2021-09-11 21:27:34',2,'СТ102','0.999504705',1),(50,'update_N','2021-09-11 21:27:34',3,'СТ103','2018/2019',6),(51,'update_O','2021-09-11 21:27:34',3,'СТ103','0.999504705',6),(52,'update_N','2021-09-11 21:27:34',4,'СТ105','2018/2019',8),(53,'update_O','2021-09-11 21:27:34',4,'СТ105','0.999504705',8),(54,'update_N','2021-09-11 21:27:34',5,'СТ201','2018/2019',6),(55,'update_O','2021-09-11 21:27:34',5,'СТ201','0.999504705',6),(56,'update_N','2021-09-11 21:27:34',6,'СТ202','2018/2019',6),(57,'update_O','2021-09-11 21:27:34',6,'СТ202','0.999504705',6),(58,'update_N','2021-09-11 21:27:34',7,'СТ203','2018/2019',5),(59,'update_O','2021-09-11 21:27:34',7,'СТ203','0.999504705',5),(60,'update_N','2021-09-11 21:27:34',8,'УИ1201','2018/2019',9),(61,'update_O','2021-09-11 21:27:34',8,'УИ1201','0.999504705',9),(62,'update_N','2021-09-11 21:27:34',9,'СТ301','2018/2019',4),(63,'update_O','2021-09-11 21:27:34',9,'СТ301','0.999504705',4),(64,'update_N','2021-09-11 21:27:34',10,'СТ302','2018/2019',1),(65,'update_O','2021-09-11 21:27:34',10,'СТ302','0.999504705',1),(66,'update_N','2021-09-11 21:27:34',11,'СТ303','2018/2019',3),(67,'update_O','2021-09-11 21:27:34',11,'СТ303','0.999504705',3),(68,'update_N','2021-09-11 21:27:34',12,'СТ306','2018/2019',7),(69,'update_O','2021-09-11 21:27:34',12,'СТ306','0.999504705',7),(70,'update_N','2021-09-11 21:27:34',13,'СТ401','2018/2019',7),(71,'update_O','2021-09-11 21:27:34',13,'СТ401','0.999504705',7),(72,'update_N','2021-09-11 21:27:34',14,'СТ402','2018/2019',4),(73,'update_O','2021-09-11 21:27:34',14,'СТ402','0.999504705',4),(74,'update_N','2021-09-11 21:27:34',15,'СТ403','2018/2019',3),(75,'update_O','2021-09-11 21:27:34',15,'СТ403','0.999504705',3),(76,'update_N','2021-09-11 21:27:34',16,'УИ2401','2018/2019',10),(77,'update_O','2021-09-11 21:27:34',16,'УИ2401','0.999504705',10),(78,'update_N','2021-09-11 21:27:34',17,'СТ501','2018/2019',2),(79,'update_O','2021-09-11 21:27:34',17,'СТ501','0.999504705',2),(80,'update_N','2021-09-11 21:27:34',18,'СТ502','2018/2019',1),(81,'update_O','2021-09-11 21:27:34',18,'СТ502','0.999504705',1),(82,'update_N','2021-09-11 21:27:34',19,'СТ503','2018/2019',4),(83,'update_O','2021-09-11 21:27:34',19,'СТ503','0.999504705',4),(84,'update_N','2021-09-11 21:27:34',20,'СТ506','2018/2019',3),(85,'update_O','2021-09-11 21:27:34',20,'СТ506','0.999504705',3),(86,'update_N','2021-09-11 21:27:34',21,'СТ601','2018/2019',5),(87,'update_O','2021-09-11 21:27:34',21,'СТ601','0.999504705',5),(88,'update_N','2021-09-11 21:27:34',22,'СТ602','2018/2019',2),(89,'update_O','2021-09-11 21:27:34',22,'СТ602','0.999504705',2),(90,'update_N','2021-09-11 21:27:34',23,'СТ603','2018/2019',1),(91,'update_O','2021-09-11 21:27:34',23,'СТ603','0.999504705',1),(92,'update_N','2021-09-11 21:27:34',24,'СТ605','2018/2019',4),(93,'update_O','2021-09-11 21:27:34',24,'СТ605','0.999504705',4),(94,'insert','2021-09-11 21:30:15',25,'СТ101','2019/2020',6),(95,'insert','2021-09-11 21:30:15',26,'СТ102','2019/2020',1),(96,'insert','2021-09-11 21:30:15',27,'СТ103','2019/2020',6),(97,'insert','2021-09-11 21:30:15',28,'СТ105','2019/2020',8),(98,'insert','2021-09-11 21:30:15',29,'СТ201','2019/2020',6),(99,'insert','2021-09-11 21:30:15',30,'СТ202','2019/2020',6),(100,'insert','2021-09-11 21:30:15',31,'СТ203','2019/2020',5),(101,'insert','2021-09-11 21:30:15',32,'УИ1201','2019/2020',9),(102,'insert','2021-09-11 21:30:15',33,'СТ301','2019/2020',4),(103,'insert','2021-09-11 21:30:15',34,'СТ302','2019/2020',1),(104,'insert','2021-09-11 21:30:15',35,'СТ303','2019/2020',3),(105,'insert','2021-09-11 21:30:15',36,'СТ306','2019/2020',7),(106,'insert','2021-09-11 21:30:15',37,'СТ401','2019/2020',7),(107,'insert','2021-09-11 21:30:15',38,'СТ402','2019/2020',4),(108,'insert','2021-09-11 21:30:15',39,'СТ403','2019/2020',3),(109,'insert','2021-09-11 21:30:15',40,'УИ2401','2019/2020',10),(110,'insert','2021-09-11 21:30:15',41,'СТ501','2019/2020',2),(111,'insert','2021-09-11 21:30:15',42,'СТ502','2019/2020',1),(112,'insert','2021-09-11 21:30:15',43,'СТ503','2019/2020',4),(113,'insert','2021-09-11 21:30:15',44,'СТ506','2019/2020',3),(114,'insert','2021-09-11 21:30:15',45,'СТ601','2019/2020',5),(115,'insert','2021-09-11 21:30:15',46,'СТ602','2019/2020',2),(116,'insert','2021-09-11 21:30:15',47,'СТ603','2019/2020',1),(117,'insert','2021-09-11 21:30:15',48,'СТ605','2019/2020',4),(118,'insert','2021-09-11 21:30:25',49,'СТ101','2020/2021',6),(119,'insert','2021-09-11 21:30:25',50,'СТ102','2020/2021',1),(120,'insert','2021-09-11 21:30:25',51,'СТ103','2020/2021',6),(121,'insert','2021-09-11 21:30:25',52,'СТ105','2020/2021',8),(122,'insert','2021-09-11 21:30:25',53,'СТ201','2020/2021',6),(123,'insert','2021-09-11 21:30:25',54,'СТ202','2020/2021',6),(124,'insert','2021-09-11 21:30:25',55,'СТ203','2020/2021',5),(125,'insert','2021-09-11 21:30:25',56,'УИ1201','2020/2021',9),(126,'insert','2021-09-11 21:30:25',57,'СТ301','2020/2021',4),(127,'insert','2021-09-11 21:30:25',58,'СТ302','2020/2021',1),(128,'insert','2021-09-11 21:30:25',59,'СТ303','2020/2021',3),(129,'insert','2021-09-11 21:30:25',60,'СТ306','2020/2021',7),(130,'insert','2021-09-11 21:30:25',61,'СТ401','2020/2021',7),(131,'insert','2021-09-11 21:30:25',62,'СТ402','2020/2021',4),(132,'insert','2021-09-11 21:30:25',63,'СТ403','2020/2021',3),(133,'insert','2021-09-11 21:30:25',64,'УИ2401','2020/2021',10),(134,'insert','2021-09-11 21:30:25',65,'СТ501','2020/2021',2),(135,'insert','2021-09-11 21:30:25',66,'СТ502','2020/2021',1),(136,'insert','2021-09-11 21:30:25',67,'СТ503','2020/2021',4),(137,'insert','2021-09-11 21:30:25',68,'СТ506','2020/2021',3),(138,'insert','2021-09-11 21:30:25',69,'СТ601','2020/2021',5),(139,'insert','2021-09-11 21:30:25',70,'СТ602','2020/2021',2),(140,'insert','2021-09-11 21:30:25',71,'СТ603','2020/2021',1),(141,'insert','2021-09-11 21:30:25',72,'СТ605','2020/2021',4);
/*!40000 ALTER TABLE `data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `idEvent` int NOT NULL AUTO_INCREMENT,
  `EventStart` date DEFAULT NULL,
  `EventEnd` date DEFAULT NULL,
  `Type` int DEFAULT NULL,
  PRIMARY KEY (`idEvent`),
  KEY `Type_idx` (`Type`),
  CONSTRAINT `Type` FOREIGN KEY (`Type`) REFERENCES `event_enum` (`idEventEnum`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'2019-01-18','2019-01-24',1),(2,'2019-04-06','2019-04-09',2),(3,'2019-06-07','2019-04-09',1),(4,'2019-08-16','2019-08-21',3),(5,'2020-01-18','2020-01-24',1),(6,'2020-04-06','2020-04-09',2),(7,'2020-06-07','2020-04-09',1),(8,'2020-08-16','2020-08-21',3),(9,'2021-01-18','2021-01-24',1),(10,'2021-04-06','2022-04-09',2),(11,'2021-06-07','2022-04-09',1),(12,'2021-08-16','2022-08-21',3);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_enum`
--

DROP TABLE IF EXISTS `event_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_enum` (
  `idEventEnum` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idEventEnum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_enum`
--

LOCK TABLES `event_enum` WRITE;
/*!40000 ALTER TABLE `event_enum` DISABLE KEYS */;
INSERT INTO `event_enum` VALUES (1,'сите'),(2,'парни'),(3,'непарни');
/*!40000 ALTER TABLE `event_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` int NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `student` (`BrojNaIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'$2b$10$XG2UAdnWJVkWhuoZBO.MLupfKlFKsjg3h6LV9L/d2mreMPQOhqk8O'),(2,'$2b$10$i7R0di/VMfeKEIPy9GhsKexskVESYNRrtPaGsz9XTsycwqyQTNg7i'),(3,'$2b$10$lVlPsuh4EJUz1zRKVIbdjOHd0jGNRwP0cM7y2GI2Efn0H.ifRKGd.'),(4,'$2b$10$C.CD1ey9//bwdJrRQWsm2upS061Z6SDFlhpQ3fS7P2M/u9hHKcqju'),(5,'$2b$10$BYPf61YKdf7gvHwC8ZrCReAup8gP7gHQoQUJZDOTX9hQr0bn.FELu'),(6,'$2b$10$3WcFyWBS/4uWSV7GCo6aY.lEsVZDrAHsSbjaKsO7XvMgit4zyWAOi');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasoka`
--

DROP TABLE IF EXISTS `nasoka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nasoka` (
  `Nasoka` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StudiskaPrograma` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Nasoka`),
  KEY `StudiskaPrograma` (`StudiskaPrograma`),
  CONSTRAINT `nasoka_ibfk_1` FOREIGN KEY (`StudiskaPrograma`) REFERENCES `studiska_programa` (`StudiskaPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasoka`
--

LOCK TABLES `nasoka` WRITE;
/*!40000 ALTER TABLE `nasoka` DISABLE KEYS */;
INSERT INTO `nasoka` VALUES ('Софтверски Технологии','Факултет за Информатика');
/*!40000 ALTER TABLE `nasoka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pol`
--

DROP TABLE IF EXISTS `pol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pol` (
  `Pol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Pol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pol`
--

LOCK TABLES `pol` WRITE;
/*!40000 ALTER TABLE `pol` DISABLE KEYS */;
INSERT INTO `pol` VALUES ('женски'),('машки');
/*!40000 ALTER TABLE `pol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet` (
  `KodNaPredmet` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ImeNaPredmet` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Krediti` double NOT NULL,
  `StatusNaPredmet` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Semestar` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`KodNaPredmet`),
  KEY `StatusNaPredmet` (`StatusNaPredmet`),
  CONSTRAINT `predmet_ibfk_1` FOREIGN KEY (`StatusNaPredmet`) REFERENCES `status_na_predmet` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet`
--

LOCK TABLES `predmet` WRITE;
/*!40000 ALTER TABLE `predmet` DISABLE KEYS */;
INSERT INTO `predmet` VALUES ('СТ101','Основи на Програмирање',8,'Задолжителен','I'),('СТ102','Апликативни Програми',8,'Задолжителен','I'),('СТ103','Алгоритми и Структури на Податоци',7,'Изборен','I'),('СТ104','Математика',7,'Изборен','I'),('СТ105','Англиски Јазик',7,'Изборен','I'),('СТ106','Теорија на Информации',7,'Изборен','I'),('СТ201','Компјутерска Архитектура',8,'Задолжителен','II'),('СТ202','Објектно Програмирање',8,'Задолжителен','II'),('СТ203','Просторни Информациски Системи',7,'Изборен','II'),('СТ204','Компјутерско Инженерство и Менаџмент',7,'Изборен','II'),('СТ301','WEB Дизајн',8,'Задолжителен','III'),('СТ302','Софтверско Инженерство',8,'Задолжителен','III'),('СТ303','Анализа на Софтверски Потреби',7,'Изборен','III'),('СТ304','Математика 2',7,'Изборен','III'),('СТ305','Конструкција на СоФтвер',7,'Изборен','III'),('СТ306','Компјутерски Мрежи',7,'Изборен','III'),('СТ401','Интернет Технологии',8,'Задолжителен','IV'),('СТ402','Управување со IT Проекти',8,'Задолжителен','IV'),('СТ403','Интеракција Човек-Компјутер',7,'Изборен','IV'),('СТ404','Развој на GIS-Системи',7,'Изборен','IV'),('СТ501','Интернет Програмирање',8,'Задолжителен','V'),('СТ502','Бази на Податоци 1',8,'Задолжителен','V'),('СТ503','Оперативни Системи',7,'Изборен','V'),('СТ504','Мултимедијски Системи',7,'Изборен','V'),('СТ505','Конструкција на Софтвер',7,'Изборен','V'),('СТ506','Компјутерска Графика',7,'Изборен','V'),('СТ601','Проектна Работа',8,'Задолжителен','VI'),('СТ602','Визуелно Програмирање',8,'Задолжителен','VI'),('СТ603','Бази на Податоци 2',7,'Изборен','VI'),('СТ604','Логичко Дизајнирање на Информациони Системи',7,'Изборен','VI'),('СТ605','Основи на Интелигентни Системи',7,'Изборен','VI'),('СТ606','Системски Софтвер',7,'Изборен','VI'),('УИ1201','Основи на Економија',7,'Изборен','II'),('УИ1202','Основи на Информатика',7,'Изборен','II'),('УИ2401','Основи на Менаџмент',7,'Изборен','IV'),('УИ2402','Психологија на бизнис',7,'Изборен','IV');
/*!40000 ALTER TABLE `predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijava_za_ispit`
--

DROP TABLE IF EXISTS `prijava_za_ispit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijava_za_ispit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Незаверена',
  `IdStudentiNaPredmet` int NOT NULL,
  `idEvent` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IdStudentiNaPredmet` (`IdStudentiNaPredmet`),
  KEY `Status` (`Status`),
  KEY `idEvent` (`idEvent`),
  CONSTRAINT `prijava_za_ispit_ibfk_1` FOREIGN KEY (`IdStudentiNaPredmet`) REFERENCES `snap` (`IdStudentiNaPredmet`),
  CONSTRAINT `prijava_za_ispit_ibfk_2` FOREIGN KEY (`Status`) REFERENCES `status_na_prijava` (`Status`),
  CONSTRAINT `prijava_za_ispit_ibfk_3` FOREIGN KEY (`idEvent`) REFERENCES `event` (`idEvent`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijava_za_ispit`
--

LOCK TABLES `prijava_za_ispit` WRITE;
/*!40000 ALTER TABLE `prijava_za_ispit` DISABLE KEYS */;
INSERT INTO `prijava_za_ispit` VALUES (44,'Положена',1,1),(45,'Положена',4,1),(46,'Положена',6,2),(47,'Положена',5,5),(48,'Положена',10,5),(49,'Положена',11,5),(50,'Положена',12,5),(51,'Положена',2,5),(52,'Положена',7,6),(53,'Положена',8,6),(54,'Положена',21,9),(55,'Положена',22,9),(56,'Положена',23,9),(65,'Положена',13,10),(66,'Положена',16,10),(67,'Положена',15,10),(68,'Положена',24,10),(69,'Положена',14,10),(70,'Положена',17,11),(71,'Положена',18,11),(72,'Положена',19,11),(73,'Положена',20,11),(74,'Положена',3,1),(76,'Положена',9,11),(77,'Положена',25,11),(78,'Положена',26,11),(79,'Положена',27,11),(80,'Положена',28,11);
/*!40000 ALTER TABLE `prijava_za_ispit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prijavi_od_student`
--

DROP TABLE IF EXISTS `prijavi_od_student`;
/*!50001 DROP VIEW IF EXISTS `prijavi_od_student`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prijavi_od_student` AS SELECT 
 1 AS `ID`,
 1 AS `Ime i Prezime`,
 1 AS `BrojNaIndex`,
 1 AS `StatusNaStudent`,
 1 AS `ImeNaPredmet`,
 1 AS `KodNaPredmet`,
 1 AS `Semestar`,
 1 AS `Krediti`,
 1 AS `Profesor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `IDNaVraboten` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Prezime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Telefon` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDNaVraboten`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Александар','Петровски','aleksandar.petrovski@msu.com','1234567890'),(2,'Мимоза','Анастоска-Јанкуловска','mimoza.jankulovska@msu.edu.mk','1234567891'),(3,'Горан','Биџовски','goran.bidjovski@msu.com ','1234567892'),(4,'Маријан','Стевановски','marijan.stevanovski@msu.com','1234567893'),(5,'Сашо','Манасов','saso.manasov@msu.com','1234567894'),(6,'Орце','Симов','orce.simov@msu.com','1234567895'),(7,'Димитар','Богатинов','dimitar.bogatinov@msu.com','1234567896'),(8,'Ацо','Атанасов','aco.atanasov@msu.com','1234567897'),(9,'Јулија','Атанасовска','julija.atanasovska@msu.com','1234567898'),(10,'Љупчо','Вчков','ljupco.vckov@msu.com','1234567899');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snap`
--

DROP TABLE IF EXISTS `snap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snap` (
  `IdStudentiNaPredmet` int NOT NULL AUTO_INCREMENT,
  `BrojNaIndex` int NOT NULL,
  `AP_ID` int NOT NULL,
  PRIMARY KEY (`IdStudentiNaPredmet`),
  UNIQUE KEY `BrojNaIndex` (`BrojNaIndex`,`AP_ID`),
  KEY `AP_ID` (`AP_ID`),
  CONSTRAINT `snap_ibfk_1` FOREIGN KEY (`AP_ID`) REFERENCES `aktiviran_predmet` (`AP_ID`),
  CONSTRAINT `snap_ibfk_2` FOREIGN KEY (`BrojNaIndex`) REFERENCES `student` (`BrojNaIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snap`
--

LOCK TABLES `snap` WRITE;
/*!40000 ALTER TABLE `snap` DISABLE KEYS */;
INSERT INTO `snap` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,33),(10,1,34),(11,1,35),(12,1,36),(13,1,37),(14,1,38),(15,1,39),(16,1,40),(17,1,65),(18,1,66),(19,1,67),(20,1,68),(21,1,69),(22,1,70),(23,1,71),(24,1,72),(25,2,1),(26,2,2),(27,2,3),(28,2,4),(29,2,5),(30,2,6),(31,2,7),(32,2,8),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39),(40,2,40),(41,2,65),(42,2,66),(43,2,67),(44,2,68),(45,2,69),(46,2,70),(47,2,71),(48,2,72),(49,3,1),(50,3,2),(51,3,3),(52,3,4),(53,3,5),(54,3,6),(55,3,7),(56,3,8),(82,3,33),(83,3,34),(84,3,35),(85,3,36),(86,3,37),(87,3,38),(88,3,39),(89,3,40),(114,3,65),(115,3,66),(116,3,67),(117,3,68),(118,3,69),(119,3,70),(120,3,71),(121,3,72),(58,4,1),(59,4,2),(60,4,3),(61,4,4),(62,4,5),(63,4,6),(64,4,7),(65,4,8),(90,4,33),(91,4,34),(92,4,35),(93,4,36),(94,4,37),(95,4,38),(96,4,39),(97,4,40),(122,4,65),(123,4,66),(124,4,67),(125,4,68),(126,4,69),(127,4,70),(128,4,71),(129,4,72),(66,5,1),(67,5,2),(68,5,3),(69,5,4),(70,5,5),(71,5,6),(72,5,7),(73,5,8),(98,5,33),(99,5,34),(100,5,35),(101,5,36),(102,5,37),(103,5,38),(104,5,39),(105,5,40),(130,5,65),(131,5,66),(132,5,67),(133,5,68),(134,5,69),(135,5,70),(136,5,71),(137,5,72),(74,6,1),(75,6,2),(76,6,3),(77,6,4),(78,6,5),(79,6,6),(80,6,7),(81,6,8),(106,6,33),(107,6,34),(108,6,35),(109,6,36),(110,6,37),(111,6,38),(112,6,39),(113,6,40),(138,6,65),(139,6,66),(140,6,67),(141,6,68),(142,6,69),(143,6,70),(144,6,71),(145,6,72);
/*!40000 ALTER TABLE `snap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_na_predmet`
--

DROP TABLE IF EXISTS `status_na_predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_na_predmet` (
  `Status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_na_predmet`
--

LOCK TABLES `status_na_predmet` WRITE;
/*!40000 ALTER TABLE `status_na_predmet` DISABLE KEYS */;
INSERT INTO `status_na_predmet` VALUES ('Задолжителен'),('Изборен'),('Опционален'),('Факултативен');
/*!40000 ALTER TABLE `status_na_predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_na_prijava`
--

DROP TABLE IF EXISTS `status_na_prijava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_na_prijava` (
  `Status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_na_prijava`
--

LOCK TABLES `status_na_prijava` WRITE;
/*!40000 ALTER TABLE `status_na_prijava` DISABLE KEYS */;
INSERT INTO `status_na_prijava` VALUES ('Заверена'),('Незаверена'),('Одкажана'),('Положена');
/*!40000 ALTER TABLE `status_na_prijava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_na_student`
--

DROP TABLE IF EXISTS `status_na_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_na_student` (
  `Status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_na_student`
--

LOCK TABLES `status_na_student` WRITE;
/*!40000 ALTER TABLE `status_na_student` DISABLE KEYS */;
INSERT INTO `status_na_student` VALUES ('Вонреден'),('Редовен');
/*!40000 ALTER TABLE `status_na_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `BrojNaIndex` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Prezime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Adresa` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/',
  `Grad` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/',
  `Pol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMBG` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Nasoka` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StatusNaStudent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`BrojNaIndex`),
  UNIQUE KEY `EMBG` (`EMBG`),
  KEY `StatusNaStudent` (`StatusNaStudent`),
  KEY `Nasoka` (`Nasoka`),
  KEY `Pol` (`Pol`),
  KEY `ime_i_prezime` (`Ime`,`Prezime`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`StatusNaStudent`) REFERENCES `status_na_student` (`Status`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Nasoka`) REFERENCES `nasoka` (`Nasoka`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`Pol`) REFERENCES `pol` (`Pol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Виктор','Игоровски','/','Куманово','машки','1','Софтверски Технологии','Вонреден'),(2,'Стамен','Димчев','/','Штип','машки','2','Софтверски Технологии','Редовен'),(3,'Исак','Темелковски','/','Берово','машки','3','Софтверски Технологии','Редовен'),(4,'Сашо','Трпчевски','/','Куманово','машки','4','Софтверски Технологии','Редовен'),(5,'Бисера','Станковска','/','Скопје','женски','5','Софтверски Технологии','Вонреден'),(6,'Огнен','Станковски','/','Скопје','машки','6','Софтверски Технологии','Редовен');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studiska_programa`
--

DROP TABLE IF EXISTS `studiska_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studiska_programa` (
  `StudiskaPrograma` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`StudiskaPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiska_programa`
--

LOCK TABLES `studiska_programa` WRITE;
/*!40000 ALTER TABLE `studiska_programa` DISABLE KEYS */;
INSERT INTO `studiska_programa` VALUES ('Факултет за Информатика');
/*!40000 ALTER TABLE `studiska_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `prijavi_od_student`
--

/*!50001 DROP VIEW IF EXISTS `prijavi_od_student`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prijavi_od_student` AS select `prijava_za_ispit`.`ID` AS `ID`,concat(`student`.`Ime`,' ',`student`.`Prezime`) AS `Ime i Prezime`,`student`.`BrojNaIndex` AS `BrojNaIndex`,`student`.`StatusNaStudent` AS `StatusNaStudent`,`predmet`.`ImeNaPredmet` AS `ImeNaPredmet`,`predmet`.`KodNaPredmet` AS `KodNaPredmet`,`predmet`.`Semestar` AS `Semestar`,`predmet`.`Krediti` AS `Krediti`,concat(`profesor`.`Ime`,' ',`profesor`.`Prezime`) AS `Profesor` from (((((`prijava_za_ispit` join `snap` on((`prijava_za_ispit`.`IdStudentiNaPredmet` = `snap`.`IdStudentiNaPredmet`))) join `aktiviran_predmet` on((`snap`.`AP_ID` = `aktiviran_predmet`.`AP_ID`))) join `student` on((`snap`.`BrojNaIndex` = `student`.`BrojNaIndex`))) join `predmet` on((`aktiviran_predmet`.`KodNaPredmet` = `predmet`.`KodNaPredmet`))) join `profesor` on((`aktiviran_predmet`.`IDNaVaraboten` = `profesor`.`IDNaVraboten`))) */;
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

-- Dump completed on 2021-09-21 23:05:32
