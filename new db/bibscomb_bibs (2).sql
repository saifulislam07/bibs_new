-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2021 at 11:50 AM
-- Server version: 10.3.28-MariaDB-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibscomb_bibs`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `amount`, `type`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 5120.00, 'MainAC', '1', '2021-05-02 08:59:55', '2021-05-02 09:03:42'),
(2, 5120.00, 'MainAC', '1', '2021-05-02 23:51:59', '2021-05-02 23:52:51'),
(3, 4.00, 'MainAC', '1', '2021-05-02 23:59:31', '2021-05-03 00:05:46'),
(4, 15.00, 'MainAC', '1', '2021-05-03 00:01:59', '2021-05-03 00:27:31'),
(5, 5120.00, 'MainAC', '1', '2021-05-03 00:03:56', '2021-05-03 01:10:23'),
(6, 5120.00, 'MainAC', '1', '2021-05-03 00:21:58', '2021-05-03 01:11:10'),
(7, 68.00, 'MainAC', '0', '2021-05-03 00:49:34', '2021-05-03 00:49:34'),
(8, 2829.00, 'MainAC', '1', '2021-05-03 00:50:06', '2021-05-03 01:55:43'),
(9, 1476.00, 'MainAC', '1', '2021-05-03 00:51:15', '2021-05-03 01:58:58'),
(10, 42.00, 'MainAC', '0', '2021-05-03 00:52:24', '2021-05-03 00:52:24'),
(11, 484.00, 'MainAC', '0', '2021-05-03 00:58:24', '2021-05-03 00:58:24'),
(12, -506.00, 'MainAC', '0', '2021-05-03 00:59:04', '2021-05-03 00:59:04'),
(13, -46.00, 'MainAC', '0', '2021-05-03 01:05:01', '2021-05-03 01:05:01'),
(14, -1245.00, 'MainAC', '0', '2021-05-03 01:21:08', '2021-05-03 01:21:08'),
(15, 234.00, 'MainAC', '0', '2021-05-03 01:55:24', '2021-05-03 01:55:24'),
(16, 10000.00, 'MainAC', '0', '2021-05-03 01:58:38', '2021-05-03 01:58:38'),
(17, 126.00, 'MainAC', '0', '2021-05-03 04:02:16', '2021-05-03 04:02:16'),
(18, 5120.00, 'MainAC', '0', '2021-05-03 04:09:40', '2021-05-03 04:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 5000,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `amount`, `details`, `created_at`, `updated_at`) VALUES
(1, '1 share 5000 tk', 10000, 'tnx', '2021-02-17 06:51:26', '2021-02-17 06:51:26'),
(2, '2 share 10000 tk', 10000, 'tnx', '2021-02-18 00:15:45', '2021-02-18 00:15:45'),
(3, '3 share 15000 tk', 15000, 'tnx', '2021-02-18 00:16:36', '2021-02-18 00:16:36'),
(5, '4 share 20000 tk', 20000, 'fg j', '2021-05-03 01:42:44', '2021-05-03 01:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `category_payment`
--

CREATE TABLE `category_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_payment`
--

INSERT INTO `category_payment` (`id`, `payment_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-05-02 08:59:55', '2021-05-02 08:59:55'),
(2, 2, 2, '2021-05-02 23:51:59', '2021-05-02 23:51:59'),
(3, 3, 1, '2021-05-03 00:03:56', '2021-05-03 00:03:56'),
(4, 4, 1, '2021-05-03 00:21:58', '2021-05-03 00:21:58'),
(5, 5, 1, '2021-05-03 00:35:06', '2021-05-03 00:35:06'),
(6, 6, 1, '2021-05-03 00:38:30', '2021-05-03 00:38:30'),
(7, 7, 2, '2021-05-03 01:53:48', '2021-05-03 01:53:48'),
(8, 8, 2, '2021-05-03 01:55:24', '2021-05-03 01:55:24'),
(9, 9, 1, '2021-05-03 01:58:38', '2021-05-03 01:58:38'),
(10, 10, 1, '2021-05-03 04:09:40', '2021-05-03 04:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'sr', '2021-05-03 01:19:30', '2021-05-03 01:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(3, 'Rabbi Hossain', 1245.00, '2021-05-03 01:21:08', '2021-05-03 01:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `date`, `type`, `invoice_id`, `product_id`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, '2021-05-03', 'Sale', 4, 1, 2.00, -2.00, 4.00, '2021-05-02 23:59:31', '2021-05-02 23:59:31'),
(2, '2021-05-03', 'Sale', 5, 3, 5.00, -3.00, 15.00, '2021-05-03 00:01:59', '2021-05-03 00:01:59'),
(3, '2021-05-03', 'Sale', 6, 4, 34.00, -2.00, 68.00, '2021-05-03 00:49:34', '2021-05-03 00:49:34'),
(4, '2021-05-03', 'Sale', 7, 1, 123.00, -23.00, 2829.00, '2021-05-03 00:50:06', '2021-05-03 00:50:06'),
(5, '2021-05-03', 'Sale', 8, 4, 123.00, -12.00, 1476.00, '2021-05-03 00:51:15', '2021-05-03 00:51:15'),
(6, '2021-05-03', 'Sale', 9, 1, 21.00, -2.00, 42.00, '2021-05-03 00:52:24', '2021-05-03 00:52:24'),
(7, '2021-05-03', 'Sale', 10, 4, 22.00, -22.00, 484.00, '2021-05-03 00:58:24', '2021-05-03 00:58:24'),
(8, '2021-05-03', 'Purchase', 2, 4, 23.00, 22.00, 506.00, '2021-05-03 00:59:04', '2021-05-03 00:59:04'),
(9, '2021-05-03', 'Purchase', 3, 4, 23.00, 2.00, 46.00, '2021-05-03 01:05:01', '2021-05-03 01:05:01'),
(10, '2021-05-03', 'Sale', 11, 1, 42.00, -3.00, 126.00, '2021-05-03 04:02:16', '2021-05-03 04:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `invests`
--

CREATE TABLE `invests` (
  `id` int(10) UNSIGNED NOT NULL,
  `sector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invest_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invests`
--

INSERT INTO `invests` (`id`, `sector`, `invest_date`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'dghj', '2021-05-03', '23', '2021-05-03 01:21:55', '2021-05-03 01:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `id` int(10) UNSIGNED NOT NULL,
  `designation_id` int(11) NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`id`, `designation_id`, `details`, `name`, `images`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'fg j', 'Mamun Hossain', '/storage/management/1613018085_6.jpg', NULL, '2021-05-03 02:46:20', '2021-05-03 02:46:20'),
(4, 1, 'fg j', 'Rabbi Hossain', '/storage/management/1620032470_FB_IMG_1613914019080 (1).jpg', NULL, '2021-05-03 03:01:10', '2021-05-03 03:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '2020_12_27_063553_create_payment_policies_table', 1),
(48, '2021_02_04_083025_create_products_table', 2),
(200, '2021_02_17_094629_create_total_prs_table', 3),
(203, '2014_10_12_000000_create_users_table', 4),
(204, '2014_10_12_100000_create_password_resets_table', 4),
(205, '2020_12_23_101644_create_roles_table', 4),
(206, '2020_12_28_073654_create_expenses_table', 4),
(207, '2020_12_30_072338_create_categories_table', 4),
(208, '2020_12_31_083939_create_payments_table', 4),
(209, '2020_12_31_084233_create_category_payment_table', 4),
(210, '2021_01_06_112900_create_notices_table', 4),
(211, '2021_01_21_100706_create_share_settings_table', 4),
(212, '2021_01_26_103846_create_policies_table', 4),
(213, '2021_02_01_060441_create_invests_table', 4),
(214, '2021_02_09_083747_create_designations_table', 4),
(215, '2021_02_09_085159_create_management_table', 4),
(216, '2021_02_11_063251_create_products_table', 4),
(217, '2021_02_11_065157_create_pcategories_table', 4),
(218, '2021_02_14_053920_create_purchases_table', 4),
(219, '2021_02_14_065905_create_sales_table', 4),
(220, '2021_02_15_085343_create_inventories_table', 4),
(221, '2021_02_17_111155_create_paymentrcvs_table', 4),
(222, '2021_02_17_122840_create_accounts_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `discription`, `created_at`, `updated_at`) VALUES
(1, 'tnx', 'বাংলাদেশ ইন্টারনেট ব্যবসায়ী সমিতিতে আপনাকে স্বাগতম', '2021-02-17 23:35:41', '2021-02-17 23:35:41'),
(3, 'ইয়েস', 'সবাইকে মাসিক চাঁদা সহ বকেয়া পরিশোধ করার জন্য অনুরধ করা যাচ্ছে...', '2021-02-18 07:26:44', '2021-02-18 07:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentrcvs`
--

CREATE TABLE `paymentrcvs` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `is_approved` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymentrcvs`
--

INSERT INTO `paymentrcvs` (`id`, `amount`, `is_approved`, `type`, `created_at`, `updated_at`) VALUES
(1, 5120.00, '1', 'payment', '2021-05-02 08:59:55', '2021-05-02 09:03:42'),
(2, 5120.00, '1', 'payment', '2021-05-02 23:51:59', '2021-05-02 23:52:51'),
(3, 5120.00, '1', 'payment', '2021-05-03 00:03:56', '2021-05-03 00:05:46'),
(4, 5120.00, '1', 'payment', '2021-05-03 00:21:58', '2021-05-03 00:27:31'),
(5, 234.00, '0', 'payment', '2021-05-03 01:55:24', '2021-05-03 01:55:24'),
(6, 10000.00, '0', 'payment', '2021-05-03 01:58:38', '2021-05-03 01:58:38'),
(7, 5120.00, '0', 'payment', '2021-05-03 04:09:40', '2021-05-03 04:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `title`, `amount`, `company`, `image`, `details`, `phone`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(4, 19, 'Bkash', 5120.00, 'City Sky Clothing Ltd', 'default.png', 'load', '0', 0, '1', '2021-05-03 00:21:58', '2021-05-03 00:27:31'),
(8, 19, 'Nagad', 234.00, 'City Sky Clothing Ltd', 'default.png', 'sdafd', '0', 0, '1', '2021-05-03 01:55:24', '2021-05-03 02:28:04'),
(9, 19, 'Bkash', 10000.00, 'City Sky Clothing Ltd', 'default.png', 'sdfa', '0', 0, '1', '2021-05-03 01:58:38', '2021-05-03 02:25:55'),
(10, 19, 'Cash Payment', 5120.00, 'City Sky Clothing Ltd', 'default.png', 'sdaf', '0', 0, '0', '2021-05-03 04:09:40', '2021-05-03 04:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `pcategories`
--

CREATE TABLE `pcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pcategories`
--

INSERT INTO `pcategories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cable', 1, '2021-02-17 06:54:14', '2021-02-17 06:54:14'),
(2, 'daros', 1, '2021-05-02 23:53:47', '2021-05-03 00:29:12'),
(3, 'pen', 1, '2021-05-03 00:43:31', '2021-05-03 00:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `details`, `created_at`, `updated_at`) VALUES
(1, 'jhgtuyg uih iiuyu', '2021-05-03 01:21:31', '2021-05-03 01:21:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buy_price` decimal(8,2) NOT NULL,
  `sell_price` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `code`, `buy_price`, `sell_price`, `status`, `created_at`, `updated_at`) VALUES
(4, 3, 'Matador', '23424h', 123.00, 200.00, 1, '2021-05-03 00:45:27', '2021-05-03 00:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `purchase_price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `date`, `product_id`, `quantity`, `purchase_price`, `total_price`, `created_at`, `updated_at`) VALUES
(2, '2021-05-03', 4, 22, 23.00, 506.00, '2021-05-03 00:59:04', '2021-05-03 00:59:04'),
(3, '2021-05-03', 4, 2, 23.00, 46.00, '2021-05-03 01:05:01', '2021-05-03 01:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Member', 'member', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_settings`
--

CREATE TABLE `share_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `share_settings`
--

INSERT INTO `share_settings` (`id`, `category_id`, `user_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 19, '2021-05-02', '2021-05-02 07:53:12', '2021-05-02 07:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `share_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '017',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'index.jpg',
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `share_id`, `name`, `company_address`, `license_type`, `nid`, `phone`, `image`, `dob`, `joining_date`, `status`, `email`, `password`, `address`, `permanent_address`, `refer`, `company`, `nominee_name`, `nominee_address`, `nominee_nid`, `nominee_phone`, `designation`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'admin', NULL, NULL, NULL, '01404684576', 'index.jpg', NULL, NULL, 1, 'admin@soft.com', '$2y$10$8.UdaUCeRvhvzigb8moOPOfYI7TltdVXI/Keb9UnKaIdOQLtpcJAi', 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3VV2JAKzeTGwFLyFbpHkD5RsiSBMAT7iBHc9KG3q4MXNbUngYZ7ucWjWI9Pp', NULL, NULL),
(19, 2, 1, 'Ripon Hossain', 'Road:10/B House:37 Sector:11 Uttara-1230', 'national', '234b33bu3', '01744245048', 'dummy-man-570x570.png', '2021-05-02', '2021-05-02', 1, 'marketinghead18@gmail.Com', '$2y$10$xHYFY.pjjqwdbgjl1ODVOeJigl0mMCoWy9i/M3wwhU1M6/zYNSFxq', 'Road:10/B House:37 Sector:11 Uttara-1230', 'uttara', 'Rifat', 'City Sky Clothing Ltd', 'Rabbi Hossain', NULL, '143j234bh32', '01717710549', NULL, 'WzQtKLCZCUibkl4ybPotOY8unRjbZHAqSFg9Cbb57jH2SgaxEmUG1vX84g9t', '2021-05-02 07:52:11', '2021-05-02 07:53:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_payment`
--
ALTER TABLE `category_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invests`
--
ALTER TABLE `invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paymentrcvs`
--
ALTER TABLE `paymentrcvs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `pcategories`
--
ALTER TABLE `pcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_settings`
--
ALTER TABLE `share_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_payment`
--
ALTER TABLE `category_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invests`
--
ALTER TABLE `invests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentrcvs`
--
ALTER TABLE `paymentrcvs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pcategories`
--
ALTER TABLE `pcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `share_settings`
--
ALTER TABLE `share_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
