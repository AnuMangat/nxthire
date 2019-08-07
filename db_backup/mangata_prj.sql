-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2019 at 07:07 AM
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
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street_number`, `street_name`, `city`, `province`, `country`, `postal_code`, `create_date`, `update_date`) VALUES
(1, '22', 'abc', 'Windsor', 'ON', 'Canada', '485GhY', '2019-07-30 21:23:57', '2019-07-30 21:23:57'),
(2, '23', 'abc', 'Toronto', 'ON', 'Canada', '92JhQ', '2019-07-30 21:24:24', '2019-07-30 21:24:24'),
(3, '20', 'tef', 'Chatham', 'ON', 'Canada', 'xyx7w', '2019-08-03 17:42:48', '2019-08-03 17:42:48'),
(4, '45', 'King Street', 'Toronto', 'ON', 'Canada', 'kl98JG', '2019-08-03 19:06:30', '2019-08-03 19:06:30'),
(5, '2', 'falcom', 'Toronto', 'ON', 'Canada', 'LJGS09', '2019-08-03 19:07:05', '2019-08-03 19:07:05'),
(6, '6', 'jette', 'Windsor', 'ON', 'Canada', 'Ljha8a', '2019-08-03 19:11:38', '2019-08-03 19:11:38'),
(7, '12', 'highrise', 'Toronto', 'ON', 'Canada', '89Lh7', '2019-08-06 22:17:38', '2019-08-06 22:17:38'),
(8, '98', 'JJINGLU', 'Markham', 'ON', 'Canada', '98L96Q', '2019-08-06 22:18:31', '2019-08-06 22:18:31'),
(9, '32', 'kingnite', 'Markham', 'ON', 'Canada', 'N0839h', '2019-08-06 22:19:14', '2019-08-06 22:19:14'),
(10, '29', 'chefli', 'Toronto', 'ON', 'Canada', 'mshs90', '2019-08-06 22:19:47', '2019-08-06 22:19:47'),
(11, '67', 'gillo', 'Toronto', 'ON', 'Canada', 'Nidh9', '2019-08-06 22:20:26', '2019-08-06 22:20:26'),
(12, '50', 'westno', 'Brampton', 'ON', 'Canada', '9383jh', '2019-08-06 22:33:55', '2019-08-06 22:33:55'),
(13, '45', 'jetnu', 'Brampton', 'ON', 'Canada', '92734g', '2019-08-06 22:34:25', '2019-08-06 22:34:25'),
(14, '23', 'ksahjs', 'Brampton', 'ON', 'Canada', 'K9shw8', '2019-08-06 22:34:58', '2019-08-06 22:34:58'),
(15, '79', 'kahs', 'Toronto', 'ON', 'Canada', '9w373', '2019-08-06 22:35:19', '2019-08-06 22:35:19'),
(16, '12', 'defg', 'Markham', 'ON', 'Canada', 'KSHD8', '2019-08-06 22:35:49', '2019-08-06 22:35:49'),
(17, '34', 'JELNB', 'Toronto', 'ON', 'Canada', '8K910', '2019-08-06 22:36:16', '2019-08-06 22:36:16');

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
(4, 'Transport or logistics', 'Trade and transport or re'),
(5, 'Health', 'health and related servic');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `recent_session_id` int(11) NOT NULL,
  `user_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `name`, `address_id`, `email`, `phone`, `recent_session_id`, `user_name`, `password`, `is_active`, `create_date`, `update_date`) VALUES
