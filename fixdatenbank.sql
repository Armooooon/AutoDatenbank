-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema auto_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema auto_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `auto_db` DEFAULT CHARACTER SET utf8 ;
USE `auto_db` ;

-- -----------------------------------------------------
-- Table `auto_db`.`kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`kunde` (
  `kundenNr` INT(255) NOT NULL AUTO_INCREMENT,
  `vorname` VARCHAR(99) NOT NULL,
  `nachname` VARCHAR(99) NOT NULL,
  `adresse` VARCHAR(99) NOT NULL,
  `plz` VARCHAR(99) NOT NULL,
  `telefon` VARCHAR(99) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`kundenNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`auto` (
  `autoNr` INT(50) NOT NULL AUTO_INCREMENT,
  `kundenNr` INT(50) NOT NULL,
  `marke` VARCHAR(50) NOT NULL,
  `modell` VARCHAR(50) NOT NULL,
  `jahr` INT(20) NOT NULL,
  `kilometerstand` INT(20) NULL DEFAULT NULL,
  PRIMARY KEY (`autoNr`),
  INDEX `kundenNr` (`kundenNr` ASC),
  CONSTRAINT `auto_ibfk_1`
    FOREIGN KEY (`kundenNr`)
    REFERENCES `auto_db`.`kunde` (`kundenNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`lieferant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`lieferant` (
  `lieferantNr` INT(50) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `adresse` VARCHAR(99) NOT NULL,
  `telefon` VARCHAR(99) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`lieferantNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`rechnung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`rechnung` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Verkauf_ID` INT(11) NOT NULL,
  `Datum` DATE NOT NULL,
  `Summe` DECIMAL(10,2) NOT NULL,
  `kunde_kundenNr` INT(255) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_rechnung_kunde1_idx` (`kunde_kundenNr` ASC),
  CONSTRAINT `fk_rechnung_kunde1`
    FOREIGN KEY (`kunde_kundenNr`)
    REFERENCES `auto_db`.`kunde` (`kundenNr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`rechnungsposition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`rechnungsposition` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Rechnung_ID` INT(11) NOT NULL,
  `Position` INT(11) NOT NULL,
  `Beschreibung` VARCHAR(255) NOT NULL,
  `Preis` DECIMAL(10,2) NOT NULL,
  `Menge` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Rechnung_ID` (`Rechnung_ID` ASC),
  CONSTRAINT `rechnungsposition_ibfk_1`
    FOREIGN KEY (`Rechnung_ID`)
    REFERENCES `auto_db`.`rechnung` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`ersatzteil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`ersatzteil` (
  `teilNr` INT(50) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `beschreibung` VARCHAR(255) NULL DEFAULT NULL,
  `preis` DECIMAL(10,2) NOT NULL,
  `lagerbestand` INT(20) NULL DEFAULT NULL,
  `lieferantNr` INT(50) NOT NULL,
  `rechnungsposition_ID` INT(11) NOT NULL,
  PRIMARY KEY (`teilNr`),
  INDEX `lieferantNr` (`lieferantNr` ASC),
  INDEX `fk_ersatzteil_rechnungsposition1_idx` (`rechnungsposition_ID` ASC),
  CONSTRAINT `ersatzteil_ibfk_1`
    FOREIGN KEY (`lieferantNr`)
    REFERENCES `auto_db`.`lieferant` (`lieferantNr`),
  CONSTRAINT `fk_ersatzteil_rechnungsposition1`
    FOREIGN KEY (`rechnungsposition_ID`)
    REFERENCES `auto_db`.`rechnungsposition` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`mitarbeiter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`mitarbeiter` (
  `mitarbeiterNr` INT(255) NOT NULL AUTO_INCREMENT,
  `vorname` VARCHAR(99) NOT NULL,
  `nachname` VARCHAR(99) NOT NULL,
  `telefon` VARCHAR(99) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`mitarbeiterNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`reparatur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`reparatur` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Auto_ID` INT(11) NOT NULL,
  `Mitarbeiter_ID` INT(11) NOT NULL,
  `Datum` DATE NOT NULL,
  `Beschreibung` VARCHAR(255) NOT NULL,
  `Kosten` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Auto_ID` (`Auto_ID` ASC),
  INDEX `Mitarbeiter_ID` (`Mitarbeiter_ID` ASC),
  CONSTRAINT `reparatur_ibfk_1`
    FOREIGN KEY (`Auto_ID`)
    REFERENCES `auto_db`.`auto` (`autoNr`),
  CONSTRAINT `reparatur_ibfk_2`
    FOREIGN KEY (`Mitarbeiter_ID`)
    REFERENCES `auto_db`.`mitarbeiter` (`mitarbeiterNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`reparatur_ersatzteil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`reparatur_ersatzteil` (
  `reparaturID` INT(11) NOT NULL,
  `ersatzteilID` INT(11) NOT NULL,
  `anzahl` INT(11) NOT NULL,
  PRIMARY KEY (`reparaturID`, `ersatzteilID`),
  INDEX `ersatzteilID` (`ersatzteilID` ASC),
  CONSTRAINT `reparatur_ersatzteil_ibfk_1`
    FOREIGN KEY (`reparaturID`)
    REFERENCES `auto_db`.`reparatur` (`ID`),
  CONSTRAINT `reparatur_ersatzteil_ibfk_2`
    FOREIGN KEY (`ersatzteilID`)
    REFERENCES `auto_db`.`ersatzteil` (`teilNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`termine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`termine` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `kunde_ID` INT(11) NOT NULL,
  `auto_ID` INT(11) NOT NULL,
  `datum` DATE NOT NULL,
  `beschreibung` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `kunde_ID` (`kunde_ID` ASC),
  INDEX `auto_ID` (`auto_ID` ASC),
  CONSTRAINT `termine_ibfk_1`
    FOREIGN KEY (`kunde_ID`)
    REFERENCES `auto_db`.`kunde` (`kundenNr`),
  CONSTRAINT `termine_ibfk_2`
    FOREIGN KEY (`auto_ID`)
    REFERENCES `auto_db`.`auto` (`autoNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`verkauf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`verkauf` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Auto_ID` INT(11) NOT NULL,
  `Kunde_ID` INT(11) NOT NULL,
  `Datum` DATE NOT NULL,
  `Preis` DECIMAL(10,2) NOT NULL,
  `Zahlungsmethode` VARCHAR(20) NOT NULL,
  `Finanzierung` TINYINT(1) NOT NULL DEFAULT '0',
  `Anzahlung` DECIMAL(10,2) NULL DEFAULT NULL,
  `Restbetrag` DECIMAL(10,2) NULL DEFAULT NULL,
  `Rechnungs_ID` INT(11) NOT NULL,
  `Mitarbeiter_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Auto_ID` (`Auto_ID` ASC),
  INDEX `Kunde_ID` (`Kunde_ID` ASC),
  INDEX `Mitarbeiter_ID` (`Mitarbeiter_ID` ASC),
  CONSTRAINT `verkauf_ibfk_1`
    FOREIGN KEY (`Auto_ID`)
    REFERENCES `auto_db`.`auto` (`autoNr`),
  CONSTRAINT `verkauf_ibfk_2`
    FOREIGN KEY (`Kunde_ID`)
    REFERENCES `auto_db`.`kunde` (`kundenNr`),
  CONSTRAINT `verkauf_ibfk_3`
    FOREIGN KEY (`Mitarbeiter_ID`)
    REFERENCES `auto_db`.`mitarbeiter` (`mitarbeiterNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `auto_db`.`verkauf_ersatzteil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `auto_db`.`verkauf_ersatzteil` (
  `verkaufID` INT(11) NOT NULL,
  `ersatzteilID` INT(11) NOT NULL,
  `anzahl` INT(11) NOT NULL,
  PRIMARY KEY (`verkaufID`, `ersatzteilID`),
  INDEX `ersatzteilID` (`ersatzteilID` ASC),
  CONSTRAINT `verkauf_ersatzteil_ibfk_1`
    FOREIGN KEY (`verkaufID`)
    REFERENCES `auto_db`.`verkauf` (`ID`),
  CONSTRAINT `verkauf_ersatzteil_ibfk_2`
    FOREIGN KEY (`ersatzteilID`)
    REFERENCES `auto_db`.`ersatzteil` (`teilNr`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
