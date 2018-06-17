-- MySQL dump 10.13  Distrib 5.7.20, for osx10.13 (x86_64)
--
-- Host: localhost    Database: yvondb_development
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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-12-20 21:39:01','2017-12-20 21:39:01');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dining_tables`
--

DROP TABLE IF EXISTS `dining_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dining_tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_of` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_order_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dining_tables`
--

LOCK TABLES `dining_tables` WRITE;
/*!40000 ALTER TABLE `dining_tables` DISABLE KEYS */;
INSERT INTO `dining_tables` VALUES (1,'N.1',4,NULL,NULL,NULL,'2017-12-20 22:05:22','2018-06-06 21:41:17',29),(2,'N.2',4,NULL,NULL,NULL,'2017-12-20 22:05:41','2018-06-02 12:31:54',NULL),(3,'N.3',4,NULL,NULL,NULL,'2017-12-20 22:05:47','2018-06-05 20:38:17',NULL),(4,'N.4',4,NULL,NULL,NULL,'2017-12-20 22:05:52','2018-05-31 19:42:58',NULL),(5,'N.5',4,NULL,NULL,NULL,'2017-12-20 22:05:57','2018-06-06 21:40:39',NULL),(6,'N.6',4,NULL,NULL,NULL,'2017-12-20 22:06:02','2018-06-06 21:39:25',NULL);
/*!40000 ALTER TABLE `dining_tables` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Déj. adulte','https://img.grouponcdn.com/deal/7z47Q1WEPH6kkk49mFtb/pB-1000x600/v1/c700x420.jpg',12.00,1,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(2,'Déj. enfant','https://img.grouponcdn.com/deal/7z47Q1WEPH6kkk49mFtb/pB-1000x600/v1/c700x420.jpg',8.00,1,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(3,'Dîner adulte','https://img.grouponcdn.com/deal/7z47Q1WEPH6kkk49mFtb/pB-1000x600/v1/c700x420.jpg',16.00,1,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(4,'Dîner enfant','https://img.grouponcdn.com/deal/7z47Q1WEPH6kkk49mFtb/pB-1000x600/v1/c700x420.jpg',10.00,1,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(5,'MoTai','http://www.manrenjiupu.com/Public/upload/goods/2016/10-19/580724384811e.png',100.00,2,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(6,'Vin rouge 33cl','http://image.kchome.com/store_1_goods_5913c29a740ab.kc',5.90,2,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(7,'Badoit 30cl','http://medias.nicolas.com/media/sys_master/images/heb/h3f/8802808037406.png',1.90,2,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(8,'Cocacola','https://blog.ynov.com/wp-content/uploads/sites/15/2016/01/logo-coca.png',3.90,2,'2018-01-10 00:00:00','2018-01-10 00:00:00'),(9,'Café','http://pinghuangcoffee.com/img/product-powder/3in1-p.png',5.91,2,'2018-01-10 00:00:00','2018-06-09 06:19:57'),(10,'gong bao ji ding','http://www.restaurantchinois-carnetgourmand.fr/media/catalog/product/cache/1/image/4137793dd7223b9146d9dcb53ced065c/p/o/poulet_l_imp_rial.jpg',10.90,3,'2018-01-10 00:00:00','2018-01-10 00:00:00');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_histories`
--

