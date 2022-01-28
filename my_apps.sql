-- phpMyAdmin SQL Dump
-- version 5.1.2-dev+20220120.2a906047e0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 28, 2022 at 09:59 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_apps`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stts` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mas_token`
--

DROP TABLE IF EXISTS `mas_token`;
CREATE TABLE IF NOT EXISTS `mas_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `token_app` text COLLATE utf8mb4_general_ci,
  `firebase` text COLLATE utf8mb4_general_ci,
  `create` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mas_users`
--

DROP TABLE IF EXISTS `mas_users`;
CREATE TABLE IF NOT EXISTS `mas_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `alamat` text COLLATE utf8mb4_general_ci,
  `role` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `stts` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mas_users`
--

INSERT INTO `mas_users` (`id`, `email`, `username`, `phone`, `name`, `password`, `alamat`, `role`, `is_active`, `stts`) VALUES
(10, 'ringga@gmail.com', 'ringga', '082212', 'ringga septia pribadi', '$2b$10$oNdfOiyEo51/661LQZEGZeESeY3zfULoxym4dIyOjOOs06.O79gZ6', 'batam', 1, 0, 0),
(9, 'ringga@gmail.com', 'ringga', '082212', 'ringga septia pribadi', '$2b$10$J5zm2GlywmJsXAbNzidYxel7qwUOr/xF77OvDZKyErKcs567j20Ie', 'batam', 1, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
