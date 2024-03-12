-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 22, 2024 at 07:41 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edistynyt_tiedonhallinta_varastonhallinta_oltp`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE IF NOT EXISTS `auth_role` (
  `auth_role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`auth_role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `auth_user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `access_jti` varchar(255) DEFAULT NULL,
  `auth_role_auth_role_id` int NOT NULL,
  PRIMARY KEY (`auth_user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_auth_user_auth_role_idx` (`auth_role_auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_item`
--

DROP TABLE IF EXISTS `rental_item`;
CREATE TABLE IF NOT EXISTS `rental_item` (
  `rental_item_id` int NOT NULL AUTO_INCREMENT,
  `rental_item_name` varchar(45) NOT NULL,
  `rental_item_desciption` text,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by_user_id` int NOT NULL,
  `rental_item_state_rental_item_state_id` int NOT NULL,
  `category_category_id` int NOT NULL,
  PRIMARY KEY (`rental_item_id`),
  KEY `fk_rental_item_auth_user1_idx` (`created_by_user_id`),
  KEY `fk_rental_item_rental_item_state1_idx` (`rental_item_state_rental_item_state_id`),
  KEY `fk_rental_item_category1_idx` (`category_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_item_feature`
--

DROP TABLE IF EXISTS `rental_item_feature`;
CREATE TABLE IF NOT EXISTS `rental_item_feature` (
  `rental_item_feature_id` int NOT NULL AUTO_INCREMENT,
  `rental_item_feature_name` varchar(45) NOT NULL,
  PRIMARY KEY (`rental_item_feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_item_has_rental_item_feature`
--

DROP TABLE IF EXISTS `rental_item_has_rental_item_feature`;
CREATE TABLE IF NOT EXISTS `rental_item_has_rental_item_feature` (
  `rental_item_rental_item_id` int NOT NULL,
  `rental_item_feature_rental_item_feature_id` int NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`rental_item_rental_item_id`,`rental_item_feature_rental_item_feature_id`),
  KEY `fk_rental_item_has_rental_item_feature_rental_item_feature1_idx` (`rental_item_feature_rental_item_feature_id`),
  KEY `fk_rental_item_has_rental_item_feature_rental_item1_idx` (`rental_item_rental_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_item_state`
--

DROP TABLE IF EXISTS `rental_item_state`;
CREATE TABLE IF NOT EXISTS `rental_item_state` (
  `rental_item_state_id` int NOT NULL AUTO_INCREMENT,
  `rental_item_state` varchar(45) NOT NULL,
  PRIMARY KEY (`rental_item_state_id`),
  UNIQUE KEY `rental_item_state_UNIQUE` (`rental_item_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_transaction`
--

DROP TABLE IF EXISTS `rental_transaction`;
CREATE TABLE IF NOT EXISTS `rental_transaction` (
  `rental_transaction_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `rental_item_rental_item_id` int NOT NULL,
  `auth_user_auth_user_id` int NOT NULL,
  `rental_transaction_state_rental_transaction_state_id` int NOT NULL,
  PRIMARY KEY (`rental_transaction_id`),
  KEY `fk_rental_transaction_rental_item1_idx` (`rental_item_rental_item_id`),
  KEY `fk_rental_transaction_auth_user1_idx` (`auth_user_auth_user_id`),
  KEY `fk_rental_transaction_rental_transaction_state1_idx` (`rental_transaction_state_rental_transaction_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `rental_transaction_state`
--

DROP TABLE IF EXISTS `rental_transaction_state`;
CREATE TABLE IF NOT EXISTS `rental_transaction_state` (
  `rental_transaction_state_id` int NOT NULL AUTO_INCREMENT,
  `rental_transaction_state` varchar(45) NOT NULL,
  PRIMARY KEY (`rental_transaction_state_id`),
  UNIQUE KEY `rental_transaction_state_UNIQUE` (`rental_transaction_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD CONSTRAINT `fk_auth_user_auth_role` FOREIGN KEY (`auth_role_auth_role_id`) REFERENCES `auth_role` (`auth_role_id`);

--
-- Constraints for table `rental_item`
--
ALTER TABLE `rental_item`
  ADD CONSTRAINT `fk_rental_item_auth_user1` FOREIGN KEY (`created_by_user_id`) REFERENCES `auth_user` (`auth_user_id`),
  ADD CONSTRAINT `fk_rental_item_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_rental_item_rental_item_state1` FOREIGN KEY (`rental_item_state_rental_item_state_id`) REFERENCES `rental_item_state` (`rental_item_state_id`);

--
-- Constraints for table `rental_item_has_rental_item_feature`
--
ALTER TABLE `rental_item_has_rental_item_feature`
  ADD CONSTRAINT `fk_rental_item_has_rental_item_feature_rental_item1` FOREIGN KEY (`rental_item_rental_item_id`) REFERENCES `rental_item` (`rental_item_id`),
  ADD CONSTRAINT `fk_rental_item_has_rental_item_feature_rental_item_feature1` FOREIGN KEY (`rental_item_feature_rental_item_feature_id`) REFERENCES `rental_item_feature` (`rental_item_feature_id`);

--
-- Constraints for table `rental_transaction`
--
ALTER TABLE `rental_transaction`
  ADD CONSTRAINT `fk_rental_transaction_auth_user1` FOREIGN KEY (`auth_user_auth_user_id`) REFERENCES `auth_user` (`auth_user_id`),
  ADD CONSTRAINT `fk_rental_transaction_rental_item1` FOREIGN KEY (`rental_item_rental_item_id`) REFERENCES `rental_item` (`rental_item_id`),
  ADD CONSTRAINT `fk_rental_transaction_rental_transaction_state1` FOREIGN KEY (`rental_transaction_state_rental_transaction_state_id`) REFERENCES `rental_transaction_state` (`rental_transaction_state_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
