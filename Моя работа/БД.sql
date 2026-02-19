-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dem2026_1
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `orderID` int DEFAULT NULL,
  `productsID` varchar(6) DEFAULT NULL,
  `count` int DEFAULT NULL,
  KEY `orderID` (`orderID`),
  KEY `productsID` (`productsID`),
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`productsID`) REFERENCES `products` (`article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,'А112Т4',2),(1,'F635R4',2),(2,'H782T5',1),(2,'G783F5',1),(3,'J384T6',10),(3,'D572U8',10),(4,'F572H7',5),(4,'D329H3',4),(5,'А112Т4',2),(5,'F635R4',2),(6,'H782T5',1),(6,'G783F5',1),(8,'F572H7',5),(8,'D329H3',4),(9,'B320R5',5),(9,'G432E4',1),(10,'S213E3',5),(10,'E482R4',5);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `adressPvzID` int DEFAULT NULL,
  `clientID` int DEFAULT NULL,
  `codeToReceive` int DEFAULT NULL,
  `statusOrder` enum('Новый','Завершен') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adressPvzID` (`adressPvzID`),
  KEY `clientID` (`clientID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`adressPvzID`) REFERENCES `pvz` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`clientID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,4,901,'Завершен'),(2,'2022-09-28','2025-04-21',11,1,902,'Завершен'),(3,'2025-03-21','2025-04-22',2,2,903,'Завершен'),(4,'2025-02-20','2025-04-23',11,3,904,'Завершен'),(5,'2025-03-17','2025-04-24',2,4,905,'Завершен'),(6,'2025-03-01','2025-04-25',15,1,906,'Завершен'),(8,'2025-03-31','2025-04-27',19,3,908,'Новый'),(9,'2025-04-02','2025-04-28',5,4,909,'Новый'),(10,'2025-04-03','2025-04-29',19,4,910,'Новый');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Alessio Nesca'),(2,'CROSBY'),(3,'Kari'),(4,'Marco Tozzi'),(5,'Rieker'),(6,'Рос');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `article` varchar(6) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `supplierID` int DEFAULT NULL,
  `producerID` int DEFAULT NULL,
  `productCategory` enum('Женская обувь','Мужская обувь') DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `photoName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`article`),
  KEY `supplierID` (`supplierID`),
  KEY `producerID` (`producerID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`producerID`) REFERENCES `producer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('B320R5','Туфли','шт.',4300,1,5,'Женская обувь',2,6,'Туфли 5 женские демисезонные, размер 41, цвет коричневый','9.jpg'),('B431R5','Ботинки','шт.',2700,2,5,'Мужская обувь',2,5,'Мужские кожаные ботинки/мужские ботинки',''),('C436G5','Ботинки зимние','кг',100,4,2,'Мужская обувь',20,100,'Ботинки зимние, ARGO, размер 47','попугай.jpg'),('D268G5','Туфли','шт.',4399,2,5,'Женская обувь',3,12,'Туфли 5 женские демисезонные, размер 36, цвет коричневый',''),('D329H3','Полуботинки','шт.',1890,2,1,'Женская обувь',4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый','8.jpg'),('D364R4','Туфли','шт.',12400,1,3,'Женская обувь',16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши',''),('D572U8','К6совки','шт.',4100,2,6,'Мужская обувь',3,6,'129615-4 К6совки мужские','6.jpg'),('E482R4','Полуботинки','шт.',1800,1,3,'Женская обувь',2,14,'Полуботинки 3 женские MYZ20S-149, размер 41, цвет: черный',''),('F427R5','Ботинки','шт.',11800,2,5,'Женская обувь',15,11,'Ботинки на молнии с декоративной пряжкой FRAU',''),('F572H7','Туфли','шт.',2700,1,4,'Женская обувь',2,14,'Туфли 4 женские летние, размер 39, цвет черный','7.jpg'),('F635R4','Ботинки','шт.',3244,2,4,'Женская обувь',2,13,'Ботинки 4 женские демисезонные, размер 39, цвет бежевый','2.jpg'),('G432E4','Туфли','шт.',2800,1,3,'Женская обувь',3,15,'Туфли 3 женские TR-YR-413017, размер 37, цвет: черный','10.jpg'),('G531F4','Ботинки','шт.',6600,1,3,'Женская обувь',12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный',''),('G783F5','Ботинки','шт.',5900,1,6,'Мужская обувь',2,8,'Мужские ботинки 6-Обувь кожаные с натуральным мехом','4.jpg'),('H535R5','Ботинки','шт.',2300,2,5,'Женская обувь',2,7,'Женские Ботинки демисезонные',''),('H782T5','Туфли','шт.',4499,1,3,'Мужская обувь',4,5,'Туфли 3 мужские классика MYZ21AW-450A, размер 43, цвет: черный','3.jpg'),('J384T6','Ботинки','шт.',3800,2,5,'Мужская обувь',2,16,'B3430/14 Полуботинки мужские 5','5.jpg'),('J542F5','Тапочки','шт.',500,1,3,'Мужская обувь',13,0,'Тапочки мужские Арт.70701-55-67син р.41',''),('K345R4','Полуботинки','шт.',2100,2,2,'Мужская обувь',2,3,'407700/01-02 Полуботинки мужские 2',''),('K358H6','Тапочки','шт.',599,1,5,'Мужская обувь',20,2,'Тапочки мужские син р.41',''),('L754R4','Полуботинки','шт.',1700,1,3,'Женская обувь',2,7,'Полуботинки 3 женские WB2020SS-26, размер 38, цвет: черный',''),('M542T5','К6совки','шт.',2800,2,5,'Мужская обувь',18,3,'К6совки мужские TOFA',''),('N457T5','Полуботинки','шт.',4600,1,2,'Женская обувь',3,13,'Полуботинки Ботинки черные зимние, мех',''),('O754F4','Туфли','шт.',5400,2,5,'Женская обувь',4,18,'Туфли женские демисезонные 5 артикул 55073-68/37',''),('P764G4','Туфли','шт.',6800,1,2,'Женская обувь',15,15,'Туфли женские, ARGO, размер 38',''),('S213E3','Полуботинки','шт.',2156,2,2,'Мужская обувь',3,6,'407700/01-01 Полуботинки мужские 2',''),('S326R5','Тапочки','шт.',9900,2,2,'Мужская обувь',17,15,'Мужские кожаные тапочки \"Профиль С.Дали\"\" \"',''),('S634B5','Кеды','шт.',5500,2,2,'Мужская обувь',3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный',''),('T324F5','Сапоги','шт.',4699,1,2,'Женская обувь',2,5,'Сапоги замша Цвет: синий',''),('А112Т4','Ботинки','шт.',4990,1,3,'Женская обувь',3,6,'Женские Ботинки демисезонные 3','1.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvz`
