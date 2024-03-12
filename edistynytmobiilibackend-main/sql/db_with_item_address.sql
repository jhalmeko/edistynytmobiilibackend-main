-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema edistynyt_tiedonhallinta_varastonhallinta_oltp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema edistynyt_tiedonhallinta_varastonhallinta_oltp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp` DEFAULT CHARACTER SET utf8 ;
USE `edistynyt_tiedonhallinta_varastonhallinta_oltp` ;

-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_role` (
  `auth_role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`auth_role_id`),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_user` (
  `auth_user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `deleted_at` DATETIME NULL,
  `access_jti` VARCHAR(255) NULL,
  `auth_role_auth_role_id` INT NOT NULL,
  PRIMARY KEY (`auth_user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_auth_user_auth_role_idx` (`auth_role_auth_role_id` ASC),
  CONSTRAINT `fk_auth_user_auth_role`
    FOREIGN KEY (`auth_role_auth_role_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_role` (`auth_role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_state` (
  `rental_item_state_id` INT NOT NULL AUTO_INCREMENT,
  `rental_item_state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rental_item_state_id`),
  UNIQUE INDEX `rental_item_state_UNIQUE` (`rental_item_state` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item` (
  `rental_item_id` INT NOT NULL AUTO_INCREMENT,
  `rental_item_name` VARCHAR(45) NOT NULL,
  `rental_item_description` TEXT NULL,
  `serial_number` VARCHAR(45) NOT NULL,
  `address` VARCHAR(255) NULL,
  `created_at` DATETIME NOT NULL,
  `deleted_at` DATETIME NULL,
  `created_by_user_id` INT NOT NULL,
  `rental_item_state_rental_item_state_id` INT NOT NULL,
  `category_category_id` INT NOT NULL,
  PRIMARY KEY (`rental_item_id`),
  INDEX `fk_rental_item_auth_user1_idx` (`created_by_user_id` ASC),
  INDEX `fk_rental_item_rental_item_state1_idx` (`rental_item_state_rental_item_state_id` ASC),
  INDEX `fk_rental_item_category1_idx` (`category_category_id` ASC),
  UNIQUE INDEX `serial_number_UNIQUE` (`serial_number` ASC),
  CONSTRAINT `fk_rental_item_auth_user1`
    FOREIGN KEY (`created_by_user_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_user` (`auth_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_item_rental_item_state1`
    FOREIGN KEY (`rental_item_state_rental_item_state_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_state` (`rental_item_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_item_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_feature` (
  `rental_item_feature_id` INT NOT NULL AUTO_INCREMENT,
  `rental_item_feature_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rental_item_feature_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_has_rental_item_feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_has_rental_item_feature` (
  `rental_item_rental_item_id` INT NOT NULL,
  `rental_item_feature_rental_item_feature_id` INT NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rental_item_rental_item_id`, `rental_item_feature_rental_item_feature_id`),
  INDEX `fk_rental_item_has_rental_item_feature_rental_item_feature1_idx` (`rental_item_feature_rental_item_feature_id` ASC),
  INDEX `fk_rental_item_has_rental_item_feature_rental_item1_idx` (`rental_item_rental_item_id` ASC),
  CONSTRAINT `fk_rental_item_has_rental_item_feature_rental_item1`
    FOREIGN KEY (`rental_item_rental_item_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item` (`rental_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_item_has_rental_item_feature_rental_item_feature1`
    FOREIGN KEY (`rental_item_feature_rental_item_feature_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item_feature` (`rental_item_feature_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_transaction_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_transaction_state` (
  `rental_transaction_state_id` INT NOT NULL AUTO_INCREMENT,
  `rental_transaction_state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rental_transaction_state_id`),
  UNIQUE INDEX `rental_transaction_state_UNIQUE` (`rental_transaction_state` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_transaction` (
  `rental_transaction_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `rental_item_rental_item_id` INT NOT NULL,
  `auth_user_auth_user_id` INT NOT NULL,
  `rental_transaction_state_rental_transaction_state_id` INT NOT NULL,
  `due_date` DATETIME NOT NULL,
  `returned_at` DATETIME NULL,
  PRIMARY KEY (`rental_transaction_id`),
  INDEX `fk_rental_transaction_rental_item1_idx` (`rental_item_rental_item_id` ASC),
  INDEX `fk_rental_transaction_auth_user1_idx` (`auth_user_auth_user_id` ASC),
  INDEX `fk_rental_transaction_rental_transaction_state1_idx` (`rental_transaction_state_rental_transaction_state_id` ASC),
  CONSTRAINT `fk_rental_transaction_rental_item1`
    FOREIGN KEY (`rental_item_rental_item_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_item` (`rental_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_transaction_auth_user1`
    FOREIGN KEY (`auth_user_auth_user_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`auth_user` (`auth_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_transaction_rental_transaction_state1`
    FOREIGN KEY (`rental_transaction_state_rental_transaction_state_id`)
    REFERENCES `edistynyt_tiedonhallinta_varastonhallinta_oltp`.`rental_transaction_state` (`rental_transaction_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
