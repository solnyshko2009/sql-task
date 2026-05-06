-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: medical_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `families` (
  `family_id` int NOT NULL,
  `consanguineous_marriage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
INSERT INTO `families` VALUES (0,0),(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0);
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `partner_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` VALUES (1,'РДКБ'),(2,'ДГОИ'),(3,'НЦЗД'),(4,'МГНЦ');
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `family_id` int DEFAULT NULL,
  `partner_id` int DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phenotype` text,
  `inspected_diagnoses_mkb` text,
  `partner_card_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `family_id` (`family_id`),
  KEY `partner_id` (`partner_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`family_id`),
  CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (0,0,1,'Адам Арсеньевич Белов','XY','2017-11-12','ЗПРР, café au lait macules, café au lait macules','Q85.0','261/2018'),(1,0,1,'Богданова Элеонора Степановна','XX','1998-12-24','здоров',NULL,NULL),(2,0,1,'Рожков Мстислав Анатольевич','XY','1994-03-03','здоров',NULL,NULL),(3,1,2,'Лидия Николаевна Матвеева','XX','2018-05-24','ЗПРР, café au lait macules, сниженный интеллект','E84.0','2019000166'),(4,1,2,'Горшкова Анна Эльдаровна','XX','2000-03-19','здоров',NULL,NULL),(5,1,2,'Капитон Марсович Кулаков','XY','1988-05-27','здоров',NULL,NULL),(6,2,3,'г-жа Полякова Елизавета Робертовна','XX','2019-12-01','диабет, судороги, диабет','E70.0','2019/426'),(7,2,3,'Кира Кирилловна Суханова','XX','1991-09-22','здоров',NULL,NULL),(8,2,3,'г-н Дементьев Ульян Афанасьевич','XY','1998-05-11','здоров',NULL,NULL),(9,3,2,'Вероника Валентиновна Быкова','XX','2019-02-03','атаксия, иммунодефицит, диабет','G11.3','2020000756'),(10,3,2,'Лора Олеговна Сафонова','XX','1987-04-02','здоров',NULL,NULL),(11,3,2,'Гурий Гордеевич Дорофеев','XY','1982-01-16','здоров',NULL,NULL),(12,4,3,'Леонид Егорович Архипов','XY','2019-06-10','ЗПРР, липомы, сниженный интеллект','E70.0','2020/221'),(13,4,3,'Алина Ефимовна Веселова','XX','1998-11-30','здоров',NULL,NULL),(14,4,3,'Медведев Вадим Еремеевич','XY','1996-08-22','здоров',NULL,NULL),(15,5,2,'Богданов Матвей Артемьевич','XY','2017-12-10','телеэктазии, липомы, высокорослость','Q85.0','2018000438'),(16,5,2,'Лукия Егоровна Медведева','XX','1991-05-31','здоров',NULL,NULL),(17,5,2,'Котов Владимир Ааронович','XY','1996-12-25','здоров',NULL,NULL),(18,6,3,'Наина Ильинична Большакова','XX','2018-11-29','высокорослость, судороги, выпуклый лоб','E84.0','2020/608'),(19,6,3,'Моисеева Марина Филипповна','XX','1981-01-04','здоров',NULL,NULL),(20,6,3,'Уваров Остап Иосипович','XY','1997-08-21','здоров',NULL,NULL),(21,7,4,'Максимова Зинаида Семеновна','XX','2016-08-09','атаксия, высокорослость, ЗПРР','E70.0','2020/622'),(22,7,4,'Галина Юрьевна Рожкова','XX','1994-09-02','здоров',NULL,NULL),(23,7,4,'Федотов Леонтий Адрианович','XY','1994-09-13','здоров',NULL,NULL),(24,8,1,'Аникей Бенедиктович Громов','XY','2018-03-21','вязкая мокрота, диарея, экзема','E70.0','406/2018'),(25,8,1,'Никитина Екатерина Михайловна','XX','1984-05-03','здоров',NULL,NULL),(26,8,1,'Панкрат Федотович Афанасьев','XY','2000-01-29','здоров',NULL,NULL),(27,9,1,'Маркова Евгения Тимуровна','XX','2020-10-25','café au lait macules, сниженный интеллект, выпуклый лоб','Q85.0','363/2019'),(28,9,1,'Виноградова Евгения Васильевна','XX','1988-09-16','здоров',NULL,NULL),(29,9,1,'Вацлав Брониславович Щукин','XY','1995-12-05','здоров',NULL,NULL),(30,10,1,'Лапин Анатолий Фомич','XY','2018-04-21','высокорослость, судороги, сниженный интеллект','Q85.0','108/2019'),(31,10,1,'Валерия Руслановна Щукина','XX','1984-10-10','здоров',NULL,NULL),(32,10,1,'Пестов Рюрик Всеволодович','XY','2000-10-08','здоров',NULL,NULL),(33,11,4,'г-жа Рогова Нина Егоровна','XX','2017-02-16','вязкая мокрота, телеэктазии, крупный шишковатый череп','Q85.0','2018/378'),(34,11,4,'Раиса Ниловна Сергеева','XX','1984-04-14','здоров',NULL,NULL),(35,11,4,'Меркушев Илья Жанович','XY','1998-06-04','здоров',NULL,NULL),(36,12,1,'Епифан Арсеньевич Нестеров','XY','2017-08-14','атаксия, ЗПРР, телеэктазии','E70.0','924/2018'),(37,12,1,'Олимпиада Павловна Фомичева','XX','1982-08-05','здоров',NULL,NULL),(38,12,1,'Федотов Спартак Германович','XY','1981-09-19','здоров',NULL,NULL),(39,13,4,'Зуева Надежда Кузьминична','XX','2016-01-16','липомы, выпуклый лоб, липомы','Q87.2','2018/279'),(40,13,4,'Вера Игоревна Воронцова','XX','1990-08-08','здоров',NULL,NULL),(41,13,4,'Христофор Ермилович Брагин','XY','1984-03-06','здоров',NULL,NULL),(42,14,2,'Гордей Бориславович Смирнов','XY','2017-09-28','судороги, липомы, café au lait macules','Q87.3','2020000608'),(43,14,2,'Вероника Георгиевна Власова','XX','1983-04-25','здоров',NULL,NULL),(44,14,2,'Блохин Матвей Брониславович','XY','1989-08-23','здоров',NULL,NULL),(45,15,3,'Фёкла Геннадиевна Зиновьева','XX','2020-12-21','диарея, экзема, судороги','E70.0','2020/306'),(46,15,3,'Ираида Яковлевна Логинова','XX','1998-06-14','здоров',NULL,NULL),(47,15,3,'Радислав Евсеевич Кошелев','XY','1987-01-08','здоров',NULL,NULL),(48,16,4,'Мартьян Иосифович Самойлов','XY','2017-06-08','диабет, высокорослость, крупный шишковатый череп','Q85.0','2018/516'),(49,16,4,'Наина Ивановна Крюкова','XX','2000-01-24','здоров',NULL,NULL),(50,16,4,'Савва Зиновьевич Соболев','XY','1988-03-13','здоров',NULL,NULL),(51,17,4,'Наталья Георгиевна Архипова','XX','2018-09-05','диабет, café au lait macules, липомы','E70.0','2020/975'),(52,17,4,'Евдокия Львовна Орлова','XX','1983-09-16','здоров',NULL,NULL),(53,17,4,'Родионов Антип Валерьянович','XY','1996-08-05','здоров',NULL,NULL),(54,18,1,'Блинов Михей Трофимович','XY','2019-05-24','экзема, выпуклый лоб, телеэктазии','E70.0','621/2018'),(55,18,1,'Валерия Ивановна Ефремова','XX','1982-04-07','здоров',NULL,NULL),(56,18,1,'Корнилов Эрнест Филимонович','XY','2000-08-26','здоров',NULL,NULL),(57,19,2,'Рожкова Виктория Геннадиевна','XX','2018-03-21','ЗПРР, диарея, диабет','G11.3','2020000135'),(58,19,2,'Маргарита Богдановна Шубина','XX','1998-02-11','здоров',NULL,NULL),(59,19,2,'Максимов Никандр Ефремович','XY','1986-05-19','здоров',NULL,NULL),(60,20,1,'Агата Юльевна Одинцова','XX','2017-05-03','судороги, атаксия, атаксия','E70.0','438/2020'),(61,20,1,'Петухова Ия Харитоновна','XX','1992-10-14','здоров',NULL,NULL),(62,20,1,'Артемьев Никита Владленович','XY','1991-07-15','здоров',NULL,NULL),(63,21,1,'Гусева Акулина Оскаровна','XX','2020-05-16','ЗПРР, атаксия, вязкая мокрота','E70.0','532/2018'),(64,21,1,'Гришина Акулина Матвеевна','XX','1983-07-21','здоров',NULL,NULL),(65,21,1,'Третьяков Вячеслав Борисович','XY','1989-11-21','здоров',NULL,NULL),(66,22,2,'Субботин Виктор Феодосьевич','XY','2019-11-22','телеэктазии, café au lait macules, диарея','E70.0','2020000201'),(67,22,2,'Наталья Болеславовна Петрова','XX','1989-11-03','здоров',NULL,NULL),(68,22,2,'Некрасов Харлампий Зиновьевич','XY','1998-02-16','здоров',NULL,NULL),(69,23,1,'Крюков Арефий Даниилович','XY','2016-03-09','липомы, ЗПРР, судороги','Q85.0','556/2018'),(70,23,1,'Беляева Мария Аркадьевна','XX','1988-07-15','здоров',NULL,NULL),(71,23,1,'Панов Владилен Ильич','XY','1993-06-21','здоров',NULL,NULL),(72,24,4,'Калашникова Алевтина Харитоновна','XX','2019-08-11','судороги, крупный шишковатый череп, диарея','Q85.0','2020/763'),(73,24,4,'Моисеева Лариса Ждановна','XX','1984-09-07','здоров',NULL,NULL),(74,24,4,'Власов Карп Бориславович','XY','1982-01-04','здоров',NULL,NULL),(75,25,3,'Платон Юлианович Фокин','XY','2020-05-22','телеэктазии, ЗПРР, выпуклый лоб','G11.3','2018/513'),(76,25,3,'Лихачева Валерия Станиславовна','XX','1996-11-30','здоров',NULL,NULL),(77,25,3,'Иларион Ааронович Панфилов','XY','1986-02-12','здоров',NULL,NULL),(78,26,4,'Воробьева Ульяна Юрьевна','XX','2019-02-17','ЗПРР, диабет, café au lait macules','Q87.2','2018/565'),(79,26,4,'Владимирова Елизавета Леонидовна','XX','1992-01-24','здоров',NULL,NULL),(80,26,4,'Глеб Брониславович Агафонов','XY','1985-10-17','здоров',NULL,NULL),(81,27,4,'Афанасьева Нина Степановна','XX','2017-06-29','иммунодефицит, сниженный интеллект, диабет','G11.3','2018/195'),(82,27,4,'Лазарева Лариса Руслановна','XX','1987-07-02','здоров',NULL,NULL),(83,27,4,'Арефий Ермолаевич Медведев','XY','1981-03-02','здоров',NULL,NULL),(84,28,4,'Волкова Юлия Геннадиевна','XX','2016-10-26','высокорослость, липомы, сниженный интеллект','G11.3','2020/128'),(85,28,4,'Корнилова Дарья Тарасовна','XX','1982-02-05','здоров',NULL,NULL),(86,28,4,'Миронов Ян Ярославович','XY','1983-04-17','здоров',NULL,NULL),(87,29,1,'Лаврентьева Василиса Романовна','XX','2019-09-13','иммунодефицит, судороги, вязкая мокрота','E70.0','504/2019'),(88,29,1,'Крюкова Иванна Львовна','XX','1994-01-12','здоров',NULL,NULL),(89,29,1,'Филиппов Мокей Аверьянович','XY','1992-11-04','здоров',NULL,NULL),(90,30,4,'Севастьян Архипович Кулаков','XY','2020-12-06','диабет, выпуклый лоб, высокорослость','E70.0','2019/527'),(91,30,4,'Евпраксия Вадимовна Дмитриева','XX','1985-05-06','здоров',NULL,NULL),(92,30,4,'г-н Афанасьев Феликс Анисимович','XY','1981-11-29','здоров',NULL,NULL),(93,31,3,'Полина Степановна Осипова','XX','2019-05-23','диабет, атаксия, крупный шишковатый череп','Q87.2','2020/686'),(94,31,3,'Горбачева Евфросиния Эльдаровна','XX','1983-08-07','здоров',NULL,NULL),(95,31,3,'Вацлав Изотович Воронов','XY','1986-03-07','здоров',NULL,NULL),(96,32,3,'Викентий Авдеевич Никонов','XY','2017-08-09','атаксия, судороги, телеэктазии','Q87.2','2020/675'),(97,32,3,'Маргарита Валериевна Князева','XX','1994-04-13','здоров',NULL,NULL),(98,32,3,'Ермил Арсенович Нестеров','XY','1989-09-01','здоров',NULL,NULL),(99,33,1,'Васильева Вера Архиповна','XX','2020-06-03','судороги, судороги, телеэктазии','Q85.0','255/2020'),(100,33,1,'Елисеева Клавдия Владимировна','XX','1985-05-02','здоров',NULL,NULL),(101,33,1,'Стрелков Гордей Владиленович','XY','1984-04-29','здоров',NULL,NULL),(102,34,2,'Прохорова Акулина Викторовна','XX','2016-07-28','судороги, café au lait macules, ЗПРР','E84.0','2018000868'),(103,34,2,'Ермакова Евгения Вячеславовна','XX','1981-01-19','здоров',NULL,NULL),(104,34,2,'Спиридон Федосьевич Ефремов','XY','1989-06-23','здоров',NULL,NULL),(105,35,2,'Панова Фёкла Яковлевна','XX','2019-04-26','сниженный интеллект, экзема, экзема','Q85.0','2019000582'),(106,35,2,'Варвара Сергеевна Никонова','XX','1989-01-31','здоров',NULL,NULL),(107,35,2,'Коновалов Феофан Григорьевич','XY','1988-06-19','здоров',NULL,NULL),(108,36,2,'Прасковья Аскольдовна Быкова','XX','2017-09-30','липомы, вязкая мокрота, судороги','E70.0','2018000333'),(109,36,2,'Клавдия Васильевна Брагина','XX','1985-01-07','здоров',NULL,NULL),(110,36,2,'Спартак Вилорович Борисов','XY','1982-01-20','здоров',NULL,NULL),(111,37,2,'Валерия Афанасьевна Алексеева','XX','2019-05-10','судороги, café au lait macules, судороги','Q85.0','2019000700'),(112,37,2,'Василиса Сергеевна Белова','XX','1996-09-02','здоров',NULL,NULL),(113,37,2,'Харитонов Антип Тарасович','XY','1999-01-05','здоров',NULL,NULL),(114,38,2,'Соболева Мария Болеславовна','XX','2016-12-07','экзема, судороги, судороги','Q87.3','2019000735'),(115,38,2,'Мария Ильинична Назарова','XX','1993-02-24','здоров',NULL,NULL),(116,38,2,'Никонов Степан Трофимович','XY','1986-12-09','здоров',NULL,NULL),(117,39,4,'Марина Валериевна Мамонтова','XX','2018-10-13','диарея, судороги, ЗПРР','Q85.0','2018/724'),(118,39,4,'Виктория Натановна Сазонова','XX','1982-09-20','здоров',NULL,NULL),(119,39,4,'Остап Иосифович Денисов','XY','1984-08-11','здоров',NULL,NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samples`
--

DROP TABLE IF EXISTS `samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samples` (
  `sample_id` int NOT NULL,
  `internal_lab_id` varchar(50) DEFAULT NULL,
  `partner_sample_id` varchar(50) DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `sequencing_type` varchar(20) DEFAULT NULL,
  `receiving_date` date DEFAULT NULL,
  `sequencing_date` date DEFAULT NULL,
  `analysis_date` date DEFAULT NULL,
  `biobank` varchar(100) DEFAULT NULL,
  `result_delivery_date` date DEFAULT NULL,
  `run_id` int DEFAULT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `patient_id` (`patient_id`),
  KEY `run_id` (`run_id`),
  CONSTRAINT `samples_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `samples_ibfk_2` FOREIGN KEY (`run_id`) REFERENCES `sequencing_runs` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samples`
--

LOCK TABLES `samples` WRITE;
/*!40000 ALTER TABLE `samples` DISABLE KEYS */;
INSERT INTO `samples` VALUES (1,'1f42b240-c447-4dad-9a50-5584647d2af6','0',0,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0011-MinION/0',NULL,1),(2,'959e1f7b-f56f-45c2-811b-93cd13165a11','1',1,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0003-MinION/1',NULL,2),(3,'7f4c5661-5230-4c27-870d-58d41338fb3c','2',2,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MinION/2',NULL,3),(4,'cd72a6b2-d7d5-4ed6-b3bd-c8444de06347','3',3,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0009-MinION/3',NULL,4),(5,'76260224-87f1-4080-b722-47c3fbafdb81','4',4,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0009-MinION/4',NULL,4),(6,'4d6b958b-3c2a-4e1c-bd6f-ab02f860862e','5',5,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0014-MinION/5',NULL,5),(7,'00c427a5-3059-403e-a768-8fdb4d9af592','6',6,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0003-MiSeq/6',NULL,6),(8,'105c17b8-a19f-4c8e-b853-90edb6d6a461','7',7,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0007-MiSeq/7',NULL,7),(9,'9171932e-2e10-4868-ad8d-327d83f8fcd9','8',8,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0008-MiSeq/8',NULL,8),(10,'24d4679f-f3c0-454f-91d8-8af970fe2636','9',9,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MinION/9',NULL,9),(11,'09d0ea7d-84a5-4679-bc84-c13a83f3e505','10',10,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0013-MinION/10',NULL,10),(12,'a1c613e7-a6d4-40ad-8314-afc2640c3e7a','11',11,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0014-MinION/11',NULL,5),(13,'13139ed1-59e0-4782-a31d-4f91986ccf01','12',12,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0005-MiSeq/12',NULL,11),(14,'aa5d1728-bb06-4d94-bd2c-89984b60e18b','13',13,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0011-MiSeq/13',NULL,12),(15,'76fc6160-8641-4937-ad0f-7a8b13ce2203','14',14,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0007-MiSeq/14',NULL,13),(16,'14dd07fb-88af-4a16-9c27-ec6e558380de','15',15,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0014-MiSeq/15',NULL,14),(17,'8f4f2214-3ff9-466c-8123-2bde08dc9503','16',16,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0014-MiSeq/16',NULL,14),(18,'3c390ebe-8466-4cd9-a7ae-2b0d028b1a17','17',17,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MiSeq/17',NULL,15),(19,'3c20464d-3c79-49cb-a49f-7f9a7c775f84','18',18,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MinION/18',NULL,3),(20,'8ee10c42-6a4c-46a7-92bb-80f74345958e','19',19,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0010-MinION/19',NULL,16),(21,'b16cd505-f86a-4218-938d-9ecb94b40bc8','20',20,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MinION/20',NULL,17),(22,'d6f31581-f7bb-49d2-84b3-35ca9beb814f','21',21,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0013-MinION/21',NULL,10),(23,'41af294b-d10e-4321-99f2-6c94ab6b0082','22',22,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0009-MinION/22',NULL,18),(24,'9ca4baba-d934-4231-b4c8-afea94bd4394','23',23,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0006-MinION/23',NULL,19),(25,'e2cb0b95-3dc5-4d93-8235-26ab3467929c','24',24,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0002-MiSeq/24',NULL,20),(26,'e9a4e730-74c9-474c-84a1-c6cb7e79d072','25',25,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0013-MiSeq/25',NULL,21),(27,'2562e6e4-6286-4a36-a5f6-badf98f14646','26',26,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0015-MiSeq/26',NULL,22),(28,'08511be5-9956-45e1-8339-9a8b311d9b86','27',27,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0006-MiSeq/27',NULL,23),(29,'d719710a-9f8c-4d91-9e95-e6b9c7fb7a0b','28',28,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0007-MiSeq/28',NULL,24),(30,'958702ce-9e4b-40fe-92d8-f6b73b25556d','29',29,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0006-MiSeq/29',NULL,25),(31,'5b2c77bd-9199-4f64-9295-da39749f5f21','30',30,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0008-MiSeq/30',NULL,8),(32,'2ca050e4-71a1-4298-80dd-4e3452b205f4','31',31,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0008-MiSeq/31',NULL,26),(33,'44069b0d-da9c-479c-84fb-37bcfa3ebb5b','32',32,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0003-MiSeq/32',NULL,27),(34,'d77d8102-26fc-43a1-b062-bd0afaff47af','33',33,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MiSeq/33',NULL,28),(35,'ed3db557-a88d-4f3c-9fac-6e717d751408','34',34,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0008-MiSeq/34',NULL,8),(36,'4a5651ea-2aa6-4d44-86a2-9d072f881800','35',35,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0008-MiSeq/35',NULL,8),(37,'8341e6b4-17ba-4c2f-9fb6-e063c4696204','36',36,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0007-MinION/36',NULL,29),(38,'b02a186b-a741-4511-93bc-77a9e8e0ccec','37',37,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0004-MinION/37',NULL,30),(39,'100cf9cc-0b75-4409-b6d4-d0d40104967a','38',38,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MinION/38',NULL,3),(40,'d93f70f5-bbd6-4360-9fd0-2e6cd4ea3b14','39',39,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0004-MiSeq/39',NULL,31),(41,'7c5fb59b-1705-4d6b-914a-1ff4639e40d8','40',40,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0008-MiSeq/40',NULL,26),(42,'97e617d6-d7e4-419e-9c84-65d4c537a44f','41',41,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0015-MiSeq/41',NULL,32),(43,'d93d03e6-6e18-44d4-b5a0-6e3c8677b1b5','42',42,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0006-MiSeq/42',NULL,23),(44,'160172d2-bdd2-4eee-94b9-771559eeac7e','43',43,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0009-MiSeq/43',NULL,33),(45,'0830296d-2591-47c3-bed5-a396f7a546f1','44',44,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0002-MiSeq/44',NULL,34),(46,'0b634461-6588-479d-a7bc-f1842ae47c29','45',45,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MinION/45',NULL,35),(47,'82cdc0f5-12ef-4367-b6c2-39598184f4da','46',46,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0013-MinION/46',NULL,36),(48,'7ce1d071-a3b0-4e03-8dfe-2011a367a423','47',47,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0012-MinION/47',NULL,37),(49,'d4cfa44e-7008-4c73-af50-9d8d01d891d4','48',48,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0003-MiSeq/48',NULL,6),(50,'8f6483e5-a44a-46cd-92e2-919a37821ed9','49',49,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0011-MiSeq/49',NULL,12),(51,'e7af9f63-9f3f-428b-b09e-06146c0e237d','50',50,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0007-MiSeq/50',NULL,13),(52,'4e5c224c-0a13-4ad2-b0d7-70ae19c5b39d','51',51,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0009-MiSeq/51',NULL,33),(53,'50771726-4591-4cd7-b0d5-fe3fe7ac099c','52',52,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0012-MiSeq/52',NULL,38),(54,'d657a454-f916-41cb-a63b-1448f6781e42','53',53,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0007-MiSeq/53',NULL,24),(55,'5818543b-6fd9-4d9a-b446-17ca2f3da769','54',54,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MiSeq/54',NULL,39),(56,'6b9e2055-9ae6-4a36-919c-c558923423d7','55',55,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0004-MiSeq/55',NULL,40),(57,'5e069ce6-2b4f-4776-9525-7e8536c665b1','56',56,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0013-MiSeq/56',NULL,41),(58,'dad1cbb0-c2e2-46b7-baea-69a79a4b720c','57',57,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0014-MiSeq/57',NULL,14),(59,'831b63ee-0243-43b7-b9dc-e205139555f2','58',58,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0015-MiSeq/58',NULL,22),(60,'a6b718b0-02a8-46cb-ae25-11c1998ad7d0','59',59,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MiSeq/59',NULL,42),(61,'9f3c1fbd-9bba-48ac-8bed-26d674062804','60',60,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MinION/60',NULL,9),(62,'d195278f-2609-423e-97ee-6307020bd1b6','61',61,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0005-MinION/61',NULL,43),(63,'1316e3f0-8ec3-4912-9f35-dc08e594c513','62',62,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0014-MinION/62',NULL,44),(64,'e566ec17-118b-4f54-9d7c-2ea14aa34580','63',63,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0010-MiSeq/63',NULL,45),(65,'9d64d802-ae6a-42c2-a04f-252220ec611f','64',64,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0005-MiSeq/64',NULL,11),(66,'4deddab5-c221-45d7-8f95-6ad3f3f8ccf9','65',65,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MiSeq/65',NULL,39),(67,'e8dd2845-1fdc-4a73-b92f-b5ab837d4c49','66',66,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0013-MinION/66',NULL,36),(68,'0cc942d8-d87b-4ac7-a610-ead12a3a8e5a','67',67,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0003-MinION/67',NULL,46),(69,'134a33e4-4dc5-4716-b9be-a071f18c6819','68',68,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0015-MinION/68',NULL,47),(70,'71cfed47-b7c5-4da5-a70d-30ddb4420268','69',69,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MiSeq/69',NULL,28),(71,'2b6a44b1-2f6c-4a1b-8539-adbf6d3c85ab','70',70,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0006-MiSeq/70',NULL,23),(72,'22696474-d1ed-4c91-b7ff-b7f763a2a9b2','71',71,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0006-MiSeq/71',NULL,25),(73,'98ee2d76-57fe-4768-b877-52179c155b07','72',72,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0005-MiSeq/72',NULL,48),(74,'0286ad9d-76a2-485d-b07a-633b66777607','73',73,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0008-MiSeq/73',NULL,49),(75,'c3db42c5-5000-4213-b35c-4f7b0b1d4e4d','74',74,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0008-MiSeq/74',NULL,26),(76,'05a293f5-b5e8-4aeb-a6a8-55af368a9261','75',75,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MinION/75',NULL,17),(77,'0519aa4b-5584-4a80-a586-e3d62dc1106a','76',76,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0005-MinION/76',NULL,43),(78,'509886c5-a5a8-47ca-826d-e6eb9db3eafc','77',77,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MinION/77',NULL,3),(79,'b3e6471d-1f25-4e94-a9ff-9b8d5b8f308b','78',78,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0007-MiSeq/78',NULL,24),(80,'9739a859-5a48-4cc0-8863-5a06c7bc6dc6','79',79,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0009-MiSeq/79',NULL,50),(81,'23c9fec6-2572-4a6b-a86b-ee2a6cd4d929','80',80,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0006-MiSeq/80',NULL,23),(82,'075aacf4-fac9-4ed2-adad-f0fb971fa886','81',81,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0010-MinION/81',NULL,16),(83,'7b9fbae5-ed62-4354-94bf-051a2cb26c1e','82',82,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MinION/82',NULL,9),(84,'cf7c1fab-f61c-4621-906c-c845cca0d75b','83',83,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MinION/83',NULL,17),(85,'3281b581-b7fb-4383-b417-342eee6e68b7','84',84,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0011-MinION/84',NULL,51),(86,'83ecfed4-9102-4d82-ba4e-efbc89166c27','85',85,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0011-MinION/85',NULL,52),(87,'71157ca6-e1fe-431a-8a38-ea1c809386dd','86',86,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0010-MinION/86',NULL,17),(88,'9ece3872-20d7-4d94-bb00-129f05d0733b','87',87,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0006-MiSeq/87',NULL,25),(89,'240a4b98-143e-4896-888e-c7dad9bdf3c3','88',88,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0007-MiSeq/88',NULL,24),(90,'adfb74de-af75-45c9-a7cf-112dd1edddb1','89',89,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0003-MiSeq/89',NULL,6),(91,'0576c7c2-2151-4783-8b99-2af65f7faef2','90',90,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0002-MiSeq/90',NULL,34),(92,'6e424c68-6b6a-4b4c-9670-82d3cc5bbf7a','91',91,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0011-MiSeq/91',NULL,53),(93,'ebef41a0-5d88-4b90-ac10-e3ce87a1fa4c','92',92,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0011-MiSeq/92',NULL,53),(94,'df68a33b-4035-4c62-82d8-915f685c256e','93',93,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0011-MiSeq/93',NULL,12),(95,'87a70e18-0fc1-4243-8f32-8d086a09ee28','94',94,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0013-MiSeq/94',NULL,21),(96,'2acf712c-2a3e-44fb-8036-1ac156122023','95',95,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MiSeq/95',NULL,39),(97,'d2b07128-720c-4d14-8b64-8a431c0bf286','96',96,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0012-MiSeq/96',NULL,38),(98,'115b058a-04a1-4e18-9e74-9ef3c9794ac9','97',97,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MiSeq/97',NULL,39),(99,'677fc93d-229f-4523-8ddc-a2de1bc7c4c2','98',98,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0009-MiSeq/98',NULL,33),(100,'831d6b4c-ddd3-4a38-9989-e3389f23de43','99',99,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0008-MiSeq/99',NULL,49),(101,'98b5b0f2-5703-4e31-a6bd-e76ddfe878e0','100',100,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0006-MiSeq/100',NULL,54),(102,'4a228f32-44ab-4a8c-9b31-bd935ed125ac','101',101,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0014-MiSeq/101',NULL,55),(103,'1cecb1c9-304d-43e4-85c6-e7abcef6b0e8','102',102,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0006-MiSeq/102',NULL,25),(104,'c64249f6-3220-4057-b64b-def7d2de7afe','103',103,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0008-MiSeq/103',NULL,26),(105,'68ed1a7d-4607-40d1-b5fd-4b3f1aadbfdb','104',104,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0015-MiSeq/104',NULL,22),(106,'adfddd0b-ca3a-45a6-a387-764e9aa94380','105',105,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0007-MinION/105',NULL,56),(107,'f83fd287-5812-4f81-92af-14b0373d451d','106',106,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0010-MinION/106',NULL,16),(108,'9eee625a-e5fd-499f-b801-e9c024a4f98f','107',107,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0004-MinION/107',NULL,30),(109,'054473c9-0f61-4ec4-a605-7a39bd319a4c','108',108,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0010-MiSeq/108',NULL,42),(110,'71f27c8a-b08b-40c7-86ba-c4bfc3ce818f','109',109,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0004-MiSeq/109',NULL,31),(111,'c63f32b1-eb62-467d-ab9a-ab570f236909','110',110,'WGS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0004-MiSeq/110',NULL,31),(112,'f69855e1-73dc-4131-b5df-489a3bf5563b','111',111,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0010-MiSeq/111',NULL,45),(113,'42e935ea-4be0-49d5-9b3c-57214d998aac','112',112,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2024/2024-0009-MiSeq/112',NULL,33),(114,'1764b866-b527-4738-bf90-6d1cd1477d10','113',113,'WGBS',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0009-MiSeq/113',NULL,39),(115,'4c56928e-c6b2-4184-82ea-110e288c8bff','114',114,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0002-MinION/114',NULL,57),(116,'4649773c-5747-4665-82c1-c0f09d70d285','115',115,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0015-MinION/115',NULL,58),(117,'5c09cec0-9ad2-4303-81ae-8f2259e52c5d','116',116,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MinION/116',NULL,9),(118,'ce5d83b2-fd5a-4180-a34a-4d6f4218149b','117',117,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2022/2022-0009-MinION/117',NULL,4),(119,'3ab1eaa3-3dc4-43e2-820f-0bbb8dc10b29','118',118,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0001-MinION/118',NULL,59),(120,'d325398a-9ca5-403a-a3a5-a93c2e69bd73','119',119,'ONT',NULL,NULL,NULL,'/mnt/ceph1/2023/2023-0012-MinION/119',NULL,9);
/*!40000 ALTER TABLE `samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequencing_runs`
--

DROP TABLE IF EXISTS `sequencing_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequencing_runs` (
  `run_id` int NOT NULL,
  `run_code` varchar(50) NOT NULL,
  PRIMARY KEY (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequencing_runs`
--

LOCK TABLES `sequencing_runs` WRITE;
/*!40000 ALTER TABLE `sequencing_runs` DISABLE KEYS */;
INSERT INTO `sequencing_runs` VALUES (1,'2022-0011-MinION'),(2,'2023-0003-MinION'),(3,'2023-0010-MinION'),(4,'2022-0009-MinION'),(5,'2022-0014-MinION'),(6,'2023-0003-MiSeq'),(7,'2022-0007-MiSeq'),(8,'2023-0008-MiSeq'),(9,'2023-0012-MinION'),(10,'2022-0013-MinION'),(11,'2024-0005-MiSeq'),(12,'2023-0011-MiSeq'),(13,'2023-0007-MiSeq'),(14,'2023-0014-MiSeq'),(15,'2023-0012-MiSeq'),(16,'2022-0010-MinION'),(17,'2024-0010-MinION'),(18,'2024-0009-MinION'),(19,'2024-0006-MinION'),(20,'2024-0002-MiSeq'),(21,'2022-0013-MiSeq'),(22,'2022-0015-MiSeq'),(23,'2024-0006-MiSeq'),(24,'2024-0007-MiSeq'),(25,'2023-0006-MiSeq'),(26,'2022-0008-MiSeq'),(27,'2024-0003-MiSeq'),(28,'2024-0010-MiSeq'),(29,'2023-0007-MinION'),(30,'2023-0004-MinION'),(31,'2024-0004-MiSeq'),(32,'2023-0015-MiSeq'),(33,'2024-0009-MiSeq'),(34,'2023-0002-MiSeq'),(35,'2023-0009-MinION'),(36,'2023-0013-MinION'),(37,'2022-0012-MinION'),(38,'2022-0012-MiSeq'),(39,'2023-0009-MiSeq'),(40,'2023-0004-MiSeq'),(41,'2023-0013-MiSeq'),(42,'2023-0010-MiSeq'),(43,'2023-0005-MinION'),(44,'2023-0014-MinION'),(45,'2022-0010-MiSeq'),(46,'2024-0003-MinION'),(47,'2022-0015-MinION'),(48,'2023-0005-MiSeq'),(49,'2024-0008-MiSeq'),(50,'2022-0009-MiSeq'),(51,'2024-0011-MinION'),(52,'2023-0011-MinION'),(53,'2022-0011-MiSeq'),(54,'2022-0006-MiSeq'),(55,'2022-0014-MiSeq'),(56,'2022-0007-MinION'),(57,'2023-0002-MinION'),(58,'2023-0015-MinION'),(59,'2023-0001-MinION');
/*!40000 ALTER TABLE `sequencing_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medical_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05 21:22:17
