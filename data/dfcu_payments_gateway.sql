-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2025 at 09:54 AM
-- Server version: 8.0.40-0ubuntu0.20.04.1
-- PHP Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dfcu_payments_gateway`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int NOT NULL,
  `account_number` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_number`) VALUES
(9, 1002003001),
(1, 1231231231),
(2, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int NOT NULL,
  `name` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`) VALUES
(3, 'GBP'),
(1, 'UGX'),
(2, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `initiated_payments`
--

CREATE TABLE `initiated_payments` (
  `id` int NOT NULL,
  `payer_account_number` int NOT NULL,
  `payee_account_number` int NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `payer_reference` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `initiated_payments`
--

INSERT INTO `initiated_payments` (`id`, `payer_account_number`, `payee_account_number`, `amount`, `currency`, `payer_reference`, `created_at`) VALUES
(93, 1231231231, 1002003001, '50000', '500', 'Testing', '2025-05-11 00:05:23'),
(94, 1002003001, 1231231231, '23000', '230', '', '2025-05-11 00:11:57'),
(95, 1002003001, 1231231231, '23000', '230', '', '2025-05-11 00:12:55'),
(96, 1231231231, 1002003001, '30000', '300', 'xccxbxc', '2025-05-11 00:17:02'),
(97, 1231231231, 1231231231, '40000', '400', '', '2025-05-11 00:34:39'),
(98, 1002003001, 1231231231, '25000', '250', '', '2025-05-11 01:03:18'),
(99, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:07'),
(100, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:12'),
(101, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:14'),
(102, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:15'),
(103, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:16'),
(104, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:21'),
(105, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:23'),
(106, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:24'),
(107, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:25'),
(108, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:26'),
(109, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:27'),
(110, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:27'),
(111, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:28'),
(112, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:30'),
(113, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:31'),
(114, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:32'),
(115, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:33'),
(116, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:34'),
(117, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:36'),
(118, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:37'),
(119, 1231231231, 1002003001, '560000', '560', 'Testing 123', '2025-05-11 01:06:38'),
(120, 2147483647, 1231231231, '500000', '500', 'Testing again 123!', '2025-05-11 01:17:52'),
(121, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 10:53:10'),
(122, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 10:58:17'),
(123, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 10:59:48'),
(124, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:00:20'),
(125, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:00:32'),
(126, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:00:37'),
(127, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:02:37'),
(128, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:03:35'),
(129, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:04:43'),
(130, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:05:38'),
(131, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:06:42'),
(132, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:12:40'),
(133, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:13:14'),
(134, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:15:59'),
(135, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:20:31'),
(136, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:21:28'),
(137, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:22:44'),
(138, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:24:28'),
(139, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:26:32'),
(140, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:27:31'),
(141, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:36:07'),
(142, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 11:37:32'),
(143, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:33:05'),
(144, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:35:33'),
(145, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:42:09'),
(146, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:42:49'),
(147, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:44:33'),
(148, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:45:56'),
(149, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 12:46:46'),
(150, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:34:34'),
(151, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:36:33'),
(152, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:37:57'),
(153, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:40:23'),
(154, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:40:51'),
(155, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:41:30'),
(156, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:42:44'),
(157, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 13:43:07'),
(158, 1002003001, 2147483647, '50000', '500', 'Test', '2025-05-11 14:09:41'),
(159, 1002003001, 1002003001, '20000', '200', '', '2025-05-11 14:10:38'),
(160, 1231231231, 1231231231, '230000', '230', 'Test 123', '2025-05-11 14:11:11'),
(161, 2147483647, 1231231231, '340000', '340', 'Test 123', '2025-05-11 14:11:49'),
(162, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 14:13:47'),
(163, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 14:16:05'),
(164, 1002003001, 1231231231, '306000', 'UGX', 'Payment for the printer', '2025-05-11 14:22:39'),
(165, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-11 14:23:10'),
(166, 1002003001, 1231231231, '45000', '450', 'Just testing', '2025-05-12 02:20:40'),
(167, 1231231231, 1002003001, '300000', '300', 'Testing 123', '2025-05-12 02:27:21'),
(168, 1002003001, 1231231231, '1000000', '100', 'Yes', '2025-05-12 02:31:05'),
(169, 1231231231, 1002003001, '340000', '340', 'Great', '2025-05-12 02:34:16'),
(170, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:34:58'),
(171, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:01'),
(172, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:02'),
(173, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:03'),
(174, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:08'),
(175, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:08'),
(176, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:08'),
(177, 1231231231, 1002003001, '6565656', '656', 'Great', '2025-05-12 02:35:09'),
(178, 1002003001, 2147483647, '60000', '600', 'Testing 1234', '2025-05-12 03:25:00'),
(179, 2147483647, 1231231231, '230000', '230', 'Rest', '2025-05-12 03:28:29'),
(180, 1231231231, 2147483647, '450000', '450', 'Resting', '2025-05-12 03:30:08'),
(181, 1002003001, 1231231231, '1000000', '100', 'Reast', '2025-05-12 03:32:06'),
(182, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 05:04:23'),
(183, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 05:05:00'),
(184, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 05:14:36'),
(185, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 05:26:53'),
(186, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 05:28:59'),
(187, 1002003001, 1231231231, '3566', '356', 'Testing 123', '2025-05-12 05:30:27'),
(189, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:29:03'),
(191, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:29:16'),
(192, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:29:22'),
(193, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:29:29'),
(194, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:29:44'),
(195, 1002003001, 2147483647, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:31:04'),
(197, 1002003001, 1002003001, '306000', 'UGX', 'Payment for the printer', '2025-05-12 06:32:35'),
(200, 1002003001, 1002003001, '450000', '450', 'gdgdsdf', '2025-05-12 06:33:09'),
(201, 1002003001, 1002003001, '450000', '450', 'gdgdsdf', '2025-05-12 06:33:18'),
(202, 1002003001, 1002003001, '450000', '450', 'gdgdsdf', '2025-05-12 06:33:20'),
(204, 1002003001, 1002003001, '1000000', '100', 'gfghfghfg', '2025-05-12 06:38:23'),
(212, 1002003001, 1231231231, '2300000', '230', 'Money for the printers', '2025-05-12 06:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `processed_payments`
--

CREATE TABLE `processed_payments` (
  `id` int NOT NULL,
  `initiated_payment_id` int NOT NULL,
  `transaction_reference` bigint NOT NULL,
  `status_code` int NOT NULL,
  `response_message` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `processed_payments`
--

INSERT INTO `processed_payments` (`id`, `initiated_payment_id`, `transaction_reference`, `status_code`, `response_message`, `created_at`) VALUES
(61, 93, 103788646749, 200, 'Transaction successful', '2025-05-11 00:05:23'),
(62, 94, 1030565921165, 200, 'Transaction successful', '2025-05-11 00:11:57'),
(63, 95, 194850180386, 200, 'Transaction successful', '2025-05-11 00:12:55'),
(64, 96, 740196536210, 100, 'Transaction Pending', '2025-05-11 00:17:03'),
(65, 97, 955615329733, 200, 'Transaction successful', '2025-05-11 00:34:39'),
(66, 98, 669556133191, 200, 'Transaction successful', '2025-05-11 01:03:18'),
(67, 99, 220389880406, 200, 'Transaction successful', '2025-05-11 01:06:07'),
(68, 100, 464645569039, 200, 'Transaction successful', '2025-05-11 01:06:12'),
(69, 101, 183949577752, 200, 'Transaction successful', '2025-05-11 01:06:14'),
(70, 102, 791274117596, 200, 'Transaction successful', '2025-05-11 01:06:15'),
(71, 103, 522337959773, 100, 'Transaction Pending', '2025-05-11 01:06:17'),
(72, 104, 936894966728, 200, 'Transaction successful', '2025-05-11 01:06:21'),
(73, 105, 911541988653, 200, 'Transaction successful', '2025-05-11 01:06:23'),
(74, 106, 1099003250061, 200, 'Transaction successful', '2025-05-11 01:06:24'),
(75, 107, 158729966949, 200, 'Transaction successful', '2025-05-11 01:06:25'),
(76, 108, 574956868329, 200, 'Transaction successful', '2025-05-11 01:06:26'),
(77, 109, 1068690889738, 200, 'Transaction successful', '2025-05-11 01:06:27'),
(78, 110, 422097515126, 200, 'Transaction successful', '2025-05-11 01:06:27'),
(79, 111, 293047064128, 100, 'Transaction Pending', '2025-05-11 01:06:28'),
(80, 112, 544883812704, 200, 'Transaction successful', '2025-05-11 01:06:30'),
(81, 113, 729436752080, 200, 'Transaction successful', '2025-05-11 01:06:31'),
(82, 114, 518538797387, 200, 'Transaction successful', '2025-05-11 01:06:32'),
(83, 115, 104118108097, 200, 'Transaction successful', '2025-05-11 01:06:33'),
(84, 116, 436102000981, 200, 'Transaction successful', '2025-05-11 01:06:34'),
(85, 117, 993123317646, 200, 'Transaction successful', '2025-05-11 01:06:36'),
(86, 118, 299283419091, 200, 'Transaction successful', '2025-05-11 01:06:37'),
(87, 119, 811613361336, 400, 'Transaction failed - An error has occured at the server. Please contact the administrator', '2025-05-11 01:06:38'),
(88, 120, 640654239453, 200, 'Transaction successful', '2025-05-11 01:17:52'),
(89, 121, 121081616922, 100, 'Transaction Pending', '2025-05-11 10:53:10'),
(90, 122, 344612052671, 200, 'Transaction successful', '2025-05-11 10:58:18'),
(91, 123, 944796034442, 200, 'Transaction successful', '2025-05-11 10:59:48'),
(92, 124, 1051857335138, 200, 'Transaction successful', '2025-05-11 11:00:20'),
(93, 125, 492253934279, 200, 'Transaction successful', '2025-05-11 11:00:32'),
(94, 126, 168691008673, 400, 'Transaction failed - Specified payer account is suspended', '2025-05-11 11:00:38'),
(95, 127, 693380847320, 200, 'Transaction successful', '2025-05-11 11:02:37'),
(96, 128, 855427127342, 200, 'Transaction successful', '2025-05-11 11:03:35'),
(97, 129, 620123175520, 200, 'Transaction successful', '2025-05-11 11:04:43'),
(98, 130, 801194808410, 400, 'Transaction failed - Specified payee account is inactive', '2025-05-11 11:05:38'),
(99, 131, 400565686544, 200, 'Transaction successful', '2025-05-11 11:06:43'),
(100, 132, 609232277757, 200, 'Transaction successful', '2025-05-11 11:12:40'),
(101, 133, 339383315494, 100, 'Transaction Pending', '2025-05-11 11:13:14'),
(102, 134, 549933349874, 200, 'Transaction successful', '2025-05-11 11:16:00'),
(103, 136, 277843785440, 200, 'Transaction successful', '2025-05-11 11:21:28'),
(104, 137, 101601884934, 100, 'Transaction Pending', '2025-05-11 11:22:44'),
(105, 138, 171039936046, 200, 'Transaction successful', '2025-05-11 11:24:28'),
(106, 139, 192673310293, 200, 'Transaction successful', '2025-05-11 11:26:32'),
(107, 140, 516075305240, 200, 'Transaction successful', '2025-05-11 11:27:31'),
(108, 141, 500179341456, 200, 'Transaction successful', '2025-05-11 11:36:07'),
(109, 142, 128816511699, 200, 'Transaction successful', '2025-05-11 11:37:32'),
(110, 143, 504048399598, 200, 'Transaction successful', '2025-05-11 12:33:05'),
(111, 144, 912274315938, 200, 'Transaction successful', '2025-05-11 12:35:33'),
(112, 145, 270257177190, 200, 'Transaction successful', '2025-05-11 12:42:09'),
(113, 146, 1047213587733, 200, 'Transaction successful', '2025-05-11 12:42:49'),
(114, 147, 242540052264, 200, 'Transaction successful', '2025-05-11 12:44:33'),
(115, 149, 1004225804498, 200, 'Transaction successful', '2025-05-11 12:46:46'),
(116, 150, 442821493359, 200, 'Transaction successful', '2025-05-11 13:34:34'),
(117, 151, 191890915010, 200, 'Transaction successful', '2025-05-11 13:36:33'),
(118, 152, 1042212387885, 200, 'Transaction successful', '2025-05-11 13:37:57'),
(119, 153, 613529583429, 200, 'Transaction successful', '2025-05-11 13:40:23'),
(120, 154, 883517328160, 200, 'Transaction successful', '2025-05-11 13:40:51'),
(121, 155, 483115394907, 200, 'Transaction successful', '2025-05-11 13:41:30'),
(122, 156, 532055414320, 100, 'Transaction Pending', '2025-05-11 13:42:44'),
(123, 157, 843368114432, 200, 'Transaction successful', '2025-05-11 13:43:07'),
(124, 158, 1006818597705, 200, 'Transaction successful', '2025-05-11 14:09:41'),
(125, 159, 296828344346, 400, 'Transaction failed - Payee account is frozen', '2025-05-11 14:10:38'),
(126, 160, 865609867749, 400, 'Transaction failed - Specified payee account is suspended', '2025-05-11 14:11:11'),
(127, 161, 333429887717, 200, 'Transaction successful', '2025-05-11 14:11:49'),
(128, 162, 671313839082, 200, 'Transaction successful', '2025-05-11 14:13:47'),
(129, 163, 396534581104, 200, 'Transaction successful', '2025-05-11 14:16:05'),
(130, 164, 577209089426, 200, 'Transaction successful', '2025-05-11 14:22:39'),
(131, 165, 563527262000, 200, 'Transaction successful', '2025-05-11 14:23:10'),
(132, 166, 150782956793, 200, 'Transaction successful', '2025-05-12 02:20:40'),
(133, 167, 255483333960, 200, 'Transaction successful', '2025-05-12 02:27:22'),
(134, 168, 888463473551, 200, 'Transaction successful', '2025-05-12 02:31:05'),
(135, 169, 511134458423, 100, 'Transaction Pending', '2025-05-12 02:34:16'),
(136, 170, 594311377172, 200, 'Transaction successful', '2025-05-12 02:34:58'),
(137, 171, 261120340982, 200, 'Transaction successful', '2025-05-12 02:35:01'),
(138, 172, 828873786757, 200, 'Transaction successful', '2025-05-12 02:35:02'),
(139, 173, 156585904267, 200, 'Transaction successful', '2025-05-12 02:35:03'),
(140, 174, 335038052926, 200, 'Transaction successful', '2025-05-12 02:35:08'),
(141, 175, 758183477690, 200, 'Transaction successful', '2025-05-12 02:35:09'),
(142, 176, 1076022024139, 200, 'Transaction successful', '2025-05-12 02:35:09'),
(143, 177, 941761741612, 200, 'Transaction successful', '2025-05-12 02:35:09'),
(144, 178, 446591694866, 100, 'Transaction Pending', '2025-05-12 03:25:00'),
(145, 179, 555371072025, 200, 'Transaction successful', '2025-05-12 03:28:30'),
(146, 180, 960312121585, 200, 'Transaction successful', '2025-05-12 03:30:08'),
(147, 181, 859881422959, 200, 'Transaction successful', '2025-05-12 03:32:06'),
(148, 182, 985295470777, 100, 'Transaction Pending', '2025-05-12 05:04:23'),
(149, 183, 970764009206, 200, 'Transaction successful', '2025-05-12 05:05:00'),
(150, 184, 352678535305, 200, 'Transaction successful', '2025-05-12 05:14:36'),
(151, 185, 385485395429, 200, 'Transaction successful', '2025-05-12 05:26:53'),
(152, 186, 727013031961, 400, 'Transaction failed - System timeout. Please try again!', '2025-05-12 05:28:59'),
(153, 187, 572847658066, 200, 'Transaction successful', '2025-05-12 05:30:27'),
(154, 189, 886074629194, 200, 'Transaction successful', '2025-05-12 06:29:04'),
(155, 191, 598288677748, 200, 'Transaction successful', '2025-05-12 06:29:16'),
(156, 192, 422312025532, 200, 'Transaction successful', '2025-05-12 06:29:22'),
(157, 193, 104772584189, 200, 'Transaction successful', '2025-05-12 06:29:30'),
(158, 194, 605597134096, 200, 'Transaction successful', '2025-05-12 06:29:44'),
(159, 195, 116320098013, 200, 'Transaction successful', '2025-05-12 06:31:04'),
(160, 197, 927768673139, 100, 'Transaction Pending', '2025-05-12 06:32:35'),
(161, 200, 859809262941, 200, 'Transaction successful', '2025-05-12 06:33:09'),
(162, 201, 110964393451, 200, 'Transaction successful', '2025-05-12 06:33:18'),
(163, 202, 797881576887, 200, 'Transaction successful', '2025-05-12 06:33:20'),
(164, 204, 463822364256, 200, 'Transaction successful', '2025-05-12 06:38:24'),
(165, 212, 155349868840, 200, 'Transaction successful', '2025-05-12 06:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int NOT NULL,
  `code` int DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `code`, `name`, `message`) VALUES
(1, 100, 'PENDING', 'Transaction Pending'),
(2, 200, 'SUCCESSFUL', 'Transaction successfully processed'),
(3, 400, 'FAILED', 'Transaction failed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_number_UNIQUE` (`account_number`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `initiated_payments`
--
ALTER TABLE `initiated_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payer_account_number` (`payer_account_number`),
  ADD KEY `payee_account_number` (`payee_account_number`);

--
-- Indexes for table `processed_payments`
--
ALTER TABLE `processed_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `INITIATED_PAYMENT_ID_UNIQUE` (`initiated_payment_id`),
  ADD UNIQUE KEY `TRANSACTION_REFERENCE_UNIQUE` (`transaction_reference`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `initiated_payments`
--
ALTER TABLE `initiated_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `processed_payments`
--
ALTER TABLE `processed_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `initiated_payments`
--
ALTER TABLE `initiated_payments`
  ADD CONSTRAINT `initiated_payments_ibfk_1` FOREIGN KEY (`payer_account_number`) REFERENCES `accounts` (`account_number`),
  ADD CONSTRAINT `initiated_payments_ibfk_2` FOREIGN KEY (`payee_account_number`) REFERENCES `accounts` (`account_number`);

--
-- Constraints for table `processed_payments`
--
ALTER TABLE `processed_payments`
  ADD CONSTRAINT `processed_payments_ibfk_1` FOREIGN KEY (`initiated_payment_id`) REFERENCES `initiated_payments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
