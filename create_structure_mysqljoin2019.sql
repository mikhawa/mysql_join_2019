-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mysqljoin2019
-- -----------------------------------------------------
-- Préparation du test du CF2m pour les webdev 2019

-- -----------------------------------------------------
-- Schema mysqljoin2019
--
-- Préparation du test du CF2m pour les webdev 2019
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mysqljoin2019` DEFAULT CHARACTER SET utf8 ;
USE `mysqljoin2019` ;

-- -----------------------------------------------------
-- Table `mysqljoin2019`.`perm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`perm` (
  `idperm` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thename` VARCHAR(60) NOT NULL,
  `thelevel` TINYINT UNSIGNED NOT NULL DEFAULT 3,
  PRIMARY KEY (`idperm`),
  UNIQUE INDEX `thename_UNIQUE` (`thename` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqljoin2019`.`theuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`theuser` (
  `idtheuser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thelogin` VARCHAR(80) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `thename` VARCHAR(160) NOT NULL,
  `thepwd` CHAR(64) NOT NULL,
  `themail` VARCHAR(250) NOT NULL,
  `perm_idperm` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idtheuser`),
  UNIQUE INDEX `thelogin_UNIQUE` (`thelogin` ASC),
  INDEX `fk_theuser_perm_idx` (`perm_idperm` ASC),
  CONSTRAINT `fk_theuser_perm`
    FOREIGN KEY (`perm_idperm`)
    REFERENCES `mysqljoin2019`.`perm` (`idperm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqljoin2019`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`article` (
  `idarticle` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thetitle` VARCHAR(200) NOT NULL,
  `thetext` TEXT NOT NULL,
  `thedate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `theuser_idtheuser` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idarticle`),
  INDEX `fk_article_theuser1_idx` (`theuser_idtheuser` ASC),
  CONSTRAINT `fk_article_theuser1`
    FOREIGN KEY (`theuser_idtheuser`)
    REFERENCES `mysqljoin2019`.`theuser` (`idtheuser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqljoin2019`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`image` (
  `idimage` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `theurl` VARCHAR(250) NOT NULL,
  `thealt` VARCHAR(100) NULL,
  `article_idarticle` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idimage`),
  INDEX `fk_image_article1_idx` (`article_idarticle` ASC),
  CONSTRAINT `fk_image_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `mysqljoin2019`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqljoin2019`.`categ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`categ` (
  `idcateg` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `thetitle` VARCHAR(120) NOT NULL,
  `thedesc` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idcateg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysqljoin2019`.`categ_has_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysqljoin2019`.`categ_has_article` (
  `categ_idcateg` SMALLINT UNSIGNED NOT NULL,
  `article_idarticle` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`categ_idcateg`, `article_idarticle`),
  INDEX `fk_categ_has_article_article1_idx` (`article_idarticle` ASC),
  INDEX `fk_categ_has_article_categ1_idx` (`categ_idcateg` ASC),
  CONSTRAINT `fk_categ_has_article_categ1`
    FOREIGN KEY (`categ_idcateg`)
    REFERENCES `mysqljoin2019`.`categ` (`idcateg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categ_has_article_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `mysqljoin2019`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
