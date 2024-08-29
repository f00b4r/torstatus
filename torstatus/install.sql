-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `Bandwidth`;
CREATE TABLE `Bandwidth` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `fingerprint` tinytext NOT NULL,
                             `write` blob,
                             `read` blob,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Bandwidth1`;
CREATE TABLE `Bandwidth1` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `fingerprint` tinytext NOT NULL,
                              `write` blob,
                              `read` blob,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Bandwidth2`;
CREATE TABLE `Bandwidth2` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `fingerprint` tinytext NOT NULL,
                              `write` blob,
                              `read` blob,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Descriptor1`;
CREATE TABLE `Descriptor1` (
                               `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
                               `Fingerprint` varchar(256) DEFAULT NULL,
                               `Name` varchar(256) DEFAULT NULL,
                               `LastDescriptorPublished` datetime DEFAULT NULL,
                               `IP` varchar(256) DEFAULT NULL,
                               `ORPort` int(10) unsigned DEFAULT NULL,
                               `DirPort` int(10) unsigned DEFAULT NULL,
                               `Platform` varchar(256) DEFAULT NULL,
                               `Contact` varchar(256) DEFAULT NULL,
                               `Uptime` bigint(20) unsigned DEFAULT NULL,
                               `BandwidthMAX` int(10) unsigned DEFAULT NULL,
                               `BandwidthBURST` int(10) unsigned DEFAULT NULL,
                               `BandwidthOBSERVED` int(10) unsigned DEFAULT NULL,
                               `OnionKey` varchar(1024) DEFAULT NULL,
                               `SigningKey` varchar(1024) DEFAULT NULL,
                               `WriteHistoryLAST` datetime DEFAULT NULL,
                               `WriteHistoryINC` int(10) unsigned DEFAULT NULL,
                               `WriteHistorySERDATA` text,
                               `ReadHistoryLAST` datetime DEFAULT NULL,
                               `ReadHistoryINC` int(10) unsigned DEFAULT NULL,
                               `ReadHistorySERDATA` text,
                               `ExitPolicySERDATA` text,
                               `FamilySERDATA` text,
                               `Hibernating` tinyint(1) unsigned DEFAULT NULL,
                               `DescriptorSignature` varchar(1024) DEFAULT NULL,
                               PRIMARY KEY (`ID`),
                               KEY `Index_Fingerprint` (`Fingerprint`),
                               KEY `Index_Bandwidth` (`BandwidthOBSERVED`),
                               KEY `Index_Uptime` (`Uptime`),
                               KEY `Index_Platform` (`Platform`),
                               KEY `Index_Contact` (`Contact`),
                               KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Descriptor2`;
CREATE TABLE `Descriptor2` (
                               `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
                               `Fingerprint` varchar(256) DEFAULT NULL,
                               `Name` varchar(256) DEFAULT NULL,
                               `LastDescriptorPublished` datetime DEFAULT NULL,
                               `IP` varchar(256) DEFAULT NULL,
                               `ORPort` int(10) unsigned DEFAULT NULL,
                               `DirPort` int(10) unsigned DEFAULT NULL,
                               `Platform` varchar(256) DEFAULT NULL,
                               `Contact` varchar(256) DEFAULT NULL,
                               `Uptime` bigint(20) unsigned DEFAULT NULL,
                               `BandwidthMAX` int(10) unsigned DEFAULT NULL,
                               `BandwidthBURST` int(10) unsigned DEFAULT NULL,
                               `BandwidthOBSERVED` int(10) unsigned DEFAULT NULL,
                               `OnionKey` varchar(1024) DEFAULT NULL,
                               `SigningKey` varchar(1024) DEFAULT NULL,
                               `WriteHistoryLAST` datetime DEFAULT NULL,
                               `WriteHistoryINC` int(10) unsigned DEFAULT NULL,
                               `WriteHistorySERDATA` text,
                               `ReadHistoryLAST` datetime DEFAULT NULL,
                               `ReadHistoryINC` int(10) unsigned DEFAULT NULL,
                               `ReadHistorySERDATA` text,
                               `ExitPolicySERDATA` text,
                               `FamilySERDATA` text,
                               `Hibernating` tinyint(1) unsigned DEFAULT NULL,
                               `DescriptorSignature` varchar(1024) DEFAULT NULL,
                               PRIMARY KEY (`ID`),
                               KEY `Index_Fingerprint` (`Fingerprint`),
                               KEY `Index_Bandwidth` (`BandwidthOBSERVED`),
                               KEY `Index_Uptime` (`Uptime`),
                               KEY `Index_Platform` (`Platform`),
                               KEY `Index_Contact` (`Contact`),
                               KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `hostnames`;
