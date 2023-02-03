-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: dump_desafio_usuarios_3
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `_events`
--

DROP TABLE IF EXISTS `_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_` varchar(50) NOT NULL,
  `description_` text,
  `location` varchar(600) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_events`
--

LOCK TABLES `_events` WRITE;
/*!40000 ALTER TABLE `_events` DISABLE KEYS */;
INSERT INTO `_events` VALUES (1,'Evento 1','Acciones del evento 1','Rascafria',28459,'2023-01-20','musica');
/*!40000 ALTER TABLE `_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description_` text,
  `date_` datetime DEFAULT NULL,
  `fk_id_volunteer` int DEFAULT NULL,
  `fk_id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_volunteer` (`fk_id_volunteer`),
  KEY `fk_id_user` (`fk_id_user`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`fk_id_volunteer`) REFERENCES `volunteers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description_` text,
  `date_` datetime DEFAULT NULL,
  `status_` varchar(30) DEFAULT NULL,
  `fk_id_volunteer` int DEFAULT NULL,
  `fk_id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_volunteer` (`fk_id_volunteer`),
  KEY `fk_id_user` (`fk_id_user`) /*!80000 INVISIBLE */,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`fk_id_volunteer`) REFERENCES `volunteers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `avatar` varchar(550) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `location` varchar(600) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `strikes` int DEFAULT NULL,
  `interests` text,
  `health_issues` text,
  `car` tinyint(1) DEFAULT NULL,
  `comments` text,
  `last_contact` datetime DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','Cosme Rueda','Abeyta','6327627691','unsplash_BBjW2qnIixc.jpg','1933-01-01','Bustarviejo',28028,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":true,\\\"manualidades\\\":false}','Hipertension',0,'No tiene acceso a datos.','2022-02-27 15:00:00',1),(2,'','Concha','Abrego','6431255008','unsplash_DrFp1cx1Xuo.jpg','1933-01-10','Somosierra',28143,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":true,\\\"manualidades\\\":true}','Diabetes',0,'Pues ya ves socio','2022-02-27 16:00:00',1),(3,'','Hortensia','Abreu','6448644364','unsplash_odh6diQdVLY.jpg','1933-01-20','Buitrago del Lozoya',28027,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":true,\\\"manualidades\\\":false}','No tiene',1,'Pues ya ves socio','2022-02-27 15:00:00',1),(4,'','David Páez Espejo','Acevedo','6082745515','unsplash_QwNUkiDxjbo.jpg','1933-01-29','Lozoyuela-Navas-Sieteiglesias',28901,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Alzheimer',0,'Pues ya ves socio','2022-03-24 16:00:00',1),(5,'','María Fernanda','Acosta','6590715226','unsplash_sdB8Yi-R0Qk.jpg','1933-02-08','Buitrago del Lozoya',28027,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":true,\\\"manualidades\\\":true}','Alzheimer',0,'Pues ya ves socio','2022-03-24 15:00:00',1),(6,'','María Elba ','Acuña','6406270606','unsplash__aduPjJvDx4.jpg','1933-02-17','Montejo de la Sierra',28088,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":false,\\\"baile\\\":false,\\\"cocina\\\":true,\\\"manualidades\\\":false}','No tiene',0,'No tiene acceso a datos.','2022-04-17 16:00:00',1),(7,'','Elba Luisa','Acuña','6406270606','unsplash_A6O7pgc7vHg.jpg','1933-12-01','Montejo de la Sierra',28088,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":true,\\\"manualidades\\\":true}','Problemas auditivos',0,'No tiene acceso a datos.','2022-04-17 17:00:00',1),(8,'','Elisa','Adame','6169444905','unsplash_IL6M6cmhEpM.jpg','1934-10-02','El Berrueco',28021,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":true,\\\"manualidades\\\":true}','Cataratas',1,'No tiene acceso a datos.','2022-05-12 16:00:00',1),(9,'','Bárbara Sofía','Adorno','6714786318','unsplash_izJC1PUjZNc-1.jpg','1948-09-16','Gargantilla del Lozoya y Pinilla de Buitrago',28063,0,'\'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":true,\\\"manualidades\\\":false}\'','Artrosis',0,'No tiene acceso a datos.','2022-05-12 18:00:00',1),(10,'','Cruz María','Agosto','6220957928','unsplash_l9I93gZKTG4.jpg','1948-06-19','Buitrago del Lozoya',28027,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":false,\\\"baile\\\":false,\\\"cocina\\\":true,\\\"manualidades\\\":false}','Artritis',0,'No tiene acceso a datos.','2022-06-06 16:00:00',1),(11,'','Bienvenida Mariscal','Aguayo','6393248738','unsplash_MMhazsT2wtM.jpg','1947-10-15','Bustarviejo',28028,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":true,\\\"manualidades\\\":true}','No tiene',0,'No tiene acceso a datos.','2022-06-06 16:00:00',1),(12,'','Lino','Águilar','6854332963','unsplash_NRnPv3Gs-Nc.jpg','1946-11-14','Navalafuente',28094,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":false}','No tiene',0,'No tiene acceso a datos.','2022-07-01 16:00:00',1),(13,'','Susanita','Aguilera','6661656458','unsplash_NaV1BloVk0g.jpg','1945-11-13','Robregordo',28126,0,'{\\\"juegos\\\":true,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Artrosis',1,'No tiene acceso a datos.','2022-07-01 17:00:00',1),(14,'','Ximena','Aguirre','6212546410','unsplash_odh6diQdVLY.jpg','1939-05-07','Bustarviejo',28028,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Artritis',0,'No tiene acceso a datos.','2022-07-26 17:00:00',1),(15,'','Marco de Carrión','Alanis','6498931127','unsplash_5jDJ4LaXiWE.jpg','1948-03-22','Bustarviejo',28028,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":true}','No tiene',0,'No tiene acceso a datos.','2022-07-26 17:00:00',1),(16,'','Viviana','Alaniz','6142208843','unsplash_QQsRTGAZp9o.jpg','1948-09-24','Piñuécar-Gandullas',28114,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','No tiene',0,'No tiene acceso a datos.','2022-07-26 17:00:00',1),(17,'','Jordán','Alarcón','6759013665','unsplash_9kDXgXFRmO8.jpg','1943-01-11','Talamanca de Jarama',28145,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Artrosis',0,'No tiene acceso a datos.','2022-08-20 18:00:00',2),(18,'','Calixta Petrona','Alba','6807790813','unsplash_sdB8Yi-R0Qk.jpg','1944-11-12','La Cabrera',28030,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":true}','Artritis',1,'No tiene acceso a datos.','2022-08-20 18:00:00',2),(19,'','Isidoro','Alcala','6740961755','unsplash_52R7t7x8CPI.jpg','1948-02-23','Venturada',28169,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":false,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Parkinson',0,'No tiene acceso a datos.','2022-08-20 17:00:00',2),(20,'','Luis Ignacio','Alcántar','6336238605','unsplash_aCZ2hiC-iDk.jpg','1942-02-10','La Cabrera',28030,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":true}','No tiene',0,'No tiene acceso a datos.','2022-09-13 18:00:00',2),(21,'','Fabricio','Alcaraz','6832512693','unsplash_aMcaLCfTWrA.jpg','1940-04-08','Valdemanco',28158,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":true}','No tiene',0,'No tiene acceso a datos.','2022-09-13 15:00:00',2),(22,'','Gervasio','Alejandro','6603600776','unsplash_BBjW2qnIixc.jpg','1941-03-09','Bustarviejo',28028,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":false,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Artrosis',0,'No tiene acceso a datos.','2022-09-13 17:00:00',2),(23,'','Maite Lissette','Alemán','6897520481','unsplash_NlHGKAZ3jCI.jpg','1937-07-05','Torrelaguna',28151,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":true}','Artritis',0,'No tiene acceso a datos.','2022-10-08 16:00:00',2),(24,'','Alonso','Alfaro','6093254413','unsplash_cKT0oJL9vMI.jpg','1935-09-03','El Berrueco',28021,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":false,\\\"musica\\\":true,\\\"baile\\\":true,\\\"cocina\\\":false,\\\"manualidades\\\":false}','Parkinson',1,'No tiene acceso a datos.','2022-10-08 17:00:00',2),(25,'','José Carlos','Alicea','6099469546','unsplash_dYNar7pk9_Y.jpg','1949-08-17','Canencia',28034,0,'{\\\"juegos\\\":false,\\\"reuniones\\\":true,\\\"musica\\\":true,\\\"baile\\\":false,\\\"cocina\\\":false,\\\"manualidades\\\":false}','No tiene',0,'No tiene acceso a datos.','2022-11-02 16:00:00',3),(26,'','Custodio','Almanza','6842594642','unsplash_S7uN9Rw9I0k.jpg','1936-08-04','Buitrago del Lozoya',28027,0,'','Artrosis',0,'No tiene acceso a datos.','2022-11-02 00:00:00',3),(28,'','Estrella María','Almonte','6763610564','unsplash_XMCLLGGMMYU.jpg','1938-06-06','Buitrago del Lozoya',28027,0,'','No tiene',0,'No tiene acceso a datos.','2022-11-27 00:00:00',3),(29,'','Ercilia','Alonso','6926186550','unsplash_z_8Jqe0Cc-s.jpg','1948-04-21','Bustarviejo',28028,0,'','No tiene',1,'No tiene acceso a datos.','2022-11-27 00:00:00',3),(30,'','Ana María','Alonzo','6340105504','unsplash_ZPynRLKjp9I.jpg','1950-07-18','Bustarviejo',28028,0,'','No tiene',0,'No tiene acceso a datos.','2022-12-22 00:00:00',3),(31,'','Yéssica Flor','Altamirano','6426898854','unsplash_VMGAbeeJTKo.jpg','1948-08-25','Lozoyuela-Navas-Sieteiglesias',28901,0,'','No tiene',0,'No tiene acceso a datos.','2022-12-22 00:00:00',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_events`
--

DROP TABLE IF EXISTS `users_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_id_user` int DEFAULT NULL,
  `fk_id_event` int DEFAULT NULL,
  `assistance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user` (`fk_id_user`),
  KEY `fk_id_event` (`fk_id_event`),
  CONSTRAINT `users_events_ibfk_1` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_events_ibfk_2` FOREIGN KEY (`fk_id_event`) REFERENCES `_events` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_events`
--

LOCK TABLES `users_events` WRITE;
/*!40000 ALTER TABLE `users_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_volunteers`
--

DROP TABLE IF EXISTS `users_volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_volunteers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_id_volunteer` int DEFAULT NULL,
  `fk_id_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_volunteer` (`fk_id_volunteer`),
  KEY `fk_id_user` (`fk_id_user`),
  CONSTRAINT `users_volunteers_ibfk_1` FOREIGN KEY (`fk_id_volunteer`) REFERENCES `volunteers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_volunteers_ibfk_2` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_volunteers`
--

LOCK TABLES `users_volunteers` WRITE;
/*!40000 ALTER TABLE `users_volunteers` DISABLE KEYS */;
INSERT INTO `users_volunteers` VALUES (1,25,NULL),(2,25,NULL),(3,25,NULL),(4,25,NULL),(5,25,NULL);
/*!40000 ALTER TABLE `users_volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer_events`
--

DROP TABLE IF EXISTS `volunteer_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_id_volunteer` int DEFAULT NULL,
  `fk_id_event` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_volunteer` (`fk_id_volunteer`),
  KEY `fk_id_event` (`fk_id_event`),
  CONSTRAINT `volunteer_events_ibfk_1` FOREIGN KEY (`fk_id_volunteer`) REFERENCES `volunteers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `volunteer_events_ibfk_2` FOREIGN KEY (`fk_id_event`) REFERENCES `_events` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_events`
--

LOCK TABLES `volunteer_events` WRITE;
/*!40000 ALTER TABLE `volunteer_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteer_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `pass` varchar(200) NOT NULL,
  `availability` varchar(150) DEFAULT NULL,
  `location` varchar(600) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `studies` varchar(100) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `car` tinyint(1) DEFAULT NULL,
  `volunteer_since` date DEFAULT NULL,
  `avatar` varchar(600) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES (1,'jperez@gmail.com','Juan','Perez','673946248','1997-04-11','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','La Acebeda',28001,'High School','Technical',1,'2016-02-01',NULL,NULL),(2,'maria.rodillo@hotmail.com','Maria','Rodillo','663574789','1989-12-12','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Alameda del Valle',28003,'No studies','Non-technical',0,'2015-08-16',NULL,NULL),(3,'jsolis.67@gmail.com','Jaime','Solís','624554183','1982-08-14','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','El Atazar',28016,'Bachelors','Non-technical',0,'2015-02-28',NULL,NULL),(4,'lu-cejas@hotmail.es','Lucía','Cejas','693442293','1975-04-16','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','El Berrueco',28021,'Bachelors','Non-technical',0,'2014-09-12',NULL,NULL),(5,'pescri@gmail.com','Pablo','Escribano','677225142','1967-12-17','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','El Berrueco',28021,'Bachelors','Non-technical',0,'2014-03-27',NULL,NULL),(6,'robertodelamora@hotmail.com','Roberto','de la Mora','698788924','1997-11-16','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Berzosa del Lozoya',28020,'High School','Non-technical',1,'2013-10-09',NULL,NULL),(7,'pepeaviles@hotmail.es','Jose María','Avilés','678782355','1975-04-16','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Braojos',28024,'Bachelors','Technical',1,'2013-04-23',NULL,NULL),(8,'amparo_ru@yahoo.com','Amparo','Rumbián','678393832','1970-05-08','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Buitrago del Lozoya',28027,'High School','Technical',0,'2012-11-05',NULL,NULL),(9,'jaime-zambrana@gmail.com','Jaime','Zambrana','684957583','1992-03-07','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Bustarviejo',28028,'High School','Technical',1,'2012-05-20',NULL,NULL),(10,'tesamorgado@gmail.com','Teresa','Morgado','699878872','1993-11-05','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','Cabanillas de la Sierra',28029,'No studies','Non-technical',1,'2011-12-03',NULL,NULL),(11,'castillomarcos@hotmail.com','Marcos','Castillo','654549881','1988-10-02','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','weekends','La Cabrera',28030,'Masters','Non-technical',0,'2011-06-17',NULL,NULL),(12,'l_nuñez@yahoo.com','Lissette','Núñez','688225462','1992-03-07','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','Canencia',28034,'No studies','Non-technical',0,'2010-12-30',NULL,NULL),(13,'floresg33@gmail.com','Gabriel','Flores','677541923','1993-11-05','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','Cervera de Buitrago',28039,'Primary School','Non-technical',0,'2010-07-14',NULL,NULL),(14,'franbarbadillo@hotmail.es','Francisco','Barbadillo','699826382','1995-07-06','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','Gargantilla del Lozoya y Pinilla de Buitrago',28063,'High School','Technical',0,'2010-01-26',NULL,NULL),(15,'ineshdz@gmail.com','Inés','Hernández ','641265899','1995-07-07','$2a$08$MYfx4rLvgQEUvRhnKulBre3wya7jfQveKKc6XjfUrnm69IbDB.2my','workdays','Gascones',28064,'High School','Technical',0,'2009-08-10',NULL,NULL),(16,'olemiluis@gmail.com','Jose Angel','Contreras','647611807','2023-01-09','$2a$08$r2mSPko9u4Fh7nZUdxiT6.6CtAZTP3rWGhYqUZwqVfHwUS0poaVr.','','C/ Aire, 34',4628,'High School',NULL,1,'2023-01-02',NULL,'Es un fiera'),(17,'olemiluis2@gmail.com','Jose Angel','Contreras','647611807','2023-01-05','$2a$08$NHg0R2No6EKoAjOAHZKdBuRkOD8yESCz/jclvbT5Aie1a1Qf6V1Um','','C/ Aire, 34',4628,'',NULL,1,'2023-01-04',NULL,'asd'),(18,'olemiluis3@gmail.com','Jose Angel','Contreras','647611807','2023-01-07','$2a$08$YDZZ7oKdaphFz6BjSNK7N.nWq.srlEzxVU5weqHbNRc7vEYkMG/B2','','C/ Aire, 34',4628,'',NULL,1,'2023-01-14',NULL,'1214r5124'),(21,'olemiluis4@gmail.com','Jose','Contreras','647611807','2023-01-21','$2a$08$wGzBn.X9uCazCFScgBgHfeigb1xwpyG7G1LgZCJJwtHkFgBb9ljA2','workdays','C/ Río Guadiana, nº 76',4240,'No studies','Non-technical',0,'2023-01-03',NULL,'12asd123'),(23,'olemiluis10@hotmail.com','Diego','Perez','678701449','2022-09-28','$2a$08$eNBHTWsEq6E2FZuQmhkwne3gydo3FD6Cx/ASFhG248N1PivV61FeG','weekends','C/ Abajo 6',37002,'High School','Non-technical',1,'2023-01-25',NULL,'afsadfasfas'),(24,'voluntarioguapo@gmail.com','Jose Angel','Contreras Fernandez','647611807','1212-12-12','$2a$08$amohEBTRPFlr/1wSoPoSB.5TnG0CBXlacfkDG30O8cAq3lWjmWQB.','workdays','C/ Triana, 6, 2A',4628,'No studies','Non-technical',1,'2023-01-24',NULL,'es guapo'),(25,'guapo@gmail.com','Jose Angel','Contreras','647611807','2023-01-25','$2a$08$QbiVHqRpiy2eP42EgZlZROeOC0zIDICmMdb.7CBJB61VvAdqFdemu','workdays','C/ Aire, 34',4628,'No studies','Non-technical',1,'2023-01-17','1673615208975--IMG_20220522_143721.jpg','95184732');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03 12:42:59
