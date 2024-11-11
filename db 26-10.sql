/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - medlocator
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`medlocator` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `medlocator`;

/*Table structure for table `app_bill` */

DROP TABLE IF EXISTS `app_bill`;

CREATE TABLE `app_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Usere` varchar(20) NOT NULL,
  `Phone_no` bigint NOT NULL,
  `Date` date NOT NULL,
  `Amount` int NOT NULL,
  `Status` varchar(20) NOT NULL,
  `PHARMACY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_bill_PHARMACY_id_20e9a722_fk_app_pharmacy_id` (`PHARMACY_id`),
  CONSTRAINT `app_bill_PHARMACY_id_20e9a722_fk_app_pharmacy_id` FOREIGN KEY (`PHARMACY_id`) REFERENCES `app_pharmacy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_bill` */

/*Table structure for table `app_bill_sub` */

DROP TABLE IF EXISTS `app_bill_sub`;

CREATE TABLE `app_bill_sub` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `QUANTITY` int NOT NULL,
  `PRICE` double NOT NULL,
  `BILL_id` bigint NOT NULL,
  `STOCK_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_bill_sub_BILL_id_97258fb5_fk_app_bill_id` (`BILL_id`),
  KEY `app_bill_sub_STOCK_id_a4d9d03f_fk_app_stock_id` (`STOCK_id`),
  CONSTRAINT `app_bill_sub_BILL_id_97258fb5_fk_app_bill_id` FOREIGN KEY (`BILL_id`) REFERENCES `app_bill` (`id`),
  CONSTRAINT `app_bill_sub_STOCK_id_a4d9d03f_fk_app_stock_id` FOREIGN KEY (`STOCK_id`) REFERENCES `app_stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_bill_sub` */

/*Table structure for table `app_category` */

DROP TABLE IF EXISTS `app_category`;

CREATE TABLE `app_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Category` varchar(30) NOT NULL,
  `Description` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_category` */

insert  into `app_category`(`id`,`Category`,`Description`) values 
(3,'Antibiotics','Used to treat bacterial infections'),
(4,'Antidiabetics','Manage blood sugar levels in diabetes'),
(5,'Antacids','Neutralize stomach acid'),
(10,'Antidepressants','used to treat clinical depression');

/*Table structure for table `app_feedback` */

DROP TABLE IF EXISTS `app_feedback`;

CREATE TABLE `app_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Phone_no` bigint NOT NULL,
  `Feedback` varchar(50) NOT NULL,
  `Rating` int NOT NULL,
  `Date` date NOT NULL,
  `PHARMACY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_feedback_PHARMACY_id_6d7542f7_fk_app_pharmacy_id` (`PHARMACY_id`),
  CONSTRAINT `app_feedback_PHARMACY_id_6d7542f7_fk_app_pharmacy_id` FOREIGN KEY (`PHARMACY_id`) REFERENCES `app_pharmacy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_feedback` */

/*Table structure for table `app_ingredients` */

DROP TABLE IF EXISTS `app_ingredients`;

CREATE TABLE `app_ingredients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Content` varchar(50) NOT NULL,
  `Quantity` int NOT NULL,
  `MEDICINE_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ingredients_MEDICINE_id_b3cca04c_fk_app_medicine_id` (`MEDICINE_id`),
  CONSTRAINT `app_ingredients_MEDICINE_id_b3cca04c_fk_app_medicine_id` FOREIGN KEY (`MEDICINE_id`) REFERENCES `app_medicine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_ingredients` */

/*Table structure for table `app_login` */

DROP TABLE IF EXISTS `app_login`;

CREATE TABLE `app_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Type` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_login` */

