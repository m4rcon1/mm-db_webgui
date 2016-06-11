/* ----------------------------------------------------------- */
/*                                                             */
/* Database MySQL File for MacManagement Database              */
/* Initialization.                                             */
/*                                                             */
/* Crafted by: Marco Wohler                                    */
/* Date: 10.06.2016                                            */
/*                                                             */
/*                                                             */
/* ----------------------------------------------------------- */
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	none


-- 
-- Create Database "mm-enrollment" if not exists
-- 

CREATE DATABASE IF NOT EXISTS `mm-enrollment`
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE `mm-enrollment`;


-- 
-- Prevent Errors with Constraints so delete the Main Table.
-- Uncomment the DROP Command to overwrite old Databases.
-- ATTENTION: All Data from Database "mm-enrollment"
-- will be deleted!
-- 

-- DROP TABLE IF EXISTS `mmen_clients`;

-- 
-- Table Structure for Table "mmen_customer"
-- 

DROP TABLE IF EXISTS `mmen_customer`;

CREATE TABLE `mmen_customer` (
  `cust_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` char(255) NOT NULL,
  `lastname` char(255) NOT NULL,
  `street` char(255) NOT NULL,
  `str-nr` char(255) DEFAULT NULL,
  PRIMARY KEY(`cust_id`)
  ) ENGINE=InnoDB;
  

-- 
-- Table Structure for Table "mmen_country"
-- 

DROP TABLE IF EXISTS `mmen_country`;

CREATE TABLE `mmen_country` (
  `coun_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` char(255) NOT NULL,
  PRIMARY KEY(`coun_id`)
  ) ENGINE=InnoDB;
  
  
-- 
-- Table Structure for Table "mmen_region"
-- 

DROP TABLE IF EXISTS `mmen_region`;

CREATE TABLE `mmen_region` (
  `regi_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` char(255) NOT NULL,
  PRIMARY KEY(`regi_id`)
  ) ENGINE=InnoDB;


-- 
-- Table Structure for Table "mmen_canton"
-- 

DROP TABLE IF EXISTS `mmen_canton`;

CREATE TABLE `mmen_canton` (
  `cant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `canton` char(255) NOT NULL,
  PRIMARY KEY(`cant_id`)
  ) ENGINE=InnoDB;


-- 
-- Table Structure for Table "mmen_plz"
-- 

DROP TABLE IF EXISTS `mmen_plz`;

CREATE TABLE `mmen_plz` (
  `plz_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plz` mediumint(8) NOT NULL,
  PRIMARY KEY(`plz_id`)
  ) ENGINE=InnoDB;


-- 
-- Table Structure for Table "mmen_clients" (This is the main Table.)
-- 

DROP TABLE IF EXISTS `mmen_clients`;

CREATE TABLE `mmen_clients` (
  `sn` bigint(20) unsigned NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `permission` tinyint(3) DEFAULT NULL,
  `last-contact` datetime DEFAULT NULL,
  `last-modified` datetime NOT NULL,
  `fk_customer` int(10) unsigned NOT NULL,
  `fk_country` int(10) unsigned NOT NULL,
  `fk_region` int(10) unsigned NOT NULL,
  `fk_canton` int(10) unsigned NOT NULL,
  `fk_plz` int(10) unsigned NOT NULL,
  PRIMARY KEY(`sn`),
  FOREIGN KEY(`fk_customer`)
  REFERENCES mmen_customer(`cust_id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY(`fk_country`)
  REFERENCES mmen_country(`coun_id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY(`fk_region`)
  REFERENCES mmen_region(`regi_id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY(`fk_canton`)
  REFERENCES mmen_canton(`cant_id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT,
  FOREIGN KEY(`fk_plz`)
  REFERENCES mmen_plz(`plz_id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT
  ) ENGINE=InnoDB;


-- 
-- Print Infos
-- 

-- SHOW DATABASES;
-- SHOW TABLES;

/* End of File */

/* ----------------------------------------------------------- */