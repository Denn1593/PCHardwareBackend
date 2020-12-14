-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PCHardwareV1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PCHardwareV1` ;

-- -----------------------------------------------------
-- Schema PCHardwareV1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PCHardwareV1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `PCHardwareV1` ;

-- -----------------------------------------------------
-- Table `PCHardwareV1`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`customers` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `zip` INT NULL DEFAULT NULL,
  `Country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`employees` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(30) NULL DEFAULT NULL,
  `zip` INT NULL DEFAULT NULL,
  `country` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`order_audits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`order_audits` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`order_audits` (
  `id` INT NOT NULL UNIQUE AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `order_id` INT NULL DEFAULT NULL, 
  `status_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `order_audit_FK` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_audit_FK`
    FOREIGN KEY (`order_id`)
    REFERENCES `PCHardwareV1`.`orders` (`id`),
  CONSTRAINT `order_audit_FK34`
    FOREIGN KEY (`status_id`)
    REFERENCES `PCHardwareV1`.`status` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`status` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `order_audit_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKstatus301195` (`order_audit_id` ASC) VISIBLE,
  CONSTRAINT `FKstatus301195`
    FOREIGN KEY (`order_audit_id`)
    REFERENCES `PCHardwareV1`.`order_audits` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`payment_methods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`payment_methods` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`payment_methods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`orders` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `status_id` INT NULL DEFAULT NULL,
  `payment_method_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKOrders911524` (`customer_id` ASC) VISIBLE,
  INDEX `FKOrders418421` (`employee_id` ASC) VISIBLE,
  INDEX `FKOrders691899` (`status_id` ASC) VISIBLE,
  INDEX `FKOrders710015` (`payment_method_id` ASC) VISIBLE,
  CONSTRAINT `FKOrders418421`
    FOREIGN KEY (`employee_id`)
    REFERENCES `PCHardwareV1`.`employees` (`id`),
  CONSTRAINT `FKOrders691899`
    FOREIGN KEY (`status_id`)
    REFERENCES `PCHardwareV1`.`status` (`id`),
  CONSTRAINT `FKOrders710015`
    FOREIGN KEY (`payment_method_id`)
    REFERENCES `PCHardwareV1`.`payment_methods` (`id`),
  CONSTRAINT `FKOrders911524`
    FOREIGN KEY (`customer_id`)
    REFERENCES `PCHardwareV1`.`customers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`order_items` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`order_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL DEFAULT NULL,
  `unit_price` INT NULL DEFAULT NULL,
  `order_id` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKorder_item666216` (`order_id` ASC) VISIBLE,
  INDEX `FKorder_item666218` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKorder_item666216`
    FOREIGN KEY (`order_id`)
    REFERENCES `PCHardwareV1`.`orders` (`id`),
  CONSTRAINT `FKorder_item666218`
    FOREIGN KEY (`product_id`)
    REFERENCES `PCHardwareV1`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`product_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`product_categories` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`product_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `PCHardwareV1`.`manufacturers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`manufacturers` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`manufacturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `website` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`products` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `article_number` VARCHAR(255) NULL DEFAULT NULL,
  `manufacturer_id` int NULL DEFAULT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  `stock` INT NULL DEFAULT NULL,
  `for_sale` BOOL NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKProducts160638` (`category_id` ASC) VISIBLE,
  CONSTRAINT `FKProducts160638`
    FOREIGN KEY (`category_id`)
    REFERENCES `PCHardwareV1`.`product_categories` (`id`),
  CONSTRAINT `FKProducts160639`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `PCHardwareV1`.`manufacturers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `PCHardwareV1`.`reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PCHardwareV1`.`reviews` ;

CREATE TABLE IF NOT EXISTS `PCHardwareV1`.`reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `product_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKReviews517345` (`customer_id` ASC) VISIBLE,
  INDEX `FKReviews339945` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKReviews339945`
    FOREIGN KEY (`product_id`)
    REFERENCES `PCHardwareV1`.`products` (`id`),
  CONSTRAINT `FKReviews517345`
    FOREIGN KEY (`customer_id`)
    REFERENCES `PCHardwareV1`.`customers` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- view for sold products
-- -----------------------------------------------------
create view sold_products as SELECT 
    products.id, products.name, products.article_number, products.description, products.price, COUNT(amount) AS sold_count
FROM
    products
        JOIN
    order_items ON product_id = products.id
GROUP BY products.id;


-- -----------------------------------------------------
-- procedure for creating order
-- -----------------------------------------------------
DELIMITER $$

create procedure create_order(var_customer_id int, var_payment_method_id int, var_employee_id int, product_id_list TEXT, product_quantity_list text)
MODIFIES SQL DATA
begin

#product_is_list vars
	declare nexti TEXt default null;
    declare nextlengthi int default null;
    declare valuei int default null;
    
#product_quantity_list vars
	declare nextq text default null;
	declare nextlengthq int default null;
    declare valueq int default null;
    
    declare var_order_id int default null;
    declare var_price int default null;
    
    start transaction;
    
    insert into orders(date, customer_id, employee_id, status_id, payment_method_id) values(now(), customer_id, var_employee_id, 1, var_payment_method_id);
    set var_order_id = last_insert_id();
    
    l:
    loop
    
		#if id list is empty
		if(length(trim(product_id_list)) = 0 or product_id_list is null) then
			leave l;
		end if;
		
		#if quantity list is empty
		if(length(trim(product_quantity_list)) = 0 or product_quantity_list is null) then
			leave l;
		end if;
		
		set nexti = substring_index(product_id_list, ',', 1);
		set nextlengthi = length(nexti);
		set valuei = convert(trim(nexti), unsigned integer);
		
		set nextq = substring_index(product_quantity_list, ',', 1);
		set nextlengthq = length(nextq);
		set valueq = convert(trim(nextq), unsigned integer);
		select price into var_price from products where id = valuei;
        
        select concat('product_id is ', valuei), concat('quantity ', valueq), concat('id list ', product_id_list);
		
		insert into order_items (order_id, amount, unit_price, product_id) values(var_order_id, valueq, var_price, valuei);
        
        set product_id_list = insert(product_id_list, 1, nextlengthi + 1, '');
        set product_quantity_list = insert(product_quantity_list, 1, nextlengthq + 1, '');
    end loop;
    commit;
end $$
delimiter ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
