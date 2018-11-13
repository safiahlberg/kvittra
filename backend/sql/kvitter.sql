-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 13, 2018 at 09:02 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `k_category`
--

TRUNCATE TABLE `k_category`;
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

--
-- Truncate table before insert `k_reciept`
--

TRUNCATE TABLE `k_reciept`;
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

--
-- Truncate table before insert `k_reciept_img`
--

TRUNCATE TABLE `k_reciept_img`;
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

--
-- Truncate table before insert `k_reciept_tag`
--

TRUNCATE TABLE `k_reciept_tag`;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
