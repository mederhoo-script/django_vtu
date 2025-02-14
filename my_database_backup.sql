-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: vtu_db
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.20.04.1

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `account_user_id_2c86f506_fk_users_id` (`user_id`),
  CONSTRAINT `account_user_id_2c86f506_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airtime`
--

DROP TABLE IF EXISTS `airtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airtime` (
  `aId` int NOT NULL,
  `aNetwork` varchar(10) NOT NULL,
  `aBuyDiscount` double NOT NULL,
  `aUserDiscount` double NOT NULL,
  `aAgentDiscount` double NOT NULL,
  `aVendorDiscount` double NOT NULL,
  `aType` varchar(15) NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airtime`
--

LOCK TABLES `airtime` WRITE;
/*!40000 ALTER TABLE `airtime` DISABLE KEYS */;
INSERT INTO `airtime` VALUES (1,'1',98,99.5,99.2,99,'VTU'),(2,'2',95.5,99,98,97.5,'VTU'),(3,'3',96.5,98.5,98,97.8,'VTU'),(4,'4',98,99.5,99.2,99,'VTU'),(5,'1',98,99.6,99.2,99,'Share And Sell'),(6,'2',93.5,98,97.2,96.5,'Share And Sell'),(7,'3',87,94,93,92,'Share And Sell'),(8,'4',88,85,94,92,'Share And Sell');
/*!40000 ALTER TABLE `airtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airtimepinprice`
--

DROP TABLE IF EXISTS `airtimepinprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airtimepinprice` (
  `aId` int NOT NULL,
  `aNetwork` varchar(10) NOT NULL,
  `aUserDiscount` double NOT NULL,
  `aAgentDiscount` double NOT NULL,
  `aVendorDiscount` double NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airtimepinprice`
--

LOCK TABLES `airtimepinprice` WRITE;
/*!40000 ALTER TABLE `airtimepinprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `airtimepinprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alphatopupprice`
--

DROP TABLE IF EXISTS `alphatopupprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alphatopupprice` (
  `alphaId` int NOT NULL,
  `buyingPrice` int NOT NULL,
  `sellingPrice` int NOT NULL,
  `agent` int NOT NULL,
  `vendor` int NOT NULL,
  `dPosted` datetime(6) NOT NULL,
  PRIMARY KEY (`alphaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alphatopupprice`
--

LOCK TABLES `alphatopupprice` WRITE;
/*!40000 ALTER TABLE `alphatopupprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `alphatopupprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apiconfigs`
--

DROP TABLE IF EXISTS `apiconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apiconfigs` (
  `aId` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiconfigs`
--

LOCK TABLES `apiconfigs` WRITE;
/*!40000 ALTER TABLE `apiconfigs` DISABLE KEYS */;
INSERT INTO `apiconfigs` VALUES (1,'data_api','2ca7f944ce0acde2c37ab53d90ee7c690270b481706599d33a825d80ef07'),(2,'monifyApi','MK_PROD_FLX4P92EDF'),(3,'monifySecrete','RQDUNGNX17WTDRYAK2SH2RKTLNR38Y5Y'),(13,'mtnVtuKey','49697ettdrd55555ggdd76ss77477ddssg6');
/*!40000 ALTER TABLE `apiconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apilinks`
--

DROP TABLE IF EXISTS `apilinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apilinks` (
  `aId` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `atype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apilinks`
--

LOCK TABLES `apilinks` WRITE;
/*!40000 ALTER TABLE `apilinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `apilinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add Token',7,'add_tokenproxy'),(26,'Can change Token',7,'change_tokenproxy'),(27,'Can delete Token',7,'delete_tokenproxy'),(28,'Can view Token',7,'view_tokenproxy'),(29,'Can add custom user',8,'add_customuser'),(30,'Can change custom user',8,'change_customuser'),(31,'Can delete custom user',8,'delete_customuser'),(32,'Can view custom user',8,'view_customuser'),(33,'Can add airtime',9,'add_airtime'),(34,'Can change airtime',9,'change_airtime'),(35,'Can delete airtime',9,'delete_airtime'),(36,'Can view airtime',9,'view_airtime'),(37,'Can add airtime pin price',10,'add_airtimepinprice'),(38,'Can change airtime pin price',10,'change_airtimepinprice'),(39,'Can delete airtime pin price',10,'delete_airtimepinprice'),(40,'Can view airtime pin price',10,'view_airtimepinprice'),(41,'Can add alpha topup price',11,'add_alphatopupprice'),(42,'Can change alpha topup price',11,'change_alphatopupprice'),(43,'Can delete alpha topup price',11,'delete_alphatopupprice'),(44,'Can view alpha topup price',11,'view_alphatopupprice'),(45,'Can add api config',12,'add_apiconfig'),(46,'Can change api config',12,'change_apiconfig'),(47,'Can delete api config',12,'delete_apiconfig'),(48,'Can view api config',12,'view_apiconfig'),(49,'Can add api link',13,'add_apilink'),(50,'Can change api link',13,'change_apilink'),(51,'Can delete api link',13,'delete_apilink'),(52,'Can view api link',13,'view_apilink'),(53,'Can add cable id',14,'add_cableid'),(54,'Can change cable id',14,'change_cableid'),(55,'Can delete cable id',14,'delete_cableid'),(56,'Can view cable id',14,'view_cableid'),(57,'Can add cable plan',15,'add_cableplan'),(58,'Can change cable plan',15,'change_cableplan'),(59,'Can delete cable plan',15,'delete_cableplan'),(60,'Can view cable plan',15,'view_cableplan'),(61,'Can add contact',16,'add_contact'),(62,'Can change contact',16,'change_contact'),(63,'Can delete contact',16,'delete_contact'),(64,'Can view contact',16,'view_contact'),(65,'Can add crypto',17,'add_crypto'),(66,'Can change crypto',17,'change_crypto'),(67,'Can delete crypto',17,'delete_crypto'),(68,'Can view crypto',17,'view_crypto'),(69,'Can add data pin',18,'add_datapin'),(70,'Can change data pin',18,'change_datapin'),(71,'Can delete data pin',18,'delete_datapin'),(72,'Can view data pin',18,'view_datapin'),(73,'Can add data plan',19,'add_dataplan'),(74,'Can change data plan',19,'change_dataplan'),(75,'Can delete data plan',19,'delete_dataplan'),(76,'Can view data plan',19,'view_dataplan'),(77,'Can add data token',20,'add_datatoken'),(78,'Can change data token',20,'change_datatoken'),(79,'Can delete data token',20,'delete_datatoken'),(80,'Can view data token',20,'view_datatoken'),(81,'Can add electricity id',21,'add_electricityid'),(82,'Can change electricity id',21,'change_electricityid'),(83,'Can delete electricity id',21,'delete_electricityid'),(84,'Can view electricity id',21,'view_electricityid'),(85,'Can add exam id',22,'add_examid'),(86,'Can change exam id',22,'change_examid'),(87,'Can delete exam id',22,'delete_examid'),(88,'Can view exam id',22,'view_examid'),(89,'Can add network id',23,'add_networkid'),(90,'Can change network id',23,'change_networkid'),(91,'Can delete network id',23,'delete_networkid'),(92,'Can view network id',23,'view_networkid'),(93,'Can add transactions',24,'add_transactions'),(94,'Can change transactions',24,'change_transactions'),(95,'Can delete transactions',24,'delete_transactions'),(96,'Can view transactions',24,'view_transactions'),(97,'Can add account',25,'add_account'),(98,'Can change account',25,'change_account'),(99,'Can delete account',25,'delete_account'),(100,'Can view account',25,'view_account');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cableid`
--

DROP TABLE IF EXISTS `cableid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cableid` (
  `cId` int NOT NULL,
  `cableid` varchar(10) DEFAULT NULL,
  `provider` varchar(10) NOT NULL,
  `providerStatus` varchar(10) NOT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cableid`
--

LOCK TABLES `cableid` WRITE;
/*!40000 ALTER TABLE `cableid` DISABLE KEYS */;
/*!40000 ALTER TABLE `cableid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cableplans`
--

DROP TABLE IF EXISTS `cableplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cableplans` (
  `cpId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `atype` varchar(255) DEFAULT NULL,
  `cableprovider` smallint NOT NULL,
  `day` varchar(255) NOT NULL,
  PRIMARY KEY (`cpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cableplans`
--

LOCK TABLES `cableplans` WRITE;
/*!40000 ALTER TABLE `cableplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `cableplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `msgId` int NOT NULL,
  `sId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `dPosted` datetime(6) NOT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto`
--

DROP TABLE IF EXISTS `crypto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `atype` varchar(255) NOT NULL,
  `network` smallint NOT NULL,
  `agentrate` varchar(255) NOT NULL,
  `userrate` varchar(255) NOT NULL,
  `vendorrate` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto`
--

LOCK TABLES `crypto` WRITE;
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapins`
--

DROP TABLE IF EXISTS `datapins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datapins` (
  `dpId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `atype` varchar(255) DEFAULT NULL,
  `datanetwork` smallint NOT NULL,
  `day` varchar(255) NOT NULL,
  PRIMARY KEY (`dpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapins`
--

LOCK TABLES `datapins` WRITE;
/*!40000 ALTER TABLE `datapins` DISABLE KEYS */;
/*!40000 ALTER TABLE `datapins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataplans`
--

DROP TABLE IF EXISTS `dataplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataplans` (
  `pId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `atype` varchar(255) DEFAULT NULL,
  `datanetwork` smallint NOT NULL,
  `day` varchar(255) NOT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataplans`
--

LOCK TABLES `dataplans` WRITE;
/*!40000 ALTER TABLE `dataplans` DISABLE KEYS */;
INSERT INTO `dataplans` VALUES (1,'500MB','130','135','130','130','1','SME',1,'30'),(2,'1GB','265','265','265','265','2','SME',1,'30'),(3,'2GB','520','530','520','520','3','SME',1,'30'),(4,'3GB','780','795','780','780','4','SME',1,'30'),(5,'5GB','1300','1325','1300','1300','5','SME',1,'30'),(6,'10GB','2600','2650','2600','2600','6','SME',1,'30'),(7,'1.5GB','880','885','880','880','36','GIFTING',4,'30'),(8,'2GB','1000','1050','1000','1000','37','GIFTING',4,'30'),(9,'3GB','1300','1350','1300','1300','38','GIFTING',4,'30'),(10,'4.5GB','1750','1750','1850','1750','39','GIFTING',4,'30'),(11,'500MB','137','140','137','137','46','COOPERATE GIFTING',2,'30'),(12,'1GB','275','275','275','275','47','COOPERATE GIFTING',2,'30'),(13,'2GB','550','550','550','550','48','COOPERATE GIFTING',2,'30'),(14,'5GB','1375','1375','1375','1375','49','COOPERATE GIFTING',2,'30'),(15,'500MB','130','130','130','130','50','COOPERATE GIFTING',1,'30'),(16,'1GB','260','260','260','260','51','COOPERATE GIFTING',1,'30'),(17,'2GB','520','520','520','520','52','COOPERATE GIFTING',1,'30'),(18,'3GB','780','780','780','780','53','COOPERATE GIFTING',1,'30'),(19,'5GB','1300','1300','1300','1300','54','COOPERATE GIFTING',1,'30'),(20,'10GB','2600','2600','2600','2600','55','COOPERATE GIFTING',1,'30'),(21,'10GB','2750','2750','2750','2750','56','COOPERATE GIFTING',2,'30'),(22,'200MB','50','50','50','50','57','COOPERATE GIFTING',3,'30'),(23,'500MB','135','135','135','135','58','COOPERATE GIFTING',3,'30'),(24,'1GB','270','270','270','270','59','COOPERATE GIFTING',3,'30'),(25,'2GB','540','540','540','540','60','COOPERATE GIFTING',3,'30'),(26,'3GB','810','810','810','810','61','COOPERATE GIFTING',3,'30'),(27,'5GB','1350','1350','1350','1350','62','COOPERATE GIFTING',3,'30'),(28,'10GB','2700','2700','2700','2700','63','COOPERATE GIFTING',3,'30'),(29,'300MB','85','85','85','85','70','COOPERATE GIFTING',2,'30'),(30,'100MB','30','30','30','30','71','COOPERATE GIFTING',2,'30'),(31,'500MB','90','90','90','90','72','COOPERATE GIFTING',4,'30'),(32,'1GB','170','170','170','170','73','COOPERATE GIFTING',4,'30'),(33,'2GB','340','340','340','340','74','COOPERATE GIFTING',4,'30'),(34,'3GB','510','510','510','510','75','COOPERATE GIFTING',4,'30'),(35,'5GB','850','850','850','850','76','COOPERATE GIFTING',4,'30'),(36,'10GB','1700','1700','1700','1700','77','COOPERATE GIFTING',4,'30'),(37,'1GB','225','225','225','225','78','GIFTING',1,'1'),(38,'3.5GB','550','550','550','550','79','GIFTING',1,'2'),(39,'15GB','2050','2050','2050','2050','80','GIFTING',1,'7'),(40,'100MB','70','70','70','70','82','GIFTING',2,'1'),(41,'300MB','125','125','125','125','83','GIFTING',2,'2'),(42,'1GB','230','230','230','230','84','GIFTING',2,'2'),(43,'2GB','350','350','350','350','85','GIFTING',2,'2'),(44,'3GB','550','550','550','550','86','GIFTING',2,'7'),(45,'4GB','1030','1030','1030','1030','87','GIFTING',2,'30'),(46,'10GB','2050','2050','2050','2050','88','GIFTING',2,'30'),(47,'15GB','3050','3050','3050','3050','89','GIFTING',2,'30'),(48,'1GB','220','220','220','220','90','GIFTING',3,'1'),(49,'2GB','320','320','320','320','91','GIFTING',3,'1'),(50,'3.5GB','500','500','500','500','92','GIFTING',3,'2'),(51,'15GB','2000','2000','2000','2000','93','GIFTING',3,'7');
/*!40000 ALTER TABLE `dataplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datatokens`
--

DROP TABLE IF EXISTS `datatokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datatokens` (
  `tId` int NOT NULL,
  `sId` int NOT NULL,
  `tRef` varchar(255) NOT NULL,
  `business` varchar(30) NOT NULL,
  `network` varchar(30) NOT NULL,
  `datasize` varchar(30) NOT NULL,
  `quantity` int NOT NULL,
  `serial` longtext NOT NULL,
  `tokens` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`tId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datatokens`
--

LOCK TABLES `datatokens` WRITE;
/*!40000 ALTER TABLE `datatokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `datatokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-02-06 01:48:38.139694','1','2ca7f944ce0acde2c37ab53d90ee7c690270b481706599d33a825d80ef07',2,'[{\"changed\": {\"fields\": [\"Value\"]}}]',12,1),(2,'2025-02-06 01:51:25.440600','1','mederhoo',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Phone\", \"Address\", \"Pin\", \"Balance\"]}}]',8,1),(3,'2025-02-06 19:28:03.675353','2','SME - 1GB',2,'[{\"changed\": {\"fields\": [\"Price\", \"Userprice\", \"Agentprice\", \"Vendorprice\"]}}]',19,1),(4,'2025-02-06 19:29:50.135563','1','SME - 500MB',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',19,1),(5,'2025-02-06 19:31:31.711385','1','SME - 500MB',2,'[{\"changed\": {\"fields\": [\"Price\", \"Userprice\"]}}]',19,1),(6,'2025-02-06 19:33:31.779108','3','SME - 2GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(7,'2025-02-06 19:34:08.970283','4','SME - 3GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(8,'2025-02-06 19:34:43.430508','5','SME - 5GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(9,'2025-02-06 19:35:18.470240','6','SME - 10GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(10,'2025-02-06 19:36:34.670818','7','GIFTING - 1.5GB',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',19,1),(11,'2025-02-06 19:37:13.202335','8','GIFTING - 2GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(12,'2025-02-06 19:37:52.449354','7','GIFTING - 1.5GB',2,'[{\"changed\": {\"fields\": [\"Price\", \"Userprice\"]}}]',19,1),(13,'2025-02-06 19:38:40.962063','9','GIFTING - 3GB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1),(14,'2025-02-06 19:41:25.292713','10','GIFTING - 4.5GB',2,'[{\"changed\": {\"fields\": [\"Agentprice\"]}}]',19,1),(15,'2025-02-06 19:45:48.891765','11','COOPERATE GIFTING - 500MB',2,'[{\"changed\": {\"fields\": [\"Userprice\"]}}]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(25,'vtu_app','account'),(9,'vtu_app','airtime'),(10,'vtu_app','airtimepinprice'),(11,'vtu_app','alphatopupprice'),(12,'vtu_app','apiconfig'),(13,'vtu_app','apilink'),(14,'vtu_app','cableid'),(15,'vtu_app','cableplan'),(16,'vtu_app','contact'),(17,'vtu_app','crypto'),(8,'vtu_app','customuser'),(18,'vtu_app','datapin'),(19,'vtu_app','dataplan'),(20,'vtu_app','datatoken'),(21,'vtu_app','electricityid'),(22,'vtu_app','examid'),(23,'vtu_app','networkid'),(24,'vtu_app','transactions');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-06 01:13:22.472120'),(2,'contenttypes','0002_remove_content_type_name','2025-02-06 01:13:24.119034'),(3,'auth','0001_initial','2025-02-06 01:13:28.327391'),(4,'auth','0002_alter_permission_name_max_length','2025-02-06 01:13:29.052450'),(5,'auth','0003_alter_user_email_max_length','2025-02-06 01:13:29.098472'),(6,'auth','0004_alter_user_username_opts','2025-02-06 01:13:29.370143'),(7,'auth','0005_alter_user_last_login_null','2025-02-06 01:13:29.422282'),(8,'auth','0006_require_contenttypes_0002','2025-02-06 01:13:29.458461'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-06 01:13:29.500127'),(10,'auth','0008_alter_user_username_max_length','2025-02-06 01:13:29.545815'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-06 01:13:29.595472'),(12,'auth','0010_alter_group_name_max_length','2025-02-06 01:13:29.711586'),(13,'auth','0011_update_proxy_permissions','2025-02-06 01:13:29.756429'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-06 01:13:29.807401'),(15,'vtu_app','0001_initial','2025-02-06 01:13:45.643656'),(16,'admin','0001_initial','2025-02-06 01:13:47.311847'),(17,'admin','0002_logentry_remove_auto_add','2025-02-06 01:13:47.362934'),(18,'admin','0003_logentry_add_action_flag_choices','2025-02-06 01:13:47.420717'),(19,'authtoken','0001_initial','2025-02-06 01:13:48.559131'),(20,'authtoken','0002_auto_20160226_1747','2025-02-06 01:13:48.641301'),(21,'authtoken','0003_tokenproxy','2025-02-06 01:13:48.682539'),(22,'authtoken','0004_alter_tokenproxy_options','2025-02-06 01:13:48.744724'),(23,'sessions','0001_initial','2025-02-06 01:13:49.188337');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4cybi5gow4kqlnozx7p362c92ropupla','.eJxVjMsOwiAQRf-FtSG0DA9duu83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mLGMXpd4uYHlx3QHestyZTq-syR7kr8qBdTo34eT3cv4OCvXzrnNhrQxnAKJsHCwCWKCIQpOhoTJ7JoHOoPGpgpZOBfAbjrGKX3SDeH_d-OA0:1tg5nb:-XsJ1Hm9ZmKLIPierlEjNWfW-C68OxNZgw8yurY-wn0','2025-02-20 17:36:23.454324'),('5juxghicua5a93hlabowhl7d1fpi3i4h','.eJxVjMsOwiAQRf-FtSGAPF267zeQYQakaiAp7cr479qkC93ec859sQjbWuM28hJnYhcm2el3S4CP3HZAd2i3zrG3dZkT3xV-0MGnTvl5Pdy_gwqjfuuAxpEQxSMoSVYZXVAGq93ZEQYyWehC2klPAGCFc9mjQq19QWN9Sez9AeExOBU:1tfx8z:_jZsENPQ3bnp3hUwdjOQB3E1OzMzc4KrhnmH-vrPFDk','2025-02-20 08:21:53.539825'),('b6uz1qm76mm0fd9dl4ifpkiv2a5i7jh5','.eJxVjEEOgkAMRe8yazOhtEBx6d4zkHY6I6gZEgZWxrsrCQvd_vfef7lBtnUcthKXYTJ3duhOv5tKeMS8A7tLvs0-zHldJvW74g9a_HW2-Lwc7t_BKGX81tRE4CSRElV9G7seUjKzpoaqIiDihpgRWSkgCGhtgppaVpaE2Kl7fwDXMDei:1tg5uC:kUry6y5Ln3CWo2lsHd3v4jldE8hVxWztBQ5QeFw56gg','2025-02-20 17:43:12.281255'),('m69rqbnz6x7qpvo3fn5kypxaejyy4rsj','.eJxVjMsOwiAQRf-FtSGAPF267zeQYQakaiAp7cr479qkC93ec859sQjbWuM28hJnYhcm2el3S4CP3HZAd2i3zrG3dZkT3xV-0MGnTvl5Pdy_gwqjfuuAxpEQxSMoSVYZXVAGq93ZEQYyWehC2klPAGCFc9mjQq19QWN9Sez9AeExOBU:1tfxNj:v08Pzd206NvSGzQqUHN6xsz2v9u19Cdx9Z0LA5cFbt0','2025-02-20 08:37:07.671754'),('szxevp6mp6utvgt8eebfrjzp3733kxqe','.eJxVjMEOwiAQRP-FsyEUEIpH734D2WUXqRpISnsy_rtt0oMe5jLvzbxFhHUpce08x4nERVhx-u0Q0pPrDugB9d5kanWZJ5S7Ig_a5a0Rv66H-3dQoJdtrbIfs-EQSHmj9QDkIFtztkweQ94SnPaDUQ4zJs3owY3O2mzJu4QsPl_hKjge:1tg6Mo:-PFPPrC0rZKvNnRPfSYKwpMRaSn_ZT8EGc2RwN_DNSQ','2025-02-20 18:12:46.000865'),('y1omiluww1er8yc9w5lfzjrncp86ihu8','.eJxVjEEOgkAMRe8yazOhtEBx6d4zkHY6I6gZEgZWxrsrCQvd_vfef7lBtnUcthKXYTJ3duhOv5tKeMS8A7tLvs0-zHldJvW74g9a_HW2-Lwc7t_BKGX81tRE4CSRElV9G7seUjKzpoaqIiDihpgRWSkgCGhtgppaVpaE2Kl7fwDXMDei:1tg5uB:MLbMa4zB3EN07D7mETgMsng414KexJL19Wof6E0GF-c','2025-02-20 17:43:11.399070'),('yrozv2vbyaausjss26etblny3tc0zj2w','.eJxVjMEOwiAQRP-FsyEUEIpH734D2WUXqRpISnsy_rtt0oMe5jLvzbxFhHUpce08x4nERVhx-u0Q0pPrDugB9d5kanWZJ5S7Ig_a5a0Rv66H-3dQoJdtrbIfs-EQSHmj9QDkIFtztkweQ94SnPaDUQ4zJs3owY3O2mzJu4QsPl_hKjge:1tg6Mo:-PFPPrC0rZKvNnRPfSYKwpMRaSn_ZT8EGc2RwN_DNSQ','2025-02-20 18:12:46.991365');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electricityid`
--

DROP TABLE IF EXISTS `electricityid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electricityid` (
  `eId` int NOT NULL,
  `electricityid` varchar(50) DEFAULT NULL,
  `provider` varchar(50) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  `providerStatus` varchar(10) NOT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electricityid`
--

LOCK TABLES `electricityid` WRITE;
/*!40000 ALTER TABLE `electricityid` DISABLE KEYS */;
/*!40000 ALTER TABLE `electricityid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examid`
--

DROP TABLE IF EXISTS `examid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examid` (
  `eId` int NOT NULL,
  `examid` varchar(10) DEFAULT NULL,
  `provider` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `buying_price` int NOT NULL,
  `providerStatus` varchar(10) NOT NULL,
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examid`
--

LOCK TABLES `examid` WRITE;
/*!40000 ALTER TABLE `examid` DISABLE KEYS */;
/*!40000 ALTER TABLE `examid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkid`
--

DROP TABLE IF EXISTS `networkid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `networkid` (
  `nId` int NOT NULL,
  `networkid` varchar(10) NOT NULL,
  `smeId` varchar(10) NOT NULL,
  `giftingId` varchar(10) NOT NULL,
  `corporateId` varchar(10) NOT NULL,
  `vtuId` varchar(10) NOT NULL,
  `sharesellId` varchar(10) NOT NULL,
  `network` varchar(20) NOT NULL,
  `networkStatus` varchar(10) NOT NULL,
  `vtuStatus` varchar(10) NOT NULL,
  `sharesellStatus` varchar(10) NOT NULL,
  `airtimepinStatus` varchar(10) NOT NULL,
  `smeStatus` varchar(10) NOT NULL,
  `giftingStatus` varchar(10) NOT NULL,
  `corporateStatus` varchar(10) NOT NULL,
  `datapinStatus` varchar(10) NOT NULL,
  PRIMARY KEY (`nId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkid`
--

LOCK TABLES `networkid` WRITE;
/*!40000 ALTER TABLE `networkid` DISABLE KEYS */;
INSERT INTO `networkid` VALUES (1,'1','1','1','1','1','1','MTN','On','On','On','On','On','On','On','On'),(2,'2','2','2','2','2','2','AIRTEL','On','On','On','On','On','On','On','On'),(3,'3','3','3','3','3','3','GLO','On','On','On','On','On','On','On','On'),(4,'4','4','4','4','4','4','9MOBILE','On','On','On','On','On','On','On','On');
/*!40000 ALTER TABLE `networkid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `description` longtext,
  `api_return_message` longtext,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `transactions_user_id_766cc893_fk_users_id` (`user_id`),
  CONSTRAINT `transactions_user_id_766cc893_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'SME Data','TXN202502061719394C2AEA63',520.00,'completed','2025-02-06 17:19:42.217644','2GB SME 30 purchased for 07061359074','{\'network\': \'MTN\', \'request-id\': \'TXN20250206171939874B6631\', \'amount\': \'520\', \'dataplan\': \'2GB\', \'status\': \'success\', \'transid\': \'TXN20250206171939874B6631\', \'message\': \'Dear Customer, You have successfully shared 2GB Data to 2347061359074\', \'phone_number\': \'07061359074\', \'oldbal\': \'2000\', \'newbal\': 1480, \'system\': \'API\', \'plan_type\': \'SME\', \'wallet_vending\': \'wallet\', \'response\': \'Dear Customer, You have successfully shared 2GB Data to 2347061359074. Your SME data balance is 0GB expires 06/02/2025. Thankyou Your SME data balance is N/AGB. Thankyou\'}',1),(2,'Airtime','TXN20250206181010C142C7EE',500.00,'completed','2025-02-06 18:10:12.211176','Airtime of 500 for 07061359074 on 1 network.','{\'network\': \'MTN\', \'request-id\': \'TXN20250206181010C142C7EE\', \'amount\': \'500\', \'transid\': \'TXN20250206181010C142C7EE\', \'discount\': 485, \'status\': \'success\', \'message\': \'successfully purchase MTN VTU to 07061359074 , ₦500\', \'phone_number\': \'07061359074\', \'oldbal\': \'1480\', \'newbal\': 995, \'system\': \'API\', \'plan_type\': \'VTU\', \'wallet_vending\': \'wallet\'}',1);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` longtext,
  `pin` varchar(6) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `bvn` varchar(11) DEFAULT NULL,
  `nin` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pbkdf2_sha256$600000$aaRhxx9ZLycBtvTX883wfJ$8l2RT/64rMuSrC4qoh3RAMZoOz9UhkvJ46IiTpjLbco=','2025-02-06 08:37:07.632404',1,'mederhoo','Hammed','Amusat',1,1,'2025-02-06 01:33:19.000000','mederhoo@gmail.com','08034295030','House 5 Road 1 Alagbede Omi Adio','1234',48984.99,NULL,NULL),(2,'pbkdf2_sha256$600000$7MFK7zLUAqcCyeD9lb17E5$Yv7EvhCmDBFTsg22rse3rDKXOoiRmBDJScctFbBS+a0=','2025-02-06 17:36:23.390169',0,'Neyo','Amzat','Abass',0,1,'2025-02-06 17:35:56.341341','Asmat4uk@gmail.com','07069612740','Ibadan','0803',0.00,NULL,NULL),(3,'pbkdf2_sha256$600000$TqNKGtl28nAOqbL61ikfXH$YuHuwhoymBIA3M8r3RtDvRv98wZUyvwUy60eYZDtqE4=','2025-02-06 17:43:12.240367',0,'Sodscotech','Sodiq','Okunade',0,1,'2025-02-06 17:43:03.201079','sodeeqokunade10@gmail.com','08107208625','No 12 oke oloro','1212',0.00,NULL,NULL),(4,'pbkdf2_sha256$600000$NEynao7RNw4TDduAOYhv4k$sfyN7ca4QdjbyH1j97ZUJIKkjsSIJ6NMxDHxFFVArHM=','2025-02-06 18:12:46.944537',0,'MD','Muhammad kungayakun','Isiaq',0,1,'2025-02-06 18:12:27.986101','isiaqmuhammedkunfayakun@gmail.com','08130517183','Omi Adio','2443',0.00,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_customuser_id_group_id_927de924_uniq` (`customuser_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_customuser_id_4bd991a9_fk_users_id` FOREIGN KEY (`customuser_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_customuser_id_permission_id_2b4e4e39_uniq` (`customuser_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_customuser_id_efdb305c_fk_users_id` FOREIGN KEY (`customuser_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-14  0:14:48