(1, 'Jhon verdosa', 3, 'John.verdosa@abcemail.com', '7835933321', 1, 'Jhon', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-03 17:54:31', '2019-08-03 17:54:31'),
(2, 'Emily nodes', 1, 'emily@tuemail.com', '9836292721', 1, 'Emilia', 'ddcd90dde662f3fb8c56223e642af0ed', 1, '2019-08-03 17:59:52', '2019-08-03 17:59:52');

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
(2, 'Master in Computer Science', 'thesis in cs ', 'University of Windsor', 1, 1);

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
  `supervisor_phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `supervisor_email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `use_as_reference` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate_experience`
--

INSERT INTO `candidate_experience` (`id`, `candidate_id`, `name`, `description`, `no_of_years`, `company_name`, `company_address`, `supervisor_name`, `supervisor_phone`, `supervisor_email`, `use_as_reference`) VALUES
(1, 2, 'Jr. Software engineer', 'Designs and develops interactive web technology in an agile, cloud-based software environment.', 3, 'shamul', '67 gerrad windsor ontario', 'kilpoo', '98372029', 'kilpoo@shamul.com', 1),
(2, 1, 'Software engineer', 'JavaScript Babel Typescript HTML SAAS Redux', 5, 'kjol.ltd', '98 hubino Toronto ontario', 'killom', '983720759', 'killom@ui.com', 1);

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
  `phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
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
(5, 'freshpic', 3, 'freshpic@org.com', '5344674322', '2019-08-06 22:40:38', '2019-08-06 22:40:38', 3, 1),
(6, 'BLI Bank', 4, 'BLI.bank@org.com', '244646965', '2019-08-06 22:42:34', '2019-08-06 22:42:34', 1, 1),
(7, 'GCD group', 7, 'Gcdgroup@co.g', '34675855', '2019-08-06 22:45:04', '2019-08-06 22:45:04', 5, 1),
(8, 'helloBg', 8, 'Bghello@org.ca', '463579286', '2019-08-06 22:46:55', '2019-08-06 22:46:55', 4, 1),
(9, 'techsmni', 9, 'techsmini@org.ca', '1251644333', '2019-08-06 22:50:16', '2019-08-06 22:50:16', 2, 1),
(11, 'yessure', 10, 'yessure@org.ca', '236277582', '2019-08-06 22:52:34', '2019-08-06 22:52:34', 1, 1),
(12, 'KlO.ltd', 11, 'KlO@org.ca', '362756433', '2019-08-06 22:54:17', '2019-08-06 22:54:17', 1, 1),
(13, 'JwN.co', 13, 'Jwn@org.co', '464547683', '2019-08-06 22:56:51', '2019-08-06 22:56:51', 3, 1),
(14, 'KellyPacking', 13, 'kellypacking@org.ca', '46632496', '2019-08-06 22:57:44', '2019-08-06 22:57:44', 3, 1),
(15, 'fennet', 16, 'fennet@org.ca', '73532826', '2019-08-06 23:07:47', '2019-08-06 23:07:47', 4, 1),
(16, 'ulli.ltd', 16, 'ulli@org.ca', '33568432', '2019-08-06 23:08:21', '2019-08-06 23:08:21', 3, 1),
(17, 'LeoGen', 17, 'leoGen', '75342987', '2019-08-06 23:11:57', '2019-08-06 23:11:57', 1, 1);

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
(3, 1, 'low pay scale.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employer_user`
--

CREATE TABLE `employer_user` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
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
(1, 'Anudeep Mangat', 1, '2019-07-30 21:31:31', '2019-07-30 21:31:31', 'amangat@abc.consult.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(2, 'Aria', 2, '2019-08-03 18:41:08', '2019-08-03 18:41:08', 'Aria@sanito.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 5),
(4, 'Techsolm', 3, '2019-08-06 23:41:34', '2019-08-06 23:41:34', 'shamil_Techsolm', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(5, 'nitin_Yunicom', 4, '2019-08-06 23:44:44', '2019-08-06 23:44:44', 'nitin@Yunicom.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(6, 'Sehaj_Bli ', 6, '2019-08-07 00:02:24', '2019-08-07 00:02:24', 'Sehaj@blibank.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(7, 'alice', 5, '2019-08-07 00:17:55', '2019-08-07 00:17:55', 'alice@freshpic.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(8, 'mike', 7, '2019-08-07 00:23:22', '2019-08-07 00:23:22', 'mike@gcd.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(9, 'channel', 8, '2019-08-07 00:26:34', '2019-08-07 00:26:34', 'channel@hellobg.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(10, 'tom', 13, '2019-08-07 00:35:06', '2019-08-07 00:35:06', 'tom@jwn.co', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(11, 'teena', 11, '2019-08-07 00:38:40', '2019-08-07 00:38:40', 'teena@yessure.org', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(12, 'linda', 12, '2019-08-07 00:41:21', '2019-08-07 00:41:21', 'linda@kio.ltd', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(13, 'Jinny', 14, '2019-08-07 00:45:38', '2019-08-07 00:45:38', 'jinny@kellypacking.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(14, 'tony', 15, '2019-08-07 00:48:25', '2019-08-07 00:48:25', 'tony_fennet@org.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1),
(15, 'vijay', 9, '2019-08-07 01:02:20', '2019-08-07 01:02:20', 'vijay@techsmini.com', 'ddcd90dde662f3fb8c56223e642af0ed', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_candidate`
--

CREATE TABLE `job_candidate` (
  `job_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_post`
--

CREATE TABLE `job_post` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `salary_range_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `address_id` int(11) NOT NULL,
  `job_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_post`
--

INSERT INTO `job_post` (`id`, `title`, `description`, `user_id`, `salary_range_id`, `create_date`, `update_date`, `is_active`, `address_id`, `job_type_id`) VALUES
(1, 'Software Engineer', 'You have relevant experience with mobile software development including iOS and Android platforms\r\nYou have industry or project experience with audio/video streaming technologies\r\nYou have some eperience with Adobe Flash Builder including developing Flash-based client-server applications with ActionScript / Flex', 1, 1, '2019-07-30 21:39:50', '2019-07-30 21:39:50', 1, 1, 1),
(2, 'Data Analyst', 'ob Functions\r\n\r\nPrepares variety of computer programs, associated documentation and design specifications, including logical system design diagrams.\r\nAssists in conducting detailed analysis of defined system specifications and developing methods for problem solving\r\nConverts symbolic statements of work processes to detailed design and coding into program language\r\nAssists in developing detailed programs and design, produces diagrams indicating mathematical computations, sequence data, and solutions. Additionally, the individual is involved with test and system integration (unit and/or software integration) of programs\r\nProvide development support for designated SharePoint and ASP sites utilizing out of box web parts and custom HTML/C++/JavaScript when necessary\r\nWork with functional leaders and Business Unit leaders on setting up sites\r\nWork with user community to trouble shoot technical issues\r\nWork with IT to communicate issues and help with solutions', 1, 1, '2019-08-02 16:36:02', '2019-08-02 16:36:02', 0, 1, 1),
(3, 'Quality inspector', 'A Quality Inspector monitors the quality of incoming and outgoing products or materials for a company. Also known as a Quality Control Inspector, they are tasked with conducting tests, analyzing measurements, and overseeing production processes. They work in assembly lines or production departments.\r\n', 2, 2, '2019-08-06 23:58:13', '2019-08-06 23:58:13', 1, 2, 2),
(4, 'Financial Advisor', 'We are currently seeking a Financial Advisor to join our National Accounts team. In this role, the Financial Advisor will develop and maintain the relationships for the Assante Capital Management book of business. Working in a team-oriented environment, you will use your organizational, investment knowledge and exceptional communications skills to provide advice and service existing or new clients with their portfolio of in-house products.', 6, 1, '2019-08-07 00:03:45', '2019-08-07 00:03:45', 1, 4, 1),
(5, 'Manager,Cloud operations', 'Applicants should have a strong understanding of public cloud technologies (i.e. AWS, Azure and GCP), and be able to work effectively in a fast-paced, cross-functional environment. An IT operations background and hands on experience managing technical infrastructure and cloud-based services are both required for this role.', 4, 3, '2019-08-07 00:07:56', '2019-08-07 00:07:56', 1, 6, 1),
(6, 'Machinist/Operator', 'Machinists and tool and die makers set up, maintain, and operate computer and mechanically-operated machines that are used to create parts for the manufacturing process. This position require training, either in apprenticeship programs, vocational schools, or community or technical colleges. The employee also receive lots of on-the-job training.', 5, 2, '2019-08-07 00:12:24', '2019-08-07 00:12:24', 1, 5, 2),
(7, 'Packaging Supervisor', 'Direct reports include approximately 30 hourly unionized employees\r\nWorks closely with the Buyer/Planner, Customer Service Representatives, Plant Accountant and the Plant Manager coordinating activities and communication to manufacturing personnel.\r\nResponsible for the health and safety for the plant employees, as well as quality, costs, scrap and process improvements.\r\nCoordinates all inventory/activities to enable full traceability of all materials used in manufacturing\r\nOrganize daily shift communication meetings at the start of each shift to include all employees on topics of, safety, and quality, on time delivery, machine schedules, attainment and shift hand off issues', 7, 2, '2019-08-07 00:20:46', '2019-08-07 00:20:46', 1, 3, 4),
(8, 'Registered Nurse', 'Position is responsible for providing professional nursing care to individuals including the intravenous or injection administration of biologics or other specialty pharmaceutical products and promotes patient health by completing health reviews prior to treatment, reviews patient files and collaborates with physicians and multidisciplinary team members as required, with the end goal of providing medical therapies or self-administration teaching to patients in an ambulatory setting', 8, 1, '2019-08-07 00:25:21', '2019-08-07 00:25:21', 1, 7, 2),
(9, 'Dispatcher', 'Successfully plan and schedule drivers, truck loads, and routes.\r\nCommunicate with drivers to keep everything on track\r\nMust possess excellent oral and written/typing communication skills\r\nCommunicate with customers for late or problematic shipments\r\nMust possess great organizational skills\r\nPerform the task for clearing loads. (inbound/outbound) Knowledge of Canadian and US customs procedures\r\nMinimum 2-3 years experience working as a dispatcher', 9, 2, '2019-08-07 00:28:45', '2019-08-07 00:28:45', 1, 8, 4),
(10, 'Web developer- intern', 'Your job will entail working with both front and back-end developers to build complex client side logic. You will be developing complex UI and visualization tools (interactive charts, widgets, and tables) to interact with large volumes of back-end data with fast response times. You will be bridging the gap between visual elements and the server side infrastructure, and defining how the application looks and functions', 10, 2, '2019-08-07 00:37:50', '2019-08-07 00:37:50', 1, 9, 3),
(11, 'Business Analyst', 'The Business Analyst is responsible for the support and successful completion of analytical, building, testing and deployment tasks in support of business process initiatives. The Business Analyst will assist the Business Planning & Analysis team and will work with cross-functional teams in analyzing and documenting requirements.', 11, 1, '2019-08-07 00:40:19', '2019-08-07 00:40:19', 1, 10, 1),
(12, 'Sr.Financial Analyst', 'The Financial Analyst, reporting to the Finance Business Partner, is directly involved in the preparation of financial statements, operating reports, and budgets for the regions management team. An attention to detail, ability to analyze and think critically and the desire to improve process and procedures will benefit the team. The Financial Analyst provides analysis for a range of improvement initiatives supporting operations and finance.', 12, 3, '2019-08-07 00:43:49', '2019-08-07 00:43:49', 1, 11, 1),
(13, 'Order Picker', 'Pick and pack orders quickly and accurately,\r\nReceive, check in and put away stock quickly and accurately.\r\nSupport UPS, Freight, Returns and Customer Pick-Up departments as needed.\r\nReplenish picking locations and unload trailers', 13, 2, '2019-08-07 00:47:20', '2019-08-07 00:47:20', 1, 13, 2),
(14, 'AZ Truck Driver', '1 year AZ truck driving experience with valid licenseClean Abstract and CVOR (has to be dated within 30 day)Clean criminal SearchFAST Approved preferred\r\n\r\nWhat you will get:\r\n\r\nSupply all tolls and permitsExcellent paying ratesConsistent year round workCurrent and maintained fleetRuns to - Central USA, Montreal to Windsor Professional staff and dispatch team', 14, 1, '2019-08-07 00:51:56', '2019-08-07 00:51:56', 1, 16, 1),
(15, 'Full Stack Java Developer ', '5+ yrs. of experience in Java/J2EE and related frameworks based development, hardcore programming.\r\nStrong hands on experience using core Java with JDK1.\r\nShould have strong technical knowledge and hands-on experience with the following\r\nLatest version of Spring as core business logic implementer – experienced in spring boot\r\nAnalytical and algorithmic solutions approach to handle complex implementations.\r\nDesign Patterns such as Factory, Singleton, Façade, Observer, Command, Web Services/Rest Patterns, Angular JS/Angular 2 along with Java/J2EE', 15, 3, '2019-08-07 01:03:55', '2019-08-07 01:03:55', 1, 9, 1);

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
(1, 1);

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
(1, '50,000 - 80,000', '', '2019-07-30 21:34:53', '2019-07-30 21:34:53'),
(2, '<50,000', '', '2019-07-30 21:35:17', '2019-07-30 21:35:17'),
(3, '80,000 - 1,00,000', '', '2019-07-30 21:35:39', '2019-07-30 21:35:39');

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
  `create_date` datetime NOT NULL,
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
(5, 'Java', '', '2019-08-05 23:43:49', '2019-08-05 23:43:49');

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
(1, '2019-08-05 22:13:15', 27, 0);

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
-- Indexes for table `job_post`
--
ALTER TABLE `job_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `job_type_id` (`job_type_id`),
  ADD KEY `salary_range_id` (`salary_range_id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidate_experience`
--
ALTER TABLE `candidate_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `company_reviews`
--
ALTER TABLE `company_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employer_user`
--
ALTER TABLE `employer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `job_candidate`
--
ALTER TABLE `job_candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_post`
--
ALTER TABLE `job_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_session`
--
ALTER TABLE `user_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  ADD CONSTRAINT `job_post_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `job_post_ibfk_3` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`),
  ADD CONSTRAINT `job_post_ibfk_4` FOREIGN KEY (`salary_range_id`) REFERENCES `salary_ranges` (`id`),
  ADD CONSTRAINT `job_post_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `employer_user` (`id`);

--
-- Constraints for table `pass`
--
ALTER TABLE `pass`
  ADD CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`secret_question_id`) REFERENCES `secret_question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
