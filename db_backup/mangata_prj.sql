-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 11, 2019 at 03:27 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mangata_prj`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street_number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `street_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street_number`, `street_name`, `city`, `province`, `country`, `postal_code`, `create_date`, `update_date`) VALUES
(1, '22', 'abc', 'Windsor', 'ON', 'Canada', '485GhY', '2019-07-30 21:23:57', '2019-07-30 21:23:57'),
(2, '23', 'abc', 'Windsor', 'ON', 'Canada', '92JhQ', '2019-07-30 21:24:24', '2019-07-30 21:24:24'),
(3, '20', 'tef', 'Chatham', 'ON', 'Canada', 'xyx7w', '2019-08-03 17:42:48', '2019-08-03 17:42:48'),
(4, '45', 'King Street', 'Windsor', 'ON', 'Canada', 'kl98JG', '2019-08-03 19:06:30', '2019-08-03 19:06:30'),
(5, '2', 'falcom', 'Windsor', 'ON', 'Canada', 'LJGS09', '2019-08-03 19:07:05', '2019-08-03 19:07:05'),
(6, '6', 'jette', 'Windsor', 'ON', 'Canada', 'Ljha8a', '2019-08-03 19:11:38', '2019-08-03 19:11:38'),
(16, '11', '1797', 'WINDSOR', 'Ontario', 'Canada', 'N9B 3H6', '2019-08-09 08:53:24', '2019-08-09 08:53:24'),
(17, '11', '1797', 'WINDSOR', 'Ontario', 'Canada', 'N9B 3H6', '2019-08-09 08:54:10', '2019-08-09 08:54:10'),
(18, '1797', '1797', 'WINDSOR', 'Ontario', 'Canada', 'N9B 3H6', '2019-08-09 08:55:08', '2019-08-09 08:55:08'),
(19, '22', 'abc', 'Windsor', 'ON', 'Canada', '485GhY', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(20, '23', 'abc', 'Toronto', 'ON', 'Canada', '92JhQ', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(21, '20', 'tef', 'Chatham', 'ON', 'Canada', 'xyx7w', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(22, '45', 'King Street', 'Toronto', 'ON', 'Canada', 'kl98JG', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(23, '2', 'falcom', 'Toronto', 'ON', 'Canada', 'LJGS09', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(24, '6', 'jette', 'Windsor', 'ON', 'Canada', 'Ljha8a', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(25, '12', 'highrise', 'Toronto', 'ON', 'Canada', '89Lh7', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(26, '98', 'JJINGLU', 'Markham', 'ON', 'Canada', '98L96Q', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(27, '32', 'kingnite', 'Markham', 'ON', 'Canada', 'N0839h', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(28, '29', 'chefli', 'Toronto', 'ON', 'Canada', 'mshs90', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(29, '67', 'gillo', 'Toronto', 'ON', 'Canada', 'Nidh9', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(30, '50', 'westno', 'Brampton', 'ON', 'Canada', '9383jh', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(31, '45', 'jetnu', 'Brampton', 'ON', 'Canada', '92734g', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(32, '23', 'ksahjs', 'Brampton', 'ON', 'Canada', 'K9shw8', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(33, '79', 'kahs', 'Toronto', 'ON', 'Canada', '9w373', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(34, '12', 'defg', 'Markham', 'ON', 'Canada', 'KSHD8', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(35, '34', 'JELNB', 'Toronto', 'ON', 'Canada', '8K910', '2019-08-09 11:21:50', '2019-08-09 11:21:50'),
(36, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:49:01', '2019-08-09 15:49:01'),
(37, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:51:20', '2019-08-09 15:51:20'),
(38, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:52:01', '2019-08-09 15:52:01'),
(39, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:52:29', '2019-08-09 15:52:29'),
(40, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:53:42', '2019-08-09 15:53:42'),
(41, 'sd', 'sadsa', 'sadas', 'asdasd', 'asdasd', 'asdasd', '2019-08-09 15:54:04', '2019-08-09 15:54:04'),
(42, '285', '285 Queen St E', 'Brampton', 'ON', 'Canada', 'L6W 2C2', '2019-08-09 16:02:14', '2019-08-09 16:02:14'),
(43, '285', 'Queen St E', 'Brampton', 'ON', 'Canada', 'L6W 2C2', '2019-08-09 16:08:23', '2019-08-09 16:08:23'),
(44, '111', 'Queen St E', 'Windsor', 'ON', 'Canada', 'K2J3R8', '2019-08-09 16:09:50', '2019-08-09 16:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `business_type`
--

CREATE TABLE `business_type` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_type`
--

