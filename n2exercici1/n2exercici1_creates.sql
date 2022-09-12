-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema n2exercici1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `n2exercici1` ;

-- -----------------------------------------------------
-- Schema n2exercici1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n2exercici1` DEFAULT CHARACTER SET utf8mb4 ;
USE `n2exercici1` ;

-- -----------------------------------------------------
-- Table `n2exercici1`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`user` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `born_date` DATE NOT NULL,
  `Genre` ENUM("M", "F", "NB") NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`video` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`video` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `size` DOUBLE NOT NULL,
  `file_name` VARCHAR(255) NOT NULL,
  `duration` TIME NOT NULL,
  `thumbnail` VARCHAR(255) NOT NULL,
  `num_plays` INT NOT NULL DEFAULT 0,
  `num_likes` INT NOT NULL DEFAULT 0,
  `num_dislikes` INT NOT NULL DEFAULT 0,
  `state` ENUM("Public", "Hidden", "Private") NOT NULL DEFAULT 'Private',
  `user_id` INT UNSIGNED NOT NULL,
  `publication_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `producte_nom_UNIQUE` (`title` ASC) VISIBLE,
  INDEX `fk_video_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`tag` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`tag` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `video_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `categoria_nom_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tag_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_tag_video`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1`.`video` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`channel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`channel` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`channel` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_channel_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`subscription` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`subscription` (
  `user_id` INT UNSIGNED NOT NULL,
  `channel_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `channel_id`),
  INDEX `fk_channel_subs_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_subs`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_channel_subs`
    FOREIGN KEY (`channel_id`)
    REFERENCES `n2exercici1`.`channel` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`video_reaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`video_reaction` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`video_reaction` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` ENUM("Like", "Dislike") NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `video_id` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_user_reaction_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video_reaction_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_v_reaction`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_v_reaction`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1`.`video` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`playlist` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`playlist` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `state` ENUM("Public", "Private") NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`comment` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(255) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `video_id` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_user_reaction_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video_reaction_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_comment`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_comment`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1`.`video` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`comment_reaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`comment_reaction` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`comment_reaction` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` ENUM("Like", "Dislike") NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `comment_id` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_user_reaction_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_comment_c_reaction_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_c_reaction`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_c_reaction`
    FOREIGN KEY (`comment_id`)
    REFERENCES `n2exercici1`.`comment` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1`.`playlist_has_video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n2exercici1`.`playlist_has_video` ;

CREATE TABLE IF NOT EXISTS `n2exercici1`.`playlist_has_video` (
  `playlist_id` INT UNSIGNED NOT NULL,
  `video_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `fk_playlist_has_video_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_video_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_video_playlist`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `n2exercici1`.`playlist` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_has_video_video`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1`.`video` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
