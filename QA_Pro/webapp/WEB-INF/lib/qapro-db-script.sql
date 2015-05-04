CREATE DATABASE  IF NOT EXISTS `qapro` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci */;
USE `qapro`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: qapro
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(450) COLLATE utf8_turkish_ci DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  `responder_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_answer_fk` (`question_id`),
  KEY `question_responder_fk` (`responder_id`),
  CONSTRAINT `question_answer_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'Youtube videos are cool but since I need a well-organized professional one, I prefer javathlon.com','2014-06-01 17:07:40',1,4,1),(2,'It is Ronaldo from Brasil...','2014-06-01 17:07:40',1,6,3),(3,'Of course Javathlon','2014-08-30 21:00:00',1,1,4);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_validation`
--

DROP TABLE IF EXISTS `email_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_validation` (
  `validation_id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_code` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_validated` bit(1) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`validation_id`),
  KEY `user_id_validation_fk` (`user_id`),
  CONSTRAINT `user_id_validation_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_validation`
--

LOCK TABLES `email_validation` WRITE;
/*!40000 ALTER TABLE `email_validation` DISABLE KEYS */;
INSERT INTO `email_validation` VALUES (3,'1409512080495someotherstring','haruki@murakami.com',32,'\0','2014-08-30 21:00:00',NULL);
/*!40000 ALTER TABLE `email_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `permission_name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `permission_description` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`permission_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('BLOCK_USER','2014-05-29 18:51:11','can block a user'),('CREATE_ANSWER','2014-05-29 18:51:11','can create answer'),('CREATE_QUESTION','2014-05-29 18:51:11','can create question'),('CREATE_TOPIC','2014-05-29 18:51:11','can create a topic'),('DELETE_SELF_ANSWER','2014-05-29 18:51:11','can delete answer they create'),('DELETE_SELF_QUESTION','2014-05-29 18:51:11','can delete the question they create'),('UNBLOCK_USER','2014-05-29 18:51:11','can unblock a user'),('UPDATE_SELF_ANSWER','2014-05-29 18:51:11','can update the answer they create'),('UPDATE_SELF_QUESTION','2014-05-29 18:51:11','can update the question they create');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(450) COLLATE utf8_turkish_ci DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `is_active` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `asker_id` int(11) DEFAULT NULL,
  `up_vote` int(11) DEFAULT NULL,
  `down_vote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_asker_fk` (`asker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Can you advice me a video Java course?','2014-06-01 14:03:53','1',4,17,2),(2,'What is the highest mountain in the world?','2014-06-01 14:03:53','1',4,1,0),(3,'Who scored the most goals in Fifa world cup?','2014-06-01 14:03:53','1',6,0,0),(4,'What is the best resource for Java training?','2014-08-30 21:00:00','1',3,0,0),(5,'What is the best resource for Java training?','2014-08-30 21:00:00','1',3,0,0),(6,'What is the best resource for Java training?','2014-08-30 21:00:00','1',3,0,0),(7,'What is the best resource for Java training?','2014-09-15 21:00:00','1',3,0,0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `role_permission_id` int(11) NOT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `role_name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `permission_name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`),
  KEY `role_name_index` (`role_name`),
  KEY `rolepermission_permission_namefk_fk_idx` (`permission_name`),
  CONSTRAINT `rolepermission_permission_namefk_fk` FOREIGN KEY (`permission_name`) REFERENCES `permission` (`permission_name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rolepermission_role_namefk_fk` FOREIGN KEY (`role_name`) REFERENCES `roles` (`role_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,NULL,'','simple_user','CREATE_ANSWER'),(2,NULL,'','simple_user','CREATE_QUESTION'),(3,NULL,'','simple_user','DELETE_SELF_ANSWER'),(4,NULL,'','simple_user','DELETE_SELF_QUESTION'),(5,NULL,'','moderator','CREATE_ANSWER'),(6,NULL,'','moderator','CREATE_TOPIC'),(7,NULL,'','moderator','CREATE_QUESTION'),(8,NULL,'','moderator','DELETE_SELF_ANSWER'),(9,NULL,'','moderator','DELETE_SELF_QUESTION'),(10,NULL,'\0','moderator','UNBLOCK_USER'),(11,NULL,'\0','moderator','BLOCK_USER');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `insert_date` timestamp NULL DEFAULT NULL,
  `role_description` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('moderator',NULL,'can manage users + simple_user'),('simple_user',NULL,'can manage answers/questions');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `role_name` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role_fk_idx` (`role_name`),
  CONSTRAINT `user_role_pk` FOREIGN KEY (`role_name`) REFERENCES `roles` (`role_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'talhaocakci','fbfgh56ghfdhf','','talha','ocakci','2014-05-23 23:35:10','moderator',NULL),(4,'kirkhammeet','toolongpassword','','kirk','hammett','2014-05-25 21:11:40','simple_user',NULL),(6,'BruceDickinson','toolongpassword','','bruce','dickinson','2014-05-26 20:55:40','simple_user',NULL),(8,'milankundera','milanpass','','milan','kundera','2014-06-04 15:13:47',NULL,'milankundera@gmail.com'),(9,'milankundera','milanpass','','milan','kundera','2014-06-04 15:15:01',NULL,'milankundera@gmail.com'),(11,'douglasadams','douglaspass','','douglas','adams','2014-06-07 08:22:52',NULL,'douglasadams@gmail.com'),(12,'milankunderaccv','dfvfdvfd','','talha','ocakci','2014-06-07 08:29:40',NULL,'btocakci@gmail.comfv'),(13,'milankundera&#351;&#351;j&#351;','kl&#351;k&#351;','','&#351;k&#351;','kl&#351;k&#351;','2014-06-07 08:30:22',NULL,'j&#351;l&#351;'),(14,'tahaocakcijj','hlhll','','milanjj','kundera','2014-06-07 08:33:25',NULL,'btocakci@gmail.comjj'),(15,'elif_shafak','fsdfsdfsdf','','elif','shafak','2014-06-07 08:42:11',NULL,'elif_shafak@gmail.com'),(19,'orhanpamuk','fsfsgfdfg','','orhan ','pamuk','2014-06-10 14:18:14',NULL,'orhan@pamuk.com'),(20,'orhanpamuk2','fdsfsdfsdf','','orhan 2','pamuk2','2014-06-10 14:18:58',NULL,'orhan2@pamuk.com'),(21,'sad','asd','','asd','sad','2014-06-11 12:25:26',NULL,'asd'),(22,'oscarwilde','oscarpass','','oscar','wilde','2014-06-11 12:43:29',NULL,'oscar@wilde.com'),(23,'orhanpamuk3','ddasd','','orhaaaan','pamukk','2014-06-14 07:39:24',NULL,'orhan3@pamuk.com'),(26,'kevinspacey','dfsdf','','kevin','spacey','2014-06-14 10:52:01',NULL,'kevinspacey@yahoo.com'),(27,NULL,NULL,'','denemetest',NULL,NULL,NULL,NULL),(28,'glucas',NULL,'','george','lucas',NULL,NULL,'glucas@hotmail.com'),(32,'harukimurakami',NULL,'','haruki','murakami',NULL,NULL,'haruki@murakami.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(4) COLLATE utf8_turkish_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `is_cancelled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vote_question_fk` (`question_id`),
  KEY `vote_user_fk` (`user_id`),
  CONSTRAINT `vote_question_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vote_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,22,'UP','2014-09-19 21:00:00','\0');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-21 10:38:01
