# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: spiderweb_dev
# Generation Time: 2019-05-29 15:30:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Calendar
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Calendar`;

CREATE TABLE `Calendar` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `dateTimeCalculation` mediumtext,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CalendarOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CalendarOwner`;

CREATE TABLE `CalendarOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Calendar_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Calendar_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Campaign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Campaign`;

CREATE TABLE `Campaign` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(15) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CampaignNoteComment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CampaignNoteComment`;

CREATE TABLE `CampaignNoteComment` (
  `CampaignNote_ID` int(11) unsigned NOT NULL,
  `CampaignNote_table` char(2) NOT NULL DEFAULT '',
  `Owner_ID` int(11) unsigned NOT NULL,
  `comment` mediumtext,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`CampaignNote_ID`,`CampaignNote_table`,`Owner_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CampaignNotePageDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CampaignNotePageDetail`;

CREATE TABLE `CampaignNotePageDetail` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Campaign_ID` int(11) unsigned NOT NULL,
  `PageDetail_ID` int(11) unsigned NOT NULL,
  `partition_noteStart` int(11) unsigned NOT NULL,
  `partition_noteEnd` int(11) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `detailInCampaign` (`Campaign_ID`,`PageDetail_ID`),
  KEY `notePartitionRange` (`partition_noteStart`,`partition_noteEnd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CampaignNotePageProperty
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CampaignNotePageProperty`;

CREATE TABLE `CampaignNotePageProperty` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Campaign_ID` int(11) unsigned NOT NULL,
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `propertyInCampaign` (`Campaign_ID`,`Page_ID`,`Property_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CampaignNotePageRelation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CampaignNotePageRelation`;

CREATE TABLE `CampaignNotePageRelation` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Campaign_ID` int(11) unsigned NOT NULL,
  `PageRelation_ID` int(11) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `relationInCampaign` (`Campaign_ID`,`PageRelation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table CampaignOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CampaignOwner`;

CREATE TABLE `CampaignOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Campaign_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Campaign_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table healthcheck
# ------------------------------------------------------------

DROP TABLE IF EXISTS `healthcheck`;

CREATE TABLE `healthcheck` (
  `status` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `healthcheck` WRITE;
/*!40000 ALTER TABLE `healthcheck` DISABLE KEYS */;

INSERT INTO `healthcheck` (`status`)
VALUES
	('ok');

/*!40000 ALTER TABLE `healthcheck` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Map`;

CREATE TABLE `Map` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `Image_ID` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table MapOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MapOwner`;

CREATE TABLE `MapOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Map_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Map_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Page`;

CREATE TABLE `Page` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PageTemplate_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `guid` char(15) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `guid` (`guid`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Page` WRITE;
/*!40000 ALTER TABLE `Page` DISABLE KEYS */;

INSERT INTO `Page` (`ID`, `PageTemplate_ID`, `Version_ID`, `guid`, `title`, `summary`, `permission`, `createdAt`, `updatedAt`, `deletedAt`)
VALUES
	(1,1,1,'PG_123456789012','This is a test Page','A what? A test page. Oh a test page.','PR','2019-02-27 06:09:22','2019-02-27 06:09:22',NULL);

/*!40000 ALTER TABLE `Page` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PageAlias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageAlias`;

CREATE TABLE `PageAlias` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `Page_ID` int(11) unsigned NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `alias` (`alias`),
  KEY `Page_ID` (`Page_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageDetail`;

CREATE TABLE `PageDetail` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `Page_ID` int(11) unsigned NOT NULL,
  `guid` char(15) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `partition` longtext NOT NULL,
  `order` int(11) unsigned NOT NULL,
  `permission` char(2) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Page_ID` (`Page_ID`),
  KEY `order` (`order`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageOwner`;

CREATE TABLE `PageOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Page_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Page_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PageOwner` WRITE;
/*!40000 ALTER TABLE `PageOwner` DISABLE KEYS */;

INSERT INTO `PageOwner` (`User_ID`, `Page_ID`, `isOwner`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `PageOwner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PagePropertyEnum
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyEnum`;

CREATE TABLE `PagePropertyEnum` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `PropertyEnum_ID` int(11) unsigned NOT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`),
  KEY `value` (`PropertyEnum_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PagePropertyEvent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyEvent`;

CREATE TABLE `PagePropertyEvent` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `Calendar_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `start` int(11) unsigned NOT NULL,
  `end` int(11) unsigned NOT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`,`Calendar_ID`),
  KEY `end` (`end`),
  KEY `start` (`start`),
  KEY `duration` (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PagePropertyLocation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyLocation`;

CREATE TABLE `PagePropertyLocation` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `Map_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `x` int(11) unsigned NOT NULL,
  `y` int(11) unsigned NOT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`,`Map_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PagePropertyNumber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyNumber`;

CREATE TABLE `PagePropertyNumber` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `value` float NOT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`),
  KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PagePropertyOrder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyOrder`;

CREATE TABLE `PagePropertyOrder` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PagePropertyString
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PagePropertyString`;

CREATE TABLE `PagePropertyString` (
  `Page_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Page_ID`,`Property_ID`),
  KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageRelation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageRelation`;

CREATE TABLE `PageRelation` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `Page_ID_agent` int(11) unsigned NOT NULL,
  `Page_ID_patient` int(11) unsigned NOT NULL,
  `Relation_ID` int(11) unsigned NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `order` int(11) unsigned NOT NULL,
  `permission` char(2) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Page_ID_agent` (`Page_ID_agent`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageRelationOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageRelationOwner`;

CREATE TABLE `PageRelationOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `PageRelation_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`PageRelation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageTemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageTemplate`;

CREATE TABLE `PageTemplate` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `guid` char(15) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `hasProperties` tinyint(1) NOT NULL,
  `hasDetails` tinyint(1) NOT NULL,
  `hasRelations` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PageTemplate` WRITE;
/*!40000 ALTER TABLE `PageTemplate` DISABLE KEYS */;

INSERT INTO `PageTemplate` (`ID`, `Version_ID`, `guid`, `name`, `summary`, `hasProperties`, `hasDetails`, `hasRelations`, `createdAt`, `updatedAt`, `deletedAt`)
VALUES
	(1,1,'PGT_12345678901','generic','',1,1,1,'2019-02-27 06:07:52','2019-02-27 06:07:52',NULL);

/*!40000 ALTER TABLE `PageTemplate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PageTemplateDefaultProperties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageTemplateDefaultProperties`;

CREATE TABLE `PageTemplateDefaultProperties` (
  `PageTemplate_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`PageTemplate_ID`,`Property_ID`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PageTemplateOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PageTemplateOwner`;

CREATE TABLE `PageTemplateOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `PageTemplate_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`PageTemplate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PageTemplateOwner` WRITE;
/*!40000 ALTER TABLE `PageTemplateOwner` DISABLE KEYS */;

INSERT INTO `PageTemplateOwner` (`User_ID`, `PageTemplate_ID`, `isOwner`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `PageTemplateOwner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Property
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Property`;

CREATE TABLE `Property` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `type` char(2) NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PropertyEnum
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PropertyEnum`;

CREATE TABLE `PropertyEnum` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `summary` varchar(255) DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Property_ID` (`Property_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PropertyEnumDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PropertyEnumDetail`;

CREATE TABLE `PropertyEnumDetail` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `PropertyEnum_ID` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `partition` longtext NOT NULL,
  `order` int(11) unsigned NOT NULL,
  `permission` char(2) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Page_ID` (`PropertyEnum_ID`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PropertyEnumOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PropertyEnumOwner`;

CREATE TABLE `PropertyEnumOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `PropertyEnum_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`PropertyEnum_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PropertyOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PropertyOwner`;

CREATE TABLE `PropertyOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Property_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Property_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Relation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Relation`;

CREATE TABLE `Relation` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `actor` varchar(255) NOT NULL DEFAULT '',
  `patient` varchar(255) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`actor`,`patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RelationGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelationGroup`;

CREATE TABLE `RelationGroup` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Version_ID` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `relationCalculation` mediumtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RelationGroupOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelationGroupOwner`;

CREATE TABLE `RelationGroupOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `RelationGroup_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`RelationGroup_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table RelationOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RelationOwner`;

CREATE TABLE `RelationOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Relation_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Relation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`ID`, `email`, `createdAt`, `updatedAt`, `deletedAt`)
VALUES
	(1,'test@email.com','2019-02-27 06:07:03','2019-02-27 06:07:03',NULL);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Version`;

CREATE TABLE `Version` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `Version_ID_parent` int(11) unsigned DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Version_ID_parent` (`Version_ID_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Version` WRITE;
/*!40000 ALTER TABLE `Version` DISABLE KEYS */;

INSERT INTO `Version` (`ID`, `name`, `Version_ID_parent`, `createdAt`, `updatedAt`, `deletedAt`)
VALUES
	(1,'master',NULL,'2019-02-27 06:06:33','2019-02-27 06:06:33',NULL);

/*!40000 ALTER TABLE `Version` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table VersionOwner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VersionOwner`;

CREATE TABLE `VersionOwner` (
  `User_ID` int(11) unsigned NOT NULL,
  `Version_ID` int(11) unsigned NOT NULL,
  `isOwner` tinyint(1) NOT NULL,
  PRIMARY KEY (`User_ID`,`Version_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `VersionOwner` WRITE;
/*!40000 ALTER TABLE `VersionOwner` DISABLE KEYS */;

INSERT INTO `VersionOwner` (`User_ID`, `Version_ID`, `isOwner`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `VersionOwner` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
