-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema n1exercici2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `n1exercici2` ;

-- -----------------------------------------------------
-- Schema n1exercici2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n1exercici2` DEFAULT CHARACTER SET utf8mb4 ;
USE `n1exercici2` ;

-- -----------------------------------------------------
-- Table `n1exercici2`.`provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`provincia` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`provincia` (
  `provincia_id` INT NOT NULL,
  `provincia_nom` VARCHAR(45) NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`localitat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`localitat` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`localitat` (
  `localitat_id` INT NOT NULL,
  `localitat_nom` VARCHAR(45) NULL,
  `provincia_provincia_id` INT NOT NULL,
  PRIMARY KEY (`localitat_id`),
  INDEX `fk_localitat_provincia_idx` (`provincia_provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_localitat_provincia`
    FOREIGN KEY (`provincia_provincia_id`)
    REFERENCES `n1exercici2`.`provincia` (`provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`client` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`client` (
  `client_id` INT NOT NULL,
  `client_nom` VARCHAR(45) NOT NULL,
  `client_cognoms` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(255) NOT NULL,
  `codi_postal` VARCHAR(5) NOT NULL,
  `localitat` INT NOT NULL,
  `client_tel` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_localitat_idx` (`localitat` ASC) VISIBLE,
  CONSTRAINT `fk_localitat_client`
    FOREIGN KEY (`localitat`)
    REFERENCES `n1exercici2`.`localitat` (`localitat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`botiga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`botiga` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`botiga` (
  `botiga_id` INT NOT NULL AUTO_INCREMENT,
  `botiga_nom` VARCHAR(45) NOT NULL,
  `botiga_adreça` VARCHAR(255) NULL,
  `botiga_codi_postal` VARCHAR(5) NULL,
  `botiga_localitat` INT NULL,
  PRIMARY KEY (`botiga_id`),
  INDEX `fk_localitat_idx` (`botiga_localitat` ASC) VISIBLE,
  CONSTRAINT `fk_localitat_botiga`
    FOREIGN KEY (`botiga_localitat`)
    REFERENCES `n1exercici2`.`localitat` (`localitat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`empleat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`empleat` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`empleat` (
  `NIF` VARCHAR(9) NOT NULL,
  `empleat_nom` VARCHAR(45) NULL,
  `empleat_cognoms` VARCHAR(45) NULL,
  `empleat_tel` VARCHAR(9) NULL,
  `empleat_tipus` ENUM('Cuiner/a', 'Repartidor/a') NULL,
  `botiga_botiga_id` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_empleat_botiga1_idx` (`botiga_botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleat_botiga1`
    FOREIGN KEY (`botiga_botiga_id`)
    REFERENCES `n1exercici2`.`botiga` (`botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`comanda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`comanda` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`comanda` (
  `comanda_id` INT NOT NULL,
  `comanda_data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comanda_tipus` ENUM('repartiment', 'botiga') NOT NULL,
  `comanda_preu` DECIMAL(10,2) NULL,
  `client_client_id` INT NOT NULL,
  `botiga_botiga_id` INT NOT NULL,
  `comanda_repartidor` VARCHAR(9) NULL DEFAULT NULL,
  `comanda_data_entrega` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`comanda_id`),
  INDEX `fk_comanda_client1_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_comanda_botiga1_idx` (`botiga_botiga_id` ASC) VISIBLE,
  INDEX `fk_repartidor_idx` (`comanda_repartidor` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `n1exercici2`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_botiga_id`)
    REFERENCES `n1exercici2`.`botiga` (`botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_repartidor`
    FOREIGN KEY (`comanda_repartidor`)
    REFERENCES `n1exercici2`.`empleat` (`NIF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`categoria` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`categoria` (
  `categoria_nom` ENUM('Pizza', 'Hamburguesa', 'Beguda', 'Pizza Pepperoni', 'Pizza Caprese') NOT NULL,
  `categoria_pare` ENUM('Pizza') NULL DEFAULT NULL,
  PRIMARY KEY (`categoria_nom`),
  INDEX `fk_cat_pare_idx` (`categoria_pare` ASC) VISIBLE,
  UNIQUE INDEX `categoria_nom_UNIQUE` (`categoria_nom` ASC) VISIBLE,
  CONSTRAINT `fk_cat_pare`
    FOREIGN KEY (`categoria_pare`)
    REFERENCES `n1exercici2`.`categoria` (`categoria_nom`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`producte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`producte` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`producte` (
  `producte_id` INT NOT NULL,
  `producte_nom` VARCHAR(45) NOT NULL,
  `categoria` ENUM('Pizza', 'Hamburguesa', 'Beguda', 'Pizza Pepperoni', 'Pizza Caprese') NOT NULL,
  `producte_descripcio` VARCHAR(255) NULL,
  `imatge` VARCHAR(255) NOT NULL,
  `preu` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`producte_id`),
  INDEX `fk_cat_idx` (`categoria` ASC) VISIBLE,
  UNIQUE INDEX `producte_nom_UNIQUE` (`producte_nom` ASC) VISIBLE,
  CONSTRAINT `fk_cat`
    FOREIGN KEY (`categoria`)
    REFERENCES `n1exercici2`.`categoria` (`categoria_nom`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2`.`comanda_producte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2`.`comanda_producte` ;

CREATE TABLE IF NOT EXISTS `n1exercici2`.`comanda_producte` (
  `comanda_id` INT NOT NULL,
  `producte_id` INT NOT NULL,
  `producte_quantitat` INT NULL,
  INDEX `fk_comanda_producte_comanda1_idx` (`comanda_id` ASC) VISIBLE,
  PRIMARY KEY (`comanda_id`, `producte_id`),
  INDEX `fk_comanda_producte_producte1_idx` (`producte_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_producte_comanda1`
    FOREIGN KEY (`comanda_id`)
    REFERENCES `n1exercici2`.`comanda` (`comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_producte_producte1`
    FOREIGN KEY (`producte_id`)
    REFERENCES `n1exercici2`.`producte` (`producte_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
