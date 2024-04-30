CREATE DATABASE  IF NOT EXISTS `cricketwc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cricketwc`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cricketwc
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` varchar(12) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('user1','user1password'),('user2','user2password');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captain`
--

DROP TABLE IF EXISTS `captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captain` (
  `name` char(30) DEFAULT NULL,
  `years_of_captaincy` int DEFAULT NULL,
  `no_of_wins` int DEFAULT NULL,
  `player_id` varchar(10) DEFAULT NULL,
  KEY `player_id` (`player_id`),
  CONSTRAINT `captain_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captain`
--

LOCK TABLES `captain` WRITE;
/*!40000 ALTER TABLE `captain` DISABLE KEYS */;
INSERT INTO `captain` VALUES ('Virat Kohli',3,25,'P001'),('AB de Villiers',4,30,'P003'),('Steve Smith',2,20,'P005');
/*!40000 ALTER TABLE `captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `team_id` varchar(3) DEFAULT NULL,
  `player_id` varchar(10) DEFAULT NULL,
  KEY `team_id` (`team_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES ('IND','P001'),('IND','P002'),('AFG','P004'),('SA','P003'),('AUS','P005');
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` varchar(5) NOT NULL,
  `match_time` time DEFAULT NULL,
  `match_date` date DEFAULT NULL,
  `result` char(30) NOT NULL,
  `team1` char(30) NOT NULL,
  `team2` char(30) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES ('M001','15:30:00','2022-03-01','Team1 Won','IND','AUS'),('M002','19:00:00','2022-03-02','Team2 Won','ENG','SA'),('M003','14:45:00','2022-03-03','Match Drawn','PAK','NZ'),('M004','20:15:00','2022-03-04','Team1 Won','AUS','SA'),('M005','16:00:00','2022-03-05','Team2 Won','ENG','IND');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_in`
--

DROP TABLE IF EXISTS `played_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `played_in` (
  `stadium_id` varchar(10) DEFAULT NULL,
  `match_id` varchar(5) DEFAULT NULL,
  KEY `stadium_id` (`stadium_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `played_in_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`),
  CONSTRAINT `played_in_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_in`
--

LOCK TABLES `played_in` WRITE;
/*!40000 ALTER TABLE `played_in` DISABLE KEYS */;
INSERT INTO `played_in` VALUES ('S001','M001'),('S002','M002'),('S003','M003'),('S004','M004'),('S005','M005');
/*!40000 ALTER TABLE `played_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` varchar(10) NOT NULL,
  `player_name` char(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `type_of_player` char(10) DEFAULT NULL,
  `t20` int DEFAULT NULL,
  `test` int DEFAULT NULL,
  `odi` int DEFAULT NULL,
  `batting_average` int DEFAULT NULL,
  `no_of_sixes` int DEFAULT NULL,
  `no_of_fours` int DEFAULT NULL,
  `economy` int DEFAULT NULL,
  `no_of_wickets` int DEFAULT NULL,
  `highest_run_scored` int DEFAULT NULL,
  `total_runs` int DEFAULT NULL,
  `team_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('P001','Virat Kohli','1988-11-05','Batsman',75,95,254,53,120,180,0,0,183,11867,'IND'),('P002','Jasprit Bumrah','1993-12-06','Bowler',14,21,64,5,2,3,104,13,124,543,'IND'),('P003','AB de Villiers','1984-02-17','Batsman',78,114,228,50,200,250,0,0,176,9876,'SA'),('P004','Rashid Khan','1998-09-20','Bowler',31,4,77,12,30,45,94,136,43,543,'AFG'),('P005','Steve Smith','1989-06-02','Batsman',45,77,128,62,75,112,0,0,192,9045,'AUS');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays`
--

DROP TABLE IF EXISTS `plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plays` (
  `team_id` varchar(3) DEFAULT NULL,
  `match_id` varchar(5) DEFAULT NULL,
  KEY `team_id` (`team_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `plays_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `plays_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays`
--

LOCK TABLES `plays` WRITE;
/*!40000 ALTER TABLE `plays` DISABLE KEYS */;
INSERT INTO `plays` VALUES ('IND','M001'),('ENG','M002'),('PAK','M003'),('AUS','M004'),('ENG','M005');
/*!40000 ALTER TABLE `plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `stadium_id` varchar(10) NOT NULL,
  `stadium_name` varchar(30) DEFAULT NULL,
  `pitch_type` char(10) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`stadium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('S001','Eden Gardens','Grass','Kolkata'),('S002','MCG','Turf','Melbourne'),('S003','Lords','Grass','London'),('S004','Dubai Int. Cricket Stadium','Turf','Dubai'),('S005','SuperSport Park','Grass','Centurion');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` varchar(3) NOT NULL,
  `no_of_batsmen` int DEFAULT NULL,
  `no_of_bowlers` int DEFAULT NULL,
  `country_name` char(30) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('AFG',6,5,'Afghanistan'),('AUS',6,5,'Australia'),('ENG',8,3,'England'),('IND',7,4,'India'),('PAK',7,4,'Pakistan'),('SA',6,5,'South Africa');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umpire`
--

DROP TABLE IF EXISTS `umpire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umpire` (
  `umpire_id` varchar(10) NOT NULL,
  `umpire_name` char(30) DEFAULT NULL,
  `no_of_matches` int DEFAULT NULL,
  `country` char(30) DEFAULT NULL,
  PRIMARY KEY (`umpire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umpire`
--

LOCK TABLES `umpire` WRITE;
/*!40000 ALTER TABLE `umpire` DISABLE KEYS */;
INSERT INTO `umpire` VALUES ('UMP046','Anil Chaudhary',106,'India'),('UMP101','Aleem Dar',42,'Pakistan'),('UMP115','Tony Hill',96,'New Zealand');
/*!40000 ALTER TABLE `umpire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umpired_by`
--

DROP TABLE IF EXISTS `umpired_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umpired_by` (
  `umpire_id` varchar(10) DEFAULT NULL,
  `match_id` varchar(5) DEFAULT NULL,
  KEY `umpire_id` (`umpire_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `umpired_by_ibfk_1` FOREIGN KEY (`umpire_id`) REFERENCES `umpire` (`umpire_id`),
  CONSTRAINT `umpired_by_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umpired_by`
--

LOCK TABLES `umpired_by` WRITE;
/*!40000 ALTER TABLE `umpired_by` DISABLE KEYS */;
INSERT INTO `umpired_by` VALUES ('UMP046','M001'),('UMP101','M002'),('UMP115','M003'),('UMP046','M004'),('UMP101','M005');
/*!40000 ALTER TABLE `umpired_by` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20  1:29:33