insert  into `app_login`(`id`,`Username`,`Password`,`Type`) values 
(1,'admin','admin','admin'),
(2,'pharmacy','ph','pharmacy'),
(3,'pharma','p','pharmacy'),
(4,'xcvh2dfg','Afnan123$','pharmacy'),
(5,'afnan1223','Afnan123$','pharmacy'),
(6,'username','JJpharmacy@3','pending'),
(7,'ffah12@gmail.com','Abcd223@','pending'),
(8,'ffah12@gmail.com','Abcd223@','pharmacy'),
(9,'archanavadakkedath002@gmail.com','Abcd223@','Blocked'),
(10,'afnanshabeer2@gmail.com','JJpharmacy@3','pending'),
(11,'jjp@gmail.com','123','pharmacy'),
(12,'sankardasnasd@gmail.com','J3@4567fghjjj','pharmacy'),
(13,'asd@gmail.com','Asd@67382','pharmacy'),
(14,'neethi@gmail.com','Asd@67382','pharmacy'),
(15,'asddd@gmail.com','Asdrf@654','pharmacy'),
(16,'naveen@gmail.com','Naveen@123','pending'),
(17,'naveentj@gmail.com','Naveen@123','pending'),
(18,'hhhhh@gmail.com','Naveen@123','pharmacy');

/*Table structure for table `app_medicine` */

DROP TABLE IF EXISTS `app_medicine`;

CREATE TABLE `app_medicine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Medicine_name` varchar(40) NOT NULL,
  `CATEGORY_id` bigint NOT NULL,
  `PHARMACY_id` bigint NOT NULL,
  `image` varchar(400) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_medicine_PHARMACY_id_3695d1af_fk_app_pharmacy_id` (`PHARMACY_id`),
  KEY `app_medicine_CATEGORY_id_9d79ec3b_fk_app_category_id` (`CATEGORY_id`),
  CONSTRAINT `app_medicine_CATEGORY_id_9d79ec3b_fk_app_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `app_category` (`id`),
  CONSTRAINT `app_medicine_PHARMACY_id_3695d1af_fk_app_pharmacy_id` FOREIGN KEY (`PHARMACY_id`) REFERENCES `app_pharmacy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_medicine` */

insert  into `app_medicine`(`id`,`Medicine_name`,`CATEGORY_id`,`PHARMACY_id`,`image`) values 
(1,'rey',3,4,'/media/2024-10-10-11-48-22.jpg'),
(2,'ggg',3,4,'/media/2024-10-10-11-48-22.jpg'),
(3,'gkjf',4,4,'/media/2024-10-10-11-48-22.jpg'),
(4,'Paracetomolssss',4,1,'/media/2024-10-26-17-25-50.jpg'),
(5,'tyify',3,1,'/media/2024-10-10-11-48-22.jpg'),
(6,'dsddd',3,1,'/media/2024-10-10-11-48-22.jpg'),
(7,'sas',3,1,'/media/2024-10-10-11-48-22.jpg'),
(8,'fvdf',4,1,'/media/2024-10-10-11-48-22.jpg'),
(9,'dolo',4,1,'/media/2024-10-10-11-48-22.jpg'),
(10,'aaaa',3,15,'/media/2024-10-26-18-39-48.jpg');

/*Table structure for table `app_pharmacy` */

DROP TABLE IF EXISTS `app_pharmacy`;

CREATE TABLE `app_pharmacy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Place` varchar(40) NOT NULL,
  `Post` varchar(40) NOT NULL,
  `Pincode` int NOT NULL,
  `Phone_no` bigint NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Latitude` varchar(20) NOT NULL,
  `Longitude` varchar(20) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `Image` varchar(100) NOT NULL,
  `status` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_pharmacy_LOGIN_id_7f259df4_fk_app_login_id` (`LOGIN_id`),
  CONSTRAINT `app_pharmacy_LOGIN_id_7f259df4_fk_app_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_pharmacy` */

