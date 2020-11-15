-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pchardwarev1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pchardwarev1` ;

-- -----------------------------------------------------
-- Schema pchardwarev1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pchardwarev1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pchardwarev1` ;

-- -----------------------------------------------------
-- Table `pchardwarev1`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`customers` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `zip` INT NULL DEFAULT NULL,
  `Country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`employees` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`employees` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `zip` INT NULL DEFAULT NULL,
  `Country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`order_audits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`order_audits` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`order_audits` (
  `id` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `order_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_audit_FK` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_audit_FK`
    FOREIGN KEY (`order_id`)
    REFERENCES `PCHardwareV1`.`orders` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`status` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`status` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `order_audit_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FKstatus301195` (`order_audit_ID` ASC) VISIBLE,
  CONSTRAINT `FKstatus301195`
    FOREIGN KEY (`order_audit_ID`)
    REFERENCES `pchardwarev1`.`order_audits` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`payment_methods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`payment_methods` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`payment_methods` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`orders` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `status_id` INT NULL DEFAULT NULL,
  `order_audit_ID` INT NULL DEFAULT NULL,
  `payment_method_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FKOrders911524` (`customer_id` ASC) VISIBLE,
  INDEX `FKOrders418421` (`employee_id` ASC) VISIBLE,
  INDEX `FKOrders691899` (`status_id` ASC) VISIBLE,
  INDEX `FKOrders247750` (`order_audit_ID` ASC) VISIBLE,
  INDEX `FKOrders710015` (`payment_method_id` ASC) VISIBLE,
  CONSTRAINT `FKOrders247750`
    FOREIGN KEY (`order_audit_ID`)
    REFERENCES `pchardwarev1`.`order_audits` (`ID`),
  CONSTRAINT `FKOrders418421`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pchardwarev1`.`employees` (`ID`),
  CONSTRAINT `FKOrders691899`
    FOREIGN KEY (`status_id`)
    REFERENCES `pchardwarev1`.`status` (`ID`),
  CONSTRAINT `FKOrders710015`
    FOREIGN KEY (`payment_method_id`)
    REFERENCES `pchardwarev1`.`payment_methods` (`ID`),
  CONSTRAINT `FKOrders911524`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pchardwarev1`.`customers` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`order_items` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`order_items` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL DEFAULT NULL,
  `unitprice` INT NULL DEFAULT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FKorder_item666216` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `FKorder_item666216`
    FOREIGN KEY (`OrderID`)
    REFERENCES `pchardwarev1`.`orders` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`product_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`product_categories` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`product_categories` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`products` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`products` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `article_number` VARCHAR(255) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(60) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  `stock` INT NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `order_item_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FKProducts160638` (`category_id` ASC) VISIBLE,
  INDEX `FKProducts25864` (`order_item_id` ASC) VISIBLE,
  CONSTRAINT `FKProducts160638`
    FOREIGN KEY (`category_id`)
    REFERENCES `pchardwarev1`.`product_categories` (`ID`),
  CONSTRAINT `FKProducts25864`
    FOREIGN KEY (`order_item_id`)
    REFERENCES `pchardwarev1`.`order_items` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pchardwarev1`.`reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pchardwarev1`.`reviews` ;

CREATE TABLE IF NOT EXISTS `pchardwarev1`.`reviews` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FKReviews517345` (`customer_id` ASC) VISIBLE,
  INDEX `FKReviews339945` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKReviews339945`
    FOREIGN KEY (`product_id`)
    REFERENCES `pchardwarev1`.`products` (`ID`),
  CONSTRAINT `FKReviews517345`
    FOREIGN KEY (`customer_id`)
    REFERENCES `pchardwarev1`.`customers` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
