/*
SQLyog Enterprise - MySQL GUI v6.5
MySQL - 8.0.21 : Database - my_rest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

create database if not exists `my_rest`;

USE `my_rest`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `AdminId` int unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Status` int unsigned NOT NULL DEFAULT '1',
  `MenuId` int unsigned NOT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `administrator` */

insert  into `administrator`(`AdminId`,`Fname`,`Lname`,`Username`,`Password`,`Status`,`MenuId`) values (1,'adminfname','adminlname','admin','Admin@123',1,1);

/*Table structure for table `chefs` */

DROP TABLE IF EXISTS `chefs`;

CREATE TABLE `chefs` (
  `ChefId` int unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `PhonoNo` varchar(15) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `OrderId` int NOT NULL,
  PRIMARY KEY (`ChefId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chefs` */

insert  into `chefs`(`ChefId`,`Fname`,`Lname`,`Username`,`PhonoNo`,`Password`,`OrderId`) values (1,'Chef1','ChefLname','chef123','343434343434','Password@123',1);

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `CustomerId` int unsigned NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `PaymentId` int unsigned DEFAULT NULL,
  `FoodId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customers` */

insert  into `customers`(`CustomerId`,`Email`,`PhoneNo`,`Fname`,`Lname`,`PaymentId`,`FoodId`) values (1,'email@email.com','33333333333','MyFName','MyLname',1,1),(2,'test@test.com','2323232323','Test','Test',1,1);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `fooditems` */

DROP TABLE IF EXISTS `fooditems`;

CREATE TABLE `fooditems` (
  `FoodId` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `ItemCategory` int unsigned NOT NULL,
  PRIMARY KEY (`FoodId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fooditems` */

insert  into `fooditems`(`FoodId`,`Name`,`Quantity`,`UnitPrice`,`ItemCategory`) values (1,'FoodItem1',10,'500.00',1);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `MenuId` int unsigned NOT NULL AUTO_INCREMENT,
  `Price` decimal(10,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `FoodId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `menu` */

insert  into `menu`(`MenuId`,`Price`,`StartDate`,`EndDate`,`FoodId`) values (1,'500.00','2021-09-17','2021-09-25',1);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_09_08_222716_create_projects_table',1);

/*Table structure for table `orderitems` */

DROP TABLE IF EXISTS `orderitems`;

CREATE TABLE `orderitems` (
  `OrderId` int unsigned NOT NULL AUTO_INCREMENT,
  `FoodId` int unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `UnitPrice` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderitems` */

insert  into `orderitems`(`OrderId`,`FoodId`,`Quantity`,`UnitPrice`) values (1,1,1,'500.00'),(4,1,3,'500.00');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `OrderId` int unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `CustomerId` int unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `PickupDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderId`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

insert  into `orders`(`OrderId`,`OrderDate`,`CustomerId`,`Quantity`,`PickupDate`,`created_at`) values (1,'2021-09-17',1,1,'2021-09-17','2021-09-17 12:53:40'),(2,'2021-09-17',1,1,'2021-09-17','2021-09-17 20:47:25'),(3,'2021-09-17',2,2,'2021-09-17','2021-09-17 20:47:49'),(4,'2021-09-17',2,3,'2021-09-17','2021-09-17 20:55:00');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `PaymentId` int unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int unsigned NOT NULL,
  `OrderId` int unsigned NOT NULL,
  `PaymentDate` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentType` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`PaymentId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payments` */

insert  into `payments`(`PaymentId`,`CustomerId`,`OrderId`,`PaymentDate`,`Amount`,`PaymentType`) values (1,1,1,'2021-09-17','500.00',0);

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(22,2) DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `projects` */

insert  into `projects`(`id`,`name`,`introduction`,`location`,`cost`,`created_at`,`updated_at`) values (1,'test','test','test','2.00','2021-09-17 07:23:49','2021-09-17 07:23:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
