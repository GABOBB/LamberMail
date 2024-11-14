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
  `texto` text NOT NULL,
  `llave_encriptacion` varchar(255) NOT NULL,
  `correo_remitente` varchar(255) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `correos_recibidos_ibfk_1` (`correo_id`),
  CONSTRAINT `correos_recibidos_ibfk_1` FOREIGN KEY (`correo_id`) REFERENCES `usuarios2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos_recibidos`
--

LOCK TABLES `correos_recibidos` WRITE;
/*!40000 ALTER TABLE `correos_recibidos` DISABLE KEYS */;
INSERT INTO `correos_recibidos` VALUES (1,1,'Marc Guiu > Mbappe ','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:48:55'),(2,1,'Quien soy?','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:57:14'),(4,1,'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 00:30:24'),(6,5,'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 03:03:25'),(7,6,'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 21:18:54');
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
  `contrase√±a` varchar(255) NOT NULL,
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
INSERT INTO `usuarios` VALUES (1,'usuario@example.com','mi_contrase√±a_secreta','2024-11-11 22:06:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios2`
--

LOCK TABLES `usuarios2` WRITE;
/*!40000 ALTER TABLE `usuarios2` DISABLE KEYS */;
INSERT INTO `usuarios2` VALUES (1,'usuario@dominio.com',_binary 'contrase√±a_encriptada','llave_encriptacion_usuario'),(3,'usuario2@dominio.com',_binary 'contrase√±a_encriptada','llave_encriptacion_usuario'),(5,'nuevo_usuario@dominio.com',_binary 'nueva_contrasena_encriptada','llave_encriptacion_nueva'),(6,'Prueba@LamberMail.com',_binary 'nueva_contrasena_encriptada','llave_encriptacion_nueva'),(17,'Yerik@LamberMail.com',_binary '\ÙFCR§lèmt\"M\·px','1586,642,1086,615,1802,331,3086,2160,1337,2310,2546,3199,2790,155,2546,1107,');
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

-- Dump completed on 2024-11-13 23:40:38