CREATE TABLE `hostnames` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `ip` varchar(15) NOT NULL,
                             `hostname` text NOT NULL,
                             PRIMARY KEY (`id`),
                             KEY `hostnames_ip_idx` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Mirrors`;
CREATE TABLE `Mirrors` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `mirrors` text NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `missing_countries`;
CREATE TABLE `missing_countries` (
                                     `country_code` varchar(2) NOT NULL,
                                     PRIMARY KEY (`country_code`),
                                     UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `missing_flags`;
CREATE TABLE `missing_flags` (
                                 `country_code` varchar(2) NOT NULL,
                                 PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `NetworkStatus1`;
CREATE TABLE `NetworkStatus1` (
                                  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                  `Fingerprint` varchar(256) DEFAULT NULL,
                                  `Name` varchar(256) DEFAULT NULL,
                                  `LastDescriptorPublished` datetime DEFAULT NULL,
                                  `DescriptorHash` varchar(256) DEFAULT NULL,
                                  `IP` varchar(256) DEFAULT NULL,
                                  `Hostname` varchar(256) DEFAULT NULL,
                                  `ORPort` int(10) unsigned DEFAULT NULL,
                                  `DirPort` int(10) unsigned DEFAULT NULL,
                                  `CountryCode` varchar(4) DEFAULT NULL,
                                  `FAuthority` tinyint(1) unsigned DEFAULT NULL,
                                  `FBadDirectory` tinyint(1) unsigned DEFAULT NULL,
                                  `FBadExit` tinyint(1) unsigned DEFAULT NULL,
                                  `FExit` tinyint(1) unsigned DEFAULT NULL,
                                  `FFast` tinyint(1) unsigned DEFAULT NULL,
                                  `FGuard` tinyint(1) unsigned DEFAULT NULL,
                                  `FNamed` tinyint(1) unsigned DEFAULT NULL,
                                  `FStable` tinyint(1) unsigned DEFAULT NULL,
                                  `FRunning` tinyint(1) unsigned DEFAULT NULL,
                                  `FValid` tinyint(1) unsigned DEFAULT NULL,
                                  `FV2Dir` tinyint(1) unsigned DEFAULT NULL,
                                  `FHSDir` tinyint(1) unsigned DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `Index_Fingerprint` (`Fingerprint`),
                                  KEY `Index_Name` (`Name`),
                                  KEY `Index_CountryCode` (`CountryCode`),
                                  KEY `Index_LastDescriptorPublished` (`LastDescriptorPublished`),
                                  KEY `Index_IP` (`IP`),
                                  KEY `Index_Hostname` (`Hostname`),
                                  KEY `Index_ORPort` (`ORPort`),
                                  KEY `Index_DirPort` (`DirPort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `NetworkStatus2`;
