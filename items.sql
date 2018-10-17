-- MySQL dump 10.13  Distrib 5.7.20, for osx10.13 (x86_64)
--
-- Host: localhost    Database: yvondb
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Cocktail Maison (12cl)','cocktail.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 20:43:50'),(2,'Martini Rouge ou Blanc (4cl)','martini_blanc.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 20:44:03'),(3,'Martini Gin (4cl)','martini_gin.jpg',4.50,1,'2018-01-10 00:00:00','2018-08-08 20:46:14'),(4,'Pastis 51 ou Ricard (2cl)','pastis51.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 20:51:22'),(5,'Whisky J&B (4cl)','whiskyjb.jpg',4.50,1,'2018-01-10 00:00:00','2018-08-08 20:50:22'),(6,'Kir (12cl)','kir.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 20:51:08'),(7,'Gin (4cl)','gin.jpg',3.00,1,'2018-01-10 00:00:00','2018-08-08 20:54:45'),(8,'Kir Royal (12cl)','kir_royal.jpg',7.50,1,'2018-01-10 00:00:00','2018-08-08 20:57:21'),(9,'Porto (4cl)','porto.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 20:58:36'),(10,'Américano (4cl)','americano.jpg',3.50,1,'2018-01-10 00:00:00','2018-08-08 21:02:13'),(11,'Vodka (4cl)','vodka.jpg',4.50,1,'2018-08-08 21:02:46','2018-08-08 21:02:46'),(12,'Coupe de Champagne (12cl)','coupe.jpg',6.80,1,'2018-08-08 21:03:41','2018-08-08 21:03:41'),(13,'Evian(50cl)','evrin_50.png',3.00,2,'2018-09-06 18:44:07','2018-09-06 18:44:07'),(14,'Evian(1L)','evrin_50.png',4.50,2,'2018-09-06 18:44:52','2018-09-08 15:59:49'),(15,'Coca cola(33cl)','coca.jpg',3.00,2,'2018-09-06 18:47:53','2018-09-06 18:47:53'),(16,'Perrier(33cl)','perrier.jpg',3.00,2,'2018-09-06 18:50:31','2018-09-06 18:50:31'),(17,'Scheweppes, Orangina(25cl)','orangina.jpg',3.00,2,'2018-09-06 18:53:37','2018-09-06 21:18:38'),(18,'Jus de Fruits(25cl)','jus.jpg',3.00,2,'2018-09-06 18:57:06','2018-09-06 18:57:06'),(19,'Nectar abricot(25cl)','nectar.jpg',3.00,2,'2018-09-06 18:59:14','2018-09-06 18:59:14'),(20,'Bière chinoise(33cl)','biere.jpg',4.50,2,'2018-09-06 19:00:28','2018-09-06 19:00:28'),(21,'Heineken(33cl)','heineken.jpg',4.50,2,'2018-09-06 19:04:00','2018-09-06 19:04:00'),(22,'Thé au jasmin vert','the.jpg',3.00,2,'2018-09-06 19:06:08','2018-09-06 19:06:08'),(23,'Café Decafeiné','cafe.jpg',1.80,2,'2018-09-06 19:09:23','2018-09-06 19:09:23'),(24,'Café crème','cafec.jpg',3.50,2,'2018-09-06 19:12:46','2018-09-06 19:12:46'),(25,'Mei kuei lu(2cl)','mei.jpg',3.00,3,'2018-09-06 19:17:48','2018-09-06 19:17:48'),(26,'Cointreau(2cl)','cointreau.jpg',4.50,3,'2018-09-06 19:19:06','2018-09-06 19:19:06'),(27,'Get 27(2cl)','get27.jpg',4.50,3,'2018-09-06 19:20:37','2018-09-06 19:20:37'),(28,'Marie Brizard(2cl)','marie.jpg',4.50,3,'2018-09-06 19:21:40','2018-09-06 19:21:40'),(29,'Cognac','cognac.jpg',5.40,3,'2018-09-06 19:22:47','2018-09-06 19:22:47'),(30,'Irish Coffee','irish.jpg',7.00,3,'2018-09-06 19:23:49','2018-09-06 19:23:49'),(31,'Gamay Touraine(37,5cl)','touraine.jpg',7.50,4,'2018-09-06 19:35:51','2018-09-06 19:35:51'),(32,'Gamay Touraine(75cl)','touraine.jpg',12.50,4,'2018-09-06 19:36:40','2018-09-06 19:36:40'),(33,'Côte de Rhône(37,5cl)','cote.jpg',7.80,4,'2018-09-06 19:38:32','2018-09-06 19:38:32'),(34,'Côte de Rhône(75cl)','cote.jpg',12.80,4,'2018-09-06 19:39:00','2018-09-06 19:39:00'),(35,'Saumur Champigny(37,5cl)','saumur.jpg',8.50,4,'2018-09-06 19:40:42','2018-09-06 19:40:42'),(36,'Saumur Champigny(75cl)','saumur.jpg',15.80,4,'2018-09-06 19:41:09','2018-09-06 19:41:09'),(37,'Beaujolais Villages(37,5cl)','beaujolais.jpg',7.80,4,'2018-09-06 19:42:21','2018-09-06 19:42:21'),(38,'Beaujolais Villages(75cl)','beaujolais.jpg',12.80,4,'2018-09-06 19:42:47','2018-09-06 19:42:47'),(39,'Bordeaux(37,5cl)','bordeaux.jpg',8.50,4,'2018-09-06 19:43:23','2018-09-06 19:43:23'),(40,'Bordeaux(75cl)','bordeaux.jpg',15.80,4,'2018-09-06 19:45:01','2018-09-06 19:45:01'),(41,'Brouilly(37,5cl)','brouilly.jpg',12.50,4,'2018-09-06 19:46:01','2018-09-06 19:46:01'),(42,'Brouilly(75cl)','brouilly.jpg',19.50,4,'2018-09-06 19:46:51','2018-09-06 19:46:51'),(43,'Saint-Emilion(37,5cl)','emilion.jpg',12.80,4,'2018-09-06 19:48:28','2018-09-06 19:48:28'),(44,'Saint-Emilion(75cl)','emilion.jpg',20.80,4,'2018-09-06 19:48:59','2018-09-06 19:48:59'),(45,'Saint-Emilion G. C.(37,5cl)','emilioncru.jpg',18.00,4,'2018-09-06 19:50:06','2018-09-06 19:50:49'),(46,'Saint-Emilion G. C.(75cl)','emilioncru.jpg',32.00,4,'2018-09-06 19:51:14','2018-09-06 19:51:14'),(47,'Côtes de Provence(37,5cl)','provence.jpg',7.50,5,'2018-09-06 19:54:17','2018-09-06 19:54:17'),(48,'Côtes de Provence(75cl)','provence.jpg',12.50,5,'2018-09-06 20:05:52','2018-09-06 20:05:52'),(49,'Tavel(37,5cl)','travel.jpg',9.80,5,'2018-09-06 20:08:42','2018-09-06 20:08:42'),(50,'Tavel(75cl)','travel.jpg',17.80,5,'2018-09-06 20:09:08','2018-09-06 20:09:08'),(51,'Provence de St-Tropez(37,5cl)','tropez.jpg',8.50,5,'2018-09-06 20:15:50','2018-09-06 20:15:50'),(52,'Provence de St-Tropez(75cl)','tropez.jpg',15.80,5,'2018-09-06 20:27:19','2018-09-06 20:27:19'),(53,'Bandol(37,5)','bandol.jpg',13.80,5,'2018-09-06 20:28:54','2018-09-06 20:28:54'),(54,'Bandol(75cl)','bandol.jpg',21.80,5,'2018-09-06 20:29:26','2018-09-06 20:29:26'),(55,'Sancerre Rosé(37,5cl)','sancerre.jpg',14.80,5,'2018-09-06 20:30:23','2018-09-06 20:30:23'),(56,'Sancerre Rosé(75cl)','sancerre.jpg',22.80,5,'2018-09-06 20:30:52','2018-09-06 20:30:52'),(57,'Riesling(37,5cl)','riesling.jpg',8.80,6,'2018-09-06 20:35:48','2018-09-06 20:35:48'),(58,'Riesling(75cl)','riesling.jpg',15.80,6,'2018-09-06 20:36:38','2018-09-06 20:36:38'),(59,'Muscadet(37,5cl)','muscadet.jpg',8.80,6,'2018-09-06 20:37:48','2018-09-06 20:37:48'),(60,'Muscadet(75cl)','muscadet.jpg',15.80,6,'2018-09-06 20:38:58','2018-09-06 20:38:58'),(61,'Sancerre Blanc(37,5cl)','sancerreblanc.jpg',14.80,6,'2018-09-06 20:40:08','2018-09-06 20:40:08'),(62,'Sancerre Blanc(75cl)','sancerreblanc.jpg',22.80,6,'2018-09-06 20:40:39','2018-09-06 20:40:39'),(63,'Pouilly fumé(37,5cl)','pouillyfume.jpg',18.00,6,'2018-09-06 20:41:54','2018-09-06 20:41:54'),(64,'Pouilly fumé(75cl)','pouillyfume.jpg',32.00,6,'2018-09-06 20:42:18','2018-09-06 20:42:18'),(65,'Vins(Rouge Rosé Blanc)(1/4)','pichet.jpg',3.00,7,'2018-09-06 20:43:48','2018-09-06 20:43:48'),(66,'Vins(Rouge Rosé Blanc)(1/2)','pichet.jpg',5.50,7,'2018-09-06 20:44:23','2018-09-06 20:44:23'),(67,'Champagne(75cl)','champagne.jpg',45.00,8,'2018-09-06 20:45:17','2018-09-06 20:45:17'),(68,'Buffet Volonté Midi Adulte','buffet.jpg',12.80,0,'2018-09-06 20:49:20','2018-09-06 20:49:20'),(69,'Buffet Volonté Midi -8ans','buffet.jpg',8.80,0,'2018-09-06 20:50:01','2018-09-06 20:50:01'),(70,'Buffet Volonté soir Adulte','buffet.jpg',18.80,0,'2018-09-06 20:50:36','2018-09-06 20:50:36'),(71,'Buffet Volonté soir -8ans','buffet.jpg',12.80,0,'2018-09-06 20:51:14','2018-09-06 20:51:14');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-17 22:17:53
