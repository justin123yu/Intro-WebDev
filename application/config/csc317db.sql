-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` mediumtext NOT NULL,
  `fk_postId` int NOT NULL,
  `fk_authorId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comment_author_idx` (`fk_authorId`),
  KEY `comment_belongsTo_idx` (`fk_postId`),
  CONSTRAINT `comment_author` FOREIGN KEY (`fk_authorId`) REFERENCES `users` (`id`),
  CONSTRAINT `comment_belongsTo` FOREIGN KEY (`fk_postId`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Test',8,1,'2021-12-12 15:36:04'),(2,'Test123',8,1,'2021-12-12 15:36:06'),(3,'Test123!',8,1,'2021-12-12 15:36:08'),(4,'Test123',8,1,'2021-12-12 15:52:58'),(5,'Good Meme',8,1,'2021-12-12 15:53:24'),(6,'Good Meme',8,1,'2021-12-12 15:53:44'),(7,'XD',8,1,'2021-12-12 17:06:23');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` mediumtext NOT NULL,
  `photopath` varchar(2048) NOT NULL,
  `thumbnail` varchar(2048) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `fk_userId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_userId`),
  CONSTRAINT `post_author` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Test','Testing my Post','public\\images\\uploads\\0c135d8d9ac3d28cd6577082e9a2b1d86c7637c1ff49.png','public/images/uploads/thumbnail-0c135d8d9ac3d28cd6577082e9a2b1d86c7637c1ff49.png',1,'2021-12-12 14:29:53',1),(2,'test02','Test02','public\\images\\uploads\\007046e3bceda86bbd4d521b2d3f7f4b0288bfc15d5c.png','public/images/uploads/thumbnail-007046e3bceda86bbd4d521b2d3f7f4b0288bfc15d5c.png',1,'2021-12-12 14:30:31',1),(3,'Test03','XDTESTINGXDTESTINGXD','public\\images\\uploads\\1d382a865264924ab2e29f5c8a4511935b4c37072fe0.png','public/images/uploads/thumbnail-1d382a865264924ab2e29f5c8a4511935b4c37072fe0.png',1,'2021-12-12 14:31:17',1),(4,'Test3','Testing my Post','public\\images\\uploads\\f1cad6d28efdec7daab6bcf2b06d53d99f7d6b655028.png','public/images/uploads/thumbnail-f1cad6d28efdec7daab6bcf2b06d53d99f7d6b655028.png',1,'2021-12-12 15:34:26',1),(5,'ASDASD','ASDASDAS','public\\images\\uploads\\60e31146b4b0e5d19298f402bcd6b17e32af192f2d5c.png','public/images/uploads/thumbnail-60e31146b4b0e5d19298f402bcd6b17e32af192f2d5c.png',1,'2021-12-12 15:34:39',1),(6,'ASADADADASD','ASDASDASD','public\\images\\uploads\\9ec2b2b32fedc4fcbb7fb606ab1937eb1c171661c067.webp','public/images/uploads/thumbnail-9ec2b2b32fedc4fcbb7fb606ab1937eb1c171661c067.webp',1,'2021-12-12 15:34:53',1),(7,'MEME','ADSSA','public\\images\\uploads\\9faccae4e031070e12f0215578d6d564a4b748b0748d.png','public/images/uploads/thumbnail-9faccae4e031070e12f0215578d6d564a4b748b0748d.png',1,'2021-12-12 15:35:11',1),(8,'ASDADAD','ASDASDASDAS','public\\images\\uploads\\50a5c705c5ce7f6526f61d80fcad471a876b54956f49.jpeg','public/images/uploads/thumbnail-50a5c705c5ce7f6526f61d80fcad471a876b54956f49.jpeg',1,'2021-12-12 15:35:26',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test123','Test123@gmail.com','$2b$15$PXDEB/puslQ3Sd99FOxUCuydiC2qNni3vdzXbaT3hfflQ2aHGhXZS',1,'2021-12-12 14:12:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-12 17:37:53