CREATE TABLE `NetworkStatus2` (
                                  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                  `Fingerprint` varchar(256) DEFAULT NULL,
                                  `Name` varchar(256) DEFAULT NULL,
                                  `LastDescriptorPublished` datetime DEFAULT NULL,
                                  `DescriptorHash` varchar(256) DEFAULT NULL,
                                  `IP` varchar(256) DEFAULT NULL,
                                  `Hostname` varchar(256) DEFAULT NULL,
                                  `ORPort` int(10) unsigned DEFAULT NULL,
                                  `DirPort` int(10) unsigned DEFAULT NULL,
                                  `CountryCode` varchar(4) DEFAULT NULL,
                                  `FAuthority` tinyint(1) unsigned DEFAULT NULL,
                                  `FBadDirectory` tinyint(1) unsigned DEFAULT NULL,
                                  `FBadExit` tinyint(1) unsigned DEFAULT NULL,
                                  `FExit` tinyint(1) unsigned DEFAULT NULL,
                                  `FFast` tinyint(1) unsigned DEFAULT NULL,
                                  `FGuard` tinyint(1) unsigned DEFAULT NULL,
                                  `FNamed` tinyint(1) unsigned DEFAULT NULL,
                                  `FStable` tinyint(1) unsigned DEFAULT NULL,
                                  `FRunning` tinyint(1) unsigned DEFAULT NULL,
                                  `FValid` tinyint(1) unsigned DEFAULT NULL,
                                  `FV2Dir` tinyint(1) unsigned DEFAULT NULL,
                                  `FHSDir` tinyint(1) unsigned DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `Index_Fingerprint` (`Fingerprint`),
                                  KEY `Index_Name` (`Name`),
                                  KEY `Index_CountryCode` (`CountryCode`),
                                  KEY `Index_LastDescriptorPublished` (`LastDescriptorPublished`),
                                  KEY `Index_IP` (`IP`),
                                  KEY `Index_Hostname` (`Hostname`),
                                  KEY `Index_ORPort` (`ORPort`),
                                  KEY `Index_DirPort` (`DirPort`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `NetworkStatusSource`;
CREATE TABLE `NetworkStatusSource` (
                                       `ID` int(10) unsigned NOT NULL DEFAULT '1',
                                       `Fingerprint` varchar(256) DEFAULT NULL,
                                       `Name` varchar(256) DEFAULT NULL,
                                       `LastDescriptorPublished` datetime DEFAULT NULL,
                                       `IP` varchar(256) DEFAULT NULL,
                                       `ORPort` int(10) unsigned DEFAULT NULL,
                                       `DirPort` int(10) unsigned DEFAULT NULL,
                                       `Platform` varchar(256) DEFAULT NULL,
                                       `Contact` varchar(256) DEFAULT NULL,
                                       `Uptime` int(10) unsigned DEFAULT NULL,
                                       `BandwidthMAX` int(10) unsigned DEFAULT NULL,
                                       `BandwidthBURST` int(10) unsigned DEFAULT NULL,
                                       `BandwidthOBSERVED` int(10) unsigned DEFAULT NULL,
                                       `OnionKey` varchar(1024) DEFAULT NULL,
                                       `SigningKey` varchar(1024) DEFAULT NULL,
                                       `WriteHistoryLAST` datetime DEFAULT NULL,
                                       `WriteHistoryINC` int(10) unsigned DEFAULT NULL,
                                       `WriteHistorySERDATA` varchar(8192) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
                                       `ReadHistoryLAST` datetime DEFAULT NULL,
                                       `ReadHistoryINC` int(10) unsigned DEFAULT NULL,
                                       `ReadHistorySERDATA` varchar(8192) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
                                       `ExitPolicySERDATA` varchar(8192) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
                                       `FamilySERDATA` varchar(8192) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
                                       `Hibernating` tinyint(1) unsigned DEFAULT NULL,
                                       `DescriptorSignature` varchar(1024) DEFAULT NULL,
                                       PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ORAddresses1`;
CREATE TABLE `ORAddresses1` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `descriptor_id` int(11) NOT NULL,
                                `address` varchar(100) NOT NULL,
                                `port` int(11) NOT NULL,
                                PRIMARY KEY (`id`),
                                KEY `address` (`address`),
                                KEY `descriptor_id` (`descriptor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ORAddresses2`;
CREATE TABLE `ORAddresses2` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `descriptor_id` int(11) NOT NULL,
                                `address` varchar(100) NOT NULL,
                                `port` int(11) NOT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Status`;
CREATE TABLE `Status` (
                          `ID` int(10) unsigned NOT NULL DEFAULT '1',
                          `LastUpdate` datetime DEFAULT NULL,
                          `LastUpdateElapsed` int(10) unsigned DEFAULT NULL,
                          `ActiveNetworkStatusTable` varchar(256) DEFAULT NULL,
                          `ActiveDescriptorTable` varchar(256) DEFAULT NULL,
                          `ActiveORAddressesTable` varchar(256) DEFAULT NULL,
                          PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2024-08-29 09:20:02

INSERT INTO `NetworkStatusSource` (`ID`,`Fingerprint`,`Name`,`LastDescriptorPublished`,`IP`,`ORPort`,`DirPort`,`Platform`,`Contact`,`Uptime`,`BandwidthMAX`,`BandwidthBURST`,`BandwidthOBSERVED`,`OnionKey`,`SigningKey`,`WriteHistoryLAST`,`WriteHistoryINC`,`WriteHistorySERDATA`,`ReadHistoryLAST`,`ReadHistoryINC`,`ReadHistorySERDATA`,`ExitPolicySERDATA`,`FamilySERDATA`,`Hibernating`,`DescriptorSignature`) VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO `Status` (`ID`,`LastUpdate`,`LastUpdateElapsed`,`ActiveNetworkStatusTable`,`ActiveDescriptorTable`) VALUES (1,'2000-01-01 00:00:00',NULL,NULL,NULL);

INSERT INTO `Mirrors` (`id`,`mirrors`) VALUES (1,'');
