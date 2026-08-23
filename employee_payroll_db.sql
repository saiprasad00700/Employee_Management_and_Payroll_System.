-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_payroll_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL,
  `emp_id` int DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1001,'2026-08-01','Present'),(2,1002,'2026-08-01','Present'),(3,1003,'2026-08-01','Absent'),(4,1004,'2026-08-01','Present'),(5,1005,'2026-08-01','Present'),(6,1001,'2026-08-02','Present'),(7,1002,'2026-08-02','Absent'),(8,1003,'2026-08-02','Present'),(9,1004,'2026-08-02','Present'),(10,1005,'2026-08-02','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (101,'HR'),(102,'IT'),(103,'Finance'),(104,'Data Science');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job_role` varchar(50) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1001,'Rahul Sharma','Male','9876543210','rahul@gmail.com','Software Engineer','2026-01-10',50000.00,102),(1002,'Priya Reddy','Female','9876543211','priya@gmail.com','HR Executive','2026-02-15',35000.00,101),(1003,'Arjun Kumar','Male','9876543212','arjun@gmail.com','Data Analyst','2026-03-20',45000.00,104),(1004,'Sneha Rao','Female','9876543213','sneha@gmail.com','Accountant','2026-01-05',40000.00,103),(1005,'Vikram Patel','Male','9876543214','vikram@gmail.com','ML Engineer','2026-04-01',60000.00,104);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `payroll_id` int NOT NULL,
  `emp_id` int DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `basic` decimal(10,2) DEFAULT NULL,
  `hra` decimal(10,2) DEFAULT NULL,
  `da` decimal(10,2) DEFAULT NULL,
  `pf` decimal(10,2) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payroll_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,1001,'August',50000.00,10000.00,5000.00,6000.00,59000.00),(2,1002,'August',35000.00,7000.00,3500.00,4200.00,41300.00),(3,1003,'August',45000.00,9000.00,4500.00,5400.00,53100.00),(4,1004,'August',40000.00,8000.00,4000.00,4800.00,47200.00),(5,1005,'August',60000.00,12000.00,6000.00,7200.00,70800.00),(6,1003,'september',45000.00,9000.00,4500.00,5400.00,53100.00);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'employee_payroll_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-23 23:41:18
