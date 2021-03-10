-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: mypim_db
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` text,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` int unsigned DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `customSettings` longtext,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1615312982,1615312982,1,1,NULL,0,0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_metadata` (
  `cid` int NOT NULL,
  `name` varchar(190) NOT NULL,
  `language` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`cid`,`name`,`language`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` int unsigned DEFAULT NULL,
  `expire` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('asset_1',_binary 's:574:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:11:\"\0*\0filename\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1615312982;s:19:\"\0*\0modificationDate\";i:1615312982;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1615312982;s:12:\"\0*\0_fulldump\";b:0;}\";',1615313555,1617732755),('document_1',_binary 's:886:\"O:27:\"Pimcore\\Model\\Document\\Page\":31:{s:8:\"\0*\0title\";s:0:\"\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";N;s:13:\"\0*\0controller\";s:7:\"default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:0:\"\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:6:\"\0*\0key\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:999999;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1615312982;s:19:\"\0*\0modificationDate\";i:1615312982;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1615312982;s:12:\"\0*\0_fulldump\";b:0;}\";',1615313551,1617732749),('document_properties_1',_binary 's:6:\"a:0:{}\";',1615313551,1617732749),('object_1',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:1;s:13:\"\0*\0o_parentId\";i:0;s:8:\"\0*\0o_key\";s:0:\"\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:999999;s:17:\"\0*\0o_creationDate\";i:1615312983;s:21:\"\0*\0o_modificationDate\";i:1615312983;s:14:\"\0*\0o_userOwner\";i:1;s:21:\"\0*\0o_userModification\";i:1;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1615312983;s:12:\"\0*\0_fulldump\";b:0;}\";',1615313555,1617732755),('object_2',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:2;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:7:\"product\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1615397213;s:21:\"\0*\0o_modificationDate\";i:1615397212;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1615397212;s:12:\"\0*\0_fulldump\";b:0;}\";',1615397215,1617816414),('object_3',_binary 's:820:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":25:{s:12:\"\0*\0o_classId\";s:1:\"1\";s:14:\"\0*\0o_className\";s:7:\"product\";s:7:\"\0*\0name\";s:14:\"havells geyser\";s:13:\"\0*\0decription\";s:23:\"waaow and cool product.\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:3;s:13:\"\0*\0o_parentId\";i:2;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:6:\"geyser\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1615397244;s:21:\"\0*\0o_modificationDate\";i:1615397276;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1615397276;s:12:\"\0*\0_fulldump\";b:0;}\";',1615397279,1617816478),('system_resource_columns_edit_lock',_binary 's:101:\"a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}\";',1615397247,1617816446);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `tag` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('asset_1','asset_1'),('object_3','class_1'),('document_1','document_1'),('document_properties_1','document_1'),('document_properties_1','document_properties'),('object_1','object_1'),('object_2','object_2'),('object_3','object_3'),('system_resource_columns_edit_lock','resource'),('system_resource_columns_edit_lock','system');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` varchar(50) NOT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('1','product');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` int unsigned NOT NULL,
  `groupId` int unsigned NOT NULL,
  `sorter` int DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `parentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` int unsigned NOT NULL,
  `keyId` int unsigned NOT NULL,
  `sorter` int DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_layouts` (
  `id` varchar(64) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combi` (`sourcetype`,`sourceid`,`targettype`,`targetid`),
  KEY `targettype_targetid` (`targettype`,`targetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `index` int unsigned DEFAULT '0',
  `published` tinyint unsigned DEFAULT '1',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1615312982,1615312982,1,1,0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_elements` (
  `documentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_email` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_hardlink` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childrenFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_link` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset','object') DEFAULT NULL,
  `internal` int unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_newsletter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_page` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(383) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `targetGroupIds` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default','','','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_printpage` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_snippet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_translations` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_lock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (1,3,'object',2,'9eu68ie630jk3u0p1g07h929uj',1615397246);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element_workflow_state` (
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `place` text,
  `workflow` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` int unsigned DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentDate` (`sentDate`,`id`),
  FULLTEXT KEY `fulltext` (`from`,`to`,`cc`,`bcc`,`subject`,`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glossary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_favourites`
--

DROP TABLE IF EXISTS `gridconfig_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_favourites` (
  `ownerId` int NOT NULL,
  `classId` varchar(50) NOT NULL,
  `objectId` int NOT NULL DEFAULT '0',
  `gridConfigId` int DEFAULT NULL,
  `searchType` varchar(50) NOT NULL DEFAULT '',
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  PRIMARY KEY (`ownerId`,`classId`,`searchType`,`objectId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_favourites`
--

LOCK TABLES `gridconfig_favourites` WRITE;
/*!40000 ALTER TABLE `gridconfig_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_shares`
--

DROP TABLE IF EXISTS `gridconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_shares` (
  `gridConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`gridConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_shares`
--

LOCK TABLES `gridconfig_shares` WRITE;
/*!40000 ALTER TABLE `gridconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfigs`
--

DROP TABLE IF EXISTS `gridconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `searchType` varchar(50) DEFAULT NULL,
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfigs`
--

LOCK TABLES `gridconfigs` WRITE;
/*!40000 ALTER TABLE `gridconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `http_error_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` int DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` int unsigned DEFAULT NULL,
  `count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfig_shares`
--

DROP TABLE IF EXISTS `importconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfig_shares` (
  `importConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`importConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfig_shares`
--

LOCK TABLES `importconfig_shares` WRITE;
/*!40000 ALTER TABLE `importconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfigs`
--

DROP TABLE IF EXISTS `importconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfigs`
--

LOCK TABLES `importconfigs` WRITE;
/*!40000 ALTER TABLE `importconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_keys`
--

DROP TABLE IF EXISTS `lock_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_keys` (
  `key_id` varchar(64) NOT NULL,
  `key_token` varchar(44) NOT NULL,
  `key_expiration` int unsigned NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_keys`
--

LOCK TABLES `lock_keys` WRITE;
/*!40000 ALTER TABLE `lock_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid_ctype` (`cid`,`ctype`),
  KEY `date` (`date`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_data` (
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'info',
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int DEFAULT NULL,
  `recipient` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificationDate` timestamp NULL DEFAULT NULL,
  `linkedElementType` enum('document','asset','object') DEFAULT NULL,
  `linkedElement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_1`
--

DROP TABLE IF EXISTS `object_1`;
/*!50001 DROP VIEW IF EXISTS `object_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_1` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `decription`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_query_1`
--

DROP TABLE IF EXISTS `object_query_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '1',
  `oo_className` varchar(255) DEFAULT 'product',
  `name` varchar(190) DEFAULT NULL,
  `decription` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_1`
--

LOCK TABLES `object_query_1` WRITE;
/*!40000 ALTER TABLE `object_query_1` DISABLE KEYS */;
INSERT INTO `object_query_1` VALUES (3,'1','product','havells geyser','waaow and cool product.');
/*!40000 ALTER TABLE `object_query_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_1`
--

DROP TABLE IF EXISTS `object_relations_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_1`
--

LOCK TABLES `object_relations_1` WRITE;
/*!40000 ALTER TABLE `object_relations_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_1`
--

DROP TABLE IF EXISTS `object_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `decription` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_1`
--

LOCK TABLES `object_store_1` WRITE;
/*!40000 ALTER TABLE `object_store_1` DISABLE KEYS */;
INSERT INTO `object_store_1` VALUES (3,'havells geyser','waaow and cool product.');
/*!40000 ALTER TABLE `object_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_url_slugs`
--

DROP TABLE IF EXISTS `object_url_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_url_slugs` (
  `objectId` int NOT NULL DEFAULT '0',
  `classId` varchar(50) NOT NULL DEFAULT '0',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  `slug` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`,`siteId`),
  KEY `index` (`index`),
  KEY `objectId` (`objectId`),
  KEY `classId` (`classId`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `ownername` (`ownername`),
  KEY `slug` (`slug`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_url_slugs`
--

LOCK TABLES `object_url_slugs` WRITE;
/*!40000 ALTER TABLE `object_url_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_url_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `o_id` int unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `o_path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `o_index` int unsigned DEFAULT '0',
  `o_published` tinyint unsigned DEFAULT '1',
  `o_creationDate` int unsigned DEFAULT NULL,
  `o_modificationDate` int unsigned DEFAULT NULL,
  `o_userOwner` int unsigned DEFAULT NULL,
  `o_userModification` int unsigned DEFAULT NULL,
  `o_classId` varchar(50) DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  `o_childrenSortBy` enum('key','index') DEFAULT NULL,
  `o_childrenSortOrder` enum('ASC','DESC') DEFAULT NULL,
  `o_versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `index` (`o_index`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`),
  KEY `o_classId` (`o_classId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1615312983,1615312983,1,1,NULL,NULL,NULL,NULL,0),(2,1,'folder','product','/',NULL,1,1615397213,1615397212,2,2,NULL,NULL,NULL,NULL,2),(3,2,'object','geyser','/product/',0,1,1615397244,1615397276,2,2,'1','product',NULL,NULL,2);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimcore_migrations`
--

DROP TABLE IF EXISTS `pimcore_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pimcore_migrations` (
  `migration_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migrated_at` datetime NOT NULL,
  PRIMARY KEY (`migration_set`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimcore_migrations`
--

LOCK TABLES `pimcore_migrations` WRITE;
/*!40000 ALTER TABLE `pimcore_migrations` DISABLE KEYS */;
INSERT INTO `pimcore_migrations` VALUES ('pimcore_core','20180724144005','2021-03-09 10:03:06'),('pimcore_core','20180830113528','2021-03-09 10:03:06'),('pimcore_core','20180830122128','2021-03-09 10:03:06'),('pimcore_core','20180904201947','2021-03-09 10:03:06'),('pimcore_core','20180906142115','2021-03-09 10:03:06'),('pimcore_core','20180907115436','2021-03-09 10:03:06'),('pimcore_core','20180912140913','2021-03-09 10:03:06'),('pimcore_core','20180913132106','2021-03-09 10:03:06'),('pimcore_core','20180924111736','2021-03-09 10:03:06'),('pimcore_core','20181008132414','2021-03-09 10:03:06'),('pimcore_core','20181009135158','2021-03-09 10:03:06'),('pimcore_core','20181115114003','2021-03-09 10:03:06'),('pimcore_core','20181126094412','2021-03-09 10:03:06'),('pimcore_core','20181126144341','2021-03-09 10:03:06'),('pimcore_core','20181128074035','2021-03-09 10:03:06'),('pimcore_core','20181128112320','2021-03-09 10:03:06'),('pimcore_core','20181214145532','2021-03-09 10:03:06'),('pimcore_core','20190102143436','2021-03-09 10:03:06'),('pimcore_core','20190102153226','2021-03-09 10:03:06'),('pimcore_core','20190108131401','2021-03-09 10:03:06'),('pimcore_core','20190124105627','2021-03-09 10:03:06'),('pimcore_core','20190131074054','2021-03-09 10:03:06'),('pimcore_core','20190131095936','2021-03-09 10:03:06'),('pimcore_core','20190320133439','2021-03-09 10:03:06'),('pimcore_core','20190402073052','2021-03-09 10:03:06'),('pimcore_core','20190403120728','2021-03-09 10:03:06'),('pimcore_core','20190405112707','2021-03-09 10:03:06'),('pimcore_core','20190408084129','2021-03-09 10:03:06'),('pimcore_core','20190508074339','2021-03-09 10:03:06'),('pimcore_core','20190515130651','2021-03-09 10:03:06'),('pimcore_core','20190520151448','2021-03-09 10:03:06'),('pimcore_core','20190522130545','2021-03-09 10:03:06'),('pimcore_core','20190527121800','2021-03-09 10:03:06'),('pimcore_core','20190618154000','2021-03-09 10:03:06'),('pimcore_core','20190701141857','2021-03-09 10:03:06'),('pimcore_core','20190708175236','2021-03-09 10:03:06'),('pimcore_core','20190729085052','2021-03-09 10:03:06'),('pimcore_core','20190802090149','2021-03-09 10:03:06'),('pimcore_core','20190806160450','2021-03-09 10:03:06'),('pimcore_core','20190807121356','2021-03-09 10:03:06'),('pimcore_core','20190828142756','2021-03-09 10:03:06'),('pimcore_core','20190902085052','2021-03-09 10:03:06'),('pimcore_core','20190904154339','2021-03-09 10:03:06'),('pimcore_core','20191015131700','2021-03-09 10:03:06'),('pimcore_core','20191107141816','2021-03-09 10:03:06'),('pimcore_core','20191114123638','2021-03-09 10:03:06'),('pimcore_core','20191114132014','2021-03-09 10:03:06'),('pimcore_core','20191121150326','2021-03-09 10:03:06'),('pimcore_core','20191125135853','2021-03-09 10:03:06'),('pimcore_core','20191125200416','2021-03-09 10:03:06'),('pimcore_core','20191126130004','2021-03-09 10:03:06'),('pimcore_core','20191208175348','2021-03-09 10:03:06'),('pimcore_core','20191213115045','2021-03-09 10:03:06'),('pimcore_core','20191218073528','2021-03-09 10:03:06'),('pimcore_core','20191230103524','2021-03-09 10:03:06'),('pimcore_core','20191230104529','2021-03-09 10:03:06'),('pimcore_core','20200113120101','2021-03-09 10:03:06'),('pimcore_core','20200116181758','2021-03-09 10:03:06'),('pimcore_core','20200121095650','2021-03-09 10:03:06'),('pimcore_core','20200121131304','2021-03-09 10:03:06'),('pimcore_core','20200127102432','2021-03-09 10:03:06'),('pimcore_core','20200129102132','2021-03-09 10:03:06'),('pimcore_core','20200210101048','2021-03-09 10:03:06'),('pimcore_core','20200210164037','2021-03-09 10:03:06'),('pimcore_core','20200211115044','2021-03-09 10:03:06'),('pimcore_core','20200212130011','2021-03-09 10:03:06'),('pimcore_core','20200218104052','2021-03-09 10:03:06'),('pimcore_core','20200226102938','2021-03-09 10:03:06'),('pimcore_core','20200310122412','2021-03-09 10:03:06'),('pimcore_core','20200313092019','2021-03-09 10:03:06'),('pimcore_core','20200317163018','2021-03-09 10:03:06'),('pimcore_core','20200318100042','2021-03-09 10:03:06'),('pimcore_core','20200324141723','2021-03-09 10:03:06'),('pimcore_core','20200407120641','2021-03-09 10:03:06'),('pimcore_core','20200407132737','2021-03-09 10:03:06'),('pimcore_core','20200407145422','2021-03-09 10:03:06'),('pimcore_core','20200410112354','2021-03-09 10:03:06'),('pimcore_core','20200421142950','2021-03-09 10:03:06'),('pimcore_core','20200422090352','2021-03-09 10:03:06'),('pimcore_core','20200428082346','2021-03-09 10:03:06'),('pimcore_core','20200428111313','2021-03-09 10:03:06'),('pimcore_core','20200529121630','2021-03-09 10:03:06'),('pimcore_core','20200604110336','2021-03-09 10:03:06'),('pimcore_core','20200619071650','2021-03-09 10:03:06'),('pimcore_core','20200703093410','2021-03-09 10:03:06'),('pimcore_core','20200721123847','2021-03-09 10:03:06'),('pimcore_core','20200807105448','2021-03-09 10:03:06'),('pimcore_core','20200812160035','2021-03-09 10:03:06'),('pimcore_core','20200817133132','2021-03-09 10:03:06'),('pimcore_core','20200820151104','2021-03-09 10:03:06'),('pimcore_core','20200828091305','2021-03-09 10:03:06'),('pimcore_core','20200902111642','2021-03-09 10:03:06'),('pimcore_core','20201001133558','2021-03-09 10:03:06'),('pimcore_core','20201207132025','2021-03-09 10:03:06'),('pimcore_core','20210211152319','2021-03-09 10:03:06');
/*!40000 ALTER TABLE `pimcore_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `getall` (`cpath`,`ctype`,`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantityvalue_units` (
  `id` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(50) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `converter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baseunit` (`baseunit`),
  CONSTRAINT `fk_baseunit` FOREIGN KEY (`baseunit`) REFERENCES `quantityvalue_units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recyclebin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('entire_uri','path_query','path','auto_create') NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceSite` int DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `regex` tinyint(1) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `expiry` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `routing_lookup` (`active`,`regex`,`sourceSite`,`source`,`type`,`expiry`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanitycheck` (
  `id` int unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `userId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_backend_data` (
  `id` int NOT NULL,
  `fullpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(190) DEFAULT NULL,
  `published` tinyint unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int DEFAULT NULL,
  `userModification` int DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (2,'/product','object','folder','folder',1,1615397213,1615397212,2,2,'ID: 2  \nPath: /product  \nproduct product',''),(3,'/product/geyser','object','object','product',1,1615397244,1615397276,2,2,'ID: 3  \nPath: /product/geyser  \ngeyser havells geyser waaow and cool product. product geyser','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `idPath` varchar(190) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idPath_name` (`idPath`,`name`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_assignment` (
  `tagid` int unsigned NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `prio` smallint unsigned NOT NULL DEFAULT '0',
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_storage`
--

DROP TABLE IF EXISTS `targeting_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_storage` (
  `visitorId` varchar(100) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `creationDate` datetime DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitorId`,`scope`,`name`),
  KEY `targeting_storage_scope_index` (`scope`),
  KEY `targeting_storage_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_storage`
--

LOCK TABLES `targeting_storage` WRITE;
/*!40000 ALTER TABLE `targeting_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_target_groups`
--

DROP TABLE IF EXISTS `targeting_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_target_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `threshold` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_target_groups`
--

LOCK TABLES `targeting_target_groups` WRITE;
/*!40000 ALTER TABLE `targeting_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint NOT NULL DEFAULT '0',
  `date` int unsigned DEFAULT NULL,
  `expiryDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `data` varchar(190) DEFAULT NULL,
  `timestamp` int unsigned DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `day` int unsigned DEFAULT NULL,
  `dayOfWeek` int unsigned DEFAULT NULL,
  `dayOfYear` int unsigned DEFAULT NULL,
  `weekOfYear` int unsigned DEFAULT NULL,
  `hour` int unsigned DEFAULT NULL,
  `minute` int unsigned DEFAULT NULL,
  `second` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES ('Master','cs','',1615397257,1615397257),('Master','de','',1615397257,1615397257),('Master','en','',1615397257,1615397257),('Master','es','',1615397257,1615397257),('Master','fa','',1615397257,1615397257),('Master','fr','',1615397257,1615397257),('Master','hu','',1615397257,1615397257),('Master','it','',1615397257,1615397257),('Master','ja','',1615397257,1615397257),('Master','nl','',1615397257,1615397257),('Master','pl','',1615397257,1615397257),('Master','pt_BR','',1615397257,1615397257),('Master','ru','',1615397257,1615397257),('Master','sk','',1615397257,1615397257),('Master','sv','',1615397257,1615397257),('Master','sv_FI','',1615397257,1615397257),('Master','th','',1615397257,1615397257),('Master','tr','',1615397257,1615397257),('Master','uk','',1615397257,1615397257),('Master','zh_Hans','',1615397257,1615397257),('Master (Admin Mode)','cs','',1615397256,1615397256),('Master (Admin Mode)','de','',1615397256,1615397256),('Master (Admin Mode)','en','',1615397256,1615397256),('Master (Admin Mode)','es','',1615397256,1615397256),('Master (Admin Mode)','fa','',1615397256,1615397256),('Master (Admin Mode)','fr','',1615397256,1615397256),('Master (Admin Mode)','hu','',1615397256,1615397256),('Master (Admin Mode)','it','',1615397256,1615397256),('Master (Admin Mode)','ja','',1615397256,1615397256),('Master (Admin Mode)','nl','',1615397256,1615397256),('Master (Admin Mode)','pl','',1615397256,1615397256),('Master (Admin Mode)','pt_BR','',1615397256,1615397256),('Master (Admin Mode)','ru','',1615397256,1615397256),('Master (Admin Mode)','sk','',1615397256,1615397256),('Master (Admin Mode)','sv','',1615397256,1615397256),('Master (Admin Mode)','sv_FI','',1615397256,1615397256),('Master (Admin Mode)','th','',1615397256,1615397256),('Master (Admin Mode)','tr','',1615397256,1615397256),('Master (Admin Mode)','uk','',1615397256,1615397256),('Master (Admin Mode)','zh_Hans','',1615397256,1615397256),('decription','cs','',1615397257,1615397257),('decription','de','',1615397257,1615397257),('decription','en','',1615397257,1615397257),('decription','es','',1615397257,1615397257),('decription','fa','',1615397257,1615397257),('decription','fr','',1615397257,1615397257),('decription','hu','',1615397257,1615397257),('decription','it','',1615397257,1615397257),('decription','ja','',1615397257,1615397257),('decription','nl','',1615397257,1615397257),('decription','pl','',1615397257,1615397257),('decription','pt_BR','',1615397257,1615397257),('decription','ru','',1615397257,1615397257),('decription','sk','',1615397257,1615397257),('decription','sv','',1615397257,1615397257),('decription','sv_FI','',1615397257,1615397257),('decription','th','',1615397257,1615397257),('decription','tr','',1615397257,1615397257),('decription','uk','',1615397257,1615397257),('decription','zh_Hans','',1615397257,1615397257),('object_add_dialog_custom_text.product','cs','',1615397254,1615397254),('object_add_dialog_custom_text.product','de','',1615397254,1615397254),('object_add_dialog_custom_text.product','en','',1615397254,1615397254),('object_add_dialog_custom_text.product','es','',1615397254,1615397254),('object_add_dialog_custom_text.product','fa','',1615397254,1615397254),('object_add_dialog_custom_text.product','fr','',1615397254,1615397254),('object_add_dialog_custom_text.product','hu','',1615397254,1615397254),('object_add_dialog_custom_text.product','it','',1615397254,1615397254),('object_add_dialog_custom_text.product','ja','',1615397254,1615397254),('object_add_dialog_custom_text.product','nl','',1615397254,1615397254),('object_add_dialog_custom_text.product','pl','',1615397254,1615397254),('object_add_dialog_custom_text.product','pt_BR','',1615397254,1615397254),('object_add_dialog_custom_text.product','ru','',1615397254,1615397254),('object_add_dialog_custom_text.product','sk','',1615397254,1615397254),('object_add_dialog_custom_text.product','sv','',1615397254,1615397254),('object_add_dialog_custom_text.product','sv_FI','',1615397254,1615397254),('object_add_dialog_custom_text.product','th','',1615397254,1615397254),('object_add_dialog_custom_text.product','tr','',1615397254,1615397254),('object_add_dialog_custom_text.product','uk','',1615397254,1615397254),('object_add_dialog_custom_text.product','zh_Hans','',1615397254,1615397254),('object_add_dialog_custom_title.product','cs','',1615397255,1615397255),('object_add_dialog_custom_title.product','de','',1615397255,1615397255),('object_add_dialog_custom_title.product','en','',1615397255,1615397255),('object_add_dialog_custom_title.product','es','',1615397255,1615397255),('object_add_dialog_custom_title.product','fa','',1615397255,1615397255),('object_add_dialog_custom_title.product','fr','',1615397255,1615397255),('object_add_dialog_custom_title.product','hu','',1615397255,1615397255),('object_add_dialog_custom_title.product','it','',1615397255,1615397255),('object_add_dialog_custom_title.product','ja','',1615397255,1615397255),('object_add_dialog_custom_title.product','nl','',1615397255,1615397255),('object_add_dialog_custom_title.product','pl','',1615397255,1615397255),('object_add_dialog_custom_title.product','pt_BR','',1615397255,1615397255),('object_add_dialog_custom_title.product','ru','',1615397255,1615397255),('object_add_dialog_custom_title.product','sk','',1615397255,1615397255),('object_add_dialog_custom_title.product','sv','',1615397255,1615397255),('object_add_dialog_custom_title.product','sv_FI','',1615397255,1615397255),('object_add_dialog_custom_title.product','th','',1615397255,1615397255),('object_add_dialog_custom_title.product','tr','',1615397255,1615397255),('object_add_dialog_custom_title.product','uk','',1615397255,1615397255),('object_add_dialog_custom_title.product','zh_Hans','',1615397255,1615397255),('product','cs','',1615396998,1615396998),('product','de','',1615396998,1615396998),('product','en','',1615396998,1615396998),('product','es','',1615396998,1615396998),('product','fa','',1615396998,1615396998),('product','fr','',1615396998,1615396998),('product','hu','',1615396998,1615396998),('product','it','',1615396998,1615396998),('product','ja','',1615396998,1615396998),('product','nl','',1615396998,1615396998),('product','pl','',1615396998,1615396998),('product','pt_BR','',1615396998,1615396998),('product','ru','',1615396998,1615396998),('product','sk','',1615396998,1615396998),('product','sv','',1615396998,1615396998),('product','sv_FI','',1615396998,1615396998),('product','th','',1615396998,1615396998),('product','tr','',1615396998,1615396998),('product','uk','',1615396998,1615396998),('product','zh_Hans','',1615396998,1615396998);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_locks` (
  `id` int NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint unsigned DEFAULT '0',
  `active` tinyint unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` text,
  `apiKey` varchar(255) DEFAULT NULL,
  `twoFactorAuthentication` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  `websiteTranslationLanguagesEdit` longtext,
  `websiteTranslationLanguagesView` longtext,
  `lastLogin` int unsigned DEFAULT NULL,
  `keyBindings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$drHvtWJGVEoeRt58//sN5.J9P2U6tLqw3pAvs9j9h/BEeUhXzHfbW',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,0,'','',NULL,'null',NULL,'','','',1615396895,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('admin_translations',''),('application_logging',''),('asset_metadata',''),('assets',''),('classes',''),('clear_cache',''),('clear_fullpage_cache',''),('clear_temp_files',''),('dashboards',''),('document_types',''),('documents',''),('emails',''),('gdpr_data_extractor',''),('glossary',''),('http_errors',''),('notes_events',''),('notifications',''),('notifications_send',''),('objects',''),('piwik_reports',''),('piwik_settings',''),('plugins',''),('predefined_properties',''),('qr_codes',''),('recyclebin',''),('redirects',''),('reports',''),('reports_config',''),('robots.txt',''),('routes',''),('seemode',''),('seo_document_editor',''),('share_configurations',''),('system_settings',''),('tag_snippet_management',''),('tags_assignment',''),('tags_configuration',''),('tags_search',''),('targeting',''),('thumbnails',''),('translations',''),('users',''),('web2print_settings',''),('website_settings',''),('workflow_details','');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` int unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`,`itemId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `note` text,
  `stackTrace` text,
  `date` int unsigned DEFAULT NULL,
  `public` tinyint unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint unsigned DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  `binaryFileHash` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `binaryFileId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype_cid` (`ctype`,`cid`),
  KEY `date` (`date`),
  KEY `binaryFileHash` (`binaryFileHash`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,3,'object',2,'','#0 /var/www/html/pim3/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/pim3/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/pim3/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1615397244,0,1,1,NULL,NULL),(2,3,'object',2,'','#0 /var/www/html/pim3/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/pim3/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/pim3/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/pim3/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/pim3/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1615397276,0,1,2,NULL,NULL);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `object_1`
--

/*!50001 DROP VIEW IF EXISTS `object_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_1` AS select `object_query_1`.`oo_id` AS `oo_id`,`object_query_1`.`oo_classId` AS `oo_classId`,`object_query_1`.`oo_className` AS `oo_className`,`object_query_1`.`name` AS `name`,`object_query_1`.`decription` AS `decription`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_1` join `objects` on((`objects`.`o_id` = `object_query_1`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10  9:41:13
