-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2018 at 02:28 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kvitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `k_category`
--

DROP TABLE IF EXISTS `k_category`;
CREATE TABLE IF NOT EXISTS `k_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `k_category`
--

INSERT INTO `k_category` (`id`, `name`, `uuid`) VALUES
(1, 'Villan', '1accc2445ffe'),
(2, 'Villan2', '1accc2445cce');

-- --------------------------------------------------------

--
-- Table structure for table `k_reciept`
--

DROP TABLE IF EXISTS `k_reciept`;
CREATE TABLE IF NOT EXISTS `k_reciept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `k_reciept_img`
--

DROP TABLE IF EXISTS `k_reciept_img`;
CREATE TABLE IF NOT EXISTS `k_reciept_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL,
  `receipt_id` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `k_reciept_tag`
--

DROP TABLE IF EXISTS `k_reciept_tag`;
CREATE TABLE IF NOT EXISTS `k_reciept_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reciept_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `color` varchar(7) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `k_router`
--

DROP TABLE IF EXISTS `k_router`;
CREATE TABLE IF NOT EXISTS `k_router` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(128) NOT NULL,
  `href` varchar(64) NOT NULL,
  `privilege` int(11) NOT NULL DEFAULT '0',
  `auto` varchar(64) DEFAULT NULL,
  `signature` varchar(64) NOT NULL DEFAULT '/.*/',
  `service` varchar(64) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `k_router`
--

INSERT INTO `k_router` (`id`, `request`, `href`, `privilege`, `auto`, `signature`, `service`) VALUES
(1, 'kvitter/home', 'pages/home.php', 0, NULL, '/kvitter\\/home((\\/\\w+)+|\\/?)$.*/', NULL),
(2, 'kvitter/categories', 'backend/controller/category.php', 0, 'CategoryController', '/kvitter\\/category((\\/\\w+)+|\\/?)$.*/', NULL),
(3, 'kvitter/reciepts', 'pages/reciepts.php', 0, NULL, '/kvitter\\/reciepts/', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