DROP TABLE IF EXISTS `order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_histories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `detail` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `printable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_histories`
--

LOCK TABLES `order_histories` WRITE;
/*!40000 ALTER TABLE `order_histories` DISABLE KEYS */;
INSERT INTO `order_histories` VALUES (1,5,404.00,'Dîner adulte x 4 = 64.0;Déj. adulte x 2 = 24.0;Déj. enfant x 2 = 16.0;MoTai x 3 = 300.0','2018-05-30 21:46:32','2018-05-30 21:46:32',1),(2,5,391.90,'Dîner adulte x 3 = 48.0;Déj. adulte x 2 = 24.0;Déj. enfant x 2 = 16.0;MoTai x 3 = 300.0;Cocacola x 1 = 3.9','2018-05-30 22:06:13','2018-05-30 22:06:13',1),(3,5,388.00,'Dîner adulte x 3 = 48.0;Déj. adulte x 2 = 24.0;Déj. enfant x 2 = 16.0;MoTai x 3 = 300.0','2018-05-31 19:25:32','2018-05-31 19:25:32',1),(4,4,296.00,'Déj. adulte x 2 = 24.0;Dîner enfant x 2 = 20.0;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Cocacola x 1 = 3.9;Badoit 30cl x 1 = 1.9;Vin rouge 33cl x 1 = 5.9;Café x 1 = 5.9;Dîner adulte x 1 = 16.0;Déj. enfant x 1 = 8.0','2018-05-31 19:35:47','2018-05-31 19:35:47',1),(5,2,0.00,'','2018-05-31 19:42:38','2018-05-31 19:42:38',1),(6,3,186.00,'Déj. adulte x 5 = 60.0;Déj. enfant x 4 = 32.0;Dîner adulte x 4 = 64.0;Dîner enfant x 3 = 30.0','2018-05-31 19:42:45','2018-05-31 19:42:45',1),(7,1,184.00,'Dîner adulte x 5 = 80.0;Dîner enfant x 4 = 40.0;Déj. adulte x 4 = 48.0;Déj. enfant x 2 = 16.0','2018-05-31 20:07:41','2018-05-31 20:07:41',1),(8,6,12.00,'Déj. adulte x 1 = 12.0','2018-05-31 20:23:20','2018-05-31 20:23:20',1),(9,7,10.00,'Dîner enfant x 1 = 10.0','2018-05-31 20:23:49','2018-05-31 20:23:49',1),(10,8,26.00,'Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0','2018-05-31 20:42:55','2018-05-31 20:42:55',1),(11,9,10.00,'Dîner enfant x 1 = 10.0','2018-05-31 20:48:08','2018-05-31 20:48:08',1),(12,10,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-05-31 20:52:34','2018-05-31 20:52:34',1),(13,11,16.00,'Dîner adulte x 1 = 16.0','2018-05-31 20:59:56','2018-05-31 20:59:56',1),(14,12,26.00,'Dîner adulte x 1 = 16.0;Dîner enfant x 1 = 10.0','2018-05-31 21:10:30','2018-05-31 21:10:30',1),(15,13,46.00,'Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0','2018-05-31 21:10:45','2018-05-31 21:10:45',1),(16,13,38.00,'Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0','2018-05-31 21:10:54','2018-05-31 21:10:54',1),(17,14,28.00,'Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0','2018-05-31 21:45:11','2018-05-31 21:45:11',1),(18,14,46.00,'Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0','2018-05-31 21:45:31','2018-05-31 21:45:31',1),(19,15,74.50,'Dîner adulte x 1 = 16.0;Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0;Déj. adulte x 1 = 12.0;Vin rouge 33cl x 1 = 5.9;gong bao ji ding x 1 = 10.9;Cocacola x 3 = 11.7','2018-05-31 21:46:50','2018-05-31 21:46:50',1),(20,15,11.70,'Cocacola x 3 = 11.7','2018-05-31 21:47:26','2018-05-31 21:47:26',1),(21,16,28.00,'Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0','2018-05-31 21:48:03','2018-05-31 21:48:03',1),(22,17,17.70,'Café x 3 = 17.7','2018-06-02 07:13:21','2018-06-02 07:13:21',1),(23,17,175.40,'Café x 3 = 17.7;Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0;MoTai x 1 = 100.0;Badoit 30cl x 1 = 1.9;Vin rouge 33cl x 1 = 5.9;Cocacola x 1 = 3.9','2018-06-02 07:21:31','2018-06-02 07:21:31',1),(24,18,26.00,'Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0','2018-06-02 07:24:13','2018-06-02 07:24:13',1),(25,18,60.00,'Dîner enfant x 2 = 20.0;Dîner adulte x 2 = 32.0;Déj. enfant x 1 = 8.0','2018-06-02 07:24:28','2018-06-02 07:24:28',1),(26,19,8.00,'Déj. enfant x 1 = 8.0','2018-06-02 07:27:36','2018-06-02 07:27:36',1),(27,20,10.00,'Dîner enfant x 1 = 10.0','2018-06-02 07:28:46','2018-06-02 07:28:46',1),(28,21,132.80,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0;MoTai x 1 = 100.0;Badoit 30cl x 1 = 1.9;gong bao ji ding x 1 = 10.9','2018-06-02 12:28:30','2018-06-02 12:28:30',1),(29,21,121.90,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0;MoTai x 1 = 100.0;Badoit 30cl x 1 = 1.9','2018-06-02 12:29:08','2018-06-02 12:29:08',1),(30,22,0.00,'','2018-06-02 12:33:05','2018-06-02 12:33:05',1),(31,23,74.50,'Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0;Vin rouge 33cl x 1 = 5.9;Badoit 30cl x 1 = 1.9;Cocacola x 1 = 3.9;Café x 1 = 5.9;gong bao ji ding x 1 = 10.9','2018-06-02 12:34:30','2018-06-02 12:34:30',1),(32,23,80.40,'Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0;Vin rouge 33cl x 1 = 5.9;Badoit 30cl x 1 = 1.9;Cocacola x 1 = 3.9;Café x 2 = 11.8;gong bao ji ding x 1 = 10.9','2018-06-02 12:35:30','2018-06-02 12:35:30',1),(33,23,88.40,'Dîner enfant x 1 = 10.0;Déj. enfant x 2 = 16.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0;Vin rouge 33cl x 1 = 5.9;Badoit 30cl x 1 = 1.9;Cocacola x 1 = 3.9;Café x 2 = 11.8;gong bao ji ding x 1 = 10.9','2018-06-02 12:47:19','2018-06-02 12:47:19',1),(34,24,66.00,'Déj. enfant x 5 = 40.0;Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0','2018-06-05 20:35:40','2018-06-05 20:35:40',1),(35,25,20.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0','2018-06-05 20:37:47','2018-06-05 20:37:47',1),(36,26,16.00,'Dîner adulte x 1 = 16.0','2018-06-05 20:41:23','2018-06-05 20:41:23',1),(37,26,26.00,'Dîner adulte x 1 = 16.0;Dîner enfant x 1 = 10.0','2018-06-05 20:53:14','2018-06-05 20:53:14',1),(38,27,18.00,'Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0','2018-06-06 19:29:30','2018-06-06 20:34:23',0),(39,27,34.00,'Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0','2018-06-06 20:40:20','2018-06-06 20:40:28',0),(40,27,18.00,'Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0','2018-06-06 21:07:18','2018-06-06 21:09:55',0),(41,27,10.00,'Dîner enfant x 1 = 10.0','2018-06-06 21:15:57','2018-06-06 21:16:03',0),(42,27,28.00,'Dîner enfant x 2 = 20.0;Déj. enfant x 1 = 8.0','2018-06-06 21:28:21','2018-06-06 21:28:23',0),(43,27,18.00,'Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0','2018-06-06 21:29:51','2018-06-06 21:30:24',0),(44,27,10.00,'Dîner enfant x 1 = 10.0','2018-06-06 21:36:31','2018-06-06 21:36:32',0),(45,27,36.00,'Dîner enfant x 2 = 20.0;Dîner adulte x 1 = 16.0','2018-06-06 21:38:22','2018-06-06 21:38:24',0),(46,27,26.00,'Dîner enfant x 1 = 10.0;Dîner adulte x 1 = 16.0','2018-06-06 21:38:49','2018-06-06 21:38:51',0),(47,28,12.00,'Déj. adulte x 1 = 12.0','2018-06-06 21:39:45','2018-06-06 21:39:51',0),(48,28,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-06-06 21:40:14','2018-06-06 21:40:18',0),(49,29,20.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0','2018-06-06 21:41:20','2018-06-06 21:41:21',0),(50,29,28.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 2 = 16.0','2018-06-07 20:33:18','2018-06-07 20:33:19',0),(51,29,20.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0','2018-06-07 20:36:33','2018-06-07 20:36:36',0),(52,29,12.00,'Déj. adulte x 1 = 12.0','2018-06-07 20:43:04','2018-06-07 20:43:12',0),(53,29,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-06-07 20:45:13','2018-06-07 20:45:15',0),(54,29,12.00,'Déj. adulte x 1 = 12.0','2018-06-07 20:45:27','2018-06-07 20:45:29',0),(55,29,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-06-07 20:46:35','2018-06-07 20:46:37',0),(56,29,12.00,'Déj. adulte x 1 = 12.0','2018-06-07 20:46:55','2018-06-07 20:46:57',0),(57,29,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-06-07 20:48:05','2018-06-07 20:48:09',0),(58,29,30.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0','2018-06-07 20:48:40','2018-06-07 20:48:43',0),(59,29,42.00,'Déj. adulte x 2 = 24.0;Dîner enfant x 1 = 10.0;Déj. enfant x 1 = 8.0','2018-06-07 20:49:31','2018-06-07 20:49:34',0),(60,29,32.00,'Déj. adulte x 2 = 24.0;Déj. enfant x 1 = 8.0','2018-06-07 20:54:42','2018-06-07 20:54:44',0),(61,29,20.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0','2018-06-07 20:57:16','2018-06-07 20:57:18',0),(62,29,30.00,'Déj. adulte x 1 = 12.0;Déj. enfant x 1 = 8.0;Dîner enfant x 1 = 10.0','2018-06-07 20:59:43','2018-06-07 20:59:45',0),(63,29,22.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 1 = 10.0','2018-06-07 21:03:15','2018-06-07 21:03:17',0),(64,29,32.00,'Déj. adulte x 1 = 12.0;Dîner enfant x 2 = 20.0','2018-06-07 21:06:15','2018-06-07 21:06:16',0),(65,29,35.90,'Déj. adulte x 1 = 12.0;Dîner enfant x 2 = 20.0;Cocacola x 1 = 3.9','2018-06-07 21:07:27','2018-06-07 21:07:27',1),(66,29,246.80,'Déj. adulte x 1 = 12.0;Dîner enfant x 2 = 20.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-07 21:07:49','2018-06-07 21:07:52',0),(67,29,234.80,'Dîner enfant x 2 = 20.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-07 21:09:53','2018-06-07 21:09:54',0),(68,29,252.80,'Dîner enfant x 3 = 30.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Déj. enfant x 1 = 8.0','2018-06-07 21:11:19','2018-06-07 21:11:22',0),(69,29,260.80,'Dîner enfant x 3 = 30.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Déj. enfant x 2 = 16.0','2018-06-07 21:12:04','2018-06-07 21:12:06',0),(70,29,270.80,'Dîner enfant x 4 = 40.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Déj. enfant x 2 = 16.0','2018-06-07 21:15:36','2018-06-07 21:15:39',0),(71,29,262.80,'Dîner enfant x 4 = 40.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Déj. enfant x 1 = 8.0','2018-06-09 06:13:33','2018-06-09 06:13:35',0),(72,29,154.80,'Dîner enfant x 4 = 40.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 1 = 100.0','2018-06-09 06:14:32','2018-06-09 06:14:33',0),(73,29,254.80,'Dîner enfant x 4 = 40.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-09 06:15:16','2018-06-09 06:15:18',0),(74,29,244.80,'Dîner enfant x 3 = 30.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-09 06:15:36','2018-06-09 06:15:38',0),(75,29,254.80,'Dîner enfant x 4 = 40.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-09 06:16:07','2018-06-09 06:16:09',0),(76,29,264.80,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0','2018-06-09 06:16:39','2018-06-09 06:16:41',0),(77,29,280.80,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 1 = 16.0','2018-06-09 06:17:12','2018-06-09 06:17:13',0),(78,29,288.80,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 1 = 16.0;Déj. enfant x 1 = 8.0','2018-06-09 06:18:36','2018-06-09 06:18:38',0),(79,29,294.71,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 1 = 16.0;Déj. enfant x 1 = 8.0;Café x 1 = 5.91','2018-06-09 06:20:08','2018-06-09 06:20:09',0),(80,29,310.71,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 2 = 32.0;Déj. enfant x 1 = 8.0;Café x 1 = 5.91','2018-06-09 06:23:05','2018-06-09 06:23:07',0),(81,29,326.71,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 3 = 48.0;Déj. enfant x 1 = 8.0;Café x 1 = 5.91','2018-06-09 06:24:31','2018-06-09 06:24:33',0),(82,29,342.71,'Dîner enfant x 5 = 50.0;Cocacola x 1 = 3.9;gong bao ji ding x 1 = 10.9;MoTai x 2 = 200.0;Dîner adulte x 4 = 64.0;Déj. enfant x 1 = 8.0;Café x 1 = 5.91','2018-06-09 06:25:42','2018-06-09 06:25:48',0),(83,29,10.00,'Dîner enfant x 1 = 10.0','2018-06-09 06:27:51','2018-06-09 06:27:53',0),(84,29,36.00,'Dîner enfant x 2 = 20.0;Dîner adulte x 1 = 16.0','2018-06-09 06:30:29','2018-06-09 06:30:31',0),(85,29,48.00,'Dîner enfant x 2 = 20.0;Dîner adulte x 1 = 16.0;Déj. adulte x 1 = 12.0','2018-06-09 06:31:41','2018-06-09 06:31:42',0);
/*!40000 ALTER TABLE `order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (3,3,1,5,1,'2018-04-30 20:30:18','2018-05-22 09:43:46'),(4,4,1,4,1,'2018-04-30 20:30:19','2018-05-24 08:16:58'),(9,1,3,5,1,'2018-05-03 22:08:45','2018-05-16 21:43:36'),(10,2,3,4,1,'2018-05-03 22:08:47','2018-05-06 20:00:15'),(11,3,3,4,1,'2018-05-03 22:08:49','2018-05-06 20:00:20'),(12,4,3,3,1,'2018-05-03 22:08:51','2018-05-06 20:00:17'),(13,1,4,2,1,'2018-05-06 20:00:42','2018-05-29 20:28:03'),(14,4,4,2,1,'2018-05-06 20:00:44','2018-05-29 20:28:02'),(21,1,1,4,1,'2018-05-20 08:24:55','2018-05-22 09:25:43'),(22,2,1,2,1,'2018-05-22 09:25:23','2018-05-24 07:40:01'),(38,3,5,3,1,'2018-05-24 21:27:26','2018-05-30 22:06:01'),(40,1,5,2,1,'2018-05-24 21:51:56','2018-05-28 21:50:33'),(41,2,5,2,1,'2018-05-24 21:51:57','2018-05-28 21:50:34'),(44,5,5,3,1,'2018-05-27 21:45:58','2018-05-29 20:24:42'),(47,10,4,1,1,'2018-05-29 20:27:38','2018-05-29 20:27:38'),(48,5,4,2,1,'2018-05-29 20:27:54','2018-05-29 20:27:58'),(49,8,4,1,1,'2018-05-29 20:27:56','2018-05-29 20:27:56'),(50,7,4,1,1,'2018-05-29 20:27:56','2018-05-29 20:27:56'),(51,6,4,1,1,'2018-05-29 20:27:56','2018-05-29 20:27:56'),(52,9,4,1,1,'2018-05-29 20:27:59','2018-05-29 20:27:59'),(53,3,4,1,1,'2018-05-29 20:28:02','2018-05-29 20:28:02'),(54,2,4,1,1,'2018-05-29 20:28:03','2018-05-29 20:28:03'),(56,1,6,1,1,'2018-05-31 20:23:18','2018-05-31 20:23:18'),(57,4,7,1,1,'2018-05-31 20:23:47','2018-05-31 20:23:47'),(58,4,8,1,1,'2018-05-31 20:42:50','2018-05-31 20:42:50'),(59,3,8,1,1,'2018-05-31 20:42:51','2018-05-31 20:42:51'),(60,4,9,1,1,'2018-05-31 20:48:06','2018-05-31 20:48:06'),(61,1,10,1,1,'2018-05-31 20:52:26','2018-05-31 20:52:26'),(62,4,10,1,1,'2018-05-31 20:52:28','2018-05-31 20:52:28'),(63,3,11,1,1,'2018-05-31 20:59:51','2018-05-31 20:59:51'),(64,3,12,1,1,'2018-05-31 21:10:27','2018-05-31 21:10:27'),(65,4,12,1,1,'2018-05-31 21:10:28','2018-05-31 21:10:28'),(67,4,13,1,1,'2018-05-31 21:10:43','2018-05-31 21:10:43'),(68,3,13,1,1,'2018-05-31 21:10:44','2018-05-31 21:10:44'),(69,1,13,1,1,'2018-05-31 21:10:44','2018-05-31 21:10:44'),(70,3,14,1,1,'2018-05-31 21:45:08','2018-05-31 21:45:08'),(71,1,14,1,1,'2018-05-31 21:45:09','2018-05-31 21:45:09'),(72,2,14,1,1,'2018-05-31 21:45:28','2018-05-31 21:45:28'),(73,4,14,1,1,'2018-05-31 21:45:29','2018-05-31 21:45:29'),(80,8,15,3,1,'2018-05-31 21:46:41','2018-05-31 21:46:48'),(81,3,16,1,1,'2018-05-31 21:48:02','2018-05-31 21:48:02'),(82,1,16,1,1,'2018-05-31 21:48:02','2018-05-31 21:48:02'),(83,9,17,3,1,'2018-06-02 07:13:09','2018-06-02 07:13:14'),(84,2,17,1,1,'2018-06-02 07:21:21','2018-06-02 07:21:21'),(85,4,17,1,1,'2018-06-02 07:21:22','2018-06-02 07:21:22'),(86,3,17,1,1,'2018-06-02 07:21:23','2018-06-02 07:21:23'),(87,1,17,1,1,'2018-06-02 07:21:23','2018-06-02 07:21:23'),(88,5,17,1,1,'2018-06-02 07:21:27','2018-06-02 07:21:27'),(89,7,17,1,1,'2018-06-02 07:21:28','2018-06-02 07:21:28'),(90,6,17,1,1,'2018-06-02 07:21:29','2018-06-02 07:21:29'),(91,8,17,1,1,'2018-06-02 07:21:30','2018-06-02 07:21:30'),(92,4,18,2,1,'2018-06-02 07:24:08','2018-06-02 07:24:21'),(93,3,18,2,1,'2018-06-02 07:24:09','2018-06-02 07:24:22'),(94,2,18,1,1,'2018-06-02 07:24:26','2018-06-02 07:24:26'),(95,2,19,1,1,'2018-06-02 07:27:35','2018-06-02 07:27:35'),(96,4,20,1,1,'2018-06-02 07:28:45','2018-06-02 07:28:45'),(97,1,21,1,1,'2018-06-02 12:27:48','2018-06-02 12:27:48'),(98,2,21,1,1,'2018-06-02 12:28:09','2018-06-02 12:28:18'),(99,5,21,1,1,'2018-06-02 12:28:21','2018-06-02 12:28:21'),(100,7,21,1,1,'2018-06-02 12:28:23','2018-06-02 12:28:23'),(102,4,23,1,1,'2018-06-02 12:33:51','2018-06-02 12:33:51'),(103,2,23,2,1,'2018-06-02 12:33:51','2018-06-02 12:44:11'),(104,3,23,1,1,'2018-06-02 12:33:53','2018-06-02 12:33:53'),(105,1,23,1,1,'2018-06-02 12:33:54','2018-06-02 12:33:54'),(106,6,23,1,1,'2018-06-02 12:33:57','2018-06-02 12:33:57'),(107,7,23,1,1,'2018-06-02 12:33:58','2018-06-02 12:33:58'),(108,8,23,1,1,'2018-06-02 12:33:59','2018-06-02 12:33:59'),(110,9,23,2,1,'2018-06-02 12:34:01','2018-06-02 12:35:27'),(111,10,23,1,1,'2018-06-02 12:34:29','2018-06-02 12:34:29'),(112,2,24,5,1,'2018-06-02 12:50:19','2018-06-02 12:50:59'),(113,4,24,1,1,'2018-06-02 12:50:57','2018-06-02 12:50:57'),(114,3,24,1,1,'2018-06-02 12:51:00','2018-06-02 12:51:00'),(115,1,25,1,1,'2018-06-05 20:37:43','2018-06-05 20:37:43'),(116,2,25,1,1,'2018-06-05 20:37:45','2018-06-05 20:37:45'),(117,3,26,1,1,'2018-06-05 20:41:22','2018-06-05 20:41:22'),(118,4,26,1,1,'2018-06-05 20:53:12','2018-06-05 20:53:12'),(120,4,27,1,1,'2018-06-06 19:29:28','2018-06-06 21:38:48'),(123,3,27,1,1,'2018-06-06 21:38:21','2018-06-06 21:38:21'),(124,1,28,1,1,'2018-06-06 21:39:43','2018-06-06 21:39:43'),(125,4,28,1,1,'2018-06-06 21:40:13','2018-06-06 21:40:13'),(140,4,29,2,1,'2018-06-09 06:27:46','2018-06-09 06:30:26'),(141,3,29,1,1,'2018-06-09 06:30:29','2018-06-09 06:30:29'),(142,1,29,1,1,'2018-06-09 06:31:40','2018-06-09 06:31:40');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dining_table_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `encour` tinyint(1) DEFAULT '0',
  `comments` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,0,NULL,'2018-04-30 20:30:03','2018-05-31 20:07:50'),(2,2,2,0,NULL,'2018-04-30 20:45:40','2018-05-31 19:44:56'),(3,4,5,0,NULL,'2018-05-03 22:08:41','2018-05-31 20:14:57'),(4,5,2,0,NULL,'2018-05-06 20:00:36','2018-05-31 19:42:11'),(5,6,12,0,NULL,'2018-05-17 21:48:17','2018-05-31 19:34:38'),(6,6,2,0,NULL,'2018-05-31 20:23:12','2018-05-31 20:23:22'),(7,6,3,0,NULL,'2018-05-31 20:23:45','2018-05-31 20:39:53'),(8,6,2,0,NULL,'2018-05-31 20:42:46','2018-05-31 20:46:18'),(9,6,3,0,NULL,'2018-05-31 20:48:04','2018-05-31 20:48:17'),(10,6,3,0,NULL,'2018-05-31 20:52:23','2018-05-31 20:57:25'),(11,6,5,0,NULL,'2018-05-31 20:59:49','2018-05-31 21:00:01'),(12,1,2,0,NULL,'2018-05-31 21:10:25','2018-05-31 21:10:32'),(13,2,5,0,NULL,'2018-05-31 21:10:40','2018-05-31 21:10:57'),(14,6,8,0,NULL,'2018-05-31 21:45:03','2018-05-31 21:45:52'),(15,6,1,0,NULL,'2018-05-31 21:46:20','2018-05-31 21:47:34'),(16,5,2,0,NULL,'2018-05-31 21:48:00','2018-05-31 21:48:31'),(17,1,3,0,NULL,'2018-06-02 07:12:39','2018-06-02 07:21:58'),(18,1,5,0,NULL,'2018-06-02 07:24:03','2018-06-02 07:24:41'),(19,1,5,0,NULL,'2018-06-02 07:27:33','2018-06-02 07:27:39'),(20,1,9,1,NULL,'2018-06-02 07:28:41','2018-06-02 07:29:03'),(21,2,2,1,NULL,'2018-06-02 12:27:43','2018-06-02 12:32:13'),(22,6,5,0,NULL,'2018-06-02 12:32:49','2018-06-02 12:33:07'),(23,3,3,1,NULL,'2018-06-02 12:33:47','2018-06-02 12:49:56'),(24,3,2,0,NULL,'2018-06-02 12:50:17','2018-06-05 20:35:59'),(25,3,2,0,NULL,'2018-06-05 20:37:39','2018-06-05 20:38:17'),(26,6,8,0,NULL,'2018-06-05 20:41:19','2018-06-05 20:55:22'),(27,6,9,0,NULL,'2018-06-06 19:29:25','2018-06-06 21:39:25'),(28,5,1,0,NULL,'2018-06-06 21:39:41','2018-06-06 21:40:39'),(29,1,2,1,NULL,'2018-06-06 21:41:17','2018-06-06 21:41:20');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20171220212727'),('20171220213534'),('20171221215157'),('20171223210446'),('20171223210535'),('20171223214935'),('20171226092613'),('20171226093934'),('20180110201531'),('20180110202345'),('20180411210248'),('20180530205533'),('20180530210504'),('20180530215210'),('20180606194834');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2017-12-24 16:50:54','2018-06-05 20:35:26','test@gaiml.com','test','$2a$11$aa2V2wd5Lk.3wsC1Xgb0pusLZvGvPSeGmN4jpH24Sr7ShJYDyGITi',NULL,NULL,NULL,178,'2018-06-05 20:35:26','2018-06-02 12:26:09','192.168.1.80','172.20.10.3'),(2,'2018-05-31 21:34:35','2018-06-02 12:16:56','nzhang@gmail.com','admin','$2a$11$0PEbUbZ3AmneHCD09GiiC.0SkL4OldlFKwSQOA9i6WHQo.ujhm.w6',NULL,NULL,NULL,2,'2018-06-02 12:16:56','2018-05-31 21:35:56','172.20.10.2','127.0.0.1');
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

-- Dump completed on 2018-06-09  9:17:47
