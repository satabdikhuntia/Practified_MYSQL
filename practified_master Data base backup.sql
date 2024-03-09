/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.19 : Database - practified_master
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`practified_master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `practified_master`;

/*Table structure for table `certifications` */

DROP TABLE IF EXISTS `certifications`;

CREATE TABLE `certifications` (
  `certification_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `certification_name` varchar(255) NOT NULL,
  `certification_level` varchar(50) DEFAULT NULL,
  `certification_duration` int DEFAULT NULL,
  `certification_description` text,
  PRIMARY KEY (`certification_id`),
  UNIQUE KEY `unique_certification` (`certification_name`),
  KEY `fk_course_id` (`course_id`),
  CONSTRAINT `fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `certifications` */

insert  into `certifications`(`certification_id`,`course_id`,`certification_name`,`certification_level`,`certification_duration`,`certification_description`) values 
(1,1,'AWS Certified Solutions Architect – Associate','Foundational Level',1,'AWS Certified Solutions Architect – Associate'),
(2,1,'AWS Certified Developer – Associate','Associate Level',2,'AWS Certified Developer – Associate'),
(3,1,'AWS Certified SysOps Administrator – Associate','Professional Level',1,'AWS Certified SysOps Administrator – Associate'),
(4,1,'AWS Certified Solutions Architect – Professional, certification','Professional Level',1,'AWS Certified Solutions Architect – Professional, certification'),
(5,2,'Microsoft Certified: Azure Fundamentals','Foundational Level',2,'Microsoft Certified: Azure Fundamentals'),
(6,2,'Microsoft Certified: Azure Administrator Associate','Associate Level',1,'Microsoft Certified: Azure Administrator Associate'),
(7,2,'Microsoft Certified: Azure Developer Associate','Associate Level',2,'Microsoft Certified: Azure Developer Associate'),
(8,3,'Associate Cloud Engineer Certification','Associate Level',3,'Associate Cloud Engineer Certification'),
(9,3,'Professional Cloud Architect Certification','Associate Level',1,'Professional Cloud Architect Certification'),
(10,3,'Google Cloud Certified - Cloud Developer','Associate Level',2,'Google Cloud Certified - Cloud Developer');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_description` text,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `unique_course` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `courses` */

insert  into `courses`(`course_id`,`course_name`,`course_description`) values 
(1,'Amazon Web Services (AWS)','Amazon Web Services (AWS) is a comprehensive and widely adopted cloud computing platform, offering a vast array of scalable and on-demand services for computing power, storage, databases, machine learning, analytics, and more.'),
(2,'Microsoft Azure','Microsoft Azure is a versatile cloud computing platform providing a diverse set of services, including virtual computing, storage, databases, AI, and analytics, fostering innovation and scalability for businesses and developers.'),
(3,'Google Cloud Platform (GCP)','Google Cloud Platform (GCP) is a robust and flexible cloud computing suite, offering services for computing, storage, databases, machine learning, and data analytics, empowering organizations with scalable and advanced cloud solutions.'),
(4,'IBM Cloud Professional Certification','The IBM Cloud Professional Certification validates expertise in deploying, managing, and optimizing IBM Cloud solutions, demonstrating proficiency in leveraging advanced cloud technologies for business innovation and efficiency.');

/*Table structure for table `discussions` */

DROP TABLE IF EXISTS `discussions`;

