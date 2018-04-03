CREATE DATABASE IF NOT EXISTS `store`;

USE `store`;

DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customers`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `order_lines`;

CREATE TABLE `customers` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`customer_firstname` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`customer_id`)
);

CREATE TABLE `orders` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`order_date` DATE NOT NULL,
	`customer_id` INT NOT NULL,
	PRIMARY KEY(`order_id`),
	FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
);

CREATE TABLE `products` (
	`product_id` INT NOT NULL AUTO_INCREMENT,
	`product_description` TEXT NOT NULL,
	`product_price` DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(`product_id`)
);

CREATE TABLE `orderlines` (
	`order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`orderlines_amount` INT NOT NULL,
	PRIMARY KEY(`order_id`, `product_id`),
	FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`),
	FOREIGN KEY(`product_id`) REFERENCES `products`(`product_id`)
);
