-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2017 at 01:31 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_pages`
--

CREATE TABLE `active_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `active_pages`
--

INSERT INTO `active_pages` (`id`, `name`, `enabled`) VALUES
(1, 'blog', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `image`, `url`, `time`) VALUES
(1, '', 'BUL-POST_1', 1504765169);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'ঢাকা'),
(2, 'পাবনা '),
(3, 'রাজশাহী ');

-- --------------------------------------------------------

--
-- Table structure for table `confirm_links`
--

CREATE TABLE `confirm_links` (
  `id` int(11) NOT NULL,
  `link` char(32) NOT NULL,
  `for_order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `confirm_links`
--

INSERT INTO `confirm_links` (`id`, `link`, `for_order`) VALUES
(0, '5d74d34e099cca8fd2ad46eef3c48029', 1234),
(0, 'd87135229535a0f5c595179b52450056', 1235);

-- --------------------------------------------------------

--
-- Table structure for table `cookie_law`
--

CREATE TABLE `cookie_law` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `theme` varchar(20) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cookie_law`
--

INSERT INTO `cookie_law` (`id`, `link`, `theme`, `visibility`) VALUES
(1, '', 'light-top', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cookie_law_translations`
--

CREATE TABLE `cookie_law_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `button_text` varchar(50) NOT NULL,
  `learn_more` varchar(50) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cookie_law_translations`
--

INSERT INTO `cookie_law_translations` (`id`, `message`, `button_text`, `learn_more`, `abbr`, `for_id`) VALUES
(1, '', '', '', 'bg', 1),
(2, '', '', '', 'en', 1),
(3, '', '', '', 'gr', 1);

-- --------------------------------------------------------

--
-- Table structure for table `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `valid_from_date` int(10) UNSIGNED NOT NULL,
  `valid_to_date` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-enabled, 0-disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `currencyKey` varchar(5) NOT NULL,
  `flag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `name`, `currency`, `currencyKey`, `flag`) VALUES
(1, 'bg', 'bulgarian', 'лв', 'BGN', 'bg.jpg'),
(2, 'en', 'english', '$', 'USD', 'en.jpg'),
(3, 'gr', 'greece', 'EUR', 'EUR', 'gr.png'),
(4, 'bd', 'bangladesh', 'BDT', 'BDT', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `products` text NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `referrer` varchar(255) NOT NULL,
  `clean_referrer` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `paypal_status` varchar(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'viewed status is change when change processed status',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_code` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `products`, `date`, `referrer`, `clean_referrer`, `payment_type`, `paypal_status`, `processed`, `viewed`, `confirmed`, `discount_code`) VALUES
(1, 1234, 'a:1:{i:2;s:1:\"1\";}', 1504768918, 'Direct', 'Direct', 'cashOnDelivery', NULL, 1, 1, 0, '2563'),
(2, 1235, 'a:2:{i:1;s:1:\"1\";i:2;s:1:\"1\";}', 1513600188, 'Direct', 'Direct', 'cashOnDelivery', NULL, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_clients`
--

CREATE TABLE `orders_clients` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(20) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `for_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_clients`
--

INSERT INTO `orders_clients` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `post_code`, `notes`, `for_id`) VALUES
(0, 'rd', 'rd', 'rdhawladar@gmail.com', '0155454', 'ajalsdjf', 'dhaka', '1216', 'kajd;fajdf', 1),
(0, 'a', 'a', 'admin@gmail.com', '12343', 'a', 'a', 'a', 'a', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder` int(10) UNSIGNED DEFAULT NULL COMMENT 'folder with images',
  `image` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL COMMENT 'time created',
  `time_update` int(10) UNSIGNED NOT NULL COMMENT 'time updated',
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `shop_categorie` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `procurement` int(10) UNSIGNED NOT NULL,
  `in_slider` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `folder`, `image`, `time`, `time_update`, `visibility`, `shop_categorie`, `quantity`, `procurement`, `in_slider`, `url`, `brand_id`, `position`) VALUES
(1, 1504766695, 'CAR3.jpg', 1504766836, 1504768743, 1, 2, 200, 0, 1, '____1', 1, 2),
(2, 1504768473, 'CAR_T_1.png', 1504768534, 1504768800, 1, 3, 299, 1, 1, 'shop-product_2', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seo_pages`
--

CREATE TABLE `seo_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seo_pages`
--

INSERT INTO `seo_pages` (`id`, `name`) VALUES
(1, 'home'),
(2, 'checkout'),
(3, 'contacts'),
(4, 'blog');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `article_id` int(11) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_for` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `sub_for`, `position`) VALUES
(1, 5, 2),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 1, 0),
(10, 0, 0),
(11, 0, 0),
(12, 2, 0),
(13, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribed`
--

CREATE TABLE `subscribed` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribed`
--

INSERT INTO `subscribed` (`id`, `email`, `browser`, `ip`, `time`) VALUES
(1, 'rdhawladar@gmail.com', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '::1', '1504603253'),
(2, 'rdhawladar@gmail.com', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '::1', '1504764911');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `basic_description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `old_price` varchar(20) NOT NULL,
  `abbr` varchar(5) NOT NULL,
  `for_id` int(11) NOT NULL COMMENT ' ',
  `type` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `title`, `description`, `basic_description`, `price`, `old_price`, `abbr`, `for_id`, `type`, `name`) VALUES
(1, '', '', '', '', '', 'bg', 1, 'page', ''),
(2, '', '', '', '', '', 'en', 1, 'page', ''),
(3, 'বুধবার রাত ', '<p>নিহত আজিজুল হক (২৮) মাদারীপুরের রাজৈর উপজেলার বেপারীপাড়ার আবুল বেপারীর ছেলে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>বুধবার রাত সাড়ে ৮টার দিকে কেপটাউন শহরে এ ঘটনা ঘটে বলে তার চাচাত ভাই সুজন হোসেন জানান।</p>\r\n\r\n<p>তিনি বলেন, আজিজুলসহ তার কয়েক ভাই মিলে কেপটাউনের হাংক ওভার পার্ক এলাকায় একটি মুদির দোকান চালাতেন।</p>\r\n\r\n<p>&ldquo;দক্ষিণ অফ্রিকায় থাকা আজিজুলের ছোট ভাই আবু সাইদ ও তার এক খালু বুধবার রাতে আমাদের মোবাইলে ফোন করে আজিজুলকে সন্ত্রাসীরা গুলি করে হত্যা করেছে বলে জনিয়েছেন। &rdquo;</p>\r\n\r\n<p>আজিজুলের বাবা আবুল হোসেন বলেন, &ldquo;আমার ছেলেকে কত কষ্ট করে পরিবারের সুখের আশায় আফ্রিকায় পাঠাইছিলাম। আমার ছেলের লাশ এখন কিভাবে দেশে আইন্না মাটি দেবো।&rdquo;</p>\r\n', '', '', '', 'bg', 1, 'blog', ''),
(4, 'EN POST', '<p>test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;</p>\r\n', '', '', '', 'en', 1, 'blog', ''),
(5, 'GR POST', '<p>test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;test post update.&nbsp;</p>\r\n', '', '', '', 'gr', 1, 'blog', ''),
(6, 'BD POST', '<p>নিহত আজিজুল হক (২৮) মাদারীপুরের রাজৈর উপজেলার বেপারীপাড়ার আবুল বেপারীর ছেলে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>বুধবার রাত সাড়ে ৮টার দিকে কেপটাউন শহরে এ ঘটনা ঘটে বলে তার চাচাত ভাই সুজন হোসেন জানান।</p>\r\n\r\n<p>তিনি বলেন, আজিজুলসহ তার কয়েক ভাই মিলে কেপটাউনের হাংক ওভার পার্ক এলাকায় একটি মুদির দোকান চালাতেন।</p>\r\n\r\n<p>&ldquo;দক্ষিণ অফ্রিকায় থাকা আজিজুলের ছোট ভাই আবু সাইদ ও তার এক খালু বুধবার রাতে আমাদের মোবাইলে ফোন করে আজিজুলকে সন্ত্রাসীরা গুলি করে হত্যা করেছে বলে জনিয়েছেন। &rdquo;</p>\r\n\r\n<p>আজিজুলের বাবা আবুল হোসেন বলেন, &ldquo;আমার ছেলেকে কত কষ্ট করে পরিবারের সুখের আশায় আফ্রিকায় পাঠাইছিলাম। আমার ছেলের লাশ এখন কিভাবে দেশে আইন্না মাটি দেবো।&rdquo;</p>\r\n', '', '', '', 'bd', 1, 'blog', ''),
(20, '', '', '', '', '', 'en', 0, 'page_blog', ''),
(21, '', '', '', '', '', 'gr', 0, 'page_blog', ''),
(22, '', '', '', '', '', 'bd', 0, 'page_blog', ''),
(23, 'দেশি জিনিস ১ ', '<p>দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;</p>\r\n', '', '200', '300', 'bg', 1, 'product', ''),
(7, 'দেশি শপ ', '', '', '', '', 'bg', 0, 'page_home', ''),
(8, '', '', '', '', '', 'en', 0, 'page_home', ''),
(9, '', '', '', '', '', 'gr', 0, 'page_home', ''),
(10, '', '', '', '', '', 'bd', 0, 'page_home', ''),
(11, 'চেক আউট ', '', '', '', '', 'bg', 0, 'page_checkout', ''),
(12, '', '', '', '', '', 'en', 0, 'page_checkout', ''),
(13, '', '', '', '', '', 'gr', 0, 'page_checkout', ''),
(14, '', '', '', '', '', 'bd', 0, 'page_checkout', ''),
(15, '', '', '', '', '', 'bg', 0, 'page_contacts', ''),
(16, '', '', '', '', '', 'en', 0, 'page_contacts', ''),
(17, '', '', '', '', '', 'gr', 0, 'page_contacts', ''),
(18, '', '', '', '', '', 'bd', 0, 'page_contacts', ''),
(19, '', '', '', '', '', 'bg', 0, 'page_blog', ''),
(24, 'দেশি জিনিস ১ ', '<p>দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;</p>\r\n', '', '', '', 'en', 1, 'product', ''),
(25, 'দেশি জিনিস ১ ', '<p>দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;</p>\r\n', '', '', '', 'gr', 1, 'product', ''),
(26, 'দেশি জিনিস ১ ', '<p>দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;দেশি জিনিস ১&nbsp;</p>\r\n', '', '', '', 'bd', 1, 'product', ''),
(31, '', '', '', '', '', 'bg', 1, 'shop_categorie', 'দেশি শপ ক্যাতাক্রি '),
(32, '', '', '', '', '', 'en', 1, 'shop_categorie', ''),
(33, '', '', '', '', '', 'gr', 1, 'shop_categorie', ''),
(34, '', '', '', '', '', 'bd', 1, 'shop_categorie', ''),
(35, '', '', '', '', '', 'bg', 2, 'shop_categorie', ''),
(36, '', '', '', '', '', 'en', 2, 'shop_categorie', ''),
(37, '', '', '', '', '', 'gr', 2, 'shop_categorie', ''),
(38, '', '', '', '', '', 'bd', 2, 'shop_categorie', 'অ্যারও ক্যাতাক্রি '),
(39, '', '', '', '', '', 'bg', 3, 'shop_categorie', 'আরেকটা মজা '),
(40, '', '', '', '', '', 'en', 3, 'shop_categorie', ''),
(41, '', '', '', '', '', 'gr', 3, 'shop_categorie', ''),
(42, '', '', '', '', '', 'bd', 3, 'shop_categorie', ''),
(43, '', '', '', '', '', 'bg', 4, 'shop_categorie', 'অনেক হবে '),
(44, '', '', '', '', '', 'en', 4, 'shop_categorie', ''),
(45, '', '', '', '', '', 'gr', 4, 'shop_categorie', ''),
(46, '', '', '', '', '', 'bd', 4, 'shop_categorie', ''),
(47, '', '', '', '', '', 'bg', 5, 'shop_categorie', 'দুই তিন '),
(48, '', '', '', '', '', 'en', 5, 'shop_categorie', ''),
(49, '', '', '', '', '', 'gr', 5, 'shop_categorie', ''),
(50, '', '', '', '', '', 'bd', 5, 'shop_categorie', ''),
(51, '', '', '', '', '', 'bg', 6, 'shop_categorie', 'চার পাঁচ '),
(52, '', '', '', '', '', 'en', 6, 'shop_categorie', ''),
(53, '', '', '', '', '', 'gr', 6, 'shop_categorie', ''),
(54, '', '', '', '', '', 'bd', 6, 'shop_categorie', ''),
(55, '', '', '', '', '', 'bg', 7, 'shop_categorie', 'ct'),
(56, '', '', '', '', '', 'en', 7, 'shop_categorie', ''),
(57, '', '', '', '', '', 'gr', 7, 'shop_categorie', ''),
(58, '', '', '', '', '', 'bd', 7, 'shop_categorie', ''),
(59, '', '', '', '', '', 'bg', 8, 'shop_categorie', 'সাব '),
(60, '', '', '', '', '', 'en', 8, 'shop_categorie', ''),
(61, '', '', '', '', '', 'gr', 8, 'shop_categorie', ''),
(62, '', '', '', '', '', 'bd', 8, 'shop_categorie', ''),
(63, '', '', '', '', '', 'bg', 9, 'shop_categorie', 'সাবা ১ '),
(64, '', '', '', '', '', 'en', 9, 'shop_categorie', ''),
(65, '', '', '', '', '', 'gr', 9, 'shop_categorie', ''),
(66, '', '', '', '', '', 'bd', 9, 'shop_categorie', ''),
(67, '', '', '', '', '', 'bg', 10, 'shop_categorie', 'সেসি শপ '),
(68, '', '', '', '', '', 'en', 10, 'shop_categorie', ''),
(69, '', '', '', '', '', 'gr', 10, 'shop_categorie', ''),
(70, '', '', '', '', '', 'bd', 10, 'shop_categorie', ''),
(71, '', '', '', '', '', 'bg', 11, 'shop_categorie', 'বুঝি না '),
(72, '', '', '', '', '', 'en', 11, 'shop_categorie', ''),
(73, '', '', '', '', '', 'gr', 11, 'shop_categorie', ''),
(74, '', '', '', '', '', 'bd', 11, 'shop_categorie', ''),
(75, '', '', '', '', '', 'bg', 12, 'shop_categorie', 'টেস্ট '),
(76, '', '', '', '', '', 'en', 12, 'shop_categorie', ''),
(77, '', '', '', '', '', 'gr', 12, 'shop_categorie', ''),
(78, '', '', '', '', '', 'bd', 12, 'shop_categorie', ''),
(79, '', '', '', '', '', 'bg', 13, 'shop_categorie', 'সদফাদফফ '),
(80, '', '', '', '', '', 'en', 13, 'shop_categorie', ''),
(81, '', '', '', '', '', 'gr', 13, 'shop_categorie', ''),
(82, '', '', '', '', '', 'bd', 13, 'shop_categorie', ''),
(83, 'দেশি প্রকাক্ত ', '<p>দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;</p>\r\n', '<p>দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;দেশি প্রকাক্ত&nbsp;</p>\r\n', '500', '', 'bg', 2, 'product', ''),
(84, '', '', '', '', '', 'en', 2, 'product', ''),
(85, '', '', '', '', '', 'gr', 2, 'product', ''),
(86, '', '', '', '', '', 'bd', 2, 'product', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'notifications by email',
  `last_login` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `notify`, `last_login`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'your@email.com', 5, 1504764964),
(2, 'rd', '81dc9bdb52d04dc20036dbd8313ed055', 'rdhawladar@gmail.com', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `value_store`
--

CREATE TABLE `value_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `thekey` varchar(50) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `value_store`
--

INSERT INTO `value_store` (`id`, `thekey`, `value`) VALUES
(1, 'sitelogo', 'CAR1.png'),
(2, 'navitext', 'দেশি দোকান  '),
(3, 'footercopyright', 'Powered by দেহি শপ  © All right reserved. '),
(4, 'contactspage', '<p>দেশি দোকান &nbsp;দেশি দোকান &nbsp;দেশি দোকান &nbsp;দেশি দোকান &nbsp;</p>\r\n'),
(5, 'footerContactAddr', 'ঢাকা মিরপুর '),
(6, 'footerContactEmail', 'rd@shop.dev'),
(7, 'footerContactPhone', '013254687'),
(8, 'googleMaps', '51.508742,-0.120850'),
(9, 'footerAboutUs', ''),
(10, 'footerSocialFacebook', ''),
(11, 'footerSocialTwitter', ''),
(12, 'footerSocialGooglePlus', ''),
(13, 'footerSocialPinterest', ''),
(14, 'footerSocialYoutube', ''),
(16, 'contactsEmailTo', 'contacts@shop.dev'),
(17, 'shippingOrder', '2'),
(18, 'addJs', ''),
(19, 'publicQuantity', '1'),
(20, 'paypal_email', ''),
(21, 'paypal_sandbox', '0'),
(22, 'paypal_currency', 'EUR'),
(23, 'publicDateAdded', '1'),
(24, 'googleApi', 'AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU'),
(25, 'template', 'redlabel'),
(26, 'cashondelivery_visibility', '1'),
(27, 'showBrands', '1'),
(28, 'showInSlider', '1'),
(29, 'codeDiscounts', '1'),
(30, 'moreInfoBtn', '1'),
(31, 'outOfStock', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_pages`
--
ALTER TABLE `active_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_law`
--
ALTER TABLE `cookie_law`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`abbr`,`for_id`) USING BTREE;

--
-- Indexes for table `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_pages`
--
ALTER TABLE `seo_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribed`
--
ALTER TABLE `subscribed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `art_id_abbr` (`abbr`,`for_id`,`type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `value_store`
--
ALTER TABLE `value_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`thekey`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_pages`
--
ALTER TABLE `active_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cookie_law`
--
ALTER TABLE `cookie_law`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cookie_law_translations`
--
ALTER TABLE `cookie_law_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `seo_pages`
--
ALTER TABLE `seo_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `subscribed`
--
ALTER TABLE `subscribed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `value_store`
--
ALTER TABLE `value_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
