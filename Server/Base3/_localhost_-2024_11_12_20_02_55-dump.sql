-- MySQL dump 10.13  Distrib 8.4.3, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: 
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`,`Db`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','SistemaCorreo','josepa','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','nombre_base_datos','josepa','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','nombre_base_datos','usuario_remoto','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_roles`
--

LOCK TABLES `default_roles` WRITE;
/*!40000 ALTER TABLE `default_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` (`engine_name`, `device_type`, `cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('default',0,'io_block_read_cost',NULL,'2024-11-11 21:50:26',NULL),('default',0,'memory_block_read_cost',NULL,'2024-11-11 21:50:26',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_grants`
--

LOCK TABLES `global_grants` WRITE;
/*!40000 ALTER TABLE `global_grants` DISABLE KEYS */;
INSERT INTO `global_grants` VALUES ('mysql.infoschema','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.infoschema','localhost','FIREWALL_EXEMPT','N'),('mysql.infoschema','localhost','SYSTEM_USER','N'),('mysql.session','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.session','localhost','AUTHENTICATION_POLICY_ADMIN','N'),('mysql.session','localhost','BACKUP_ADMIN','N'),('mysql.session','localhost','CLONE_ADMIN','N'),('mysql.session','localhost','CONNECTION_ADMIN','N'),('mysql.session','localhost','FIREWALL_EXEMPT','N'),('mysql.session','localhost','PERSIST_RO_VARIABLES_ADMIN','N'),('mysql.session','localhost','SESSION_VARIABLES_ADMIN','N'),('mysql.session','localhost','SYSTEM_USER','N'),('mysql.session','localhost','SYSTEM_VARIABLES_ADMIN','N'),('mysql.sys','localhost','AUDIT_ABORT_EXEMPT','N'),('mysql.sys','localhost','FIREWALL_EXEMPT','N'),('mysql.sys','localhost','SYSTEM_USER','N'),('root','localhost','ALLOW_NONEXISTENT_DEFINER','Y'),('root','localhost','APPLICATION_PASSWORD_ADMIN','Y'),('root','localhost','AUDIT_ABORT_EXEMPT','Y'),('root','localhost','AUDIT_ADMIN','Y'),('root','localhost','AUTHENTICATION_POLICY_ADMIN','Y'),('root','localhost','BACKUP_ADMIN','Y'),('root','localhost','BINLOG_ADMIN','Y'),('root','localhost','BINLOG_ENCRYPTION_ADMIN','Y'),('root','localhost','CLONE_ADMIN','Y'),('root','localhost','CONNECTION_ADMIN','Y'),('root','localhost','ENCRYPTION_KEY_ADMIN','Y'),('root','localhost','FIREWALL_EXEMPT','Y'),('root','localhost','FLUSH_OPTIMIZER_COSTS','Y'),('root','localhost','FLUSH_PRIVILEGES','Y'),('root','localhost','FLUSH_STATUS','Y'),('root','localhost','FLUSH_TABLES','Y'),('root','localhost','FLUSH_USER_RESOURCES','Y'),('root','localhost','GROUP_REPLICATION_ADMIN','Y'),('root','localhost','GROUP_REPLICATION_STREAM','Y'),('root','localhost','INNODB_REDO_LOG_ARCHIVE','Y'),('root','localhost','INNODB_REDO_LOG_ENABLE','Y'),('root','localhost','OPTIMIZE_LOCAL_TABLE','Y'),('root','localhost','PASSWORDLESS_USER_ADMIN','Y'),('root','localhost','PERSIST_RO_VARIABLES_ADMIN','Y'),('root','localhost','REPLICATION_APPLIER','Y'),('root','localhost','REPLICATION_SLAVE_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_ADMIN','Y'),('root','localhost','RESOURCE_GROUP_USER','Y'),('root','localhost','ROLE_ADMIN','Y'),('root','localhost','SENSITIVE_VARIABLES_OBSERVER','Y'),('root','localhost','SERVICE_CONNECTION_ADMIN','Y'),('root','localhost','SESSION_VARIABLES_ADMIN','Y'),('root','localhost','SET_ANY_DEFINER','Y'),('root','localhost','SHOW_ROUTINE','Y'),('root','localhost','SYSTEM_USER','Y'),('root','localhost','SYSTEM_VARIABLES_ADMIN','Y'),('root','localhost','TABLE_ENCRYPTION_ADMIN','Y'),('root','localhost','TELEMETRY_LOG_ADMIN','Y'),('root','localhost','TRANSACTION_GTID_TAG','Y'),('root','localhost','XA_RECOVER_ADMIN','Y');
/*!40000 ALTER TABLE `global_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  `gtid_tag` char(32) NOT NULL COMMENT 'GTID Tag.',
  PRIMARY KEY (`source_uuid`,`gtid_tag`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (0,'Contents',0,''),(1,'Help Metadata',0,''),(2,'Data Types',0,''),(3,'Administration',0,''),(4,'Functions',0,''),(5,'Enterprise Encryption Functions',4,''),(6,'Language Structure',0,''),(7,'Geographic Features',0,''),(8,'MBR',7,''),(9,'WKT',7,''),(10,'Comparison Operators',4,''),(11,'Logical Operators',4,''),(12,'Flow Control Functions',4,''),(13,'Numeric Functions',4,''),(14,'Date and Time Functions',4,''),(15,'String Functions',4,''),(16,'Cast Functions and Operators',4,''),(17,'XML',4,''),(18,'Bit Functions',4,''),(19,'Encryption Functions',4,''),(20,'Locking Functions',4,''),(21,'Information Functions',4,''),(22,'Spatial Functions',4,''),(23,'WKT Functions',22,''),(24,'WKB Functions',22,''),(25,'Geometry Constructors',22,''),(26,'Geometry Property Functions',22,''),(27,'Point Property Functions',22,''),(28,'LineString Property Functions',22,''),(29,'Polygon Property Functions',22,''),(30,'GeometryCollection Property Functions',22,''),(31,'Geometry Relation Functions',22,''),(32,'MBR Functions',22,''),(33,'GTID',4,''),(34,'Aggregate Functions and Modifiers',4,''),(35,'GROUP BY Functions and Modifiers',4,''),(36,'Window Functions',4,''),(37,'Performance Schema Functions',4,''),(38,'Internal Functions',4,''),(39,'Miscellaneous Functions',4,''),(40,'Data Definition',0,''),(41,'Data Manipulation',0,''),(42,'Transactions',0,''),(43,'Replication Statements',0,''),(44,'Prepared Statements',0,''),(45,'Compound Statements',0,''),(46,'Account Management',0,''),(47,'Table Maintenance',0,''),(48,'Loadable Functions',0,''),(49,'Components',0,''),(50,'Plugins',0,''),(51,'Utility',0,''),(52,'Storage Engines',0,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (107,'%'),(263,'&'),(421,'(JSON'),(85,'*'),(83,'+'),(84,'-'),(422,'->'),(424,'->>'),(86,'/'),(74,':='),(57,'<'),(265,'<<'),(56,'<='),(54,'<=>'),(55,'<>'),(53,'='),(59,'>'),(58,'>='),(266,'>>'),(89,'ABS'),(856,'ACCOUNT'),(90,'ACOS'),(657,'ACTION'),(47,'ADD'),(119,'ADDDATE'),(120,'ADDTIME'),(890,'ADMIN'),(269,'AES_DECRYPT'),(270,'AES_ENCRYPT'),(580,'AFTER'),(246,'AGAINST'),(911,'AGGREGATE'),(581,'ALGORITHM'),(693,'ALL'),(48,'ALTER'),(582,'ANALYZE'),(60,'AND'),(526,'ANY_VALUE'),(658,'ARCHIVE'),(253,'ARRAY'),(722,'AS'),(464,'ASC'),(184,'ASCII'),(91,'ASIN'),(784,'ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS'),(6,'ASYMMETRIC_DECRYPT'),(7,'ASYMMETRIC_ENCRYPT'),(8,'ASYMMETRIC_SIGN'),(9,'ASYMMETRIC_VERIFY'),(641,'AT'),(92,'ATAN'),(93,'ATAN2'),(857,'ATTRIBUTE'),(888,'AUTHENTICATION'),(743,'AUTOCOMMIT'),(583,'AUTOEXTEND_SIZE'),(584,'AUTO_INCREMENT'),(458,'AVG'),(585,'AVG_ROW_LENGTH'),(755,'BACKUP'),(769,'BEFORE'),(744,'BEGIN'),(287,'BENCHMARK'),(61,'BETWEEN'),(185,'BIN'),(252,'BINARY'),(562,'BINLOG'),(527,'BIN_TO_UUID'),(460,'BIT_AND'),(268,'BIT_COUNT'),(186,'BIT_LENGTH'),(461,'BIT_OR'),(462,'BIT_XOR'),(15,'BOOL'),(16,'BOOLEAN'),(229,'BOTH'),(645,'BTREE'),(465,'BY'),(40,'BYTE'),(947,'CACHE'),(687,'CALL'),(497,'CAN_ACCESS_COLUMN'),(498,'CAN_ACCESS_DATABASE'),(499,'CAN_ACCESS_TABLE'),(500,'CAN_ACCESS_USER'),(501,'CAN_ACCESS_VIEW'),(659,'CASCADE'),(75,'CASE'),(254,'CAST'),(837,'CATALOG_NAME'),(94,'CEIL'),(95,'CEILING'),(745,'CHAIN'),(858,'CHALLENGE_RESPONSE'),(586,'CHANGE'),(563,'CHANNEL'),(41,'CHAR'),(37,'CHARACTER'),(188,'CHARACTER_LENGTH'),(288,'CHARSET'),(187,'CHAR_LENGTH'),(587,'CHECK'),(588,'CHECKSUM'),(859,'CIPHER'),(838,'CLASS_ORIGIN'),(891,'CLIENT'),(919,'CLONE'),(695,'CLOSE'),(63,'COALESCE'),(940,'CODE'),(289,'COERCIBILITY'),(544,'COLLATE'),(290,'COLLATION'),(589,'COLUMN'),(590,'COLUMNS'),(839,'COLUMN_NAME'),(549,'COMMENT'),(746,'COMMIT'),(758,'COMMITTED'),(660,'COMPACT'),(550,'COMPLETION'),(915,'COMPONENT'),(271,'COMPRESS'),(661,'COMPRESSED'),(591,'COMPRESSION'),(189,'CONCAT'),(190,'CONCAT_WS'),(709,'CONCURRENT'),(834,'CONDITION'),(592,'CONNECTION'),(291,'CONNECTION_ID'),(747,'CONSISTENT'),(593,'CONSTRAINT'),(840,'CONSTRAINT_CATALOG'),(841,'CONSTRAINT_NAME'),(842,'CONSTRAINT_SCHEMA'),(835,'CONTINUE'),(96,'CONV'),(259,'CONVERT'),(121,'CONVERT_TZ'),(97,'COS'),(98,'COT'),(463,'COUNT'),(99,'CRC32'),(49,'CREATE'),(10,'CREATE_ASYMMETRIC_PRIV_KEY'),(11,'CREATE_ASYMMETRIC_PUB_KEY'),(12,'CREATE_DIGEST'),(738,'CROSS'),(662,'CSV'),(482,'CUME_DIST'),(122,'CURDATE'),(860,'CURRENT'),(123,'CURRENT_DATE'),(292,'CURRENT_ROLE'),(124,'CURRENT_TIME'),(125,'CURRENT_TIMESTAMP'),(293,'CURRENT_USER'),(832,'CURSOR'),(843,'CURSOR_NAME'),(126,'CURTIME'),(594,'DATA'),(294,'DATABASE'),(924,'DATABASES'),(635,'DATAFILE'),(34,'DATE'),(127,'DATEDIFF'),(255,'DATETIME'),(128,'DATE_ADD'),(143,'DATE_FORMAT'),(129,'DATE_SUB'),(130,'DAY'),(144,'DAYNAME'),(145,'DAYOFMONTH'),(146,'DAYOFWEEK'),(147,'DAYOFYEAR'),(131,'DAY_HOUR'),(132,'DAY_MINUTE'),(133,'DAY_SECOND'),(823,'DEALLOCATE'),(26,'DEC'),(29,'DECIMAL'),(824,'DECLARE'),(2,'DEFAULT'),(814,'DEFAULT_AUTH'),(551,'DEFINER'),(651,'DEFINITION'),(100,'DEGREES'),(701,'DELAYED'),(595,'DELAY_KEY_WRITE'),(663,'DELETE'),(483,'DENSE_RANK'),(466,'DESC'),(958,'DESCRIBE'),(652,'DESCRIPTION'),(844,'DIAGNOSTICS'),(596,'DIRECTORY'),(552,'DISABLE'),(597,'DISCARD'),(459,'DISTINCT'),(723,'DISTINCTROW'),(87,'DIV'),(553,'DO'),(598,'DROP'),(737,'DUAL'),(724,'DUMPFILE'),(702,'DUPLICATE'),(664,'DYNAMIC'),(76,'ELSE'),(825,'ELSEIF'),(191,'ELT'),(554,'ENABLE'),(710,'ENCLOSED'),(545,'ENCRYPTION'),(77,'END'),(642,'ENDS'),(599,'ENGINE'),(925,'ENGINES'),(564,'ERROR'),(926,'ERRORS'),(238,'ESCAPE'),(711,'ESCAPED'),(555,'EVENT'),(938,'EVENTS'),(643,'EVERY'),(694,'EXCEPT'),(600,'EXCHANGE'),(822,'EXECUTE'),(64,'EXISTS'),(836,'EXIT'),(101,'EXP'),(247,'EXPANSION'),(861,'EXPIRE'),(959,'EXPLAIN'),(948,'EXPORT'),(192,'EXPORT_SET'),(909,'EXTENDED'),(680,'EXTENT_SIZE'),(148,'EXTRACT'),(423,'EXTRACTION)'),(260,'EXTRACTVALUE'),(862,'FACTOR'),(863,'FAILED_LOGIN_ATTEMPTS'),(13,'FALSE'),(907,'FAST'),(665,'FEDERATED'),(833,'FETCH'),(193,'FIELD'),(712,'FIELDS'),(892,'FILE'),(681,'FILE_BLOCK_SIZE'),(775,'FILTER'),(194,'FIND_IN_SET'),(864,'FINISH'),(601,'FIRST'),(484,'FIRST_VALUE'),(27,'FIXED'),(30,'FLOAT4'),(31,'FLOAT8'),(102,'FLOOR'),(949,'FLUSH'),(565,'FOR'),(739,'FORCE'),(602,'FOREIGN'),(195,'FORMAT'),(493,'FORMAT_BYTES'),(494,'FORMAT_PICO_TIME'),(295,'FOUND_ROWS'),(230,'FROM'),(196,'FROM_BASE64'),(149,'FROM_DAYS'),(150,'FROM_UNIXTIME'),(666,'FULL'),(603,'FULLTEXT'),(168,'FUNCTION'),(950,'GENERAL'),(335,'GEOMCOLLECTION'),(336,'GEOMETRYCOLLECTION'),(845,'GET'),(502,'GET_DD_COLUMN_PRIVILEGES'),(503,'GET_DD_CREATE_OPTIONS'),(504,'GET_DD_INDEX_SUB_PART_LENGTH'),(151,'GET_FORMAT'),(282,'GET_LOCK'),(759,'GLOBAL'),(893,'GRANT'),(927,'GRANTS'),(65,'GREATEST'),(575,'GROUP'),(528,'GROUPING'),(467,'GROUP_CONCAT'),(772,'GTIDS'),(453,'GTID_SUBSET'),(454,'GTID_SUBTRACT'),(696,'HANDLER'),(725,'HAVING'),(667,'HEAP'),(5,'HELP'),(0,'HELP_DATE'),(1,'HELP_VERSION'),(197,'HEX'),(703,'HIGH_PRIORITY'),(865,'HISTORY'),(646,'HOST'),(928,'HOSTS'),(134,'HOUR'),(135,'HOUR_MINUTE'),(136,'HOUR_SECOND'),(296,'ICU_VERSION'),(720,'IDENTIFIED'),(80,'IF'),(81,'IFNULL'),(704,'IGNORE'),(785,'IGNORE_SERVER_IDS'),(604,'IMPORT'),(66,'IN'),(50,'INDEX'),(929,'INDEXES'),(531,'INET6_ATON'),(532,'INET6_NTOA'),(529,'INET_ATON'),(530,'INET_NTOA'),(713,'INFILE'),(889,'INITIAL'),(636,'INITIAL_SIZE'),(866,'INITIATE'),(425,'INLINE'),(740,'INNER'),(566,'INNODB'),(198,'INSERT'),(605,'INSERT_METHOD'),(916,'INSTALL'),(567,'INSTANCE'),(199,'INSTR'),(17,'INT1'),(20,'INT2'),(21,'INT3'),(23,'INT4'),(25,'INT8'),(24,'INTEGER'),(505,'INTERNAL_AUTO_INCREMENT'),(506,'INTERNAL_AVG_ROW_LENGTH'),(508,'INTERNAL_CHECKSUM'),(507,'INTERNAL_CHECK_TIME'),(509,'INTERNAL_DATA_FREE'),(510,'INTERNAL_DATA_LENGTH'),(511,'INTERNAL_DD_CHAR_LENGTH'),(512,'INTERNAL_GET_COMMENT_OR_ERROR'),(513,'INTERNAL_GET_ENABLED_ROLE_JSON'),(514,'INTERNAL_GET_HOSTNAME'),(515,'INTERNAL_GET_USERNAME'),(516,'INTERNAL_GET_VIEW_WARNING_OR_ERROR'),(517,'INTERNAL_INDEX_COLUMN_CARDINALITY'),(518,'INTERNAL_INDEX_LENGTH'),(519,'INTERNAL_IS_ENABLED_ROLE'),(520,'INTERNAL_IS_MANDATORY_ROLE'),(521,'INTERNAL_KEYS_DISABLED'),(522,'INTERNAL_MAX_DATA_LENGTH'),(523,'INTERNAL_TABLE_ROWS'),(524,'INTERNAL_UPDATE_TIME'),(708,'INTERSECT'),(67,'INTERVAL'),(705,'INTO'),(606,'INVISIBLE'),(815,'IO_THREAD'),(68,'IS'),(70,'ISNULL'),(760,'ISOLATION'),(867,'ISSUER'),(283,'IS_FREE_LOCK'),(533,'IS_IPV4'),(534,'IS_IPV4_COMPAT'),(535,'IS_IPV4_MAPPED'),(536,'IS_IPV6'),(284,'IS_USED_LOCK'),(537,'IS_UUID'),(525,'IS_VISIBLE_DD_OBJECT'),(826,'ITERATE'),(726,'JOIN'),(256,'JSON'),(415,'JSON_ARRAY'),(470,'JSON_ARRAYAGG'),(433,'JSON_ARRAY_APPEND'),(434,'JSON_ARRAY_INSERT'),(418,'JSON_CONTAINS'),(419,'JSON_CONTAINS_PATH'),(443,'JSON_DEPTH'),(420,'JSON_EXTRACT'),(435,'JSON_INSERT'),(427,'JSON_KEYS'),(444,'JSON_LENGTH'),(436,'JSON_MERGE'),(437,'JSON_MERGE_PATCH'),(438,'JSON_MERGE_PRESERVE'),(416,'JSON_OBJECT'),(471,'JSON_OBJECTAGG'),(428,'JSON_OVERLAPS'),(450,'JSON_PRETTY'),(417,'JSON_QUOTE'),(439,'JSON_REMOVE'),(440,'JSON_REPLACE'),(448,'JSON_SCHEMA_VALID'),(449,'JSON_SCHEMA_VALIDATION_REPORT'),(429,'JSON_SEARCH'),(441,'JSON_SET'),(451,'JSON_STORAGE_FREE'),(452,'JSON_STORAGE_SIZE'),(447,'JSON_TABLE'),(445,'JSON_TYPE'),(442,'JSON_UNQUOTE'),(446,'JSON_VALID'),(430,'JSON_VALUE'),(51,'KEY'),(568,'KEYRING'),(607,'KEYS'),(608,'KEY_BLOCK_SIZE'),(955,'KILL'),(485,'LAG'),(697,'LAST'),(152,'LAST_DAY'),(297,'LAST_INSERT_ID'),(486,'LAST_VALUE'),(200,'LCASE'),(487,'LEAD'),(231,'LEADING'),(71,'LEAST'),(827,'LEAVE'),(956,'LEAVES'),(201,'LEFT'),(202,'LENGTH'),(761,'LEVEL'),(222,'LIKE'),(688,'LIMIT'),(714,'LINES'),(337,'LINESTRING'),(103,'LN'),(715,'LOAD'),(203,'LOAD_FILE'),(716,'LOCAL'),(153,'LOCALTIME'),(154,'LOCALTIMESTAMP'),(204,'LOCATE'),(609,'LOCK'),(104,'LOG'),(106,'LOG10'),(105,'LOG2'),(576,'LOGFILE'),(770,'LOGS'),(45,'LONG'),(46,'LONGBINARY'),(828,'LOOP'),(205,'LOWER'),(689,'LOW_PRIORITY'),(206,'LPAD'),(207,'LTRIM'),(155,'MAKEDATE'),(156,'MAKETIME'),(208,'MAKE_SET'),(569,'MASTER'),(456,'MASTER_POS_WAIT'),(248,'MATCH'),(472,'MAX'),(868,'MAX_CONNECTIONS_PER_HOUR'),(869,'MAX_QUERIES_PER_HOUR'),(610,'MAX_ROWS'),(682,'MAX_SIZE'),(870,'MAX_UPDATES_PER_HOUR'),(871,'MAX_USER_CONNECTIONS'),(394,'MBRCONTAINS'),(395,'MBRCOVEREDBY'),(396,'MBRCOVERS'),(397,'MBRDISJOINT'),(398,'MBREQUALS'),(399,'MBRINTERSECTS'),(400,'MBROVERLAPS'),(401,'MBRTOUCHES'),(402,'MBRWITHIN'),(272,'MD5'),(908,'MEDIUM'),(431,'MEMBER'),(727,'MEMORY'),(668,'MERGE'),(846,'MESSAGE_TEXT'),(157,'MICROSECOND'),(209,'MID'),(22,'MIDDLEINT'),(473,'MIN'),(137,'MINUTE'),(138,'MINUTE_SECOND'),(611,'MIN_ROWS'),(88,'MOD'),(249,'MODE'),(612,'MODIFY'),(139,'MONTH'),(158,'MONTHNAME'),(669,'MRG_MYISAM'),(338,'MULTILINESTRING'),(339,'MULTIPOINT'),(340,'MULTIPOLYGON'),(930,'MUTEX'),(670,'MYISAM'),(847,'MYSQL_ERRNO'),(653,'NAME'),(923,'NAMES'),(538,'NAME_CONST'),(38,'NATIONAL'),(741,'NATURAL'),(39,'NCHAR'),(671,'NDB'),(672,'NDBCLUSTER'),(786,'NETWORK_NAMESPACE'),(872,'NEVER'),(698,'NEXT'),(570,'NO'),(683,'NODEGROUP'),(873,'NONE'),(62,'NOT'),(159,'NOW'),(906,'NO_WRITE_TO_BINLOG'),(488,'NTH_VALUE'),(489,'NTILE'),(69,'NULL'),(82,'NULLIF'),(848,'NUMBER'),(28,'NUMERIC'),(42,'NVARCHAR'),(210,'OCT'),(211,'OCTET_LENGTH'),(432,'OF'),(728,'OFFSET'),(874,'OLD'),(556,'ON'),(546,'ONLY'),(699,'OPEN'),(613,'OPTIMIZE'),(951,'OPTIMIZER_COSTS'),(894,'OPTION'),(875,'OPTIONAL'),(717,'OPTIONALLY'),(578,'OPTIONS'),(72,'OR'),(212,'ORD'),(468,'ORDER'),(654,'ORGANIZATION'),(742,'OUTER'),(729,'OUTFILE'),(647,'OWNER'),(614,'PACK_KEYS'),(615,'PARSER'),(941,'PARSE_TREE'),(673,'PARTIAL'),(616,'PARTITION'),(617,'PARTITIONING'),(618,'PASSWORD'),(876,'PASSWORD_LOCK_TIME'),(426,'PATH)'),(490,'PERCENT_RANK'),(160,'PERIOD_ADD'),(161,'PERIOD_DIFF'),(920,'PERSIST'),(921,'PERSIST_ONLY'),(108,'PI'),(917,'PLUGIN'),(942,'PLUGINS'),(816,'PLUGIN_DIR'),(341,'POINT'),(342,'POLYGON'),(648,'PORT'),(213,'POSITION'),(109,'POW'),(110,'POWER'),(32,'PRECISION'),(766,'PREPARE'),(557,'PRESERVE'),(700,'PREV'),(619,'PRIMARY'),(895,'PRIVILEGES'),(787,'PRIVILEGE_CHECKS_USER'),(577,'PROCEDURE'),(896,'PROCESS'),(931,'PROCESSLIST'),(943,'PROFILE'),(944,'PROFILES'),(900,'PROXY'),(495,'PS_CURRENT_THREAD_ID'),(496,'PS_THREAD_ID'),(771,'PURGE'),(162,'QUARTER'),(250,'QUERY'),(690,'QUICK'),(214,'QUOTE'),(111,'RADIANS'),(112,'RAND'),(877,'RANDOM'),(273,'RANDOM_BYTES'),(491,'RANK'),(547,'READ'),(33,'REAL'),(620,'REBUILD'),(767,'RECOVER'),(571,'REDO_LOG'),(674,'REDUNDANT'),(655,'REFERENCE'),(675,'REFERENCES'),(240,'REGEXP'),(242,'REGEXP_INSTR'),(243,'REGEXP_LIKE'),(244,'REGEXP_REPLACE'),(245,'REGEXP_SUBSTR'),(878,'REGISTRATION'),(952,'RELAY'),(945,'RELAYLOG'),(788,'RELAY_LOG_FILE'),(789,'RELAY_LOG_POS'),(748,'RELEASE'),(285,'RELEASE_ALL_LOCKS'),(286,'RELEASE_LOCK'),(572,'RELOAD'),(621,'REMOVE'),(558,'RENAME'),(622,'REORGANIZE'),(623,'REPAIR'),(215,'REPEAT'),(762,'REPEATABLE'),(216,'REPLACE'),(559,'REPLICA'),(946,'REPLICAS'),(776,'REPLICATE_DO_DB'),(777,'REPLICATE_DO_TABLE'),(778,'REPLICATE_IGNORE_DB'),(779,'REPLICATE_IGNORE_TABLE'),(780,'REPLICATE_REWRITE_DB'),(781,'REPLICATE_WILD_DO_TABLE'),(782,'REPLICATE_WILD_IGNORE_TABLE'),(783,'REPLICATION'),(879,'REQUIRE'),(773,'RESET'),(853,'RESIGNAL'),(903,'RESOURCE'),(957,'RESTART'),(678,'RESTRICT'),(880,'RETAIN'),(830,'RETURN'),(849,'RETURNED_SQLSTATE'),(912,'RETURNS'),(881,'REUSE'),(217,'REVERSE'),(901,'REVOKE'),(218,'RIGHT'),(241,'RLIKE'),(882,'ROLE'),(298,'ROLES_GRAPHML'),(573,'ROLLBACK'),(113,'ROUND'),(706,'ROW'),(721,'ROWS'),(299,'ROW_COUNT'),(624,'ROW_FORMAT'),(492,'ROW_NUMBER'),(219,'RPAD'),(220,'RTRIM'),(754,'SAVEPOINT'),(560,'SCHEDULE'),(300,'SCHEMA'),(932,'SCHEMAS'),(850,'SCHEMA_NAME'),(140,'SECOND'),(163,'SEC_TO_TIME'),(707,'SELECT'),(469,'SEPARATOR'),(3,'SERIAL'),(763,'SERIALIZABLE'),(579,'SERVER'),(764,'SESSION'),(301,'SESSION_USER'),(548,'SET'),(274,'SHA'),(275,'SHA1'),(276,'SHA2'),(730,'SHARE'),(933,'SHOW'),(897,'SHUTDOWN'),(114,'SIGN'),(855,'SIGNAL'),(257,'SIGNED'),(115,'SIN'),(561,'SLAVE'),(539,'SLEEP'),(953,'SLOW'),(749,'SNAPSHOT'),(649,'SOCKET'),(913,'SONAME'),(221,'SOUNDEX'),(223,'SOUNDS'),(790,'SOURCE'),(791,'SOURCE_AUTO_POSITION'),(792,'SOURCE_BIND'),(793,'SOURCE_COMPRESSION_ALGORITHMS'),(794,'SOURCE_CONNECT_RETRY'),(795,'SOURCE_HEARTBEAT_PERIOD'),(796,'SOURCE_HOST'),(797,'SOURCE_LOG_FILE'),(798,'SOURCE_LOG_POS'),(799,'SOURCE_PASSWORD'),(800,'SOURCE_PORT'),(457,'SOURCE_POS_WAIT'),(801,'SOURCE_RETRY_COUNT'),(802,'SOURCE_SSL'),(803,'SOURCE_SSL_CA'),(804,'SOURCE_SSL_CERT'),(805,'SOURCE_SSL_CIPHER'),(806,'SOURCE_SSL_CRL'),(807,'SOURCE_SSL_CRLPATH'),(808,'SOURCE_SSL_KEY'),(809,'SOURCE_SSL_VERIFY_SERVER_CERT'),(810,'SOURCE_TLS_CIPHERSUITES'),(811,'SOURCE_TLS_VERSION'),(812,'SOURCE_USER'),(813,'SOURCE_ZSTD_COMPRESSION_LEVEL'),(224,'SPACE'),(625,'SPATIAL'),(854,'SQLSTATE'),(817,'SQL_AFTER_GTIDS'),(818,'SQL_AFTER_MTS_GAPS'),(819,'SQL_BEFORE_GTIDS'),(731,'SQL_BIG_RESULT'),(732,'SQL_BUFFER_RESULT'),(733,'SQL_CALC_FOUND_ROWS'),(774,'SQL_LOG_BIN'),(734,'SQL_NO_CACHE'),(735,'SQL_SMALL_RESULT'),(820,'SQL_THREAD'),(116,'SQRT'),(883,'SSL'),(750,'START'),(718,'STARTING'),(644,'STARTS'),(277,'STATEMENT_DIGEST'),(278,'STATEMENT_DIGEST_TEXT'),(626,'STATS_AUTO_RECALC'),(627,'STATS_PERSISTENT'),(628,'STATS_SAMPLE_PAGES'),(934,'STATUS'),(474,'STD'),(475,'STDDEV'),(476,'STDDEV_POP'),(477,'STDDEV_SAMP'),(821,'STOP'),(939,'STORAGE'),(676,'STORED'),(736,'STRAIGHT_JOIN'),(239,'STRCMP'),(914,'STRING'),(164,'STR_TO_DATE'),(364,'ST_AREA'),(343,'ST_ASBINARY'),(407,'ST_ASGEOJSON'),(345,'ST_ASTEXT'),(344,'ST_ASWKB'),(346,'ST_ASWKT'),(372,'ST_BUFFER'),(373,'ST_BUFFER_STRATEGY'),(365,'ST_CENTROID'),(409,'ST_COLLECT'),(383,'ST_CONTAINS'),(374,'ST_CONVEXHULL'),(384,'ST_CROSSES'),(375,'ST_DIFFERENCE'),(348,'ST_DIMENSION'),(385,'ST_DISJOINT'),(386,'ST_DISTANCE'),(410,'ST_DISTANCE_SPHERE'),(358,'ST_ENDPOINT'),(349,'ST_ENVELOPE'),(387,'ST_EQUALS'),(366,'ST_EXTERIORRING'),(388,'ST_FRECHETDISTANCE'),(403,'ST_GEOHASH'),(305,'ST_GEOMCOLLFROMTEXT'),(320,'ST_GEOMCOLLFROMWKB'),(306,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(321,'ST_GEOMETRYCOLLECTIONFROMWKB'),(307,'ST_GEOMETRYFROMTEXT'),(322,'ST_GEOMETRYFROMWKB'),(370,'ST_GEOMETRYN'),(350,'ST_GEOMETRYTYPE'),(408,'ST_GEOMFROMGEOJSON'),(308,'ST_GEOMFROMTEXT'),(323,'ST_GEOMFROMWKB'),(389,'ST_HAUSDORFFDISTANCE'),(367,'ST_INTERIORRINGN'),(376,'ST_INTERSECTION'),(390,'ST_INTERSECTS'),(359,'ST_ISCLOSED'),(351,'ST_ISEMPTY'),(352,'ST_ISSIMPLE'),(411,'ST_ISVALID'),(404,'ST_LATFROMGEOHASH'),(354,'ST_LATITUDE'),(360,'ST_LENGTH'),(309,'ST_LINEFROMTEXT'),(324,'ST_LINEFROMWKB'),(377,'ST_LINEINTERPOLATEPOINT'),(378,'ST_LINEINTERPOLATEPOINTS'),(310,'ST_LINESTRINGFROMTEXT'),(325,'ST_LINESTRINGFROMWKB'),(405,'ST_LONGFROMGEOHASH'),(355,'ST_LONGITUDE'),(412,'ST_MAKEENVELOPE'),(311,'ST_MLINEFROMTEXT'),(326,'ST_MLINEFROMWKB'),(313,'ST_MPOINTFROMTEXT'),(328,'ST_MPOINTFROMWKB'),(315,'ST_MPOLYFROMTEXT'),(330,'ST_MPOLYFROMWKB'),(312,'ST_MULTILINESTRINGFROMTEXT'),(327,'ST_MULTILINESTRINGFROMWKB'),(314,'ST_MULTIPOINTFROMTEXT'),(329,'ST_MULTIPOINTFROMWKB'),(316,'ST_MULTIPOLYGONFROMTEXT'),(331,'ST_MULTIPOLYGONFROMWKB'),(371,'ST_NUMGEOMETRIES'),(368,'ST_NUMINTERIORRING'),(369,'ST_NUMINTERIORRINGS'),(361,'ST_NUMPOINTS'),(391,'ST_OVERLAPS'),(379,'ST_POINTATDISTANCE'),(406,'ST_POINTFROMGEOHASH'),(317,'ST_POINTFROMTEXT'),(332,'ST_POINTFROMWKB'),(362,'ST_POINTN'),(318,'ST_POLYFROMTEXT'),(333,'ST_POLYFROMWKB'),(319,'ST_POLYGONFROMTEXT'),(334,'ST_POLYGONFROMWKB'),(413,'ST_SIMPLIFY'),(353,'ST_SRID'),(363,'ST_STARTPOINT'),(347,'ST_SWAPXY'),(380,'ST_SYMDIFFERENCE'),(392,'ST_TOUCHES'),(381,'ST_TRANSFORM'),(382,'ST_UNION'),(414,'ST_VALIDATE'),(393,'ST_WITHIN'),(356,'ST_X'),(357,'ST_Y'),(851,'SUBCLASS_ORIGIN'),(165,'SUBDATE'),(884,'SUBJECT'),(225,'SUBSTR'),(226,'SUBSTRING'),(227,'SUBSTRING_INDEX'),(166,'SUBTIME'),(478,'SUM'),(898,'SUPER'),(167,'SYSDATE'),(656,'SYSTEM'),(302,'SYSTEM_USER'),(52,'TABLE'),(757,'TABLES'),(629,'TABLESPACE'),(852,'TABLE_NAME'),(117,'TAN'),(686,'TEMPORARY'),(719,'TERMINATED'),(78,'THEN'),(904,'THREAD_PRIORITY'),(36,'TIME'),(169,'TIMEDIFF'),(35,'TIMESTAMP'),(170,'TIMESTAMPADD'),(171,'TIMESTAMPDIFF'),(258,'TIMEZONE'),(172,'TIME_FORMAT'),(173,'TIME_TO_SEC'),(574,'TLS'),(637,'TO'),(228,'TO_BASE64'),(174,'TO_DAYS'),(175,'TO_SECONDS'),(960,'TRADITIONAL'),(232,'TRAILING'),(751,'TRANSACTION'),(961,'TREE'),(685,'TRIGGER'),(935,'TRIGGERS'),(233,'TRIM'),(14,'TRUE'),(118,'TRUNCATE'),(630,'TYPE'),(234,'UCASE'),(885,'UNBOUNDED'),(765,'UNCOMMITTED'),(279,'UNCOMPRESS'),(280,'UNCOMPRESSED_LENGTH'),(638,'UNDO'),(235,'UNHEX'),(918,'UNINSTALL'),(631,'UNION'),(632,'UNIQUE'),(176,'UNIX_TIMESTAMP'),(902,'UNKNOWN'),(756,'UNLOCK'),(886,'UNREGISTER'),(18,'UNSIGNED'),(829,'UNTIL'),(679,'UPDATE'),(261,'UPDATEXML'),(633,'UPGRADE'),(236,'UPPER'),(899,'USAGE'),(684,'USE'),(303,'USER'),(954,'USER_RESOURCES'),(910,'USE_FRM'),(691,'USING'),(177,'UTC_DATE'),(178,'UTC_TIME'),(179,'UTC_TIMESTAMP'),(540,'UUID'),(541,'UUID_SHORT'),(542,'UUID_TO_BIN'),(281,'VALIDATE_PASSWORD_STRENGTH'),(4,'VALUE'),(543,'VALUES'),(43,'VARCHARACTER'),(922,'VARIABLE'),(936,'VARIABLES'),(481,'VARIANCE'),(44,'VARYING'),(479,'VAR_POP'),(480,'VAR_SAMP'),(905,'VCPU'),(304,'VERSION'),(640,'VIEW'),(677,'VIRTUAL'),(634,'VISIBLE'),(639,'WAIT'),(455,'WAIT_FOR_EXECUTED_GTID_SET'),(937,'WARNINGS'),(180,'WEEK'),(181,'WEEKDAY'),(182,'WEEKOFYEAR'),(237,'WEIGHT_STRING'),(79,'WHEN'),(692,'WHERE'),(831,'WHILE'),(251,'WITH'),(752,'WORK'),(650,'WRAPPER'),(753,'WRITE'),(887,'X509'),(768,'XA'),(73,'XOR'),(141,'YEAR'),(183,'YEARWEEK'),(142,'YEAR_MONTH'),(19,'ZEROFILL'),(264,'^'),(262,'|'),(267,'~');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(1,1),(2,2),(484,2),(501,2),(502,2),(509,2),(512,2),(513,2),(521,2),(522,2),(546,2),(553,2),(586,2),(604,2),(606,2),(612,2),(614,2),(2,3),(521,3),(2,4),(546,4),(553,4),(602,4),(603,4),(3,5),(692,5),(4,6),(5,7),(6,8),(7,9),(8,10),(9,11),(10,12),(11,13),(12,13),(11,14),(12,14),(14,15),(15,15),(14,16),(240,16),(14,17),(14,18),(18,18),(20,18),(21,18),(23,18),(24,18),(242,18),(14,19),(18,19),(20,19),(21,19),(23,19),(24,19),(16,20),(17,21),(17,22),(18,23),(18,24),(242,24),(624,24),(20,25),(21,26),(21,27),(521,27),(21,28),(22,29),(242,29),(624,29),(23,30),(24,31),(24,32),(24,33),(624,33),(26,34),(129,34),(131,34),(242,34),(28,35),(165,35),(29,36),(163,36),(242,36),(31,37),(33,37),(501,37),(502,37),(509,37),(512,37),(513,37),(521,37),(550,37),(551,37),(554,37),(632,37),(633,37),(635,37),(639,37),(31,38),(33,38),(31,39),(32,40),(32,41),(184,41),(242,41),(33,42),(33,43),(33,44),(42,45),(42,46),(51,47),(509,47),(510,47),(523,47),(604,47),(51,48),(501,48),(502,48),(503,48),(504,48),(505,48),(506,48),(507,48),(508,48),(509,48),(510,48),(511,48),(604,48),(609,48),(615,48),(51,49),(512,49),(513,49),(514,49),(515,49),(516,49),(517,49),(518,49),(519,49),(520,49),(521,49),(523,49),(524,49),(525,49),(605,49),(606,49),(616,49),(624,49),(635,49),(643,49),(644,49),(645,49),(646,49),(647,49),(648,49),(650,49),(51,50),(509,50),(515,50),(521,50),(529,50),(556,50),(635,50),(661,50),(681,50),(684,50),(51,51),(509,51),(521,51),(522,51),(546,51),(51,52),(509,52),(521,52),(534,52),(538,52),(539,52),(545,52),(547,52),(557,52),(619,52),(620,52),(621,52),(622,52),(623,52),(635,52),(648,52),(675,52),(52,53),(79,53),(53,54),(54,55),(55,56),(56,57),(57,58),(58,59),(59,60),(75,60),(573,60),(59,61),(60,61),(60,62),(63,62),(66,62),(69,62),(71,62),(74,62),(232,62),(234,62),(512,62),(513,62),(514,62),(520,62),(605,62),(606,62),(61,63),(509,63),(62,64),(63,64),(512,64),(513,64),(514,64),(520,64),(526,64),(527,64),(528,64),(532,64),(533,64),(534,64),(537,64),(604,64),(605,64),(606,64),(607,64),(608,64),(611,64),(625,64),(686,64),(64,65),(65,66),(66,66),(240,66),(554,66),(638,66),(641,66),(642,66),(661,66),(671,66),(67,67),(131,67),(514,67),(604,67),(606,67),(68,68),(69,68),(70,68),(71,68),(70,69),(71,69),(522,69),(72,70),(73,71),(76,72),(520,72),(77,73),(78,74),(80,75),(587,75),(80,76),(587,76),(80,77),(571,77),(584,77),(587,77),(588,77),(591,77),(592,77),(594,77),(80,78),(587,78),(588,78),(80,79),(587,79),(81,80),(512,80),(513,80),(514,80),(520,80),(526,80),(527,80),(528,80),(532,80),(533,80),(534,80),(537,80),(588,80),(604,80),(605,80),(606,80),(607,80),(608,80),(611,80),(625,80),(686,80),(82,81),(83,82),(84,83),(85,84),(86,84),(87,85),(88,86),(89,87),(90,88),(109,88),(91,89),(92,90),(93,91),(94,92),(95,93),(96,94),(97,95),(98,96),(99,97),(100,98),(101,99),(102,100),(103,101),(104,102),(105,103),(106,104),(636,104),(107,105),(108,106),(109,107),(110,108),(111,109),(112,110),(113,111),(114,112),(115,113),(116,114),(117,115),(118,116),(119,117),(120,118),(509,118),(539,118),(121,119),(122,120),(123,121),(124,122),(125,123),(126,124),(127,125),(128,126),(130,127),(131,128),(131,129),(133,129),(131,130),(134,130),(604,130),(606,130),(131,131),(131,132),(131,133),(131,134),(143,134),(131,135),(131,136),(131,137),(150,137),(131,138),(131,139),(151,139),(131,140),(157,140),(131,141),(179,141),(242,141),(131,142),(132,143),(135,144),(136,145),(137,146),(138,147),(139,148),(140,149),(141,150),(142,151),(144,152),(145,153),(146,154),(147,155),(148,156),(149,157),(152,158),(153,159),(154,160),(155,161),(156,162),(158,163),(159,164),(160,165),(161,166),(162,167),(163,168),(165,168),(214,168),(504,168),(517,168),(518,168),(530,168),(531,168),(624,168),(625,168),(635,168),(646,168),(658,168),(659,168),(164,169),(166,170),(167,171),(168,172),(169,173),(170,174),(171,175),(172,176),(173,177),(174,178),(175,179),(176,180),(177,181),(178,182),(180,183),(181,184),(182,185),(183,186),(185,187),(186,188),(187,189),(188,190),(189,191),(190,192),(191,193),(192,194),(193,195),(689,195),(690,195),(691,195),(194,196),(195,197),(196,198),(546,198),(547,198),(548,198),(197,199),(198,200),(199,201),(556,201),(200,202),(201,203),(202,204),(203,205),(204,206),(205,207),(206,208),(207,209),(208,210),(209,211),(210,212),(211,213),(212,214),(213,215),(592,215),(214,216),(520,216),(550,216),(551,216),(553,216),(604,216),(613,216),(215,217),(216,218),(556,218),(217,219),(218,220),(219,221),(220,222),(232,222),(635,222),(641,222),(642,222),(220,223),(221,224),(222,225),(223,226),(224,227),(225,228),(226,229),(226,230),(541,230),(545,230),(554,230),(635,230),(638,230),(641,230),(642,230),(661,230),(671,230),(226,231),(226,232),(226,233),(227,234),(228,235),(229,236),(230,237),(231,238),(233,239),(234,240),(235,241),(236,242),(237,243),(238,244),(239,245),(240,246),(240,247),(240,248),(240,249),(554,249),(240,250),(683,250),(240,251),(509,251),(515,251),(521,251),(604,251),(606,251),(609,251),(682,251),(241,252),(242,252),(572,252),(573,252),(636,252),(637,252),(682,252),(685,252),(242,253),(242,254),(242,255),(242,256),(689,256),(690,256),(691,256),(242,257),(242,258),(243,259),(244,260),(245,261),(246,262),(247,263),(248,264),(249,265),(250,266),(251,267),(252,268),(253,269),(254,270),(255,271),(256,272),(257,273),(258,274),(258,275),(259,276),(260,277),(261,278),(262,279),(263,280),(264,281),(265,282),(266,283),(267,284),(268,285),(269,286),(270,287),(271,288),(632,288),(633,288),(272,289),(273,290),(635,290),(640,290),(274,291),(275,292),(276,293),(503,293),(514,293),(277,294),(501,294),(502,294),(512,294),(513,294),(519,294),(526,294),(527,294),(635,294),(643,294),(644,294),(278,295),(279,296),(280,297),(281,298),(282,299),(601,299),(283,300),(501,300),(502,300),(512,300),(513,300),(526,300),(527,300),(635,300),(643,300),(644,300),(689,300),(690,300),(691,300),(284,301),(285,302),(286,303),(519,303),(578,303),(604,303),(606,303),(608,303),(610,303),(611,303),(616,303),(650,303),(287,304),(288,305),(288,306),(289,307),(289,308),(290,309),(290,310),(291,311),(291,312),(292,313),(292,314),(293,315),(293,316),(294,317),(295,318),(295,319),(296,320),(296,321),(297,322),(297,323),(298,324),(298,325),(299,326),(299,327),(300,328),(300,329),(301,330),(301,331),(302,332),(303,333),(303,334),(304,335),(305,336),(306,337),(307,338),(308,339),(309,340),(310,341),(311,342),(312,343),(312,344),(313,345),(313,346),(314,347),(315,348),(316,349),(317,350),(318,351),(319,352),(320,353),(321,354),(322,355),(323,356),(324,357),(325,358),(326,359),(327,360),(328,361),(329,362),(330,363),(331,364),(332,365),(333,366),(334,367),(335,368),(335,369),(336,370),(337,371),(338,372),(339,373),(340,374),(341,375),(342,376),(343,377),(344,378),(345,379),(346,380),(347,381),(348,382),(349,383),(350,384),(351,385),(352,386),(353,387),(354,388),(355,389),(356,390),(357,391),(358,392),(359,393),(360,394),(361,395),(362,396),(363,397),(364,398),(365,399),(366,400),(367,401),(368,402),(369,403),(370,404),(371,405),(372,406),(373,407),(374,408),(375,409),(376,410),(377,411),(378,412),(379,413),(380,414),(381,415),(382,416),(383,417),(384,418),(385,419),(386,420),(387,421),(388,421),(387,422),(387,423),(388,424),(388,425),(388,426),(389,427),(390,428),(391,429),(392,430),(393,431),(393,432),(394,433),(395,434),(396,435),(397,436),(398,437),(399,438),(400,439),(401,440),(402,441),(403,442),(404,443),(405,444),(406,445),(407,446),(408,447),(409,448),(410,449),(411,450),(412,451),(413,452),(414,453),(415,454),(416,455),(417,456),(418,457),(419,458),(419,459),(424,459),(425,459),(428,459),(429,459),(434,459),(543,459),(549,459),(554,459),(559,459),(420,460),(421,461),(422,462),(423,463),(424,463),(656,463),(679,463),(425,464),(554,464),(425,465),(509,465),(521,465),(541,465),(550,465),(551,465),(552,465),(554,465),(558,465),(604,465),(606,465),(425,466),(554,466),(689,466),(690,466),(691,466),(425,467),(425,468),(509,468),(541,468),(552,468),(554,468),(557,468),(558,468),(560,468),(425,469),(426,470),(427,471),(428,472),(429,473),(430,474),(431,475),(432,476),(433,477),(434,478),(435,479),(436,480),(437,481),(438,482),(439,483),(440,484),(441,485),(442,486),(443,487),(444,488),(445,489),(446,490),(447,491),(448,492),(449,493),(450,494),(451,495),(452,496),(453,497),(454,498),(455,499),(456,500),(457,501),(458,502),(459,503),(460,504),(461,505),(462,506),(463,507),(464,508),(465,509),(466,510),(467,511),(468,512),(469,513),(470,514),(471,515),(472,516),(473,517),(474,518),(475,519),(476,520),(477,521),(478,522),(479,523),(480,524),(481,525),(482,526),(483,527),(485,528),(486,529),(487,530),(488,531),(489,532),(490,533),(491,534),(492,535),(493,536),(494,537),(495,538),(496,539),(497,540),(498,541),(499,542),(500,543),(546,543),(553,543),(560,543),(501,544),(502,544),(509,544),(512,544),(513,544),(521,544),(501,545),(502,545),(509,545),(512,545),(513,545),(521,545),(501,546),(502,546),(561,546),(562,546),(563,546),(564,546),(570,546),(571,546),(501,547),(502,547),(544,547),(561,547),(562,547),(563,547),(564,547),(569,547),(570,547),(571,547),(682,547),(501,548),(502,548),(509,548),(512,548),(513,548),(521,548),(522,548),(546,548),(550,548),(551,548),(553,548),(554,548),(558,548),(561,548),(562,548),(563,548),(564,548),(574,548),(602,548),(603,548),(604,548),(612,548),(613,548),(614,548),(618,548),(631,548),(632,548),(633,548),(634,548),(635,548),(639,548),(503,549),(509,549),(514,549),(515,549),(521,549),(523,549),(604,549),(606,549),(503,550),(514,550),(503,551),(514,551),(503,552),(509,552),(514,552),(615,552),(616,552),(503,553),(514,553),(542,553),(594,553),(503,554),(509,554),(514,554),(615,554),(616,554),(503,555),(514,555),(528,555),(645,555),(503,556),(505,556),(514,556),(522,556),(556,556),(503,557),(514,557),(503,558),(509,558),(510,558),(538,558),(610,558),(503,559),(514,559),(577,559),(578,559),(579,559),(672,559),(685,559),(503,560),(514,560),(503,561),(514,561),(505,562),(638,562),(680,562),(505,563),(576,563),(577,563),(578,563),(579,563),(671,563),(672,563),(682,563),(505,564),(682,564),(505,565),(554,565),(576,565),(577,565),(578,565),(579,565),(596,565),(599,565),(600,565),(613,565),(618,565),(635,565),(671,565),(672,565),(682,565),(689,565),(690,565),(691,565),(505,566),(521,566),(635,566),(505,567),(568,567),(505,568),(505,569),(505,570),(521,570),(522,570),(505,571),(505,572),(609,572),(505,573),(561,573),(562,573),(563,573),(564,573),(565,573),(566,573),(567,573),(571,573),(505,574),(506,575),(516,575),(523,575),(554,575),(615,575),(616,575),(617,575),(618,575),(506,576),(516,576),(523,576),(507,577),(517,577),(518,577),(530,577),(531,577),(635,577),(647,577),(666,577),(667,577),(508,578),(519,578),(508,579),(519,579),(532,579),(509,580),(509,581),(509,582),(619,582),(689,582),(690,582),(691,582),(509,583),(510,583),(521,583),(523,583),(509,584),(509,585),(521,585),(509,586),(575,586),(576,586),(509,587),(521,587),(620,587),(509,588),(521,588),(621,588),(509,589),(509,590),(521,590),(550,590),(635,590),(641,590),(642,590),(509,591),(521,591),(509,592),(521,592),(683,592),(689,592),(690,592),(691,592),(509,593),(521,593),(509,594),(519,594),(521,594),(550,594),(509,595),(521,595),(509,596),(521,596),(509,597),(604,597),(509,598),(510,598),(526,598),(527,598),(528,598),(529,598),(530,598),(531,598),(532,598),(533,598),(534,598),(535,598),(536,598),(537,598),(582,598),(583,598),(604,598),(607,598),(608,598),(617,598),(625,598),(509,599),(510,599),(521,599),(523,599),(635,599),(654,599),(682,599),(509,600),(509,601),(521,601),(544,601),(509,602),(519,602),(521,602),(522,602),(509,603),(515,603),(521,603),(509,604),(545,604),(550,604),(509,605),(521,605),(509,606),(515,606),(521,606),(509,607),(635,607),(661,607),(509,608),(521,608),(509,609),(554,609),(568,609),(569,609),(604,609),(606,609),(682,609),(509,610),(521,610),(509,611),(521,611),(509,612),(604,612),(509,613),(622,613),(509,614),(521,614),(509,615),(515,615),(521,615),(509,616),(521,616),(541,616),(546,616),(550,616),(553,616),(554,616),(556,616),(681,616),(684,616),(509,617),(509,618),(519,618),(578,618),(604,618),(606,618),(613,618),(509,619),(509,620),(509,621),(509,622),(509,623),(623,623),(509,624),(521,624),(509,625),(515,625),(520,625),(533,625),(509,626),(521,626),(509,627),(521,627),(509,628),(521,628),(509,629),(510,629),(523,629),(535,629),(509,630),(616,630),(509,631),(552,631),(559,631),(509,632),(509,633),(620,633),(509,634),(515,634),(521,634),(510,635),(523,635),(510,636),(523,636),(510,637),(565,637),(566,637),(567,637),(572,637),(576,637),(613,637),(510,638),(523,638),(535,638),(600,638),(510,639),(523,639),(511,640),(525,640),(537,640),(514,641),(514,642),(514,643),(514,644),(515,645),(519,646),(519,647),(519,648),(519,649),(519,650),(520,651),(520,652),(520,653),(520,654),(520,655),(533,655),(520,656),(533,656),(616,656),(521,657),(522,657),(521,658),(521,659),(522,659),(534,659),(537,659),(521,660),(521,661),(521,662),(550,662),(521,663),(522,663),(541,663),(521,664),(521,665),(521,666),(635,666),(641,666),(642,666),(668,666),(676,666),(521,667),(521,668),(521,669),(521,670),(521,671),(521,672),(521,673),(521,674),(521,675),(522,675),(609,675),(521,676),(521,677),(522,678),(534,678),(537,678),(522,679),(546,679),(554,679),(558,679),(523,680),(523,681),(523,682),(523,683),(523,684),(556,684),(693,684),(524,685),(536,685),(635,685),(534,686),(540,687),(541,688),(544,688),(552,688),(554,688),(557,688),(558,688),(560,688),(638,688),(671,688),(541,689),(546,689),(550,689),(551,689),(553,689),(558,689),(541,690),(620,690),(623,690),(541,691),(556,691),(581,691),(660,691),(541,692),(544,692),(558,692),(641,692),(642,692),(661,692),(543,693),(549,693),(554,693),(559,693),(577,693),(604,693),(609,693),(611,693),(612,693),(614,693),(681,693),(684,693),(543,694),(552,694),(614,694),(544,695),(595,695),(544,696),(600,696),(544,697),(544,698),(544,699),(598,699),(635,699),(662,699),(544,700),(546,701),(548,701),(553,701),(546,702),(546,703),(554,703),(546,704),(550,704),(551,704),(554,704),(556,704),(558,704),(611,704),(684,704),(546,705),(552,705),(553,705),(554,705),(684,705),(689,705),(690,705),(691,705),(546,706),(560,706),(546,707),(547,707),(552,707),(553,707),(554,707),(689,707),(690,707),(691,707),(549,708),(552,708),(550,709),(551,709),(550,710),(550,711),(550,712),(635,712),(641,712),(642,712),(550,713),(551,713),(550,714),(551,714),(550,715),(684,715),(550,716),(551,716),(569,716),(619,716),(622,716),(623,716),(682,716),(550,717),(550,718),(550,719),(551,720),(604,720),(606,720),(551,721),(554,722),(556,722),(569,722),(604,722),(606,722),(609,722),(554,723),(554,724),(554,725),(554,726),(556,726),(554,727),(554,728),(554,729),(554,730),(554,731),(554,732),(554,733),(554,734),(554,735),(554,736),(556,736),(555,737),(556,738),(556,739),(615,739),(617,739),(556,740),(556,741),(556,742),(561,743),(562,743),(563,743),(564,743),(561,744),(562,744),(563,744),(564,744),(571,744),(584,744),(561,745),(562,745),(563,745),(564,745),(561,746),(562,746),(563,746),(564,746),(571,746),(561,747),(562,747),(563,747),(564,747),(571,747),(561,748),(562,748),(563,748),(564,748),(565,748),(566,748),(567,748),(571,748),(561,749),(562,749),(563,749),(564,749),(571,749),(561,750),(562,750),(563,750),(564,750),(571,750),(578,750),(561,751),(562,751),(563,751),(564,751),(570,751),(561,752),(562,752),(563,752),(564,752),(561,753),(562,753),(563,753),(564,753),(569,753),(570,753),(571,753),(565,754),(566,754),(567,754),(568,755),(568,756),(569,756),(604,756),(606,756),(569,757),(635,757),(662,757),(676,757),(682,757),(570,758),(570,759),(631,759),(674,759),(678,759),(570,760),(570,761),(570,762),(570,763),(570,764),(631,764),(674,764),(678,764),(570,765),(571,766),(580,766),(582,766),(583,766),(571,767),(571,768),(572,769),(572,770),(573,770),(635,770),(637,770),(682,770),(685,770),(572,771),(573,772),(685,772),(573,773),(577,773),(685,773),(686,773),(574,774),(575,775),(575,776),(575,777),(575,778),(575,779),(575,780),(575,781),(575,782),(575,783),(576,783),(609,783),(576,784),(576,785),(576,786),(576,787),(576,788),(576,789),(576,790),(576,791),(576,792),(576,793),(576,794),(576,795),(576,796),(576,797),(576,798),(576,799),(576,800),(576,801),(576,802),(576,803),(576,804),(576,805),(576,806),(576,807),(576,808),(576,809),(576,810),(576,811),(576,812),(576,813),(578,814),(578,815),(579,815),(578,816),(578,817),(578,818),(578,819),(578,820),(579,820),(579,821),(581,822),(609,822),(582,823),(583,823),(586,824),(596,824),(599,824),(600,824),(588,825),(589,826),(590,827),(591,828),(592,829),(593,830),(594,831),(596,832),(597,833),(599,834),(600,835),(600,836),(601,837),(602,837),(603,837),(601,838),(602,838),(603,838),(601,839),(602,839),(603,839),(601,840),(602,840),(603,840),(601,841),(602,841),(603,841),(601,842),(602,842),(603,842),(601,843),(602,843),(603,843),(601,844),(601,845),(601,846),(602,846),(603,846),(601,847),(602,847),(603,847),(601,848),(601,849),(601,850),(602,850),(603,850),(601,851),(602,851),(603,851),(601,852),(602,852),(603,852),(602,853),(602,854),(603,854),(603,855),(604,856),(606,856),(604,857),(606,857),(604,858),(604,859),(606,859),(604,860),(606,860),(613,860),(604,861),(606,861),(604,862),(604,863),(606,863),(604,864),(604,865),(606,865),(604,866),(604,867),(606,867),(604,868),(606,868),(604,869),(606,869),(604,870),(606,870),(604,871),(606,871),(604,872),(606,872),(604,873),(609,873),(612,873),(614,873),(604,874),(604,875),(606,875),(604,876),(606,876),(604,877),(606,877),(613,877),(604,878),(604,879),(606,879),(604,880),(613,880),(604,881),(606,881),(604,882),(605,882),(606,882),(607,882),(609,882),(612,882),(614,882),(604,883),(606,883),(604,884),(606,884),(604,885),(606,885),(604,886),(604,887),(606,887),(606,888),(606,889),(609,890),(609,891),(609,892),(609,893),(611,893),(609,894),(611,894),(609,895),(611,895),(665,895),(682,895),(609,896),(609,897),(688,897),(609,898),(609,899),(611,900),(611,901),(611,902),(615,903),(616,903),(617,903),(618,903),(615,904),(616,904),(615,905),(616,905),(619,906),(622,906),(623,906),(682,906),(620,907),(620,908),(623,909),(641,909),(642,909),(661,909),(676,909),(623,910),(624,911),(624,912),(624,913),(624,914),(626,915),(628,915),(626,916),(627,916),(627,917),(629,917),(635,917),(628,918),(629,918),(630,919),(631,920),(686,920),(631,921),(631,922),(634,923),(635,924),(652,924),(653,924),(635,925),(655,925),(635,926),(656,926),(635,927),(660,927),(635,928),(635,929),(635,930),(654,930),(635,931),(668,931),(635,932),(652,932),(653,932),(635,933),(636,933),(637,933),(638,933),(639,933),(640,933),(641,933),(642,933),(643,933),(644,933),(645,933),(646,933),(647,933),(648,933),(650,933),(652,933),(653,933),(654,933),(655,933),(656,933),(657,933),(658,933),(659,933),(660,933),(661,933),(662,933),(663,933),(664,933),(665,933),(666,933),(667,933),(668,933),(669,933),(670,933),(671,933),(672,933),(673,933),(674,933),(675,933),(676,933),(677,933),(678,933),(679,933),(635,934),(636,934),(654,934),(659,934),(667,934),(672,934),(674,934),(675,934),(682,934),(635,935),(677,935),(635,936),(678,936),(635,937),(679,937),(638,938),(657,938),(671,938),(655,939),(658,940),(666,940),(663,941),(664,942),(669,943),(670,944),(671,945),(673,946),(681,947),(684,947),(682,948),(682,949),(682,950),(682,951),(682,952),(682,953),(682,954),(683,955),(684,956),(687,957),(689,958),(690,958),(691,958),(689,959),(690,959),(691,959),(689,960),(690,960),(691,960),(689,961),(690,961),(691,961);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` VALUES (660,'SHOW GRANTS',3,'Syntax:\nSHOW GRANTS\n    [FOR user_or_role\n        [USING role [, role] ...]]\n\nuser_or_role: {\n    user (see )\n  | role (see .\n}\n\nThis statement displays the privileges and roles that are assigned to a\nMySQL user account or role, in the form of GRANT statements that must\nbe executed to duplicate the privilege and role assignments.\n\n*Note*:\n\nTo display nonprivilege information for MySQL accounts, use the SHOW\nCREATE USER statement. See [HELP SHOW CREATE USER].\n\nSHOW GRANTS requires the SELECT privilege for the mysql system schema,\nexcept to display privileges and roles for the current user.\n\nTo name the account or role for SHOW GRANTS, use the same format as for\nthe GRANT statement (for example, \'jeffrey\'@\'localhost\'):\n\nmysql> SHOW GRANTS FOR \'jeffrey\'@\'localhost\';\n+------------------------------------------------------------------+\n| Grants for jeffrey@localhost                                     |\n+------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `jeffrey`@`localhost`                      |\n| GRANT SELECT, INSERT, UPDATE ON `db1`.* TO `jeffrey`@`localhost` |\n+------------------------------------------------------------------+\n\nThe host part, if omitted, defaults to \'%\'. For additional information\nabout specifying account and role names, see\nhttps://dev.mysql.com/doc/refman/8.4/en/account-names.html, and\nhttps://dev.mysql.com/doc/refman/8.4/en/role-names.html.\n\nTo display the privileges granted to the current user (the account you\nare using to connect to the server), you can use any of the following\nstatements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any equivalent syntax) is used in\ndefiner context, such as within a stored procedure that executes with\ndefiner rather than invoker privileges, the grants displayed are those\nof the definer and not the invoker.\n\nIn MySQL 8.4 compared to previous series, SHOW GRANTS no longer\ndisplays ALL PRIVILEGES in its global-privileges output because the\nmeaning of ALL PRIVILEGES at the global level varies depending on which\ndynamic privileges are defined. Instead, SHOW GRANTS explicitly lists\neach granted global privilege:\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD,         |\n| SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES,  |\n| SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION   |\n| SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE,  |\n| ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE,      |\n| CREATE ROLE, DROP ROLE ON *.* TO `root`@`localhost` WITH GRANT      |\n| OPTION                                                              |\n| GRANT PROXY ON \'\'@\'\' TO `root`@`localhost` WITH GRANT OPTION        |\n+---------------------------------------------------------------------+\n\nApplications that process SHOW GRANTS output should be adjusted\naccordingly.\n\nAt the global level, GRANT OPTION applies to all granted static global\nprivileges if granted for any of them, but applies individually to\ngranted dynamic privileges. SHOW GRANTS displays global privileges this\nway:\n\no One line listing all granted static privileges, if there are any,\n  including WITH GRANT OPTION if appropriate.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is granted, if there are any, including WITH GRANT OPTION.\n\no One line listing all granted dynamic privileges for which GRANT\n  OPTION is not granted, if there are any, without WITH GRANT OPTION.\n\nWith the optional USING clause, SHOW GRANTS enables you to examine the\nprivileges associated with roles for the user. Each role named in the\nUSING clause must be granted to the user.\n\nSuppose that user u1 is assigned roles r1 and r2, as follows:\n\nCREATE ROLE \'r1\', \'r2\';\nGRANT SELECT ON db1.* TO \'r1\';\nGRANT INSERT, UPDATE, DELETE ON db1.* TO \'r2\';\nCREATE USER \'u1\'@\'localhost\' IDENTIFIED BY \'u1pass\';\nGRANT \'r1\', \'r2\' TO \'u1\'@\'localhost\';\n\nSHOW GRANTS without USING shows the granted roles:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\n\nAdding a USING clause causes the statement to also display the\nprivileges associated with each role named in the clause:\n\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\';\n+---------------------------------------------+\n| Grants for u1@localhost                     |\n+---------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`      |\n| GRANT SELECT ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost` |\n+---------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r2\';\n+-------------------------------------------------------------+\n| Grants for u1@localhost                                     |\n+-------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                      |\n| GRANT INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                 |\n+-------------------------------------------------------------+\nmysql> SHOW GRANTS FOR \'u1\'@\'localhost\' USING \'r1\', \'r2\';\n+---------------------------------------------------------------------+\n| Grants for u1@localhost                                             |\n+---------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `u1`@`localhost`                              |\n| GRANT SELECT, INSERT, UPDATE, DELETE ON `db1`.* TO `u1`@`localhost` |\n| GRANT `r1`@`%`,`r2`@`%` TO `u1`@`localhost`                         |\n+---------------------------------------------------------------------+\n\n*Note*:\n\nA privilege granted to an account is always in effect, but a role is\nnot. The active roles for an account can differ across and within\nsessions, depending on the value of the activate_all_roles_on_login\nsystem variable, the account default roles, and whether SET ROLE has\nbeen executed within a session.\n\nMySQL supports partial revocation of global privileges, such that a\nglobal privilege can be restricted from applying to particular schemas\n(see https://dev.mysql.com/doc/refman/8.4/en/partial-revokes.html). To\nindicate which global schema privileges have been revoked for\nparticular schemas, SHOW GRANTS output includes REVOKE statements:\n\nmysql> SET PERSIST partial_revokes = ON;\nmysql> CREATE USER u1;\nmysql> GRANT SELECT, INSERT, DELETE ON *.* TO u1;\nmysql> REVOKE SELECT, INSERT ON mysql.* FROM u1;\nmysql> REVOKE DELETE ON world.* FROM u1;\nmysql> SHOW GRANTS FOR u1;\n+--------------------------------------------------+\n| Grants for u1@%                                  |\n+--------------------------------------------------+\n| GRANT SELECT, INSERT, DELETE ON *.* TO `u1`@`%`  |\n| REVOKE SELECT, INSERT ON `mysql`.* FROM `u1`@`%` |\n| REVOKE DELETE ON `world`.* FROM `u1`@`%`         |\n+--------------------------------------------------+\n\nSHOW GRANTS does not display privileges that are available to the named\naccount but are granted to a different account. For example, if an\nanonymous account exists, the named account might be able to use its\nprivileges, but SHOW GRANTS does not display them.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-grants.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-grants.html'),(661,'SHOW INDEX',3,'Syntax:\nSHOW [EXTENDED] {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\n\nmysql> SHOW INDEX FROM City\\G\n*************************** 1. row ***************************\n        Table: city\n   Non_unique: 0\n     Key_name: PRIMARY\n Seq_in_index: 1\n  Column_name: ID\n    Collation: A\n  Cardinality: 4188\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n*************************** 2. row ***************************\n        Table: city\n   Non_unique: 1\n     Key_name: CountryCode\n Seq_in_index: 1\n  Column_name: CountryCode\n    Collation: A\n  Cardinality: 232\n     Sub_part: NULL\n       Packed: NULL\n         Null:\n   Index_type: BTREE\n      Comment:\nIndex_comment:\n      Visible: YES\n   Expression: NULL\n\nAn alternative to tbl_name FROM db_name syntax is db_name.tbl_name.\nThese two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe optional EXTENDED keyword causes the output to include information\nabout hidden indexes that MySQL uses internally and are not accessible\nby users.\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nSHOW INDEX returns the following fields:\n\no Table\n\n  The name of the table.\n\no Non_unique\n\n  0 if the index cannot contain duplicates, 1 if it can.\n\no Key_name\n\n  The name of the index. If the index is the primary key, the name is\n  always PRIMARY.\n\no Seq_in_index\n\n  The column sequence number in the index, starting with 1.\n\no Column_name\n\n  The column name. See also the description for the Expression column.\n\no Collation\n\n  How the column is sorted in the index. This can have values A\n  (ascending), D (descending), or NULL (not sorted).\n\no Cardinality\n\n  An estimate of the number of unique values in the index. To update\n  this number, run ANALYZE TABLE or (for MyISAM tables) myisamchk -a.\n\n  Cardinality is counted based on statistics stored as integers, so the\n  value is not necessarily exact even for small tables. The higher the\n  cardinality, the greater the chance that MySQL uses the index when\n  doing joins.\n\no Sub_part\n\n  The index prefix. That is, the number of indexed characters if the\n  column is only partly indexed, NULL if the entire column is indexed.\n\n  *Note*:\n\n  Prefix limits are measured in bytes. However, prefix lengths for\n  index specifications in CREATE TABLE, ALTER TABLE, and CREATE INDEX\n  statements are interpreted as number of characters for nonbinary\n  string types (CHAR, VARCHAR, TEXT) and number of bytes for binary\n  string types (BINARY, VARBINARY, BLOB). Take this into account when\n  specifying a prefix length for a nonbinary string column that uses a\n  multibyte character set.\n\n  For additional information about index prefixes, see\n  https://dev.mysql.com/doc/refman/8.4/en/column-indexes.html, and\n  [HELP CREATE INDEX].\n\no Packed\n\n  Indicates how the key is packed. NULL if it is not.\n\no Null\n\n  Contains YES if the column may contain NULL values and \'\' if not.\n\no Index_type\n\n  The index method used (BTREE, FULLTEXT, HASH, RTREE).\n\no Comment\n\n  Information about the index not described in its own column, such as\n  disabled if the index is disabled.\n\no Index_comment\n\n  Any comment provided for the index with a COMMENT attribute when the\n  index was created.\n\no Visible\n\n  Whether the index is visible to the optimizer. See\n  https://dev.mysql.com/doc/refman/8.4/en/invisible-indexes.html.\n\no Expression\n\n  MySQL supports functional key parts (see\n  https://dev.mysql.com/doc/refman/8.4/en/create-index.html#create-inde\n  x-functional-key-parts); this affects both the Column_name and\n  Expression columns:\n\n  o For a nonfunctional key part, Column_name indicates the column\n    indexed by the key part and Expression is NULL.\n\n  o For a functional key part, Column_name column is NULL and\n    Expression indicates the expression for the key part.\n\nInformation about table indexes is also available from the\nINFORMATION_SCHEMA STATISTICS table. See\nhttps://dev.mysql.com/doc/refman/8.4/en/information-schema-statistics-t\nable.html. The extended information about hidden indexes is available\nonly using SHOW EXTENDED INDEX; it cannot be obtained from the\nSTATISTICS table.\n\nYou can list a table\'s indexes with the mysqlshow -k db_name tbl_name\ncommand.\n\nSHOW INDEX includes the table\'s generated invisible key, if it has one,\nby default. You can cause this information to be suppressed in the\nstatement\'s output by setting\nshow_gipk_in_create_table_and_information_schema = OFF. For more\ninformation, see\nhttps://dev.mysql.com/doc/refman/8.4/en/create-table-gipks.html.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-index.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-index.html'),(662,'SHOW OPEN TABLES',3,'Syntax:\nSHOW OPEN TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttps://dev.mysql.com/doc/refman/8.4/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-open-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-open-tables.html'),(663,'SHOW PARSE_TREE',3,'Syntax:\nSHOW PARSE_TREE select_statement\n\nSHOW PARSE_TREE displays a representation of the parse tree for the\ninput SELECT statement, in JSON format.\n\n*Note*:\n\nThis statement is available only in debug builds, or if the MySQL\nserver was built using -DWITH_SHOW_PARSE_TREE. It is intended for use\nin testing and development only, and not in production.\n\nExample:\n\nmysql> SHOW PARSE_TREE SELECT * FROM t3 WHERE o_id > 2\\G\n*************************** 1. row ***************************\nShow_parse_tree: {\n  \"text\": \"SELECT * FROM t3 WHERE o_id > 2\",\n  \"type\": \"PT_select_stmt\",\n  \"components\": [\n    {\n      \"text\": \"SELECT * FROM t3 WHERE o_id > 2\",\n      \"type\": \"PT_query_expression\",\n      \"components\": [\n        {\n          \"text\": \"SELECT * FROM t3 WHERE o_id > 2\",\n          \"type\": \"PT_query_specification\",\n          \"components\": [\n            {\n              \"text\": \"*\",\n              \"type\": \"PT_select_item_list\",\n              \"components\": [\n                {\n                  \"text\": \"*\",\n                  \"type\": \"Item_asterisk\"\n                }\n              ]\n            },\n            {\n              \"text\": \"t3\",\n              \"type\": \"PT_table_factor_table_ident\",\n              \"table_ident\": \"`t3`\"\n            },\n            {\n              \"text\": \"o_id > 2\",\n              \"type\": \"PTI_where\",\n              \"components\": [\n                {\n                  \"text\": \"o_id > 2\",\n                  \"type\": \"PTI_comp_op\",\n                  \"operator\": \">\",\n                  \"components\": [\n                    {\n                      \"text\": \"o_id\",\n                      \"type\": \"PTI_simple_ident_ident\"\n                    },\n                    {\n                      \"text\": \"2\",\n                      \"type\": \"Item_int\"\n                    }\n                  ]\n                }\n              ]\n            }\n          ]\n        }\n      ]\n    }\n  ]\n}\n1 row in set (0.01 sec)\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-parse-tree.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-parse-tree.html'),(664,'SHOW PLUGINS',3,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-plugins.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-plugins.html'),(665,'SHOW PRIVILEGES',3,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The privileges displayed include all static\nprivileges, and all currently registered dynamic privileges.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-privileges.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-privileges.html'),(666,'SHOW PROCEDURE CODE',3,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, or have the SELECT privilege\nat the global level.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n       BEGIN\n         DECLARE fanta INT DEFAULT 55;\n         DROP TABLE t2;\n         LOOP\n           INSERT INTO t3 VALUES (fanta);\n           END LOOP;\n         END//\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n\nmysql> CREATE FUNCTION test.hello (s CHAR(20))\n       RETURNS CHAR(50) DETERMINISTIC\n       RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW FUNCTION CODE test.hello;\n+-----+---------------------------------------+\n| Pos | Instruction                           |\n+-----+---------------------------------------+\n|   0 | freturn 254 concat(\'Hello, \',s@0,\'!\') |\n+-----+---------------------------------------+\n1 row in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.4/en/show-procedure-code.html'),(667,'SHOW PROCEDURE STATUS',3,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nTo use either statement, you must be the user named as the routine\nDEFINER, have the SHOW_ROUTINE privilege, have the SELECT privilege at\nthe global level, or have the CREATE ROUTINE, ALTER ROUTINE, or EXECUTE\nprivilege granted at a scope that includes the routine.\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2018-08-08 13:54:11\n             Created: 2018-08-08 13:54:11\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nmysql> SHOW FUNCTION STATUS LIKE \'hello\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: hello\n                Type: FUNCTION\n             Definer: testuser@localhost\n            Modified: 2020-03-10 11:10:03\n             Created: 2020-03-10 11:10:03\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n','https://dev.mysql.com/doc/refman/8.4/en/show-procedure-status.html'),(668,'SHOW PROCESSLIST',3,'Syntax:\nSHOW [FULL] PROCESSLIST\n\n*Important*:\n\nThe INFORMATION SCHEMA implementation of SHOW PROCESSLIST is deprecated\nand subject to removal in a future MySQL release. It is recommended to\nuse the Performance Schema implementation of SHOW PROCESSLIST instead.\n\nThe MySQL process list indicates the operations currently being\nperformed by the set of threads executing within the server. The SHOW\nPROCESSLIST statement is one source of process information. For a\ncomparison of this statement with other sources, see\nhttps://dev.mysql.com/doc/refman/8.4/en/processlist-access.html#process\nlist-sources.\n\n*Note*:\n\nAn alternative implementation for SHOW PROCESSLIST is available based\non the Performance Schema processlist table, which, unlike the default\nSHOW PROCESSLIST implementation, does not require a mutex and has\nbetter performance characteristics. For details, see\nhttps://dev.mysql.com/doc/refman/8.4/en/performance-schema-processlist-\ntable.html.\n\nIf you have the PROCESS privilege, you can see all threads, even those\nbelonging to other users. Otherwise (without the PROCESS privilege),\nnonanonymous users have access to information about their own threads\nbut not threads for other users, and anonymous users have no access to\nthread information.\n\nWithout the FULL keyword, SHOW PROCESSLIST displays only the first 100\ncharacters of each statement in the Info field.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-processlist.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-processlist.html'),(669,'SHOW PROFILE',3,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype: {\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n}\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect\nthem to be removed in a future MySQL release. Use the Performance\nSchema instead; see\nhttps://dev.mysql.com/doc/refman/8.4/en/performance-schema-query-profil\ning.html.\n\nTo control profiling, use the profiling session variable, which has a\ndefault value of 0 (OFF). Enable profiling by setting profiling to 1 or\nON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nneither of those statements appears in the profile list. Malformed\nstatements are profiled. For example, SHOW PROFILING is an illegal\nstatement, and a syntax error occurs if you try to execute it, but it\nshows up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretation for\nthe two statements for some status values (see\nhttps://dev.mysql.com/doc/refman/8.4/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','https://dev.mysql.com/doc/refman/8.4/en/show-profile.html'),(670,'SHOW PROFILES',3,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\n*Note*:\n\nThe SHOW PROFILE and SHOW PROFILES statements are deprecated; expect it\nto be removed in a future MySQL release. Use the Performance Schema\ninstead; see\nhttps://dev.mysql.com/doc/refman/8.4/en/performance-schema-query-profil\ning.html.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-profiles.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-profiles.html'),(671,'SHOW RELAYLOG EVENTS',3,'Syntax:\nSHOW RELAYLOG EVENTS\n    [IN \'log_name\']\n    [FROM pos]\n    [LIMIT [offset,] row_count]\n    [channel_option]\n\nchannel_option:\n    FOR CHANNEL channel\n\nShows the events in the relay log of a replica. If you do not specify\n\'log_name\', the first relay log is displayed. This statement has no\neffect on the source. SHOW RELAYLOG EVENTS requires the REPLICATION\nSLAVE privilege.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-relaylog-events.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-relaylog-events.html'),(672,'SHOW REPLICA STATUS',3,'Syntax:\nSHOW REPLICA STATUS [FOR CHANNEL channel]\n\nThis statement provides status information on essential parameters of\nthe replica threads. The statement requires the REPLICATION CLIENT\nprivilege (or the deprecated SUPER privilege).\n\nSHOW REPLICA STATUS is nonblocking. When run concurrently with STOP\nREPLICA, SHOW REPLICA STATUS returns without waiting for STOP REPLICA\nto finish shutting down the replication SQL (applier) thread or\nreplication I/O (receiver) thread (or both). This permits use in\nmonitoring and other applications where getting an immediate response\nfrom SHOW REPLICA STATUS is more important than ensuring that it\nreturned the latest data.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW REPLICA STATUS\\G\n*************************** 1. row ***************************\n             Replica_IO_State: Waiting for source to send event\n                  Source_Host: 127.0.0.1\n                  Source_User: root\n                  Source_Port: 13000\n                Connect_Retry: 1\n              Source_Log_File: master-bin.000001\n          Read_Source_Log_Pos: 927\n               Relay_Log_File: slave-relay-bin.000002\n                Relay_Log_Pos: 1145\n        Relay_Source_Log_File: master-bin.000001\n           Replica_IO_Running: Yes\n          Replica_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Source_Log_Pos: 927\n              Relay_Log_Space: 1355\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Source_SSL_Allowed: No\n           Source_SSL_CA_File:\n           Source_SSL_CA_Path:\n              Source_SSL_Cert:\n            Source_SSL_Cipher:\n               Source_SSL_Key:\n        Seconds_Behind_Source: 0\nSource_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids:\n             Source_Server_Id: 1\n                  Source_UUID: 73f86016-978b-11ee-ade5-8d2a2a562feb\n             Source_Info_File: mysql.slave_master_info\n                    SQL_Delay: 0\n          SQL_Remaining_Delay: NULL\n    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates\n           Source_Retry_Count: 10\n                  Source_Bind:\n      Last_IO_Error_Timestamp:\n     Last_SQL_Error_Timestamp:\n               Source_SSL_Crl:\n           Source_SSL_Crlpath:\n           Retrieved_Gtid_Set: 73f86016-978b-11ee-ade5-8d2a2a562feb:1-3\n            Executed_Gtid_Set: 73f86016-978b-11ee-ade5-8d2a2a562feb:1-3\n                Auto_Position: 1\n         Replicate_Rewrite_DB:\n                 Channel_Name:\n           Source_TLS_Version:\n       Source_public_key_path:\n        Get_Source_public_key: 0\n            Network_Namespace:\n\nThe Performance Schema provides tables that expose replication\ninformation. This is similar to the information available from the SHOW\nREPLICA STATUS statement, but represented in table form. For details,\nsee\nhttps://dev.mysql.com/doc/refman/8.4/en/performance-schema-replication-\ntables.html.\n\nYou can set the GTID_ONLY option for the CHANGE REPLICATION SOURCE TO\nstatement to stop a replication channel from persisting file names and\nfile positions in the replication metadata repositories. With this\nsetting, file positions for the source binary log file and the relay\nlog file are tracked in memory. The SHOW REPLICA STATUS statement still\ndisplays file positions in normal use. However, because the file\npositions are not being regularly updated in the connection metadata\nrepository and the applier metadata repository except in a few\nsituations, they are likely to be out of date if the server is\nrestarted.\n\nFor a replication channel with the GTID_ONLY setting after a server\nstart, the read and applied file positions for the source binary log\nfile (Read_Source_Log_Pos and Exec_Source_Log_Pos) are set to zero, and\nthe file names (Source_Log_File and Relay_Source_Log_File) are set to\nINVALID. The relay log file name (Relay_Log_File) is set according to\nthe relay_log_recovery setting, either a new file that was created at\nserver start or the first relay log file present. The file position\n(Relay_Log_Pos) is set to position 4, and GTID auto-skip is used to\nskip any transactions in the file that were already applied.\n\nWhen the receiver thread contacts the source and gets valid position\ninformation, the read position (Read_Source_Log_Pos) and file name\n(Source_Log_File) are updated with the correct data and become valid.\nWhen the applier thread applies a transaction from the source, or skips\nan already executed transaction, the executed position\n(Exec_Source_Log_Pos) and file name (Relay_Source_Log_File) are updated\nwith the correct data and become valid. The relay log file position\n(Relay_Log_Pos) is also updated at that time.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-replica-status.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-replica-status.html'),(673,'SHOW REPLICAS',3,'Syntax:\nSHOW REPLICAS\n\nDisplays a list of replicas currently registered with the source. SHOW\nREPLICAS requires the REPLICATION SLAVE privilege.\n\nSHOW REPLICAS should be executed on a server that acts as a replication\nsource. The statement displays information about servers that are or\nhave been connected as replicas, with each row of the result\ncorresponding to one replica server, as shown here:\n\nmysql> SHOW REPLICAS;\n+------------+-----------+------+-----------+--------------------------------------+\n| Server_id  | Host      | Port | Source_id | Replica_UUID                         |\n+------------+-----------+------+-----------+--------------------------------------+\n|         10 | iconnect2 | 3306 |         3 | 14cb6624-7f93-11e0-b2c0-c80aa9429562 |\n|         21 | athena    | 3306 |         3 | 07af4990-f41f-11df-a566-7ac56fdaf645 |\n+------------+-----------+------+-----------+--------------------------------------+\n\no Server_id: The unique server ID of the replica server, as configured\n  in the replica server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the replica server, as specified on the\n  replica with the --report-host option. This can differ from the\n  machine name as configured in the operating system.\n\no User: The replica server user name, as specified on the replica with\n  the --report-user option. Statement output includes this column only\n  if the source server is started with the --show-replica-auth-info\n  option.\n\no Password: The replica server password, as specified on the replica\n  with the --report-password option. Statement output includes this\n  column only if the source server is started with the\n  --show-replica-auth-info option.\n\no Port: The port on the source to which the replica server is\n  listening, as specified on the replica with the --report-port option.\n\n  A zero in this column means that the replica port (--report-port) was\n  not set.\n\no Source_id: The unique server ID of the source server that the replica\n  server is replicating from. This is the server ID of the server on\n  which SHOW REPLICAS is executed, so this same value is listed for\n  each row in the result.\n\no Replica_UUID: The globally unique ID of this replica, as generated on\n  the replica and found in the replica\'s auto.cnf file.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-replicas.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-replicas.html'),(674,'SHOW STATUS',3,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information (see\nhttps://dev.mysql.com/doc/refman/8.4/en/server-status-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nStatus variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.4/en/performance-schema-status-var\n  iable-tables.html.\n\no The mysqladmin extended-status command. See\n  https://dev.mysql.com/doc/refman/8.4/en/mysqladmin.html.\n\nFor SHOW STATUS, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nSHOW STATUS accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays the global status\n  values. A global status variable may represent status for some aspect\n  of the server itself (for example, Aborted_connects), or the\n  aggregated status over all connections to MySQL (for example,\n  Bytes_received and Bytes_sent). If a variable has no global value,\n  the session value is displayed.\n\no With a SESSION modifier, the statement displays the status variable\n  values for the current connection. If a variable has no session\n  value, the global value is displayed. LOCAL is a synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each status variable is listed at\nhttps://dev.mysql.com/doc/refman/8.4/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-status.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-status.html'),(675,'SHOW TABLE STATUS',3,'Syntax:\nSHOW TABLE STATUS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works like SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-table-status.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-table-status.html'),(676,'SHOW TABLES',3,'Syntax:\nSHOW [EXTENDED] [FULL] TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nMatching performed by the LIKE clause is dependent on the setting of\nthe lower_case_table_names system variable.\n\nThe optional EXTENDED modifier causes SHOW TABLES to list hidden tables\ncreated by failed ALTER TABLE statements. These temporary tables have\nnames beginning with #sql and can be dropped using DROP TABLE.\n\nThis statement also lists any views in the database. The optional FULL\nmodifier causes SHOW TABLES to display a second output column with\nvalues of BASE TABLE for a table, VIEW for a view, or SYSTEM VIEW for\nan INFORMATION_SCHEMA table.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-tables.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-tables.html'),(677,'SHOW TRIGGERS',3,'Syntax:\nSHOW TRIGGERS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names (not trigger names) to match and causes the statement\nto display triggers for those tables. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nFor the ins_sum trigger defined in\nhttps://dev.mysql.com/doc/refman/8.4/en/triggers.html, the output of\nSHOW TRIGGERS is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: 2018-08-08 10:10:12.61\n            sql_mode: ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,\n                      NO_ZERO_IN_DATE,NO_ZERO_DATE,\n                      ERROR_FOR_DIVISION_BY_ZERO,\n                      NO_ENGINE_SUBSTITUTION\n             Definer: me@localhost\ncharacter_set_client: utf8mb4\ncollation_connection: utf8mb4_0900_ai_ci\n  Database Collation: utf8mb4_0900_ai_ci\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-triggers.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-triggers.html'),(678,'SHOW VARIABLES',3,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables (see\nhttps://dev.mysql.com/doc/refman/8.4/en/server-system-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nSystem variable information is also available from these sources:\n\no Performance Schema tables. See\n  https://dev.mysql.com/doc/refman/8.4/en/performance-schema-system-var\n  iable-tables.html.\n\no The mysqladmin variables command. See\n  https://dev.mysql.com/doc/refman/8.4/en/mysqladmin.html.\n\nFor SHOW VARIABLES, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://dev.mysql.com/doc/refman/8.4/en/extended-show.html.\n\nSHOW VARIABLES accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays global system variable\n  values. These are the values used to initialize the corresponding\n  session variables for new connections to MySQL. If a variable has no\n  global value, no value is displayed.\n\no With a SESSION modifier, the statement displays the system variable\n  values that are in effect for the current connection. If a variable\n  has no session value, the global value is displayed. LOCAL is a\n  synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each system variable is listed at\nhttps://dev.mysql.com/doc/refman/8.4/en/server-system-variables.html.\n\nSHOW VARIABLES is subject to a version-dependent display-width limit.\nFor variables with very long values that are not completely displayed,\nuse SELECT as a workaround. For example:\n\nSELECT @@GLOBAL.innodb_data_file_path;\n\nMost system variables can be set at server startup (read-only variables\nsuch as version_comment are exceptions). Many can be changed at runtime\nwith the SET statement. See\nhttps://dev.mysql.com/doc/refman/8.4/en/using-system-variables.html,\nand [HELP SET].\n\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the %\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because _ is a wildcard that matches any\nsingle character, you should escape it as \\_ to match it literally. In\npractice, this is rarely necessary.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-variables.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-variables.html'),(679,'SHOW WARNINGS',3,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS is a diagnostic statement that displays information about\nthe conditions (errors, warnings, and notes) resulting from executing a\nstatement in the current session. Warnings are generated for DML\nstatements such as INSERT, UPDATE, and LOAD DATA as well as DDL\nstatements such as CREATE TABLE and ALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://dev.mysql.com/doc/refman/8.4/en/select.html.\n\nSHOW WARNINGS is also used following EXPLAIN, to display the extended\ninformation generated by EXPLAIN. See\nhttps://dev.mysql.com/doc/refman/8.4/en/explain-extended.html.\n\nSHOW WARNINGS displays information about the conditions resulting from\nexecution of the most recent nondiagnostic statement in the current\nsession. If the most recent statement resulted in an error during\nparsing, SHOW WARNINGS shows the resulting conditions, regardless of\nstatement type (diagnostic or nondiagnostic).\n\nThe SHOW COUNT(*) WARNINGS diagnostic statement displays the total\nnumber of errors, warnings, and notes. You can also retrieve this\nnumber from the warning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nA difference in these statements is that the first is a diagnostic\nstatement that does not clear the message list. The second, because it\nis a SELECT statement is considered nondiagnostic and does clear the\nmessage list.\n\nA related diagnostic statement, SHOW ERRORS, shows only error\nconditions (it excludes warnings and notes), and SHOW COUNT(*) ERRORS\nstatement displays the total number of errors. See [HELP SHOW ERRORS].\nGET DIAGNOSTICS can be used to examine information for individual\nconditions. See [HELP GET DIAGNOSTICS].\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/show-warnings.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/show-warnings.html'),(680,'BINLOG',3,'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See https://dev.mysql.com/doc/refman/8.4/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event.\n\nTo execute BINLOG statements when applying mysqlbinlog output, a user\naccount requires the BINLOG_ADMIN privilege (or the deprecated SUPER\nprivilege), or the REPLICATION_APPLIER privilege plus the appropriate\nprivileges to execute each log event.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/binlog.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/binlog.html'),(681,'CACHE INDEX',3,'Syntax:\nCACHE INDEX {\n      tbl_index_list [, tbl_index_list] ...\n    | tbl_name PARTITION (partition_list)\n  }\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [{INDEX|KEY} (index_name[, index_name] ...)]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It applies only to MyISAM tables, including partitioned MyISAM\ntables. After the indexes have been assigned, they can be preloaded\ninto the cache if desired with LOAD INDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/cache-index.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/cache-index.html'),(682,'FLUSH',3,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL] {\n    flush_option [, flush_option] ...\n  | tables_option\n}\n\nflush_option: {\n    BINARY LOGS\n  | ENGINE LOGS\n  | ERROR LOGS\n  | GENERAL LOGS\n  | LOGS\n  | PRIVILEGES\n  | OPTIMIZER_COSTS\n  | RELAY LOGS [FOR CHANNEL channel]\n  | SLOW LOGS\n  | STATUS\n  | USER_RESOURCES\n}\n\ntables_option: {\n    table_synonym\n  | table_synonym tbl_name [, tbl_name] ...\n  | table_synonym WITH READ LOCK\n  | table_synonym tbl_name [, tbl_name] ... WITH READ LOCK\n  | table_synonym tbl_name [, tbl_name] ... FOR EXPORT\n}\n\ntable_synonym: {\n    TABLE\n  | TABLES\n}\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. Each FLUSH\noperation requires the privileges indicated in its description.\n\n*Note*:\n\nIt is not possible to issue FLUSH statements within stored functions or\ntriggers. However, you may use FLUSH in stored procedures, so long as\nthese are not called from stored functions or triggers. See\nhttps://dev.mysql.com/doc/refman/8.4/en/stored-program-restrictions.html\n.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replicas. To suppress logging, specify the\noptional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*:\n\nFLUSH LOGS, FLUSH BINARY LOGS, FLUSH TABLES WITH READ LOCK (with or\nwithout a table list), and FLUSH TABLES tbl_name ... FOR EXPORT are not\nwritten to the binary log in any case because they would cause problems\nif replicated to a replica.\n\nThe FLUSH statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.4/en/implicit-commit.html.\n\nThe mysqladmin utility provides a command-line interface to some flush\noperations, using commands such as flush-logs, flush-privileges,\nflush-status, and flush-tables. See\nhttps://dev.mysql.com/doc/refman/8.4/en/mysqladmin.html.\n\nSending a SIGHUP or SIGUSR1 signal to the server causes several flush\noperations to occur that are similar to various forms of the FLUSH\nstatement. Signals can be sent by the root system account or the system\naccount that owns the server process. This enables the flush operations\nto be performed without having to connect to the server, which requires\na MySQL account that has privileges sufficient for those operations.\nSee https://dev.mysql.com/doc/refman/8.4/en/unix-signal-response.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using RESET with replication.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/flush.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/flush.html'),(683,'KILL',3,'Syntax:\nKILL [CONNECTION | QUERY] processlist_id\n\nEach connection to mysqld runs in a separate thread. You can kill a\nthread with the KILL processlist_id statement.\n\nThread processlist identifiers can be determined from the ID column of\nthe INFORMATION_SCHEMA PROCESSLIST table, the Id column of SHOW\nPROCESSLIST output, and the PROCESSLIST_ID column of the Performance\nSchema threads table. The value for the current thread is returned by\nthe CONNECTION_ID() function.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given processlist_id, after\n  terminating any statement the connection is executing.\n\no KILL QUERY terminates the statement the connection is currently\n  executing, but leaves the connection itself intact.\n\nThe ability to see which threads are available to be killed depends on\nthe PROCESS privilege:\n\no Without PROCESS, you can see only your own threads.\n\no With PROCESS, you can see all threads.\n\nThe ability to kill threads and statements depends on the\nCONNECTION_ADMIN privilege and the deprecated SUPER privilege:\n\no Without CONNECTION_ADMIN or SUPER, you can kill only your own threads\n  and statements.\n\no With CONNECTION_ADMIN or SUPER, you can kill all threads and\n  statements, except that to affect a thread or statement that is\n  executing with the SYSTEM_USER privilege, your own session must\n  additionally have the SYSTEM_USER privilege.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/kill.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/kill.html'),(684,'LOAD INDEX',3,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list)]\n    [{INDEX|KEY} (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list: {\n    partition_name[, partition_name] ...\n  | ALL\n}\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE applies only to MyISAM tables, including\npartitioned MyISAM tables. In addition, indexes on partitioned tables\ncan be preloaded for one, several, or all partitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/load-index.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/load-index.html'),(685,'RESET',3,'Syntax:\nRESET reset_option [, reset_option] ...\n\nreset_option: {\n    BINARY LOGS AND GTIDS\n  | REPLICA\n}\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nFor information about the RESET PERSIST statement that removes\npersisted global system variables, see [HELP RESET PERSIST].\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttps://dev.mysql.com/doc/refman/8.4/en/implicit-commit.html.\n\nThe following list describes the permitted RESET statement reset_option\nvalues:\n\no RESET BINARY LOGS AND GTIDS\n\n  Deletes all binary logs listed in the index file, resets the binary\n  log index file to be empty, and creates a new binary log file.\n\no RESET REPLICA\n\n  Makes the replica forget its replication position in the source\n  binary logs. Also resets the relay log by deleting any existing relay\n  log files and beginning a new one.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/reset.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/reset.html'),(686,'RESET PERSIST',3,'Syntax:\nRESET PERSIST [[IF EXISTS] system_var_name]\n\nRESET PERSIST removes persisted global system variable settings from\nthe mysqld-auto.cnf option file in the data directory. Removing a\npersisted system variable causes the variable no longer to be\ninitialized from mysqld-auto.cnf at server startup. For more\ninformation about persisting system variables and the mysqld-auto.cnf\nfile, see\nhttps://dev.mysql.com/doc/refman/8.4/en/persisted-system-variables.html\n.\n\nThe privileges required for RESET PERSIST depend on the type of system\nvariable to be removed:\n\no For dynamic system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN privilege (or the deprecated SUPER privilege).\n\no For read-only system variables, this statement requires the\n  SYSTEM_VARIABLES_ADMIN and PERSIST_RO_VARIABLES_ADMIN privileges.\n\nSee\nhttps://dev.mysql.com/doc/refman/8.4/en/system-variable-privileges.html\n.\n\nDepending on whether the variable name and IF EXISTS clauses are\npresent, the RESET PERSIST statement has these forms:\n\no To remove all persisted variables from mysqld-auto.cnf, use RESET\n  PERSIST without naming any system variable:\n\nRESET PERSIST;\n\n  You must have privileges for removing both dynamic and read-only\n  system variables if mysqld-auto.cnf contains both kinds of variables.\n\no To remove a specific persisted variable from mysqld-auto.cnf, name it\n  in the statement:\n\nRESET PERSIST system_var_name;\n\n  This includes plugin system variables, even if the plugin is not\n  currently installed. If the variable is not present in the file, an\n  error occurs.\n\no To remove a specific persisted variable from mysqld-auto.cnf, but\n  produce a warning rather than an error if the variable is not present\n  in the file, add an IF EXISTS clause to the previous syntax:\n\nRESET PERSIST IF EXISTS system_var_name;\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/reset-persist.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/reset-persist.html'),(687,'RESTART',3,'Syntax:\nRESTART\n\nThis statement stops and restarts the MySQL server. It requires the\nSHUTDOWN privilege.\n\nOne use for RESTART is when it is not possible or convenient to gain\ncommand-line access to the MySQL server on the server host to restart\nit. For example, SET PERSIST_ONLY can be used at runtime to make\nconfiguration changes to system variables that can be set only at\nserver startup, but the server must still be restarted for those\nchanges to take effect. The RESTART statement provides a way to do so\nfrom within client sessions, without requiring command-line access on\nthe server host.\n\n*Note*:\n\nAfter executing a RESTART statement, the client can expect the current\nconnection to be lost. If auto-reconnect is enabled, the connection is\nreestablished after the server restarts. Otherwise, the connection must\nbe reestablished manually.\n\nA successful RESTART operation requires mysqld to be running in an\nenvironment that has a monitoring process available to detect a server\nshutdown performed for restart purposes:\n\no In the presence of a monitoring process, RESTART causes mysqld to\n  terminate such that the monitoring process can determine that it\n  should start a new mysqld instance.\n\no If no monitoring process is present, RESTART fails with an error.\n\nThese platforms provide the necessary monitoring support for the\nRESTART statement:\n\no Windows, when mysqld is started as a Windows service or standalone.\n  (mysqld forks, and one process acts as a monitor to the other, which\n  acts as the server.)\n\no Unix and Unix-like systems that use systemd or mysqld_safe to manage\n  mysqld.\n\nTo configure a monitoring environment such that mysqld enables the\nRESTART statement:\n\n1. Set the MYSQLD_PARENT_PID environment variable to the value of the\n   process ID of the process that starts mysqld, before starting\n   mysqld.\n\n2. When mysqld performs a shutdown due to use of the RESTART statement,\n   it returns exit code 16.\n\n3. When the monitoring process detects an exit code of 16, it starts\n   mysqld again. Otherwise, it exits.\n\nHere is a minimal example as implemented in the bash shell:\n\n#!/bin/bash\n\nexport MYSQLD_PARENT_PID=$$\n\nexport MYSQLD_RESTART_EXIT=16\n\nwhile true ; do\n  bin/mysqld mysqld options here\n  if [ $? -ne $MYSQLD_RESTART_EXIT ]; then\n    break\n  fi\ndone\n\nOn Windows, the forking used to implement RESTART makes determining the\nserver process to attach to for debugging more difficult. To alleviate\nthis, starting the server with --gdb suppresses forking, in addition to\nits other actions done to set up a debugging environment. In non-debug\nsettings, --no-monitor may be used for the sole purpose of suppressing\nforking the monitor process. For a server started with either --gdb or\n--no-monitor, executing RESTART causes the server to simply exit\nwithout restarting.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/restart.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/restart.html'),(688,'SHUTDOWN',3,'Syntax:\nSHUTDOWN\n\nThis statement stops the MySQL server. It requires the SHUTDOWN\nprivilege.\n\nSHUTDOWN provides an SQL-level interface to the same functionality\navailable using the mysqladmin shutdown command. A successful SHUTDOWN\nsequence consists of checking the privileges, validating the arguments,\nand sending an OK packet to the client. Then the server is shut down.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/shutdown.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/shutdown.html'),(689,'EXPLAIN',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type] [INTO variable]\n    {[schema_spec] explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] [schema_spec] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nschema_spec:\nFOR {SCHEMA | DATABASE} schema_name\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/explain.html'),(690,'DESCRIBE',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type] [INTO variable]\n    {[schema_spec] explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] [schema_spec] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nschema_spec:\nFOR {SCHEMA | DATABASE} schema_name\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/explain.html'),(691,'DESC',51,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type] [INTO variable]\n    {[schema_spec] explainable_stmt | FOR CONNECTION connection_id}\n\n{EXPLAIN | DESCRIBE | DESC} ANALYZE [FORMAT = TREE] [schema_spec] select_statement\n\nexplain_type: {\n    FORMAT = format_name\n}\n\nformat_name: {\n    TRADITIONAL\n  | JSON\n  | TREE\n}\n\nexplainable_stmt: {\n    SELECT statement\n  | TABLE statement\n  | DELETE statement\n  | INSERT statement\n  | REPLACE statement\n  | UPDATE statement\n}\n\nschema_spec:\nFOR {SCHEMA | DATABASE} schema_name\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/explain.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/explain.html'),(692,'HELP STATEMENT',51,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nManual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttps://dev.mysql.com/doc/refman/8.4/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not\ncase-sensitive.\n\nThe search string can contain the wildcard characters % and _. These\nhave the same meaning as for pattern-matching operations performed with\nthe LIKE operator. For example, HELP \'rep%\' returns a list of topics\nthat begin with rep.\n\nThe HELP statement does not require a terminator such as ; or \\G.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/help.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/help.html'),(693,'USE',51,'Syntax:\nUSE db_name\n\nThe USE statement tells MySQL to use the named database as the default\n(current) database for subsequent statements. This statement requires\nsome privilege for the database or some object within it.\n\nThe named database remains the default until the end of the session or\nanother USE statement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nThe database name must be specified on a single line. Newlines in\ndatabase names are not supported.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/use.html\n\n','','https://dev.mysql.com/doc/refman/8.4/en/use.html'),(694,'MERGE',52,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column data types and\nindex information. You cannot merge MyISAM tables in which the columns\nare listed in a different order, do not have exactly the same data\ntypes in corresponding columns, or have the indexes in different order.\nHowever, any or all of the MyISAM tables can be compressed with\nmyisampack. See\nhttps://dev.mysql.com/doc/refman/8.4/en/myisampack.html. Differences\nbetween tables such as these do not matter:\n\no Names of corresponding columns and indexes can differ.\n\no Comments for tables, columns, and indexes can differ.\n\no Table options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS can\n  differ.\n\nURL: https://dev.mysql.com/doc/refman/8.4/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','https://dev.mysql.com/doc/refman/8.4/en/merge-storage-engine.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `innodb_index_stats`
--

/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_index_stats` VALUES ('base_3','correos_recibidos','PRIMARY','2024-11-13 00:12:01','n_diff_pfx01',2,1,'id'),('base_3','correos_recibidos','PRIMARY','2024-11-13 00:12:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','correos_recibidos','PRIMARY','2024-11-13 00:12:01','size',1,NULL,'Number of pages in the index'),('base_3','correos_recibidos','correo_id','2024-11-13 00:12:01','n_diff_pfx01',1,1,'correo_id'),('base_3','correos_recibidos','correo_id','2024-11-13 00:12:01','n_diff_pfx02',2,1,'correo_id,id'),('base_3','correos_recibidos','correo_id','2024-11-13 00:12:01','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','correos_recibidos','correo_id','2024-11-13 00:12:01','size',1,NULL,'Number of pages in the index'),('base_3','usuarios','PRIMARY','2024-11-11 22:05:35','n_diff_pfx01',0,1,'id'),('base_3','usuarios','PRIMARY','2024-11-11 22:05:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','usuarios','PRIMARY','2024-11-11 22:05:35','size',1,NULL,'Number of pages in the index'),('base_3','usuarios','correo','2024-11-11 22:05:35','n_diff_pfx01',0,1,'correo'),('base_3','usuarios','correo','2024-11-11 22:05:35','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','usuarios','correo','2024-11-11 22:05:35','size',1,NULL,'Number of pages in the index'),('base_3','usuarios2','PRIMARY','2024-11-12 23:57:14','n_diff_pfx01',2,1,'id'),('base_3','usuarios2','PRIMARY','2024-11-12 23:57:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','usuarios2','PRIMARY','2024-11-12 23:57:14','size',1,NULL,'Number of pages in the index'),('base_3','usuarios2','correo','2024-11-12 23:57:14','n_diff_pfx01',2,1,'correo'),('base_3','usuarios2','correo','2024-11-12 23:57:14','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('base_3','usuarios2','correo','2024-11-12 23:57:14','size',1,NULL,'Number of pages in the index'),('mysql','component','PRIMARY','2024-11-11 21:50:25','n_diff_pfx01',0,1,'component_id'),('mysql','component','PRIMARY','2024-11-11 21:50:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','component','PRIMARY','2024-11-11 21:50:25','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2024-11-11 21:50:43','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2024-11-11 21:50:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2024-11-11 21:50:43','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;

--
-- Dumping data for table `innodb_table_stats`
--

/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT  IGNORE INTO `innodb_table_stats` VALUES ('base_3','correos_recibidos','2024-11-13 00:12:01',2,1,1),('base_3','usuarios','2024-11-11 22:05:35',0,1,1),('base_3','usuarios2','2024-11-12 23:57:14',2,1,1),('mysql','component','2024-11-11 21:50:25',0,1,0),('sys','sys_config','2024-11-11 21:50:43',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint unsigned NOT NULL,
  `inserts` int unsigned NOT NULL,
  `updates` int unsigned NOT NULL,
  `deletes` int unsigned NOT NULL,
  `schemaops` int unsigned NOT NULL,
  `orig_server_id` int unsigned NOT NULL,
  `orig_epoch` bigint unsigned NOT NULL,
  `gci` int unsigned NOT NULL,
  `next_position` bigint unsigned NOT NULL,
  `next_file` varchar(255) NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=latin1 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8mb3_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_history`
--

LOCK TABLES `password_history` WRITE;
/*!40000 ALTER TABLE `password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8mb3_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Db`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@','2024-11-11 21:50:27');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Port` int unsigned NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Network_namespace` char(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  `Weight` tinyint unsigned NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (`Channel_name`,`Host`,`Port`,`Network_namespace`,`Managed_name`),
  KEY `Channel_name` (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover`
--

LOCK TABLES `replication_asynchronous_connection_failover` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_asynchronous_connection_failover_managed`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover_managed` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  `Managed_type` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  `Configuration` json DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The managed source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_asynchronous_connection_failover_managed`
--

LOCK TABLES `replication_asynchronous_connection_failover_managed` WRITE;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` DISABLE KEYS */;
/*!40000 ALTER TABLE `replication_asynchronous_connection_failover_managed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_configuration_version`
--

DROP TABLE IF EXISTS `replication_group_configuration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_configuration_version` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The configuration name.',
  `version` bigint unsigned NOT NULL COMMENT 'The version of the configuration name.',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The group configuration version.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_configuration_version`
--

LOCK TABLES `replication_group_configuration_version` WRITE;
/*!40000 ALTER TABLE `replication_group_configuration_version` DISABLE KEYS */;
INSERT INTO `replication_group_configuration_version` VALUES ('replication_group_member_actions',1);
/*!40000 ALTER TABLE `replication_group_configuration_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replication_group_member_actions`
--

DROP TABLE IF EXISTS `replication_group_member_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_member_actions` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action name.',
  `event` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The event that will trigger the action.',
  `enabled` tinyint(1) NOT NULL COMMENT 'Whether the action is enabled.',
  `type` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action type.',
  `priority` tinyint unsigned NOT NULL COMMENT 'The order on which the action will be run, value between 1 and 100, lower values first.',
  `error_handling` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'On errors during the action will be handled: IGNORE, CRITICAL.',
  PRIMARY KEY (`name`,`event`),
  KEY `event` (`event`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The member actions configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replication_group_member_actions`
--

LOCK TABLES `replication_group_member_actions` WRITE;
/*!40000 ALTER TABLE `replication_group_member_actions` DISABLE KEYS */;
INSERT INTO `replication_group_member_actions` VALUES ('mysql_disable_super_read_only_if_primary','AFTER_PRIMARY_ELECTION',1,'INTERNAL',1,'IGNORE'),('mysql_start_failover_channels_if_primary','AFTER_PRIMARY_ELECTION',1,'INTERNAL',10,'CRITICAL');
/*!40000 ALTER TABLE `replication_group_member_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_edges`
--

LOCK TABLES `role_edges` WRITE;
/*!40000 ALTER TABLE `role_edges` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` (`cost_name`, `cost_value`, `last_update`, `comment`) VALUES ('disk_temptable_create_cost',NULL,'2024-11-11 21:50:26',NULL),('disk_temptable_row_cost',NULL,'2024-11-11 21:50:26',NULL),('key_compare_cost',NULL,'2024-11-11 21:50:26',NULL),('memory_temptable_create_cost',NULL,'2024-11-11 21:50:26',NULL),('memory_temptable_row_cost',NULL,'2024-11-11 21:50:26',NULL),('row_evaluate_cost',NULL,'2024-11-11 21:50:26',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the source.',
  `User_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between source and replica.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  `Source_connection_auto_failover` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates whether the channel connection failover is enabled.',
  `Gtid_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates if this channel only uses GTIDs and does not persist positions.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF','GENERATE') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables without primary keys on create and alter table queries',
  `Assign_gtids_to_anonymous_transactions_type` enum('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  `Assign_gtids_to_anonymous_transactions_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@','2024-11-11 21:50:29','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2024-11-11 21:50:30','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8mb3_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('%','josepa','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$PN,AZ|ZS4,zG+UBzhS3m3Lu6pWvIdR4k9c1j68gwIfgzgIvMTw4QD7Y6','N','2024-11-12 04:14:32',NULL,'N','N','N',NULL,NULL,NULL,NULL),('%','usuario_remoto','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$#\r+7Q [JhQYSgS0QjtdvV3V6gV90GYyuL/yh87NA2dWOgwrl4oEa8k87','N','2024-11-12 04:12:59',NULL,'N','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.infoschema','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-11-11 21:50:30',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.session','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-11-11 21:50:29',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'caching_sha2_password','$A$005$THISISACOMBINATIONOFINVALIDSALTANDPASSWORDTHATMUSTNEVERBRBEUSED','N','2024-11-11 21:50:30',NULL,'Y','N','N',NULL,NULL,NULL,NULL),('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'caching_sha2_password','$A$005$4zB	o`sR&d?A@FAUePxnat8q6tCAaML6IwbDD8Hr2Oe6029LjTN2W0H86','N','2024-11-11 21:51:25',NULL,'N','Y','Y',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `SistemaCorreo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SistemaCorreo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `SistemaCorreo`;

--
-- Current Database: `base_3`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `base_3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `base_3`;

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
  KEY `correo_id` (`correo_id`),
  CONSTRAINT `correos_recibidos_ibfk_1` FOREIGN KEY (`correo_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos_recibidos`
--

LOCK TABLES `correos_recibidos` WRITE;
/*!40000 ALTER TABLE `correos_recibidos` DISABLE KEYS */;
INSERT INTO `correos_recibidos` VALUES (1,1,'Marc Guiu > Mbappe ','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:48:55'),(2,1,'Quien soy?','llave_encriptacion_correo','remitente@dominio.com','2024-11-12 23:57:14'),(4,1,'Este es un mensaje nuevo','llave_encriptacion_mensaje','remitente@dominio.com','2024-11-13 00:30:24');
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
  `contraseña` varchar(255) NOT NULL,
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
INSERT INTO `usuarios` VALUES (1,'usuario@example.com','mi_contraseña_secreta','2024-11-11 22:06:12');
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
  `contrasena` varchar(255) NOT NULL,
  `llave_encriptacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios2`
--

LOCK TABLES `usuarios2` WRITE;
/*!40000 ALTER TABLE `usuarios2` DISABLE KEYS */;
INSERT INTO `usuarios2` VALUES (1,'usuario@dominio.com','contraseña_encriptada','llave_encriptacion_usuario'),(3,'usuario2@dominio.com','contraseña_encriptada','llave_encriptacion_usuario'),(5,'nuevo_usuario@dominio.com','nueva_contrasena_encriptada','llave_encriptacion_nueva');
/*!40000 ALTER TABLE `usuarios2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 20:03:15