CREATE TABLE `discussions` (
  `discussion_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message_text` text NOT NULL,
  `parent_message_id` text,
  `likes` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discussion_id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `discussions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `discussions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `discussions` */

insert  into `discussions`(`discussion_id`,`question_id`,`user_id`,`message_text`,`parent_message_id`,`likes`,`created_at`) values 
(1,1,1,'what is primary function in aure',NULL,NULL,'2024-03-09 10:49:49'),
(2,1,2,' it is a Virtual Machine Deployment','1',NULL,'2024-03-09 10:49:49'),
(3,1,2,' it is a Virtual Machine Deployment',NULL,NULL,'2024-03-09 10:49:49');

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `correct_option_description` text,
  PRIMARY KEY (`option_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `options` */

insert  into `options`(`option_id`,`question_id`,`option_text`,`is_correct`,`correct_option_description`) values 
(1,1,'Virtual Machine Deployment',1,'This is the reason why its correct'),
(2,1,'Object Storage',0,NULL),
(3,1,'Relational Database Service',0,NULL),
(4,1,'Content Delivery Network',0,NULL),
(5,2,'Amazon RDS',1,'This is the reason why its correct'),
(6,2,'Amazon DynamoDB',0,NULL),
(7,2,'Amazon Redshift',0,NULL),
(8,2,'Amazon Elasticache',0,NULL),
(9,3,'Scalable Object STORAGE',0,NULL),
(10,3,'Serverless Computing',1,'This is the reason why its correct'),
(11,3,'Network ISOLATION AND Connectivity',0,NULL),
(12,3,'Relational DATABASE Service',0,NULL),
(13,4,'Azure BLOB STORAGE',0,NULL),
(14,4,'Azure DATA Factory',1,'This is the reason why its correct'),
(15,4,'Azure Synapse Analytics (formerly SQL DATA Warehouse)',0,NULL),
(16,4,'Azure TABLE STORAGE',0,NULL),
(17,5,'Serverless Computing',0,NULL),
(18,5,'Object STORAGE',1,'This is the reason why its correct'),
(19,5,'Relational DATABASE Service',0,NULL),
(20,5,'Content Delivery Network',0,NULL),
(21,6,'BigQuery',0,NULL),
(22,6,'Cloud SQL',1,'This is the reason why its correct'),
(23,6,'Cloud Firestore',0,NULL),
(24,6,'Cloud Bigtable',0,NULL);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `certification_id` int DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_id` int NOT NULL AUTO_INCREMENT,
  `isMulti_select` tinyint(1) NOT NULL DEFAULT '0',
  `difficulty_level` text,
  PRIMARY KEY (`question_id`),
  KEY `fk_certification_id` (`certification_id`),
  CONSTRAINT `fk_certification_id` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`certification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `questions` */

insert  into `questions`(`certification_id`,`question_text`,`question_id`,`isMulti_select`,`difficulty_level`) values 
(1,'What is the primary function of Amazon S3?',1,0,NULL),
(1,'Which AWS service provides a fully managed NoSQL database service?',2,0,NULL),
(2,'What is the primary purpose of Azure Virtual Network?',3,0,NULL),
(2,'Which Azure service is designed for real-time analytics and big data processing?',4,0,NULL),
(3,'What is the primary purpose of Google Cloud Storage?',5,0,NULL),
(3,'Which Google Cloud service is designed for scalable and fully managed NoSQL database solutions?',6,0,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `extra_info` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`email`,`password`,`extra_info`,`isAdmin`,`created_at`) values 
(1,'admin','satabdikhuntia123@gmail.com','admin',NULL,1,'2024-03-03 19:52:50'),
(2,'Anita','anita@gmail.com','admin',NULL,1,'2024-03-09 10:33:52');

/* Procedure structure for procedure `GetDiscussions` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetDiscussions` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDiscussions`(IN questionId int)
BEGIN

    SELECT
        que.question_id as questionId,
        que.question_text as questionDescription,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'discussionId', r.discussion_id,
                'userId', r.user_id,
                'replyText', r.message_text,
                'commentedTime', r.created_at,
                'replies', (
                    SELECT
                        JSON_ARRAYAGG(
                            JSON_OBJECT(
                                'discussionId', d.discussion_id,
                                'userId', d.user_id,
                                'replyText', d.message_text,
                                'commentedTime', d.created_at,
                                'parentReplyId', d.parent_message_id
                            )
                        )
                    FROM
                        Discussions d
                    WHERE
                        d.parent_message_id = r.discussion_id
                )
            )
        ) AS replies
    FROM
        questions que
    LEFT JOIN Discussions r ON 
    que.question_id = r.question_id AND r.parent_message_id IS NULL 
    where que.question_id = questionId
    GROUP BY
        que.question_id, que.question_text
    ORDER BY
        que.question_id DESC;        
END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_GetQuestionsWithOptions` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_GetQuestionsWithOptions` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GetQuestionsWithOptions`()
SELECT
        q.question_id,
        q.question_text,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'option_id', o.option_id,
                'option_text', o.option_text,
                'is_correct', o.is_correct,
                'explanation', o.correct_option_description
            )
        ) AS options
    FROM
        questions q
    LEFT JOIN
        options o ON q.question_id = o.question_id
    GROUP BY
        q.question_id, q.question_text */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
