-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: vpms_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `book_bike`
--

DROP TABLE IF EXISTS `book_bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_bike` (
  `bike_no` varchar(10) NOT NULL,
  `propname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile_nol` varchar(45) NOT NULL,
  `eleid` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_bike`
--

LOCK TABLES `book_bike` WRITE;
/*!40000 ALTER TABLE `book_bike` DISABLE KEYS */;
INSERT INTO `book_bike` VALUES ('UP75G5434','PVR Allahabad','ASHWANI','7686868686','bikeB6');
/*!40000 ALTER TABLE `book_bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_car`
--

DROP TABLE IF EXISTS `book_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_car` (
  `car_no` varchar(9) NOT NULL,
  `propname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile_nol` varchar(45) NOT NULL,
  `eleid` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_car`
--

LOCK TABLES `book_car` WRITE;
/*!40000 ALTER TABLE `book_car` DISABLE KEYS */;
INSERT INTO `book_car` VALUES ('UP64A6652','PVR Allahabad','asasasas','23545456767','carS5'),('UP64B6652','PVR Allahabad','dssdsds','7527363863','carS14'),('UP64G6652','PVR Allahabad','Sunit','94534235332','carS15'),('UP64P6652','PVR Allahabad','kusum','9817709369','carS12'),('UP64P6655','PVR Allahabad','ASHWANI','8765445541','carS11'),('UP64Z6655','PVR Allahabad','sdsdsd','6746566732','carS17'),('UP64P6655','Ansal Plaza','ASHWANI','8765445541','carS7');
/*!40000 ALTER TABLE `book_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmps_parking`
--

DROP TABLE IF EXISTS `vmps_parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vmps_parking` (
  `prop_id` int NOT NULL AUTO_INCREMENT,
  `prop_name` varchar(50) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `car_slot` int NOT NULL,
  `bike_slot` int NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `email` varchar(40) NOT NULL,
  `Entry_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`prop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmps_parking`
--

LOCK TABLES `vmps_parking` WRITE;
/*!40000 ALTER TABLE `vmps_parking` DISABLE KEYS */;
INSERT INTO `vmps_parking` VALUES (1,'PVR Allahabad','PVR_2221',20,20,'Allahabad','Uttar Pradesh','pvr.ald@pvrcenema.com','2023-04-09 18:13:42','System123#'),(2,'City_Style','CItyStyle_123',20,30,'Allahabad','Uttar Pradesh','style.cityald@citystyl.com','2023-04-09 18:26:12','System123#'),(3,'Ansal Plaza','ANSAL_123',30,50,'Greater Noida','Uttar Pradesh','ansal.gn@gmail.com','2023-04-13 08:37:49','System123#');
/*!40000 ALTER TABLE `vmps_parking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 23:32:29
