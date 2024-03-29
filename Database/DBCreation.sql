-- MySQL Script generated by MySQL Workbench
-- Sat Nov 19 19:44:34 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `new_schema1` ;

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Patient` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Insurance` TINYINT NOT NULL,
  `SSN` INT(9) NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Department` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Department` (
  `idDepartment` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartment`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `new_schema1`.`Department` (`Name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Specialty` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Specialty` (
  `idSpecialty` INT NOT NULL AUTO_INCREMENT,
  `specialty` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSpecialty`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `specialty_UNIQUE` ON `new_schema1`.`Specialty` (`specialty` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Doctor` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Doctor` (
  `SSN` INT(9) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Salary` INT(9) NOT NULL,
  `idDepartment` INT NOT NULL,
  `idSpecialty` INT NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Doctor_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `new_schema1`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_Specialty1`
    FOREIGN KEY (`idSpecialty`)
    REFERENCES `new_schema1`.`Specialty` (`idSpecialty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Doctor_Department1_idx` ON `new_schema1`.`Doctor` (`idDepartment` ASC) VISIBLE;

CREATE INDEX `fk_Doctor_Specialty1_idx` ON `new_schema1`.`Doctor` (`idSpecialty` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Room` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Room` (
  `Floor` INT(2) NOT NULL,
  `Number` INT(4) NOT NULL,
  PRIMARY KEY (`Floor`, `Number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Nurse` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Nurse` (
  `SSN` INT(9) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Salary` INT(9) NOT NULL,
  `idDepartment` INT NOT NULL,
  `Room_Floor` INT(2) NOT NULL,
  `Room_Number` INT(4) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Nurse_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `new_schema1`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nurse_Room1`
    FOREIGN KEY (`Room_Floor` , `Room_Number`)
    REFERENCES `new_schema1`.`Room` (`Floor` , `Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Nurse_Department1_idx` ON `new_schema1`.`Nurse` (`idDepartment` ASC) VISIBLE;

CREATE INDEX `fk_Nurse_Room1_idx` ON `new_schema1`.`Nurse` (`Room_Floor` ASC, `Room_Number` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Accountant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Accountant` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Accountant` (
  `SSN` INT(9) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Salary` INT(9) NOT NULL,
  `idDepartment` INT NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `fk_Accountant_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `new_schema1`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Accountant_Department1_idx` ON `new_schema1`.`Accountant` (`idDepartment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`ReferenceType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`ReferenceType` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`ReferenceType` (
  `idReferenceType` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReferenceType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Reference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Reference` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Reference` (
  `idReference` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `idDoctor` INT NOT NULL,
  `idPatient` INT NOT NULL,
  `idReferenceType` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idReference`, `idDoctor`, `idPatient`, `idReferenceType`),
  CONSTRAINT `fk_Reference_Doctor1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `new_schema1`.`Doctor` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reference_Patient1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `new_schema1`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reference_ReferenceType1`
    FOREIGN KEY (`idReferenceType`)
    REFERENCES `new_schema1`.`ReferenceType` (`idReferenceType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Reference_Doctor1_idx` ON `new_schema1`.`Reference` (`idDoctor` ASC) VISIBLE;

CREATE INDEX `fk_Reference_Patient1_idx` ON `new_schema1`.`Reference` (`idPatient` ASC) VISIBLE;

CREATE INDEX `fk_Reference_ReferenceType1_idx` ON `new_schema1`.`Reference` (`idReferenceType` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Medication` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Medication` (
  `idMedication` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `company` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedication`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Prescription` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Prescription` (
  `idDoctor` INT(9) NOT NULL,
  `idPatient` INT NOT NULL,
  `idMedication` INT NOT NULL,
  `price` DECIMAL(8) NOT NULL,
  `numdoses` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`idDoctor`, `idPatient`, `idMedication`, `date`),
  CONSTRAINT `fk_Medication_Doctor1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `new_schema1`.`Doctor` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medication_Patient1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `new_schema1`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescribes_Medication1`
    FOREIGN KEY (`idMedication`)
    REFERENCES `new_schema1`.`Medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Medication_Doctor1_idx` ON `new_schema1`.`Prescription` (`idDoctor` ASC) VISIBLE;

CREATE INDEX `fk_Medication_Patient1_idx` ON `new_schema1`.`Prescription` (`idPatient` ASC) VISIBLE;

CREATE INDEX `fk_Prescribes_Medication1_idx` ON `new_schema1`.`Prescription` (`idMedication` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Bed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Bed` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Bed` (
  `idBed` INT NOT NULL,
  `Room_Floor` INT(2) NOT NULL,
  `Room_Number` INT(4) NOT NULL,
  PRIMARY KEY (`idBed`, `Room_Floor`, `Room_Number`),
  CONSTRAINT `fk_Bed_Room1`
    FOREIGN KEY (`Room_Floor` , `Room_Number`)
    REFERENCES `new_schema1`.`Room` (`Floor` , `Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Bed_Room1_idx` ON `new_schema1`.`Bed` (`Room_Floor` ASC, `Room_Number` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Visit` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Visit` (
  `idVisit` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `idBed` INT NOT NULL,
  `Bed_Room_Floor` INT(2) NOT NULL,
  `Bed_Room_Number` INT(4) NOT NULL,
  `idPatient` INT NOT NULL,
  PRIMARY KEY (`idVisit`),
  CONSTRAINT `fk_Visit_Bed1`
    FOREIGN KEY (`idBed` , `Bed_Room_Floor` , `Bed_Room_Number`)
    REFERENCES `new_schema1`.`Bed` (`idBed` , `Room_Floor` , `Room_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_Patient1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `new_schema1`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Visit_Bed1_idx` ON `new_schema1`.`Visit` (`idBed` ASC, `Bed_Room_Floor` ASC, `Bed_Room_Number` ASC) VISIBLE;

CREATE INDEX `fk_Visit_Patient1_idx` ON `new_schema1`.`Visit` (`idPatient` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `new_schema1`.`Visit_has_Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Visit_has_Doctor` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Visit_has_Doctor` (
  `idVisit` INT NOT NULL,
  `idDoctor` INT(9) NOT NULL,
  PRIMARY KEY (`idVisit`, `idDoctor`),
  CONSTRAINT `fk_Visit_has_Doctor_Visit1`
    FOREIGN KEY (`idVisit`)
    REFERENCES `new_schema1`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_has_Doctor_Doctor1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `new_schema1`.`Doctor` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Visit_has_Doctor_Doctor1_idx` ON `new_schema1`.`Visit_has_Doctor` (`idDoctor` ASC) VISIBLE;

CREATE INDEX `fk_Visit_has_Doctor_Visit1_idx` ON `new_schema1`.`Visit_has_Doctor` (`idVisit` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
