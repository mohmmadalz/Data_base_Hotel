-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotel_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotel_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_management` DEFAULT CHARACTER SET utf8mb4 ;
USE `hotel_management` ;

-- -----------------------------------------------------
-- Table `hotel_management`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`hotel` (
  `hotel_id` VARCHAR(11) NOT NULL,
  `star_rate` VARCHAR(11) NULL DEFAULT NULL,
  `hotel_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hotel_management`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`rooms` (
  `Rnumbuer` INT(11) NOT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `hotel_hotel_id` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Rnumbuer`, `hotel_hotel_id`),
  INDEX `fk_Rooms_hotel1_idx` (`hotel_hotel_id` ASC) ,
  CONSTRAINT `fk_Rooms_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `hotel_management`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hotel_management`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`employee` (
  `Employee_id` INT(11) NOT NULL,
  `Fname` VARCHAR(45) NULL DEFAULT NULL,
  `Lname` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `hotel_hotel_id` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  INDEX `fk_employee_hotel1_idx` (`hotel_hotel_id` ASC) ,
  CONSTRAINT `fk_employee_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `hotel_management`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hotel_management`.`clean`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`clean` (
  `Rooms_Rnumbuer` INT(11) NOT NULL,
  `Rooms_hotel_hotel_id` VARCHAR(11) NOT NULL,
  `employee_Employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`Rooms_Rnumbuer`, `Rooms_hotel_hotel_id`, `employee_Employee_id`),
  INDEX `fk_Rooms_has_employee_employee1_idx` (`employee_Employee_id` ASC) ,
  INDEX `fk_Rooms_has_employee_Rooms1_idx` (`Rooms_Rnumbuer` ASC, `Rooms_hotel_hotel_id` ASC) ,
  CONSTRAINT `fk_Rooms_has_employee_Rooms1`
    FOREIGN KEY (`Rooms_Rnumbuer` , `Rooms_hotel_hotel_id`)
    REFERENCES `hotel_management`.`rooms` (`Rnumbuer` , `hotel_hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rooms_has_employee_employee1`
    FOREIGN KEY (`employee_Employee_id`)
    REFERENCES `hotel_management`.`employee` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hotel_management`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_management`.`location` (
  `Pincode` INT(11) NOT NULL,
  `town` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `hotel_hotel_id` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`Pincode`),
  INDEX `fk_Location_hotel1_idx` (`hotel_hotel_id` ASC) ,
  CONSTRAINT `fk_Location_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `hotel_management`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
