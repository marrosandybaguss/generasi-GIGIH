-- MySQL dump 10.19  Distrib 10.3.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: social_media
-- ------------------------------------------------------
-- Server version	10.3.29-MariaDB-0+deb10u1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(6) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'heleh mbel','2021-08-15 18:58:19'),(2,1,'Setuju, #lelakiharusstrong','2021-08-15 19:46:34'),(3,5,'this is #comment','2021-08-19 18:29:07'),(4,5,'this is #comment','2021-08-19 18:29:22'),(5,5,'this is #comment','2021-08-19 18:31:51'),(6,5,'this is #comment','2021-08-19 18:32:48'),(7,5,'this is #comment','2021-08-19 18:32:48'),(8,5,'this is #comment','2021-08-19 18:33:12'),(9,5,'this is #comment','2021-08-19 18:35:04'),(10,5,'this is #comment','2021-08-19 18:35:43'),(11,5,'this is #comment','2021-08-19 23:49:05');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `post` varchar(1000) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'aku adalah #lelaki yang tak pernah lelah','2021-08-15 14:48:00'),(2,'#wanita tidak pernah salah','2021-08-15 15:21:30'),(3,'kalau #wanita kembali ke pasal pertama','2021-08-15 15:57:37'),(4,'aku adalah #lelaki yang tak pernah lelah','2021-08-13 14:09:00'),(5,'aku adalah #lelaki yang tak pernah lelah','2021-08-16 14:09:00'),(6,'#wanita #wanita keren banget sih kamu','2021-08-15 17:32:48'),(7,'#wanita harus #respect sesama #wanita','2021-08-15 18:01:24'),(8,'oh lupa trendingnya itu untuk #24jam kebelakang wkwk','2021-08-19 05:34:44'),(9,'','2021-08-19 17:12:32'),(10,'','2021-08-19 17:14:05'),(11,'','2021-08-19 17:14:53'),(12,'','2021-08-19 17:28:18'),(13,'this is #post','2021-08-19 17:30:44'),(14,'this is #post','2021-08-19 17:39:54'),(15,'this is #post','2021-08-19 17:41:28'),(16,'this is #post','2021-08-19 17:42:41'),(17,'this is #post','2021-08-19 17:44:59'),(18,'this is #post','2021-08-19 17:45:33'),(19,'this is #post','2021-08-19 17:45:47'),(20,'this is #post','2021-08-19 17:46:03'),(21,'this is #post','2021-08-19 17:46:30'),(22,'this is #post','2021-08-19 17:47:23'),(23,'this is #post','2021-08-19 17:47:54'),(24,'this is #post','2021-08-19 18:09:26'),(25,'this is #post','2021-08-19 18:11:54'),(26,'this is #post','2021-08-19 18:11:54'),(27,'this is #post','2021-08-19 18:12:06'),(28,'this is #post','2021-08-19 18:12:06'),(29,'this is #post','2021-08-19 18:14:34'),(30,'this is #post','2021-08-19 18:15:57'),(31,'this is #post','2021-08-19 18:20:04'),(32,'','2021-08-19 18:20:04'),(33,'this is #post','2021-08-19 18:20:30'),(34,'','2021-08-19 18:20:31'),(35,'this is #post','2021-08-19 18:23:48'),(36,'this is #post','2021-08-19 18:24:51'),(37,'this is #post','2021-08-19 18:25:01'),(38,'this is #post','2021-08-19 18:25:19'),(39,'this is #post','2021-08-19 23:49:05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-21 17:04:20