insert  into `app_pharmacy`(`id`,`Name`,`Place`,`Post`,`Pincode`,`Phone_no`,`Email`,`Latitude`,`Longitude`,`LOGIN_id`,`Image`,`status`) values 
(1,'medshops','mukkams','mukkamsssss',673602,9946899755,'jjp2@gmail.com','33.43','21.45',2,'featur-1.jpg','blocked'),
(4,'jj pharmacy','calicut','calicut',674321,9876543210,'jjp@gmail.com','','',5,'featur-1.jpg.jpg','1'),
(6,'medcure','calicut','calicut',674321,9876543210,'ffah12@gmail.com','','',9,'—Pngtree—colorfull geometric shape background_15488863.png','blocked'),
(9,'medicare','areekode','areekode',674321,9876543210,'jjp33@gmail.com','','',12,'alexander-grey-tr1po6kOWEc-unsplash.jpg','pending'),
(10,'medcuity','calicut','calicut',763615,1234567098,'asd@gmail.com','','',13,'pexels-pixabay-208518.jpg','pending'),
(11,'neethi','areekode','areekode',670695,1234567098,'neethi@gmail.com','','',14,'christine-sandu-jwWtZrm67VI-unsplash.jpg','pending'),
(12,'medicure','calicut','calicut',670695,7623456709,'asddd@gmail.com','','',15,'alexander-grey-tr1po6kOWEc-unsplash_oHt0dwh.jpg','pending'),
(13,'Naveens','kkm','kkm',654321,9876543210,'naveen@gmail.com','','',16,'pexels-shvetsa-3786128.jpg','pending'),
(14,'Naveenss','kkmm','kkmm',654321,9876543210,'naveentj@gmail.com','','',17,'pexels-shvetsa-3786128_yQB8YsI.jpg','pending'),
(15,'lkhjlkj','klhjlkjkl','klhklhkljh',654321,9876543210,'nmbmnbmnb@hgjhg.kjhkjgh','11.349001744923386','75.92001909581333',18,'alexander-grey-tr1po6kOWEc-unsplash_N0jcdbN.jpg','pending');

/*Table structure for table `app_stock` */

DROP TABLE IF EXISTS `app_stock`;

CREATE TABLE `app_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Batch_no` varchar(50) NOT NULL,
  `Dosage` varchar(20) NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL,
  `MEDICINE_NAME_id` bigint NOT NULL,
  `description` varchar(2000) NOT NULL,
  `expire` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stock_MEDICINE_NAME_id_2883291f_fk_app_medicine_id` (`MEDICINE_NAME_id`),
  CONSTRAINT `app_stock_MEDICINE_NAME_id_2883291f_fk_app_medicine_id` FOREIGN KEY (`MEDICINE_NAME_id`) REFERENCES `app_medicine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `app_stock` */

