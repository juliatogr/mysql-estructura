-- MySQL Workbench Synchronization
-- Generated: 2022-07-26 09:52
-- Model: n1exercici1
-- Version: 1.0
-- Project: mysql-estructura
-- Author: Júlia Tortosa

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `n1exercici1`;
CREATE SCHEMA `n1exercici1` DEFAULT COLLATE utf8mb4_general_ci ;
USE `n1exercici1`;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`glasses` (
  `glasses_id` INT(11) NOT NULL,
  `glasses_tag` VARCHAR(45) NOT NULL,
  `glasses_prescription_left` DECIMAL NULL DEFAULT NULL,
  `glasses_prescription_right` DECIMAL NULL DEFAULT NULL,
  `glasses_frame_type` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_frame_color` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_color_left` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_color_right` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_price` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_tag_idx` (`glasses_tag` ASC) VISIBLE,
  CONSTRAINT `fk_tag`
    FOREIGN KEY (`glasses_tag`)
    REFERENCES `n1exercici1`.`tags` (`tags_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`buy` (
  `buy_id` INT(11) NOT NULL,
  `client_id` INT(11) NOT NULL,
  `glasses_id` INT(11) NOT NULL,
  `seller_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`buy_id`),
  INDEX `fk_buy_glasses1_idx` (`glasses_id` ASC) VISIBLE,
  INDEX `fk_client_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_buy_glasses1`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `n1exercici1`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `n1exercici1`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`tags` (
  `tags_name` VARCHAR(45) NOT NULL,
  `provider_id` INT(11) NOT NULL,
  PRIMARY KEY (`tags_name`),
  INDEX `fk_provider_idx` (`provider_id` ASC) VISIBLE,
  CONSTRAINT `fk_provider`
    FOREIGN KEY (`provider_id`)
    REFERENCES `n1exercici1`.`provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NULL DEFAULT NULL,
  `address_house` VARCHAR(45) NULL DEFAULT NULL,
  `address_entrance` VARCHAR(45) NULL DEFAULT NULL,
  `address_appartment` VARCHAR(45) NULL DEFAULT NULL,
  `address_zip` VARCHAR(5) NULL DEFAULT NULL,
  `address_city` VARCHAR(45) NULL DEFAULT NULL,
  `address_state` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Holds contact first_name',
  `people_tel` VARCHAR(9) NULL DEFAULT NULL COMMENT 'holds contact date of birth',
  `client_reg` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'the timestamp when the client was registered\n',
  `client_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'the timestamp when this record was last modified or updated.',
  `client_email` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Possible values:\nM = Male\nF = Female',
  `client_recommendation_id` INT(11) NULL DEFAULT NULL COMMENT 'Client who has recommended the store',
  `client_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_recommendation_idx` (`client_recommendation_id` ASC) VISIBLE,
  INDEX `fk_address_idx` (`client_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_recommendation`
    FOREIGN KEY (`client_recommendation_id`)
    REFERENCES `n1exercici1`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `client_address`
    FOREIGN KEY (`client_address_id`)
    REFERENCES `n1exercici1`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `n1exercici1`.`provider` (
  `provider_id` INT(11) NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(45) NULL DEFAULT NULL,
  `provider_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `provider_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `provider_tel` VARCHAR(9) NULL DEFAULT NULL,
  `provider_fax` VARCHAR(9) NULL DEFAULT NULL,
  `provider_address_id` INT(11) NOT NULL,
  PRIMARY KEY (`provider_id`),
  INDEX `fk_address_idx` (`provider_address_id` ASC) VISIBLE,
  CONSTRAINT `provider_address`
    FOREIGN KEY (`provider_address_id`)
    REFERENCES `n1exercici1`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