--

DROP TABLE IF EXISTS `pvz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pvz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvz`
--

LOCK TABLES `pvz` WRITE;
/*!40000 ALTER TABLE `pvz` DISABLE KEYS */;
INSERT INTO `pvz` VALUES (1,'420151, г. Лесной, ул. Вишневая, 32'),(2,'125061, г. Лесной, ул. Подгорная, 8'),(3,'630370, г. Лесной, ул. Шоссейная, 24'),(4,'400562, г. Лесной, ул. Зеленая, 32'),(5,'614510, г. Лесной, ул. Маяковского, 47'),(6,'410542, г. Лесной, ул. Светлая, 46'),(7,'620839, г. Лесной, ул. Цветочная, 8'),(8,'443890, г. Лесной, ул. Коммунистическая, 1'),(9,'603379, г. Лесной, ул. Спортивная, 46'),(10,'603721, г. Лесной, ул. Гоголя, 41'),(11,'410172, г. Лесной, ул. Северная, 13'),(12,'614611, г. Лесной, ул. Молодежная, 50'),(13,'454311, г.Лесной, ул. Новая, 19'),(14,'660007, г.Лесной, ул. Октябрьская, 19'),(15,'603036, г. Лесной, ул. Садовая, 4'),(16,'394060, г.Лесной, ул. Фрунзе, 43'),(17,'410661, г. Лесной, ул. Школьная, 50'),(18,'625590, г. Лесной, ул. Коммунистическая, 20'),(19,'625683, г. Лесной, ул. 8 Марта'),(20,'450983, г.Лесной, ул. Комсомольская, 26'),(21,'394782, г. Лесной, ул. Чехова, 3'),(22,'603002, г. Лесной, ул. Дзержинского, 28'),(23,'450558, г. Лесной, ул. Набережная, 30'),(24,'344288, г. Лесной, ул. Чехова, 1'),(25,'614164, г.Лесной,  ул. Степная, 30'),(26,'394242, г. Лесной, ул. Коммунистическая, 43'),(27,'660540, г. Лесной, ул. Солнечная, 25'),(28,'125837, г. Лесной, ул. Шоссейная, 40'),(29,'125703, г. Лесной, ул. Партизанская, 49'),(30,'625283, г. Лесной, ул. Победы, 46'),(31,'614753, г. Лесной, ул. Полевая, 35'),(32,'426030, г. Лесной, ул. Маяковского, 44'),(33,'450375, г. Лесной ул. Клубная, 44'),(34,'625560, г. Лесной, ул. Некрасова, 12'),(35,'630201, г. Лесной, ул. Комсомольская, 17'),(36,'190949, г. Лесной, ул. Мичурина, 26');
/*!40000 ALTER TABLE `pvz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (5,''),(4,'Guess'),(1,'Kari'),(3,'Kari Kids'),(6,'ty'),(9,'ам'),(10,'в'),(11,'е'),(7,'к'),(2,'Обувь для вас'),(8,'п');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` enum('Администратор','Менеджер','Авторизированный клиент') DEFAULT NULL,
  `FIO` varchar(200) DEFAULT NULL,
  `login` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Администратор','Никифорова Весения Николаевна','94d5ous@gmail.com','uzWC67'),(2,'Администратор','Сазонов Руслан Германович','uth4iz@mail.com','2L6KZG'),(3,'Администратор','Одинцов Серафим Артёмович','yzls62@outlook.com','JlFRCZ'),(4,'Менеджер','Степанов Михаил Артёмович','1diph5e@tutanota.com','8ntwUp'),(5,'Менеджер','Ворсин Петр Евгеньевич','tjde7c@yahoo.com','YOyhfR'),(6,'Менеджер','Старикова Елена Павловна','wpmrc3do@tutanota.com','RSbvHv'),(7,'Авторизированный клиент','Михайлюк Анна Вячеславовна','5d4zbu@tutanota.com','rwVDh9'),(8,'Авторизированный клиент','Ситдикова Елена Анатольевна','ptec8ym@yahoo.com','LdNyos'),(9,'Авторизированный клиент','Ворсин Петр Евгеньевич','1qz4kw@mail.com','gynQMT'),(10,'Авторизированный клиент','Старикова Елена Павловна','4np6se@mail.com','AtnDjr');
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

-- Dump completed on 2026-02-19 15:28:34
