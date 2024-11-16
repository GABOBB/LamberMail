-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: base_3
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `correos_recibidos`
--

DROP TABLE IF EXISTS `correos_recibidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correos_recibidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo_id` int NOT NULL,
  `texto` varbinary(255) DEFAULT NULL,
  `llave_encriptacion` varchar(255) NOT NULL,
  `correo_remitente` varchar(255) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `correos_recibidos_ibfk_1` (`correo_id`),
  CONSTRAINT `correos_recibidos_ibfk_1` FOREIGN KEY (`correo_id`) REFERENCES `usuarios2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos_recibidos`
--

LOCK TABLES `correos_recibidos` WRITE;
/*!40000 ALTER TABLE `correos_recibidos` DISABLE KEYS */;
INSERT INTO `correos_recibidos` VALUES (1,1,_binary 'Marc Guiu > Mbappe ','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:48:55'),(2,1,_binary 'Quien soy?','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:57:14'),(4,1,_binary 'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 00:30:24'),(6,5,_binary 'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 03:03:25'),(7,6,_binary 'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 21:18:54'),(12,18,_binary 'f|\Ô<Û¾¼\ç\"\n\\4\Ò3s-NPmVK\ZYJ#†<\Ðü°‚Ly=qQ\òW','2825,2100,601,1609,1544,304,1909,392,597,501,2578,2160,597,405,1859,2910,','Yerik@LamberMail.com','2024-11-15 18:35:31'),(13,18,_binary '§\î©\ßÌª££^\í‹%š\Ä<;\'lGKH\\Ä„G¦Á²¸\ì\Z\ì\ÎiŸ\Ã8zv+|r4/i=$y2','3041,1958,248,1696,1996,2923,1710,24,1713,2341,1802,2085,304,3123,1782,375,','Yerik@LamberMail.com','2024-11-15 18:54:49'),(14,18,_binary '´„­Ô®¹‰•c]¸O\ï\âW)_mkkjmlon','2285,1710,855,1578,1710,1998,1765,2857,1265,2041,1962,2382,180,2582,2140,1175,','Yerik@LamberMail.com','2024-11-15 19:29:22'),(15,18,_binary '\Ì`A,vŠæ¾“¦\Ù\÷$=1\Z	MMiki)}nbl.{','2790,1337,2558,1086,1853,1632,1629,2008,1615,2888,2897,2616,2241,3012,1096,325,','Yerik@LamberMail.com','2024-11-15 19:33:23'),(16,18,_binary ' t—¡^º£dŸ \ó•i%FT1j~7~}','3000,953,1211,375,2391,436,485,2576,2185,1629,855,2807,1609,2304,712,3023,','Yerik@LamberMail.com','2024-11-15 19:58:54'),(17,18,_binary 'ºTÀ\Ç1Œu¯\rŒo¡?\ZL','1710,1516,180,2546,457,1265,325,884,2008,1086,1730,1765,1853,1710,1387,557,','Yerik@LamberMail.com','2024-11-15 20:25:06'),(18,18,_binary '\ö¥Nyd¶˜uËŠn¥Õ¢\Ö\r\rSYGDDO\rü¦Rx6¼\Ë,‘n²Õ¦\É	GDYPFDvd*~','543,2185,205,2825,1726,2037,561,3041,2100,1017,2008,28,2304,457,392,1586,','Yerik@LamberMail.com','2024-11-15 21:46:01'),(19,20,_binary '¤¾›VN\Ä[|†š¾\'K','2257,1713,1840,1773,2170,1794,698,678,2138,1615,1519,207,2099,2557,28,2037,','Yerik@LamberMail.com','2024-11-15 22:09:28');
/*!40000 ALTER TABLE `correos_recibidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `contraseÃ±a` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario@example.com','mi_contraseÃ±a_secreta','2024-11-11 22:06:12');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios2`
--

DROP TABLE IF EXISTS `usuarios2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `contrasena` varbinary(255) DEFAULT NULL,
  `llave_encriptacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios2`
--

LOCK TABLES `usuarios2` WRITE;
/*!40000 ALTER TABLE `usuarios2` DISABLE KEYS */;
INSERT INTO `usuarios2` VALUES (1,'usuario@dominio.com',_binary 'contraseÃ±a_encriptada','llave_encriptacion_usuario'),(3,'usuario2@dominio.com',_binary 'contraseÃ±a_encriptada','llave_encriptacion_usuario'),(5,'nuevo_usuario@dominio.com',_binary 'nueva_contrasena_encriptada','llave_encriptacion_nueva'),(6,'Prueba@LamberMail.com',_binary 'nueva_contrasena_encriptada','llave_encriptacion_nueva'),(18,'Yerik@LamberMail.com',_binary '²7\Ð`6\õ}¢\ÚÊ¹\í}\×','375,99,1576,1730,161,1421,485,1972,2637,1260,3065,2194,2823,2101,1230,2341,'),(20,'gabriel@LamberMail.com',_binary '\õˆ87Ÿ¡\Þ\å	‡!…#’ ','896,2848,436,529,3012,1337,2860,2132,1840,0,2140,2557,2848,2825,485,501,');
/*!40000 ALTER TABLE `usuarios2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-15 19:08:04
