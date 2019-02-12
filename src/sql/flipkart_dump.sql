-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: flipkart
-- ------------------------------------------------------
-- Server version	8.0.12
--
-- Table structure for table `buyer_table`
--

SET NAMES utf8;
DROP Database IF EXISTS flipkartv2;
CREATE Database flipkartv2;
Use flipkartv2;

DROP TABLE IF EXISTS `buyer_table`;
CREATE TABLE `buyer_table` (
  `buyer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address_1` varchar(140) DEFAULT NULL,
  `address_2` varchar(140) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`buyer_id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `item_seller`
--

DROP TABLE IF EXISTS `item_seller`;
CREATE TABLE `item_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `address` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`seller_id`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `item_table`
--

DROP TABLE IF EXISTS `item_table`;
CREATE TABLE `item_table` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `price` float(10,2) NOT NULL,
  `discount` float(3,2) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `pic_location` varchar(60) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `sub_category` varchar(40) DEFAULT NULL,
  `barcode` varchar(10) NOT NULL,
  `dummy_1` varchar(40) DEFAULT NULL,
  `dummy_2` varchar(40) DEFAULT NULL,
  `dummy_3` varchar(40) DEFAULT NULL,
  `dummy_4` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `label_table`
--

DROP TABLE IF EXISTS `label_table`;
CREATE TABLE `label_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `label` varchar(40) NOT NULL,
  `value` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `seller_table`
--

DROP TABLE IF EXISTS `seller_table`;
CREATE TABLE `seller_table` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address_1` varchar(140) DEFAULT NULL,
  `address_2` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO buyer_table(name, dob, mobile, address_1, address_2, email) VALUES
('John','1998-01-09','9367535629', '25-K Frank Anne Street, Michigan', NULL, 'johnfkennedy@gmail.com'),
('Smith','1997-07-17','9127093606', '1-A, Royal Legion society, Detroit', NULL, 'willissmith@rocketmail.com'),
('Wong','1995-11-06','9261879202', '90th Wall Street Hub, Manhattan', NULL, "liuwong@outlook.com"),
('Zelaya','1989-01-09','9375922897', '12FA, Silicon Valley, California', NULL, "zellala@gmail.com"),
('Ramesh','1990-01-09','9361293194', '4th House of Commons, Bangalore', NULL, "rameshbhau@yahoo.com"),
('Suresh','1993-02-19','9784503610', 'Flying Palace Apartments, Hyderabad', NULL, "sureshiya@gmail.com"),
('Pankaj','1987-01-15','9632061554', '12th Vinewood road, Lad Venturas', NULL, "pank.1278@yahoomail.com"),
('Alicia','1991-03-17','9765693745', 'Maddogg club house, Vinewood', NULL, "patricia.ali@hotmail.com"),
('Trevor','1981-05-07','9254744307', 'Saharan oasis apartments, Las Vegas', NULL, 'itsmetrevor@google.com'),
('Franklin','1998-04-08','9868843149', 'Grove Street, Home, San Fierro', NULL, 'franklin.nig@rocketmail.com');

INSERT INTO seller_table(name, mobile, email, address_1, address_2) VALUES
('Cloudtail Electronics','9367765691', 'info@cloudtail.com', '345th Warehouse, Mumbai', NULL),
('ProteinXpress','9471621231', 'proteinxpress@proteinxpress.info','Scythe Protein Company, Vadodara', NULL),
('Computer World','9211823178', 'query@computerworld.in', 'Electronic City, Bangalore', NULL),
('Home4You','9875619898', 'h4u@gmail.com', '12-C, Secret Society, Surat', NULL);

INSERT INTO item_table(description, price, discount, name, pic_location, category, sub_category, barcode, dummy_1, dummy_2, dummy_3, dummy_4) VALUES
('Flagship killer smartphone of 2019', '34999.99', '0', 'OnePlus 6T', 'images/one_plus_6t', 'Mobile Phones', 'Android Smartphones', '1804289383', NULL, NULL, NULL, NULL),
('Simplicity. Glorified. Go Apple', '74999.00', '0', 'iPhone X', 'images/iphone_x', 'Mobile Phones', 'iOS Smartphones', '1714636915', NULL, NULL, NULL, NULL),
('FCAA certified whey protein isolate. No amino spiking!', '5500.00', '0', 'BPI Sports ISO HD', 'images/bpi_iso_hd', 'Health Supplements', 'Whey Protein', '1681692777', NULL, NULL, NULL, NULL),
('Industry-standard for IFBB Pros. MuscleTech supreme', '4400.00', '0', 'MuscleTech NitroTech Whey', 'images/muscle_tech_nitro', 'Health Supplements', 'Whey Protein', '1957747793', NULL, NULL, NULL, NULL),
('Gaming evolved! Dell G7 with state-of-the art specs', '134999.99', '0', 'Dell G7', 'images/dell_g7', 'Laptops', 'Gaming Laptops', '1649760492', NULL, NULL, NULL, NULL),
('Thinnest and fastest ultrabook of 2019', '93999.99', '0', 'ASUS Vivobook', 'images/asus_vivo', 'Laptops', 'Ultrabooks', '2596516649', NULL, NULL, NULL, NULL),
('Business standard for 30 years. ThinkPad', '112500.00', '0', 'ThinkPad T480S', 'images/thinkpad_t480s', 'Laptops', 'Business Laptops', '3719885386', NULL, NULL, NULL, NULL),
('Fast, safe and reliable cooking of eggs!', '1200.00', '0', 'Vixen Egg Boiler', 'images/vixen_egg_boiler', 'Cooking Equipment', 'Electric Equipment', '1189641421', NULL, NULL, NULL, NULL),
('5 litre capacity electric kettle', '899.99', '0', 'Pigeon Kettle', 'images/pigeon_kettle', 'Cooking Equipment', 'Electric Equipment', '1846930886', NULL, NULL, NULL, NULL),
('Cereal bowl (Pack of 4)', '250.00', '0', 'MCA Cereal bowl', 'images/cereal_bowl', 'Cooking Equipment', 'Utensils', '2424238335', NULL, NULL, NULL, NULL);

INSERT INTO item_seller(item_id, seller_id, quantity, address) VALUES 
(1, 1, 400, 1),
(2, 1, 200, 1),
(3, 2, 50, 1),
(4, 2, 70, 1),
(5, 3, 95, 1),
(6, 3, 89, 1),
(7, 3, 103, 1),
(8, 4, 1065, 1),
(9, 4, 1000, 1),
(10, 4, 2056, 1);

INSERT INTO label_table(item_id, label, value) VALUES
(1, 'color', 'red'),
(2, 'color', 'blue'),
(3, 'color', 'green'),
(4, 'color', 'red'),
(5, 'color', 'red'),
(6, 'color', 'blue'),
(7, 'color', 'orange'),
(8, 'color', 'yellow'),
(9, 'color', 'violet'),
(10, 'color', 'purple');