insert  into `app_stock`(`id`,`Batch_no`,`Dosage`,`Quantity`,`Price`,`MEDICINE_NAME_id`,`description`,`expire`) values 
(2,'567','750',207,100,3,'1','1'),
(3,'ghl','tuy',456,3464,3,'1','1'),
(7,'ddfd','fdfd',8,97,4,'ew1e','2024-10-12'),
(8,'ARWA','750',2,1355,7,'EEWQ','2024-10-01'),
(10,'ghl9','500',1,546,5,'gh','2024-10-17'),
(11,'ghl','750',1,645,6,'jhfktryj','2024-10-11'),
(13,'a12','750',2,2543,8,'hfj','2024-10-24'),
(14,'a12','750',2,67,9,'fdh','2024-10-12'),
(15,'a12','500',33,32,10,'wqeww','2024-10-31');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add medicine',9,'add_medicine'),
(34,'Can change medicine',9,'change_medicine'),
(35,'Can delete medicine',9,'delete_medicine'),
(36,'Can view medicine',9,'view_medicine'),
(37,'Can add ingredients',10,'add_ingredients'),
(38,'Can change ingredients',10,'change_ingredients'),
(39,'Can delete ingredients',10,'delete_ingredients'),
(40,'Can view ingredients',10,'view_ingredients'),
(41,'Can add pharmacy',11,'add_pharmacy'),
(42,'Can change pharmacy',11,'change_pharmacy'),
(43,'Can delete pharmacy',11,'delete_pharmacy'),
(44,'Can view pharmacy',11,'view_pharmacy'),
(45,'Can add feedback',12,'add_feedback'),
(46,'Can change feedback',12,'change_feedback'),
(47,'Can delete feedback',12,'delete_feedback'),
(48,'Can view feedback',12,'view_feedback'),
(49,'Can add bill',13,'add_bill'),
(50,'Can change bill',13,'change_bill'),
(51,'Can delete bill',13,'delete_bill'),
(52,'Can view bill',13,'view_bill'),
(53,'Can add stock',14,'add_stock'),
(54,'Can change stock',14,'change_stock'),
(55,'Can delete stock',14,'delete_stock'),
(56,'Can view stock',14,'view_stock'),
(57,'Can add bill_ sub',15,'add_bill_sub'),
(58,'Can change bill_ sub',15,'change_bill_sub'),
(59,'Can delete bill_ sub',15,'delete_bill_sub'),
(60,'Can view bill_ sub',15,'view_bill_sub');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(13,'app','bill'),
(15,'app','bill_sub'),
(7,'app','category'),
(12,'app','feedback'),
(10,'app','ingredients'),
(8,'app','login'),
(9,'app','medicine'),
(11,'app','pharmacy'),
(14,'app','stock'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-08-26 11:45:08.862320'),
(2,'auth','0001_initial','2024-08-26 11:45:09.908254'),
(3,'admin','0001_initial','2024-08-26 11:45:10.106294'),
(4,'admin','0002_logentry_remove_auto_add','2024-08-26 11:45:10.113668'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-08-26 11:45:10.145695'),
(6,'app','0001_initial','2024-08-26 11:45:11.086852'),
(7,'contenttypes','0002_remove_content_type_name','2024-08-26 11:45:11.324247'),
(8,'auth','0002_alter_permission_name_max_length','2024-08-26 11:45:11.472356'),
(9,'auth','0003_alter_user_email_max_length','2024-08-26 11:45:11.543707'),
(10,'auth','0004_alter_user_username_opts','2024-08-26 11:45:11.571736'),
(11,'auth','0005_alter_user_last_login_null','2024-08-26 11:45:11.713097'),
(12,'auth','0006_require_contenttypes_0002','2024-08-26 11:45:11.726683'),
(13,'auth','0007_alter_validators_add_error_messages','2024-08-26 11:45:11.752887'),
(14,'auth','0008_alter_user_username_max_length','2024-08-26 11:45:11.904559'),
(15,'auth','0009_alter_user_last_name_max_length','2024-08-26 11:45:12.051581'),
(16,'auth','0010_alter_group_name_max_length','2024-08-26 11:45:12.077634'),
(17,'auth','0011_update_proxy_permissions','2024-08-26 11:45:12.097726'),
(18,'auth','0012_alter_user_first_name_max_length','2024-08-26 11:45:12.187157'),
(19,'sessions','0001_initial','2024-08-26 11:45:12.247928'),
(20,'app','0002_pharmacy_image','2024-08-28 11:30:57.737465'),
(21,'app','0003_alter_pharmacy_email','2024-09-29 08:52:49.787647'),
(22,'app','0004_medicine_image','2024-10-04 10:41:03.152476'),
(23,'app','0005_stock_description_stock_expire','2024-10-04 10:54:20.076940'),
(24,'app','0006_pharmacy_status','2024-10-04 11:27:51.262425');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('3wz2zdeof4y5h0biufyhtds0i46guekh','eyJsaWQiOjEsIm1pZCI6IjciLCJzaWQiOiI4In0:1syRx3:C7y0itdm14l-y2JtukJ6CqGSu2vLgibNPTJd9uBUjU8','2024-10-23 08:21:45.074063'),
('9bhf9qvtcn7tc12s5mjbjqxc35or0scl','eyJsaWQiOjIsIm1pZCI6IjQiLCJzaWQiOiIyIn0:1swfIW:SOk5Jl41uTmaEbVAil-m7LiY2w8ML5wGjIWAyGzJRl4','2024-10-18 10:12:32.596510'),
('e57hos8an5acur29bnwypunu993ujh0a','.eJyrVirOVrJSUtJRyslMUbIytNBRygUxlAwNgGLFYKY5kFUAljWtBQAq0Awg:1t4gYT:uXBtk7pFjSdgIs4dzEyEDSmDdJukYmeS-Vw_KVlnAdE','2024-11-09 13:10:09.645352'),
('k7yxa8anhyfrs6k0m2534crkbwssqck3','eyJsaWQiOjIsIm1pZCI6IjciLCJzaWQiOiIxNCIsInNrIjoiciJ9:1szCov:n2ZF2LzhqPOYNMVs3k9TG_OCU7RwRKgdINMWarb0J7o','2024-10-25 10:24:29.295804');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
