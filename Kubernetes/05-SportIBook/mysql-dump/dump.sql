-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Linux (x86_64)
--
-- Host: 172.21.0.2    Database: isportbook_testing
-- ------------------------------------------------------
-- Server version	10.4.5-MariaDB-1:10.4.5+maria~bionic

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Istruttore'),(2,'Struttura');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,16),(2,1,20),(3,2,16),(4,2,20);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Company',1,'add_profile'),(2,'Can change Company',1,'change_profile'),(3,'Can delete Company',1,'delete_profile'),(4,'Can view Company',1,'view_profile'),(5,'Can add City',2,'add_city'),(6,'Can change City',2,'change_city'),(7,'Can delete City',2,'delete_city'),(8,'Can view City',2,'view_city'),(9,'Can add sport',3,'add_sport'),(10,'Can change sport',3,'change_sport'),(11,'Can delete sport',3,'delete_sport'),(12,'Can view sport',3,'view_sport'),(13,'Can add Booking',4,'add_booking'),(14,'Can change Booking',4,'change_booking'),(15,'Can delete Booking',4,'delete_booking'),(16,'Can view Booking',4,'view_booking'),(17,'Can add Feedback',5,'add_feedback'),(18,'Can change Feedback',5,'change_feedback'),(19,'Can delete Feedback',5,'delete_feedback'),(20,'Can view Feedback',5,'view_feedback'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$3wvXtuLXlClc$ftmzO2vDs4RAOlJRtyNqsv8V1eLkEBM2tlP7SGSdTiE=','2019-07-15 11:50:42.722882',1,'root','','','root@root.tld',1,1,'2019-07-15 11:50:35.162332'),(2,'pbkdf2_sha256$150000$ywYNVr5lLkBP$0o7dAhIc+PSOF2Hb0FwdgnW1yMX6gK5u3QY7k2UYPvE=',NULL,0,'TestIstruttore','','','',1,1,'2019-07-15 11:53:08.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-15 11:50:48.653222','1','Catania',1,'[{\"added\": {}}]',2,1),(2,'2019-07-15 11:51:36.400843','1','Istruttore',1,'[{\"added\": {}}]',8,1),(3,'2019-07-15 11:51:52.286390','2','Struttura',1,'[{\"added\": {}}]',8,1),(4,'2019-07-15 11:52:41.871304','1','Climbing',1,'[{\"added\": {}}]',3,1),(5,'2019-07-15 11:53:08.979016','2','TestIstruttore',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Company\", \"object\": \"TestIstruttore\"}}]',9,1),(6,'2019-07-15 11:53:21.086236','2','TestIstruttore',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(10,'contenttypes','contenttype'),(4,'isportbook_main','booking'),(2,'isportbook_main','city'),(5,'isportbook_main','feedback'),(1,'isportbook_main','profile'),(3,'isportbook_main','sport'),(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-15 10:07:26.677468'),(2,'auth','0001_initial','2019-07-15 10:07:26.977897'),(3,'admin','0001_initial','2019-07-15 10:07:28.166842'),(4,'admin','0002_logentry_remove_auto_add','2019-07-15 10:07:28.452776'),(5,'admin','0003_logentry_add_action_flag_choices','2019-07-15 10:07:28.491085'),(6,'contenttypes','0002_remove_content_type_name','2019-07-15 10:07:28.681121'),(7,'auth','0002_alter_permission_name_max_length','2019-07-15 10:07:28.915497'),(8,'auth','0003_alter_user_email_max_length','2019-07-15 10:07:28.949800'),(9,'auth','0004_alter_user_username_opts','2019-07-15 10:07:28.971006'),(10,'auth','0005_alter_user_last_login_null','2019-07-15 10:07:29.087439'),(11,'auth','0006_require_contenttypes_0002','2019-07-15 10:07:29.095548'),(12,'auth','0007_alter_validators_add_error_messages','2019-07-15 10:07:29.115496'),(13,'auth','0008_alter_user_username_max_length','2019-07-15 10:07:29.158387'),(14,'auth','0009_alter_user_last_name_max_length','2019-07-15 10:07:29.194297'),(15,'auth','0010_alter_group_name_max_length','2019-07-15 10:07:29.233842'),(16,'auth','0011_update_proxy_permissions','2019-07-15 10:07:29.259636'),(17,'isportbook_main','0001_initial','2019-07-15 10:07:29.344096'),(18,'isportbook_main','0002_city','2019-07-15 10:07:29.522921'),(19,'isportbook_main','0003_auto_20190513_2005','2019-07-15 10:07:29.620281'),(20,'isportbook_main','0004_auto_20190513_2033','2019-07-15 10:07:30.019056'),(21,'isportbook_main','0005_profile_city','2019-07-15 10:07:30.186065'),(22,'isportbook_main','0006_companyaward','2019-07-15 10:07:30.378874'),(23,'isportbook_main','0007_profile_sports','2019-07-15 10:07:30.573943'),(24,'isportbook_main','0008_booking_feedback','2019-07-15 10:07:31.023935'),(25,'isportbook_main','0009_booking_uuid','2019-07-15 10:07:31.592740'),(26,'isportbook_main','0010_auto_20190518_1148','2019-07-15 10:07:31.625803'),(27,'isportbook_main','0011_auto_20190518_1927','2019-07-15 10:07:31.836909'),(28,'isportbook_main','0012_sport_icon','2019-07-15 10:07:31.866092'),(29,'isportbook_main','0013_auto_20190518_2138','2019-07-15 10:07:31.878835'),(30,'isportbook_main','0014_auto_20190518_2152','2019-07-15 10:07:31.894116'),(31,'isportbook_main','0015_auto_20190519_0817','2019-07-15 10:07:31.907238'),(32,'isportbook_main','0016_auto_20190519_0859','2019-07-15 10:07:32.241538'),(33,'isportbook_main','0017_profile_photo','2019-07-15 10:07:32.275463'),(34,'isportbook_main','0018_auto_20190525_2015','2019-07-15 10:07:33.097798'),(35,'isportbook_main','0019_auto_20190617_1808','2019-07-15 10:07:33.161854'),(36,'isportbook_main','0020_auto_20190619_1523','2019-07-15 10:07:33.303444'),(37,'sessions','0001_initial','2019-07-15 10:07:33.348429');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1ttv7iyg4iy7l62yushmm5xzphucadck','MTZhYWM4NzYwNmEwOWY2NmMwY2E2MmJhNDJkNGZiNDIxYWJiNmVhOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYTAxM2UwOGJlYTlkMzAwMzE3YmQzM2NhNTM2NWQyOWFlZjJmMGFmIn0=','2019-07-29 11:50:42.732374');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_booking`
--

DROP TABLE IF EXISTS `isportbook_main_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `uuid` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `isportbook_main_book_sport_id_3920da66_fk_isportboo` (`sport_id`),
  KEY `isportbook_main_book_company_id_daf7b4ab_fk_isportboo` (`company_id`),
  CONSTRAINT `isportbook_main_book_company_id_daf7b4ab_fk_isportboo` FOREIGN KEY (`company_id`) REFERENCES `isportbook_main_profile` (`id`),
  CONSTRAINT `isportbook_main_book_sport_id_3920da66_fk_isportboo` FOREIGN KEY (`sport_id`) REFERENCES `isportbook_main_sport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_booking`
--

LOCK TABLES `isportbook_main_booking` WRITE;
/*!40000 ALTER TABLE `isportbook_main_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `isportbook_main_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_city`
--

DROP TABLE IF EXISTS `isportbook_main_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_city`
--

LOCK TABLES `isportbook_main_city` WRITE;
/*!40000 ALTER TABLE `isportbook_main_city` DISABLE KEYS */;
INSERT INTO `isportbook_main_city` VALUES (1,'Catania');
/*!40000 ALTER TABLE `isportbook_main_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_feedback`
--

DROP TABLE IF EXISTS `isportbook_main_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cleaning` int(11) NOT NULL,
  `value_for_money` int(11) NOT NULL,
  `passion` int(11) NOT NULL,
  `skill` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `motivation` int(11) NOT NULL,
  `professionality` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  CONSTRAINT `isportbook_main_feed_booking_id_51dd0281_fk_isportboo` FOREIGN KEY (`booking_id`) REFERENCES `isportbook_main_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_feedback`
--

LOCK TABLES `isportbook_main_feedback` WRITE;
/*!40000 ALTER TABLE `isportbook_main_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `isportbook_main_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_profile`
--

DROP TABLE IF EXISTS `isportbook_main_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `age` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `awards` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `certifications` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_times` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `services` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_powers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `isportbook_main_prof_city_id_5a27bde7_fk_isportboo` (`city_id`),
  CONSTRAINT `isportbook_main_prof_city_id_5a27bde7_fk_isportboo` FOREIGN KEY (`city_id`) REFERENCES `isportbook_main_city` (`id`),
  CONSTRAINT `isportbook_main_profile_user_id_cda5ea3f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_profile`
--

LOCK TABLES `isportbook_main_profile` WRITE;
/*!40000 ALTER TABLE `isportbook_main_profile` DISABLE KEYS */;
INSERT INTO `isportbook_main_profile` VALUES (1,'Test istruttore','','Lorem ipsum',2,1,'','','','','','','','','','profiles/200_xPPtATP.png');
/*!40000 ALTER TABLE `isportbook_main_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_profile_sports`
--

DROP TABLE IF EXISTS `isportbook_main_profile_sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_profile_sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isportbook_main_profile_sports_profile_id_sport_id_9d4bec81_uniq` (`profile_id`,`sport_id`),
  KEY `isportbook_main_prof_sport_id_df4a4203_fk_isportboo` (`sport_id`),
  CONSTRAINT `isportbook_main_prof_profile_id_79f001d6_fk_isportboo` FOREIGN KEY (`profile_id`) REFERENCES `isportbook_main_profile` (`id`),
  CONSTRAINT `isportbook_main_prof_sport_id_df4a4203_fk_isportboo` FOREIGN KEY (`sport_id`) REFERENCES `isportbook_main_sport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_profile_sports`
--

LOCK TABLES `isportbook_main_profile_sports` WRITE;
/*!40000 ALTER TABLE `isportbook_main_profile_sports` DISABLE KEYS */;
INSERT INTO `isportbook_main_profile_sports` VALUES (1,1,1);
/*!40000 ALTER TABLE `isportbook_main_profile_sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isportbook_main_sport`
--

DROP TABLE IF EXISTS `isportbook_main_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isportbook_main_sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isportbook_main_sport`
--

LOCK TABLES `isportbook_main_sport` WRITE;
/*!40000 ALTER TABLE `isportbook_main_sport` DISABLE KEYS */;
INSERT INTO `isportbook_main_sport` VALUES (1,'Climbing','sports/200_woBrsD6.png');
/*!40000 ALTER TABLE `isportbook_main_sport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-15 13:54:45