INSERT INTO `business_type` (`id`, `name`, `description`) VALUES
(1, 'Finance', 'Financial services'),
(2, 'Technology', 'Software Firm'),
(3, 'Manufacturing', 'Manufacturing companies'),
(4, 'Finance', 'Financial services'),
(5, 'Technology', 'Software Firm'),
(6, 'Manufacturing', 'Manufacturing companies'),
(7, 'Transport or logistics', 'Trade and transport or re'),
(8, 'Health', 'health and related servic');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `recent_session_id` int(11) NOT NULL,
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `name`, `address_id`, `email`, `phone`, `recent_session_id`, `user_name`, `password`, `is_active`, `create_date`, `update_date`) VALUES
(1, 'Jhon verdosa', 3, 'John.verdosa@abcemail.com', '7835933321', 1, 'John.verdosa@abcemail.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-03 17:54:31', '2019-08-03 17:54:31'),
(2, 'Emily nodes', 1, 'emily@tuemail.com', '9836292721', 1, 'emily@tuemail.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-03 17:59:52', '2019-08-03 17:59:52'),
(8, 'test user1', 16, 'test1@abc.com', '(647) 111-2222', 35, 'test1@abc.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-09 08:53:24', '2019-08-09 08:53:24'),
(9, 'test user1', 17, 'test12@abc.com', '(647) 111-2222', 36, 'test12@abc.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-09 08:54:10', '2019-08-09 08:54:10'),
(10, 'test3@abc.com', 18, 'test3@abc.com', '(647) 111-2222', 37, 'test3@abc.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-09 08:55:08', '2019-08-09 08:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_education`
--

CREATE TABLE `candidate_education` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `college` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `is_graduate` tinyint(1) NOT NULL DEFAULT 1,
  `candidate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_education`
--

INSERT INTO `candidate_education` (`id`, `name`, `description`, `college`, `is_graduate`, `candidate_id`) VALUES
(1, 'BCS(h)', 'Computer Science applied computing ', 'Waterloo University', 1, 2),
(2, 'Master in Computer Science', 'thesis in cs ', 'University of Windsor', 1, 1),
(3, 'BCS(h)', 'Computer Science applied computing ', 'Waterloo University', 1, 2),
(4, 'Master in Computer Science', 'thesis in cs ', 'University of Windsor', 1, 1),
(12, 'Bachelor', 'Business', 'St.Clair College', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_experience`
--

CREATE TABLE `candidate_experience` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_years` int(11) NOT NULL,
  `company_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor_email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `use_as_reference` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_experience`
--

INSERT INTO `candidate_experience` (`id`, `candidate_id`, `name`, `description`, `no_of_years`, `company_name`, `company_address`, `supervisor_name`, `supervisor_phone`, `supervisor_email`, `use_as_reference`) VALUES
(1, 2, 'Jr. Software engineer', 'Designs and develops interactive web technology in an agile, cloud-based software environment.', 3, 'shamul', '67 gerrad windsor ontario', 'kilpoo', '98372029', 'kilpoo@shamul.com', 1),
(2, 1, 'Software engineer', 'JavaScript Babel Typescript HTML SAAS Redux', 5, 'kjol.ltd', '98 hubino Toronto ontario', 'killom', '983720759', 'killom@ui.com', 1),
(3, 2, 'Jr. Software engineer', 'Designs and develops interactive web technology in an agile, cloud-based software environment.', 3, 'shamul', '67 gerrad windsor ontario', 'kilpoo', '98372029', 'kilpoo@shamul.com', 1),
(4, 1, 'Software engineer', 'JavaScript Babel Typescript HTML SAAS Redux', 5, 'kjol.ltd', '98 hubino Toronto ontario', 'killom', '983720759', 'killom@ui.com', 1),
(9, 10, 'sadas', 'asdas', 3, 'sadasd', '0', 'asdas', '(905) 453-5818', 'abc@gmail.com', 1),
(11, 10, 'QA manager', 'testing', 2, 'abc solution', '44', 'testing', '(111) 111-1111', 'test@gm.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_skill`
--

CREATE TABLE `candidate_skill` (
  `candidate_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_skill`
--

INSERT INTO `candidate_skill` (`candidate_id`, `skill_id`, `id`) VALUES
(2, 1, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `type_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `address_id`, `email`, `phone`, `create_date`, `update_date`, `type_id`, `is_active`) VALUES
(1, 'Abc Consulting', 1, 'abc@abcconsulting.com', '5191111111', '2019-07-30 21:27:32', '2019-07-30 21:27:32', 2, 1),
(2, 'Sanito.ltd', 2, 'Sanito@sd.org', '983747393', '2019-08-03 18:38:22', '2019-08-03 18:38:22', 3, 1),
(3, 'Techsolm', 6, 'Techsolm@wind.org', '098734383', '2019-08-03 19:12:43', '2019-08-03 19:12:43', 2, 1),
(4, 'Yunicom', 5, 'Yunicom@wind.org', '038363532', '2019-08-03 19:13:22', '2019-08-03 19:13:22', 3, 1),
(29, 'freshpic', 3, 'freshpic@org.com', '(519) 534-64322', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(30, 'BLI Bank', 4, 'BLI.bank@org.com', '(519) 244-6965', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 1, 1),
(31, 'GCD group', 16, 'Gcdgroup@co.g', '(519) 346-5855', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 5, 1),
(32, 'helloBg', 17, 'Bghello@org.ca', '(519) 463-9286', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(33, 'techsmni', 18, 'techsmini@org.ca', '(519) 125-4333', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 2, 1),
(34, 'yessure', 19, 'yessure@org.ca', '(519) 236-7582', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 1, 1),
(35, 'KlO.ltd', 20, 'KlO@org.ca', '(519) 3627-6433', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 1, 1),
(36, 'JwN.co', 21, 'Jwn@org.co', '(519) 464-7683', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(37, 'KellyPacking', 22, 'kellypacking@org.ca', '(519) 46632496', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(38, 'fennet', 23, 'fennet@org.ca', '(519) 73532826', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(39, 'ulli.ltd', 26, 'ulli@org.ca', '(519) 335-68432', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 3, 1),
(40, 'LeoGen', 27, 'leoGen', '(519) 753-42987', '2019-08-09 11:35:08', '2019-08-09 11:35:08', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_reviews`
--

CREATE TABLE `company_reviews` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `reviews` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_reviews`
--

INSERT INTO `company_reviews` (`id`, `company_id`, `reviews`, `rating`) VALUES
(1, 1, 'Great company to work in. Good supervisor. Also get good bonus as company is progressing very fast', 4.5),
(2, 2, 'Excellent work environment. Gained lot of experience.', 5),
(3, 1, 'low pay scale.', 2),
(4, 1, 'Great company to work in. Good supervisor. Also get good bonus as company is progressing very fast', 4.5),
(5, 2, 'Excellent work environment. Gained lot of experience.', 5),
(6, 1, 'low pay scale.', 2),
(7, 1, 'sdfgsdf', 3),
(8, 2, 'dasf', 1),
(9, 1, 'fghfg', 0),
(10, 1, 'fdgdf', 0),
(11, 1, 'fdgd', 3),
(12, 3, 'dfd', 3),
(13, 4, 'xcazxc', 2),
(14, 4, 'test revirew', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employer_user`
--

CREATE TABLE `employer_user` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `recent_session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employer_user`
--

INSERT INTO `employer_user` (`id`, `name`, `company_id`, `create_date`, `update_date`, `user_name`, `password`, `is_active`, `recent_session_id`) VALUES
(1, 'Anudeep Mangat', 1, '2019-07-30 21:31:31', '2019-07-30 21:31:31', 'amangat@abc.consult.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 48),
(2, 'Aria', 2, '2019-08-03 18:41:08', '2019-08-03 18:41:08', 'Aria@sanito.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 5),
(19, 'Techsolm', 3, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'shamil_Techsolm', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(20, 'nitin_Yunicom', 4, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'nitin@Yunicom.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(21, 'Sehaj_Bli ', 30, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'Sehaj@blibank.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(22, 'alice', 29, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'alice@freshpic.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(23, 'mike', 30, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'mike@gcd.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(24, 'channel', 36, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'channel@hellobg.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(25, 'tom', 37, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'tom@jwn.co', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(26, 'teena', 38, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'teena@yessure.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(27, 'linda', 35, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'linda@kio.ltd', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(28, 'Jinny', 37, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'jinny@kellypacking.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(29, 'tony', 37, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'tony_fennet@org.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(30, 'vijay', 37, '2019-08-09 11:43:32', '2019-08-09 11:43:32', 'vijay@techsmini.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(31, 'test user sign up', 1, '2019-08-10 18:48:46', '2019-08-10 18:48:46', 'test_user@abc.consult.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(32, 'test user', 1, '2019-08-10 18:49:09', '2019-08-10 18:49:09', 'test@abc.consult.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_candidate`
--

CREATE TABLE `job_candidate` (
  `job_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `applied_date` datetime NOT NULL DEFAULT current_timestamp(),
  `resume` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_candidate`
--

INSERT INTO `job_candidate` (`job_id`, `candidate_id`, `id`, `applied_date`, `resume`) VALUES
(7, 10, 2, '2019-08-10 13:31:55', 0x7469636b65742e646f63),
(7, 10, 3, '2019-08-10 13:40:05', 0x726576696577732e68746d6c),
(2, 10, 5, '2019-08-10 16:10:15', 0x6d61696e2e68746d6c);

-- --------------------------------------------------------

--
-- Table structure for table `job_location`
--

CREATE TABLE `job_location` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_location`
--

INSERT INTO `job_location` (`id`, `name`) VALUES
(1, 'Windsor,ON'),
(2, 'Toronto,ON'),
(3, 'Ottawa,ON'),
(4, 'Calgary,AB'),
(5, 'Edmonton,AB'),
(6, 'Vancouver,BC'),
(7, 'Burnaby,BC'),
(8, 'Victoria,BC'),
(9, 'Winnipeg,MB'),
(10, 'Saskatoon,Saskatchewan'),
(11, 'Regina,Saskatchewan'),
(12, 'Fredericton,NB'),
(13, 'St. John, NFL');

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `salary_range_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `job_type_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_post`
--

INSERT INTO `job_post` (`id`, `title`, `description`, `user_id`, `salary_range_id`, `create_date`, `update_date`, `is_active`, `job_type_id`, `address_id`) VALUES
(1, 'Software Engineer', 'Our goal is to become the most recognized and trusted global engineering partner for our customers—Fortune 500 companies in the Aerospace, Medical Devices, Oil & Gas, Power, and Transportation industries. We know we can find solutions to their most important technical and business challenges they encounter. We aren’t consultants. We help them make their products the most competitive in the world and that’s how we’ve grown to over 11,000 problem solvers from 50 centers around the world. We aspire to be a 100-year company, which doesn’t mean staid and boring, but rather, we evolve and adapt to create the frontier of the engineering services industry.', 1, 1, '2019-08-06 22:07:13', '2019-08-06 22:07:13', 1, 1, 1),
(2, 'Data Analyst', 'ob Functions\r\n\r\nPrepares variety of computer programs, associated documentation and design specifications, including logical system design diagrams.\r\nAssists in conducting detailed analysis of defined system specifications and developing methods for problem solving\r\nConverts symbolic statements of work processes to detailed design and coding into program language\r\nAssists in developing detailed programs and design, produces diagrams indicating mathematical computations, sequence data, and solutions. Additionally, the individual is involved with test and system integration (unit and/or software integration) of programs\r\nProvide development support for designated SharePoint and ASP sites utilizing out of box web parts and custom HTML/C++/JavaScript when necessary\r\nWork with functional leaders and Business Unit leaders on setting up sites\r\nWork with user community to trouble shoot technical issues\r\nWork with IT to communicate issues and help with solutions', 1, 2, '2019-08-06 22:07:59', '2019-08-06 22:07:59', 1, 1, 2),
(4, 'test engineer1', 'dsgffdsfgdfh', 1, 1, '2019-08-06 23:06:27', '2019-08-06 23:06:27', 1, 1, 13),
(5, 'test engineer2', 'sfgfdsfgdf', 1, 2, '2019-08-06 23:08:42', '2019-08-06 23:08:42', 1, 2, 12),
(6, 'qa manager', 'ttttt', 1, 3, '2019-08-06 23:48:03', '2019-08-06 23:48:03', 1, 4, 9),
(7, 'web developer', 'yesy', 1, 2, '2019-08-07 00:03:53', '2019-08-07 00:03:53', 1, 2, 3),
(21, 'Quality inspector', 'A Quality Inspector monitors the quality of incoming and outgoing products or materials for a company. Also known as a Quality Control Inspector, they are tasked with conducting tests, analyzing measurements, and overseeing production processes. They work in assembly lines or production departments.', 1, 1, '2019-08-09 11:51:46', '2019-08-09 11:51:46', 1, 1, 3),
(65, 'Quality inspector', 'A Quality Inspector monitors the quality of incoming and outgoing products or materials for a company. Also known as a Quality Control Inspector, they are tasked with conducting tests, analyzing measurements, and overseeing production processes. They work in assembly lines or production departments.\r\n', 2, 2, '2019-08-10 15:28:05', '2019-08-10 15:28:05', 1, 2, 2),
(67, 'Financial Advisor', 'We are currently seeking a Financial Advisor to join our National Accounts team. In this role, the Financial Advisor will develop and maintain the relationships for the Assante Capital Management book of business. Working in a team-oriented environment, you will use your organizational, investment knowledge and exceptional communications skills to provide advice and service existing or new clients with their portfolio of in-house products.', 19, 1, '2019-08-10 15:28:53', '2019-08-10 15:28:53', 1, 1, 4),
(68, 'Manager,Cloud operations', 'Applicants should have a strong understanding of public cloud technologies (i.e. AWS, Azure and GCP), and be able to work effectively in a fast-paced, cross-functional environment. An IT operations background and hands on experience managing technical infrastructure and cloud-based services are both required for this role.', 2, 3, '2019-08-10 15:29:14', '2019-08-10 15:29:14', 1, 1, 6),
(69, 'Machinist/Operator', 'Machinists and tool and die makers set up, maintain, and operate computer and mechanically-operated machines that are used to create parts for the manufacturing process. This position require training, either in apprenticeship programs, vocational schools, or community or technical colleges. The employee also receive lots of on-the-job training.', 2, 2, '2019-08-10 15:29:14', '2019-08-10 15:29:14', 1, 2, 5),
(79, 'Packaging Supervisor', 'Direct reports include approximately 30 hourly unionized employees\r\nWorks closely with the Buyer/Planner, Customer Service Representatives, Plant Accountant and the Plant Manager coordinating activities and communication to manufacturing personnel.\r\nResponsible for the health and safety for the plant employees, as well as quality, costs, scrap and process improvements.\r\nCoordinates all inventory/activities to enable full traceability of all materials used in manufacturing\r\nOrganize daily shift communication meetings at the start of each shift to include all employees on topics of, safety, and quality, on time delivery, machine schedules, attainment and shift hand off issues', 24, 2, '2019-08-10 15:29:45', '2019-08-10 15:29:45', 1, 4, 3),
(80, 'Registered Nurse', 'Position is responsible for providing professional nursing care to individuals including the intravenous or injection administration of biologics or other specialty pharmaceutical products and promotes patient health by completing health reviews prior to treatment, reviews patient files and collaborates with physicians and multidisciplinary team members as required, with the end goal of providing medical therapies or self-administration teaching to patients in an ambulatory setting', 20, 1, '2019-08-10 15:29:45', '2019-08-10 15:29:45', 1, 2, 7),
(90, 'Dispatcher', 'Successfully plan and schedule drivers, truck loads, and routes.\r\nCommunicate with drivers to keep everything on track\r\nMust possess excellent oral and written/typing communication skills\r\nCommunicate with customers for late or problematic shipments\r\nMust possess great organizational skills\r\nPerform the task for clearing loads. (inbound/outbound) Knowledge of Canadian and US customs procedures\r\nMinimum 2-3 years experience working as a dispatcher', 25, 2, '2019-08-10 15:30:33', '2019-08-10 15:30:33', 1, 4, 8),
(91, 'Web developer- intern', 'Your job will entail working with both front and back-end developers to build complex client side logic. You will be developing complex UI and visualization tools (interactive charts, widgets, and tables) to interact with large volumes of back-end data with fast response times. You will be bridging the gap between visual elements and the server side infrastructure, and defining how the application looks and functions', 20, 2, '2019-08-10 15:30:33', '2019-08-10 15:30:33', 1, 3, 9),
(102, 'Business Analyst', 'The Business Analyst is responsible for the support and successful completion of analytical, building, testing and deployment tasks in support of business process initiatives. The Business Analyst will assist the Business Planning & Analysis team and will work with cross-functional teams in analyzing and documenting requirements.', 26, 1, '2019-08-10 15:32:02', '2019-08-10 15:32:02', 1, 1, 10),
(103, 'Sr.Financial Analyst', 'The Financial Analyst, reporting to the Finance Business Partner, is directly involved in the preparation of financial statements, operating reports, and budgets for the regions management team. An attention to detail, ability to analyze and think critically and the desire to improve process and procedures will benefit the team. The Financial Analyst provides analysis for a range of improvement initiatives supporting operations and finance.', 27, 3, '2019-08-10 15:32:02', '2019-08-10 15:32:02', 1, 1, 11),
(104, 'Order Picker', 'Pick and pack orders quickly and accurately,\r\nReceive, check in and put away stock quickly and accurately.\r\nSupport UPS, Freight, Returns and Customer Pick-Up departments as needed.\r\nReplenish picking locations and unload trailers', 23, 2, '2019-08-10 15:32:02', '2019-08-10 15:32:02', 1, 2, 13),
(105, 'AZ Truck Driver', '1 year AZ truck driving experience with valid licenseClean Abstract and CVOR (has to be dated within 30 day)Clean criminal SearchFAST Approved preferred\r\n\r\nWhat you will get:\r\n\r\nSupply all tolls and permitsExcellent paying ratesConsistent year round workCurrent and maintained fleetRuns to - Central USA, Montreal to Windsor Professional staff and dispatch team', 28, 1, '2019-08-10 15:32:02', '2019-08-10 15:32:02', 1, 1, 2),
(106, 'Full Stack Java Developer ', '5+ yrs. of experience in Java/J2EE and related frameworks based development, hardcore programming.\r\nStrong hands on experience using core Java with JDK1.\r\nShould have strong technical knowledge and hands-on experience with the following\r\nLatest version of Spring as core business logic implementer – experienced in spring boot\r\nAnalytical and algorithmic solutions approach to handle complex implementations.\r\nDesign Patterns such as Factory, Singleton, Façade, Observer, Command, Web Services/Rest Patterns, Angular JS/Angular 2 along with Java/J2EE', 30, 3, '2019-08-10 15:32:02', '2019-08-10 15:32:02', 1, 1, 9),
(107, 'qa lead', 'test', 32, 1, '2019-08-10 18:51:51', '2019-08-10 18:51:51', 0, 4, 5),
(108, 'Front end developer', 'test', 32, 2, '2019-08-10 20:15:27', '2019-08-10 20:15:27', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_skill_required`
--

CREATE TABLE `job_skill_required` (
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_skill_required`
--

INSERT INTO `job_skill_required` (`job_id`, `skill_id`) VALUES
(1, 1),
(0, 4),
(0, 3),
(0, 3),
(0, 3),
(0, 3),
(0, 3),
(0, 1),
(0, 1),
(0, 1),
(0, 1),
(0, 1),
(0, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(7, 3),
(7, 4),
(21, 2),
(107, 4),
(108, 2),
(108, 3),
(108, 4);

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_type`
--

INSERT INTO `job_type` (`id`, `name`, `description`) VALUES
(1, 'Full Time', ''),
(2, 'Part Time', ''),
(3, 'Internship', ''),
(4, 'Contract', ''),
(5, 'Temporary', '');

-- --------------------------------------------------------

--
-- Table structure for table `pass`
--

CREATE TABLE `pass` (
  `id` int(11) NOT NULL,
  `secret_question_id` int(11) NOT NULL,
  `secret_answer` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_ranges`
--

CREATE TABLE `salary_ranges` (
  `id` int(11) NOT NULL,
  `salary_range` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary_ranges`
--

INSERT INTO `salary_ranges` (`id`, `salary_range`, `description`, `create_date`, `update_date`) VALUES
(1, '$50,000 - $80,000', '', '2019-07-30 21:34:53', '2019-07-30 21:34:53'),
(2, '<$50,000', '', '2019-07-30 21:35:17', '2019-07-30 21:35:17'),
(3, '$80,000 - $1,00,000', '', '2019-07-30 21:35:39', '2019-07-30 21:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `secret_question`
--

CREATE TABLE `secret_question` (
  `id` int(11) NOT NULL,
  `question` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `secret_question`
--

INSERT INTO `secret_question` (`id`, `question`, `description`, `create_date`, `update_date`, `is_active`) VALUES
(1, 'What is your first pet name?', '', '2019-08-03 17:33:28', '2019-08-03 17:33:28', 1),
(2, 'What is the name of your favorite sibling?', '', '2019-08-03 17:35:48', '2019-08-03 17:35:48', 1),
(3, 'What is your maiden name?', '', '2019-08-03 17:36:56', '2019-08-03 17:36:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill_set`
--

CREATE TABLE `skill_set` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skill_set`
--

INSERT INTO `skill_set` (`id`, `name`, `description`, `create_date`, `update_date`) VALUES
(1, 'SQL', 'SQL', '2019-08-02 16:40:11', '2019-08-02 16:40:11'),
(2, 'Python', 'Python', '2019-08-03 18:33:00', '2019-08-03 18:33:00'),
(3, 'C++', '', '2019-08-05 23:43:27', '2019-08-05 23:43:27'),
(4, 'Go', '', '2019-08-05 23:43:39', '2019-08-05 23:43:39'),
(5, 'Java', '', '2019-08-05 23:43:49', '2019-08-05 23:43:49'),
(6, 'test', 'Junit', '2019-08-09 12:03:39', '2019-08-09 12:03:39'),
(7, 'CSS', 'Bootstrap', '2019-08-09 12:05:06', '2019-08-09 12:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_session`
--

CREATE TABLE `user_session` (
  `user_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL,
  `is_candidate` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_session`
--

INSERT INTO `user_session` (`user_id`, `last_login`, `id`, `is_candidate`) VALUES
(1, '2019-07-30 21:30:24', 1, 0),
(1, '2019-08-03 18:20:40', 2, 0),
(1, '2019-08-03 18:21:24', 3, 0),
(1, '2019-08-03 18:25:55', 4, 0),
(1, '2019-08-03 18:38:28', 5, 0),
(1, '2019-08-03 18:38:57', 6, 0),
(1, '2019-08-03 18:39:47', 7, 0),
(1, '2019-08-03 18:40:48', 8, 0),
(1, '2019-08-03 18:42:30', 9, 0),
(1, '2019-08-03 18:46:35', 10, 0),
(1, '2019-08-03 18:49:19', 11, 0),
(1, '2019-08-03 18:59:10', 12, 0),
(1, '2019-08-03 19:06:47', 13, 0),
(1, '2019-08-03 19:07:16', 14, 0),
(1, '2019-08-03 19:25:34', 15, 0),
(1, '2019-08-03 19:27:16', 16, 0),
(1, '2019-08-03 19:31:49', 17, 0),
(1, '2019-08-04 05:45:58', 18, 0),
(1, '2019-08-04 05:46:34', 19, 0),
(1, '2019-08-04 05:47:12', 20, 0),
(1, '2019-08-04 05:49:32', 21, 0),
(1, '2019-08-04 06:26:53', 22, 0),
(1, '2019-08-04 06:59:18', 23, 0),
(1, '2019-08-04 08:59:26', 24, 0),
(1, '2019-08-04 09:01:34', 25, 0),
(1, '2019-08-04 12:36:38', 26, 0),
(1, '2019-08-05 22:13:15', 27, 0),
(1, '2019-08-06 20:22:01', 28, 0),
(1, '2019-08-07 00:54:28', 29, 0),
(1, '2019-08-07 20:05:31', 30, 0),
(1, '2019-08-07 20:10:07', 31, 0),
(6, '2019-08-09 00:50:48', 32, 1),
(7, '2019-08-09 00:51:59', 33, 1),
(1, '2019-08-09 08:42:47', 34, 0),
(8, '2019-08-09 08:53:24', 35, 1),
(9, '2019-08-09 08:54:10', 36, 1),
(10, '2019-08-09 08:55:08', 37, 1),
(1, '2019-08-09 11:49:41', 38, 0),
(10, '2019-08-09 11:57:29', 39, 0),
(10, '2019-08-09 23:54:01', 40, 0),
(10, '2019-08-09 23:55:19', 41, 0),
(10, '2019-08-09 23:56:27', 42, 0),
(1, '2019-08-10 13:59:34', 43, 0),
(1, '2019-08-10 15:36:19', 44, 0),
(1, '2019-08-10 15:56:55', 45, 0),
(1, '2019-08-10 16:02:30', 46, 0),
(10, '2019-08-10 16:10:02', 47, 0),
(1, '2019-08-10 16:16:45', 48, 0),
(10, '2019-08-10 18:18:51', 49, 0),
(10, '2019-08-10 18:20:49', 50, 0),
(31, '2019-08-10 18:48:46', 51, 1),
(32, '2019-08-10 18:49:09', 52, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_type`
--
ALTER TABLE `business_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `recent_session_id` (`recent_session_id`);

--
-- Indexes for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `company_reviews`
--
ALTER TABLE `company_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `employer_user`
--
ALTER TABLE `employer_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `recent_session_id` (`recent_session_id`);

--
-- Indexes for table `job_candidate`
--
ALTER TABLE `job_candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_location`
--
ALTER TABLE `job_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `salary_range_id` (`salary_range_id`),
  ADD KEY `job_type_id` (`job_type_id`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pass`
--
ALTER TABLE `pass`
  ADD PRIMARY KEY (`id`),
  ADD KEY `secret_question_id` (`secret_question_id`);

--
-- Indexes for table `salary_ranges`
--
ALTER TABLE `salary_ranges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `secret_question`
--
ALTER TABLE `secret_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_set`
--
ALTER TABLE `skill_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `company_reviews`
--
ALTER TABLE `company_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employer_user`
--
ALTER TABLE `employer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `job_candidate`
--
ALTER TABLE `job_candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_location`
--
ALTER TABLE `job_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pass`
--
ALTER TABLE `pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_ranges`
--
ALTER TABLE `salary_ranges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `secret_question`
--
ALTER TABLE `secret_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skill_set`
--
ALTER TABLE `skill_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidate`
--
ALTER TABLE `candidate`
  ADD CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`recent_session_id`) REFERENCES `user_session` (`id`);

--
-- Constraints for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD CONSTRAINT `candidate_education_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`);

--
-- Constraints for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  ADD CONSTRAINT `candidate_experience_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`);

--
-- Constraints for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD CONSTRAINT `candidate_skill_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`),
  ADD CONSTRAINT `candidate_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill_set` (`id`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `business_type` (`id`);

--
-- Constraints for table `company_reviews`
--
ALTER TABLE `company_reviews`
  ADD CONSTRAINT `company_reviews_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `employer_user`
--
ALTER TABLE `employer_user`
  ADD CONSTRAINT `employer_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `employer_user_ibfk_2` FOREIGN KEY (`recent_session_id`) REFERENCES `user_session` (`id`);

--
-- Constraints for table `job_post`
--
ALTER TABLE `job_post`
  ADD CONSTRAINT `job_post_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `job_location` (`id`),
  ADD CONSTRAINT `job_post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employer_user` (`id`),
  ADD CONSTRAINT `job_post_ibfk_3` FOREIGN KEY (`salary_range_id`) REFERENCES `salary_ranges` (`id`),
  ADD CONSTRAINT `job_post_ibfk_4` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`);

--
-- Constraints for table `pass`
--
ALTER TABLE `pass`
  ADD CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`secret_question_id`) REFERENCES `secret_question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
