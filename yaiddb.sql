-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2019 at 11:30 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yaiddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crons`
--

CREATE TABLE `crons` (
  `id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  `sort` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crons`
--

INSERT INTO `crons` (`id`, `active`, `sort`, `name`, `file`, `createdby`, `created`, `modified`) VALUES
(1, 0, 100, 'Auto-Backup', 'backup.php', 1, '2017-09-16 07:49:22', '2017-11-11 20:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `crons_logs`
--

CREATE TABLE `crons_logs` (
  `id` int(11) NOT NULL,
  `cron_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  `debug_level` int(1) NOT NULL DEFAULT 0,
  `isSMTP` int(1) NOT NULL DEFAULT 0,
  `isHTML` varchar(5) NOT NULL DEFAULT 'true',
  `useSMTPauth` varchar(6) NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `website_name`, `smtp_server`, `smtp_port`, `email_login`, `email_pass`, `from_name`, `from_email`, `transport`, `verify_url`, `email_act`, `debug_level`, `isSMTP`, `isHTML`, `useSMTPauth`) VALUES
(1, 'Yateem Aid', 'smtp.gmail.com', 587, 'yourEmail@gmail.com', '1234', 'User Spice', 'yourEmail@gmail.com', 'tls', 'http://localhost/43', 0, 0, 0, 'true', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `fb_formbuilder`
--

CREATE TABLE `fb_formbuilder` (
  `id` int(11) NOT NULL,
  `form` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fb_formbuilder`
--

INSERT INTO `fb_formbuilder` (`id`, `form`) VALUES
(2, 'fb_settings'),
(3, 'ya_yateeminfo_01'),
(5, 'ya_kafilinfo_01'),
(6, 'ya_kafalahinfo_01');

-- --------------------------------------------------------

--
-- Table structure for table `fb_javascript`
--

CREATE TABLE `fb_javascript` (
  `id` int(11) NOT NULL,
  `div_class1` varchar(255) DEFAULT NULL,
  `div_class2` varchar(255) DEFAULT NULL,
  `label_class` varchar(255) DEFAULT NULL,
  `input_class` varchar(255) DEFAULT NULL,
  `type_html` varchar(255) DEFAULT NULL,
  `submit_new` varchar(255) DEFAULT NULL,
  `install_check` int(11) DEFAULT NULL,
  `fb_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fb_javascript_fb_fields`
--

CREATE TABLE `fb_javascript_fb_fields` (
  `id` int(11) NOT NULL,
  `fb_order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` text NOT NULL,
  `field_html` text NOT NULL,
  `requirements` text NOT NULL,
  `databasevalue` varchar(255) DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `database_value` varchar(255) DEFAULT NULL,
  `database_where` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fb_settings`
--

CREATE TABLE `fb_settings` (
  `id` int(11) NOT NULL,
  `div_class1` varchar(255) DEFAULT NULL,
  `div_class2` varchar(255) DEFAULT NULL,
  `label_class` varchar(255) DEFAULT NULL,
  `input_class` varchar(255) DEFAULT NULL,
  `type_html` varchar(255) DEFAULT NULL,
  `submit_new` varchar(255) DEFAULT NULL,
  `install_check` int(11) DEFAULT NULL,
  `fb_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fb_settings`
--

INSERT INTO `fb_settings` (`id`, `div_class1`, `div_class2`, `label_class`, `input_class`, `type_html`, `submit_new`, `install_check`, `fb_version`) VALUES
(1, 'form-row', 'form-group', 'form-group', 'form-control', NULL, 'false', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `fb_settings_fb_fields`
--

CREATE TABLE `fb_settings_fb_fields` (
  `id` int(11) NOT NULL,
  `fb_order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` text NOT NULL,
  `field_html` text NOT NULL,
  `requirements` text NOT NULL,
  `databasevalue` varchar(255) DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `database_value` varchar(255) DEFAULT NULL,
  `database_where` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fb_settings_fb_fields`
--

INSERT INTO `fb_settings_fb_fields` (`id`, `fb_order`, `name`, `field_type`, `field_html`, `requirements`, `databasevalue`, `database_name`, `database_value`, `database_where`) VALUES
(1, 1, 'div_class1', 'text', '{\"div_class2\":\"form-group\",\"label\":\"div Class1: (DEFAULT)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"input_step\":\"\"}', '', NULL, NULL, NULL, NULL),
(2, 2, 'div_class2', 'text', '{\"div_class2\":\"form-group\",\"label\":\"div Class2: (DEFAULT)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"input_step\":\"\"}', '', NULL, NULL, NULL, NULL),
(3, 3, 'label_class', 'text', '{\"div_class2\":\"form-group\",\"label\":\"Label Class: (DEFAULT)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"input_step\":\"\"}', '', NULL, NULL, NULL, NULL),
(4, 4, 'input_class', 'text', '{\"div_class2\":\"form-group\",\"label\":\"Input Class: (DEFAULT)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"input_step\":\"\"}', '', NULL, NULL, NULL, NULL),
(5, 5, 'type_html', 'text', '{\"div_class2\":\"form-group\",\"label\":\"Type HTML: (DEFAULT)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"input_step\":\"\"}', '', NULL, NULL, NULL, NULL),
(6, 6, 'submit_new', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"When Creating Form, On Submit: Exit?\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '', '[{\"id\":\"true\",\"value\":\"Yes\"},{\"id\":\"false\",\"value\":\"No\"}]', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_menus`
--

CREATE TABLE `groups_menus` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_menus`
--

INSERT INTO `groups_menus` (`id`, `group_id`, `menu_id`) VALUES
(30, 2, 9),
(29, 0, 8),
(28, 0, 7),
(27, 0, 21),
(5, 0, 3),
(6, 0, 1),
(7, 0, 2),
(8, 0, 51),
(9, 0, 52),
(10, 0, 37),
(11, 0, 38),
(12, 2, 39),
(13, 2, 40),
(14, 2, 41),
(15, 2, 42),
(16, 2, 43),
(17, 2, 44),
(18, 2, 45),
(19, 0, 46),
(20, 0, 47),
(21, 0, 49),
(26, 0, 20),
(25, 0, 18),
(31, 2, 10),
(32, 2, 11),
(33, 2, 12),
(34, 2, 13),
(35, 2, 14),
(36, 2, 15),
(37, 0, 16),
(38, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(3) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logtype` varchar(25) NOT NULL,
  `lognote` text NOT NULL,
  `ip` varchar(75) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logdate`, `logtype`, `lognote`, `ip`) VALUES
(1, 1, '2019-09-03 08:08:25', 'System Updates', 'Inserted ip to logs table', '127.0.0.1'),
(2, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 2ZB9mg1l0JXe successfully deployed.', '127.0.0.1'),
(3, 1, '2019-09-03 08:08:25', 'System Updates', 'Update B9t6He7qmFXa successfully deployed.', '127.0.0.1'),
(4, 1, '2019-09-03 08:08:25', 'System Updates', 'Updated group_menu int columns to 11 and unsigned', '127.0.0.1'),
(5, 1, '2019-09-03 08:08:25', 'System Updates', 'Updated users int columns to 11 and unsigned', '127.0.0.1'),
(6, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 86FkFVV4TGRg successfully deployed.', '127.0.0.1'),
(7, 1, '2019-09-03 08:08:25', 'System Updates', 'Added default language to settings table', '127.0.0.1'),
(8, 1, '2019-09-03 08:08:25', 'System Updates', 'Added default language to settings table', '127.0.0.1'),
(9, 1, '2019-09-03 08:08:25', 'System Updates', 'Added language info to settings table', '127.0.0.1'),
(10, 1, '2019-09-03 08:08:25', 'System Updates', 'Added default language to settings table', '127.0.0.1'),
(11, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(12, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(13, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(14, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(15, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(16, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(17, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(18, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(19, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(20, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(21, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(22, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(23, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(24, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(25, 1, '2019-09-03 08:08:25', 'System Updates', 'Update y4A1Y0u9n2Rt successfully deployed.', '127.0.0.1'),
(26, 1, '2019-09-03 08:08:25', 'System Updates', 'Modified menus for multilanguage', '127.0.0.1'),
(27, 1, '2019-09-03 08:08:25', 'System Updates', 'Update Tm5xY22MM8eC successfully deployed.', '127.0.0.1'),
(28, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 0YXdrInkjV86F successfully deployed.', '127.0.0.1'),
(29, 1, '2019-09-03 08:08:25', 'System Updates', 'Added us_plugin_hooks table', '127.0.0.1'),
(30, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 99plgnkjV86 successfully deployed.', '127.0.0.1'),
(31, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 0DaShInkjV86 successfully deployed.', '127.0.0.1'),
(32, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 0DaShInkjVz1 successfully deployed.', '127.0.0.1'),
(33, 1, '2019-09-03 08:08:25', 'System Updates', 'Added column for spice shaker', '127.0.0.1'),
(34, 1, '2019-09-03 08:08:25', 'System Updates', 'Update y4A1Y0u9n2SS successfully deployed.', '127.0.0.1'),
(35, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 0DaShInkjV87 successfully deployed.', '127.0.0.1'),
(36, 1, '2019-09-03 08:08:25', 'System Updates', 'Update 0DaShInkjV88 successfully deployed.', '127.0.0.1'),
(37, 1, '2019-09-03 08:08:43', 'User', 'User logged in.', NULL),
(38, 1, '2019-09-03 08:10:03', 'Pages Manager', 'Added 1 permission(s) to ysys/addnew.php.', '127.0.0.1'),
(39, 1, '2019-09-03 08:10:12', 'Pages Manager', 'Added 1 permission(s) to ysys/index.php.', '127.0.0.1'),
(40, 1, '2019-09-03 08:11:11', 'User', 'Changed fname from The to ???? ??????.', '127.0.0.1'),
(41, 1, '2019-09-03 08:11:12', 'User', 'Changed email from userspicephp@userspice.com to almohseneen.it@gmail.com.', '127.0.0.1'),
(42, 1, '2019-09-03 08:15:02', 'USPlugins', 'formbuilder installed', '127.0.0.1'),
(43, 1, '2019-09-03 08:15:08', 'USPlugins', 'formbuilder Activated', '127.0.0.1'),
(44, 1, '2019-09-04 07:45:57', 'Email Settings', 'Updated website_name from User Spice to Yateem Aid.', '::1'),
(45, 1, '2019-09-05 06:57:09', 'System Updates', 'Inserted announcements checker to settings table', '::1'),
(46, 1, '2019-09-05 06:57:09', 'System Updates', 'Update 2019-09-04a successfully deployed.', '::1'),
(47, 1, '2019-09-05 08:32:45', 'Pages Manager', 'Added 1 permission(s) to ysys/yateem_addnew.php.', '::1'),
(48, 1, '2019-09-07 05:11:19', 'User', 'User logged in.', NULL),
(49, 1, '2019-09-07 05:56:53', 'System Updates', 'Update 2019-09-05c successfully deployed.', '::1'),
(50, 1, '2019-09-07 08:38:50', 'Pages Manager', 'Added 1 permission(s) to ysys/kafil_addnew.php.', '::1'),
(51, 1, '2019-09-07 08:39:01', 'Pages Manager', 'Added 1 permission(s) to ysys/kafil_viewall.php.', '::1'),
(52, 1, '2019-09-07 08:48:00', 'Pages Manager', 'Added 1 permission(s) to ysys/kafalah_addnew.php.', '::1'),
(53, 1, '2019-09-07 08:48:09', 'Pages Manager', 'Added 1 permission(s) to ysys/kafalah_viewall.php.', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `logs_exempt`
--

CREATE TABLE `logs_exempt` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `parent` int(10) NOT NULL,
  `dropdown` int(1) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `display_order` int(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `parent`, `dropdown`, `logged_in`, `display_order`, `label`, `link`, `icon_class`) VALUES
(1, 'main', 2, 0, 1, 1, '{{home}}', '', 'fa fa-fw fa-home'),
(2, 'main', -1, 1, 1, 14, '', '', 'fa fa-fw fa-cogs'),
(3, 'main', -1, 0, 1, 11, '{{username}}', 'users/account.php', 'fa fa-fw fa-user'),
(4, 'main', -1, 1, 0, 3, '{{help}}', '', 'fa fa-fw fa-life-ring'),
(5, 'main', -1, 0, 0, 2, '{{register}}', 'users/join.php', 'fa fa-fw fa-plus-square'),
(6, 'main', -1, 0, 0, 1, '{{login}}', 'users/login.php', 'fa fa-fw fa-sign-in'),
(7, 'main', 2, 0, 1, 2, '{{account}}', 'users/account.php', 'fa fa-fw fa-user'),
(8, 'main', 2, 0, 1, 3, '{{hr}}', '', ''),
(9, 'main', 2, 0, 1, 4, '{{dashboard}}', 'users/admin.php', 'fa fa-fw fa-cogs'),
(10, 'main', 2, 0, 1, 5, '{{users}}', 'users/admin.php?view=users', 'fa fa-fw fa-user'),
(11, 'main', 2, 0, 1, 6, '{{perms}}', 'users/admin.php?view=permissions', 'fa fa-fw fa-lock'),
(12, 'main', 2, 0, 1, 7, '{{pages}}', 'users/admin.php?view=pages', 'fa fa-fw fa-wrench'),
(13, 'main', 2, 0, 1, 9, '{{logs}}', 'users/admin.php?view=logs', 'fa fa-fw fa-search'),
(14, 'main', 2, 0, 1, 10, '{{hr}}', '', ''),
(15, 'main', 2, 0, 1, 11, '{{logout}}', 'users/logout.php', 'fa fa-fw fa-sign-out'),
(16, 'main', -1, 0, 0, 0, '{{home}}', '', 'fa fa-fw fa-home'),
(17, 'main', -1, 0, 1, 10, '{{home}}', '', 'fa fa-fw fa-home'),
(18, 'main', 4, 0, 0, 1, '{{forgot}}', 'users/forgot_password.php', 'fa fa-fw fa-wrench'),
(20, 'main', 4, 0, 0, 99999, '{{resend}}', 'users/verify_resend.php', 'fa fa-exclamation-triangle');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `msg_from`, `msg_to`, `msg_body`, `msg_read`, `msg_thread`, `deleted`, `sent_on`) VALUES
(1, 1, 2, '&lt;p&gt;fgds&lt;/p&gt;', 0, 1, 0, '2017-08-06 00:13:47'),
(2, 1, 2, '&lt;p&gt;Did it work?&lt;/p&gt;', 0, 2, 0, '2017-09-09 15:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `archive_from` int(1) NOT NULL DEFAULT 0,
  `archive_to` int(1) NOT NULL DEFAULT 0,
  `hidden_from` int(1) NOT NULL DEFAULT 0,
  `hidden_to` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_threads`
--

INSERT INTO `message_threads` (`id`, `msg_to`, `msg_from`, `msg_subject`, `last_update`, `last_update_by`, `archive_from`, `archive_to`, `hidden_from`, `hidden_to`) VALUES
(1, 2, 1, 'Testiing123', '2017-08-06 00:13:47', 1, 0, 0, 0, 0),
(2, 2, 1, 'Testing Message Badge', '2017-09-09 15:10:09', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `class` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `private` int(11) NOT NULL DEFAULT 0,
  `re_auth` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page`, `title`, `private`, `re_auth`) VALUES
(1, 'index.php', 'Home', 0, 0),
(2, 'z_us_root.php', '', 0, 0),
(3, 'users/account.php', 'Account Dashboard', 1, 0),
(4, 'users/admin.php', 'Admin Dashboard', 1, 0),
(5, 'users/admin_page.php', 'Pages Manager', 1, 0),
(6, 'users/admin_pages.php', 'Pages Manager', 1, 0),
(7, 'users/admin_permission.php', 'Permissions Manager', 1, 0),
(8, 'users/admin_permissions.php', 'Permissions Manager', 1, 0),
(9, 'users/admin_user.php', 'User Manager', 1, 0),
(10, 'users/admin_users.php', 'User Manager', 1, 1),
(11, 'users/edit_profile.php', 'Edit Profile', 1, 0),
(12, 'users/email_settings.php', 'Email Settings', 1, 0),
(13, 'users/email_test.php', 'Email Test', 1, 0),
(14, 'users/forgot_password.php', 'Forgotten Password', 0, 0),
(15, 'users/forgot_password_reset.php', 'Reset Forgotten Password', 0, 0),
(16, 'users/index.php', 'Home', 0, 0),
(17, 'users/init.php', '', 0, 0),
(18, 'users/join.php', 'Join', 0, 0),
(19, 'users/joinThankYou.php', 'Join', 0, 0),
(20, 'users/login.php', 'Login', 0, 0),
(21, 'users/logout.php', 'Logout', 0, 0),
(22, 'users/profile.php', 'Profile', 1, 0),
(23, 'users/times.php', '', 0, 0),
(24, 'users/user_settings.php', 'User Settings', 1, 0),
(25, 'users/verify.php', 'Account Verification', 0, 0),
(26, 'users/verify_resend.php', 'Account Verification', 0, 0),
(27, 'users/view_all_users.php', 'View All Users', 1, 0),
(28, 'usersc/empty.php', '', 0, 0),
(31, 'users/oauth_success.php', '', 0, 0),
(33, 'users/fb-callback.php', '', 0, 0),
(37, 'users/check_updates.php', 'Check For Updates', 1, 0),
(38, 'users/google_helpers.php', '', 0, 0),
(39, 'users/tomfoolery.php', 'Security Log', 1, 0),
(44, 'users/admin_backup.php', 'Backup Manager', 1, 0),
(45, 'users/maintenance.php', 'Maintenance', 0, 0),
(47, 'users/mqtt_settings.php', 'MQTT Settings', 1, 0),
(49, 'users/admin_verify.php', 'Password Verification', 1, 0),
(50, 'users/cron_manager.php', 'Cron Manager', 1, 0),
(51, 'users/cron_post.php', '', 1, 0),
(55, 'users/admin_logs.php', 'Logs Manager', 1, 0),
(56, 'users/admin_logs_exempt.php', 'Logs Manager', 1, 0),
(57, 'users/admin_logs_manager.php', 'Logs Manager', 1, 0),
(58, 'users/admin_logs_mapper.php', 'Logs Manager', 1, 0),
(68, 'users/update.php', 'Update Manager', 1, 0),
(69, 'users/admin_menu_item.php', 'Menu Manager', 1, 0),
(70, 'users/admin_menus.php', 'Menu Manager', 1, 0),
(71, 'users/admin_menu.php', 'Menu Manager', 1, 0),
(72, 'users/admin_ips.php', 'IP Manager', 1, 0),
(73, 'users/subscribe.php', '', 1, 0),
(74, 'users/admin_notifications.php', 'Notifications Manager', 1, 0),
(76, 'users/enable2fa.php', 'Enable 2 Factor Auth', 1, 0),
(77, 'users/disable2fa.php', 'Disable 2 Factor Auth', 1, 0),
(78, 'users/admin_forms.php', 'Form Manager', 1, 0),
(79, 'users/admin_form_views.php', 'Form View Manager', 1, 0),
(80, 'users/edit_form.php', 'Form Editor', 1, 0),
(81, 'users/admin_pin.php', 'Verification PIN Set', 1, 0),
(82, 'users/manage2fa.php', 'Manage Two FA', 1, 0),
(83, 'users/manage_sessions.php', 'Session Manager', 1, 0),
(84, 'users/admin_manage_sessions.php', 'Session Administrator', 1, 1),
(85, 'runme.php', '', 1, 0),
(86, 'users/SSP.php', '', 1, 0),
(87, 'users/features.ini.php', '', 1, 0),
(88, 'users/loader.php', '', 1, 0),
(89, 'users/twofa.php', '', 1, 0),
(90, 'ysys/addnew.php', '', 1, 0),
(91, 'ysys/index.php', '', 1, 0),
(92, 'ysys/yateem_addnew.php', '', 1, 0),
(93, 'ysys/kafil_addnew.php', '', 1, 0),
(94, 'ysys/kafil_viewall.php', '', 1, 0),
(95, 'ysys/kafalah_addnew.php', '', 1, 0),
(96, 'ysys/kafalah_viewall.php', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `permission_page_matches`
--

CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_page_matches`
--

INSERT INTO `permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(2, 2, 27),
(3, 1, 24),
(4, 1, 22),
(5, 2, 13),
(6, 2, 12),
(7, 1, 11),
(8, 2, 10),
(9, 2, 9),
(10, 2, 8),
(11, 2, 7),
(12, 2, 6),
(13, 2, 5),
(14, 2, 4),
(15, 1, 3),
(16, 2, 37),
(17, 2, 39),
(19, 2, 40),
(21, 2, 41),
(23, 2, 42),
(27, 1, 42),
(28, 1, 27),
(29, 1, 41),
(30, 1, 40),
(31, 2, 44),
(32, 2, 47),
(33, 2, 51),
(34, 2, 50),
(35, 2, 49),
(36, 2, 53),
(37, 2, 52),
(38, 2, 68),
(39, 2, 55),
(40, 2, 56),
(41, 2, 71),
(42, 2, 58),
(43, 2, 57),
(44, 2, 53),
(45, 2, 74),
(46, 2, 75),
(47, 1, 75),
(48, 1, 76),
(49, 2, 76),
(50, 1, 77),
(51, 2, 77),
(52, 2, 78),
(53, 2, 80),
(54, 1, 81),
(55, 1, 82),
(56, 1, 83),
(57, 2, 84),
(58, 1, 90),
(59, 1, 91),
(60, 1, 92),
(61, 1, 93),
(62, 1, 94),
(63, 1, 95),
(64, 1, 96);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`) VALUES
(1, 1, '&lt;h1&gt;This is the Admin&#039;s bio.&lt;/h1&gt;'),
(2, 2, 'This is your bio');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(50) NOT NULL,
  `recaptcha` int(1) NOT NULL DEFAULT 0,
  `force_ssl` int(1) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT 0,
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `backup_dest` varchar(255) NOT NULL,
  `backup_source` varchar(255) NOT NULL,
  `backup_table` varchar(255) NOT NULL,
  `msg_notification` int(1) NOT NULL,
  `permission_restriction` int(1) NOT NULL,
  `auto_assign_un` int(1) NOT NULL,
  `page_permission_restriction` int(1) NOT NULL,
  `msg_blocked_users` int(1) NOT NULL,
  `msg_default_to` int(1) NOT NULL,
  `notifications` int(1) NOT NULL,
  `notif_daylimit` int(3) NOT NULL,
  `recap_public` varchar(100) NOT NULL,
  `recap_private` varchar(100) NOT NULL,
  `page_default_private` int(1) NOT NULL,
  `navigation_type` tinyint(1) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `custom_settings` int(1) NOT NULL,
  `system_announcement` varchar(255) NOT NULL,
  `twofa` int(1) DEFAULT 0,
  `force_notif` tinyint(1) DEFAULT NULL,
  `cron_ip` varchar(255) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `join_vericode_expiry` int(9) UNSIGNED NOT NULL,
  `reset_vericode_expiry` int(9) UNSIGNED NOT NULL,
  `admin_verify` tinyint(1) NOT NULL,
  `admin_verify_timeout` int(9) NOT NULL,
  `session_manager` tinyint(1) NOT NULL,
  `template` varchar(255) DEFAULT 'standard',
  `saas` tinyint(1) DEFAULT NULL,
  `redirect_uri_after_login` text DEFAULT NULL,
  `show_tos` tinyint(1) DEFAULT 1,
  `default_language` varchar(11) DEFAULT NULL,
  `allow_language` tinyint(1) DEFAULT NULL,
  `spice_api` varchar(75) DEFAULT NULL,
  `announce` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `recaptcha`, `force_ssl`, `css_sample`, `us_css1`, `us_css2`, `us_css3`, `site_name`, `language`, `track_guest`, `site_offline`, `force_pr`, `glogin`, `fblogin`, `gid`, `gsecret`, `gredirect`, `ghome`, `fbid`, `fbsecret`, `fbcallback`, `graph_ver`, `finalredir`, `req_cap`, `req_num`, `min_pw`, `max_pw`, `min_un`, `max_un`, `messaging`, `snooping`, `echouser`, `wys`, `change_un`, `backup_dest`, `backup_source`, `backup_table`, `msg_notification`, `permission_restriction`, `auto_assign_un`, `page_permission_restriction`, `msg_blocked_users`, `msg_default_to`, `notifications`, `notif_daylimit`, `recap_public`, `recap_private`, `page_default_private`, `navigation_type`, `copyright`, `custom_settings`, `system_announcement`, `twofa`, `force_notif`, `cron_ip`, `registration`, `join_vericode_expiry`, `reset_vericode_expiry`, `admin_verify`, `admin_verify_timeout`, `session_manager`, `template`, `saas`, `redirect_uri_after_login`, `show_tos`, `default_language`, `allow_language`, `spice_api`, `announce`) VALUES
(1, 0, 0, 0, '../users/css/color_schemes/bootstrap.min.css', '../users/css/sb-admin.css', '../users/css/custom.css', 'مساعد اليتيم', 'en', 1, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', 0, 0, 6, 30, 4, 30, 0, 1, 0, 1, 0, '/', 'everything', '', 0, 0, 0, 0, 0, 1, 0, 7, '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI', '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe', 1, 1, 'Khalid Dhafir', 1, '', 0, 0, 'off', 1, 24, 15, 1, 120, 0, 'standard', NULL, NULL, 1, 'ar-EG', 1, NULL, '2019-09-07 08:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `migration` varchar(15) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_skipped` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `migration`, `applied_on`, `update_skipped`) VALUES
(15, '1XdrInkjV86F', '2018-02-18 22:33:24', NULL),
(16, '3GJYaKcqUtw7', '2018-04-25 16:51:08', NULL),
(17, '3GJYaKcqUtz8', '2018-04-25 16:51:08', NULL),
(18, '69qa8h6E1bzG', '2018-04-25 16:51:08', NULL),
(19, '2XQjsKYJAfn1', '2018-04-25 16:51:08', NULL),
(20, '549DLFeHMNw7', '2018-04-25 16:51:08', NULL),
(21, '4Dgt2XVjgz2x', '2018-04-25 16:51:08', NULL),
(22, 'VLBp32gTWvEo', '2018-04-25 16:51:08', NULL),
(23, 'Q3KlhjdtxE5X', '2018-04-25 16:51:08', NULL),
(24, 'ug5D3pVrNvfS', '2018-04-25 16:51:08', NULL),
(25, '69FbVbv4Jtrz', '2018-04-25 16:51:09', NULL),
(26, '4A6BdJHyvP4a', '2018-04-25 16:51:09', NULL),
(27, '37wvsb5BzymK', '2018-04-25 16:51:09', NULL),
(28, 'c7tZQf926zKq', '2018-04-25 16:51:09', NULL),
(29, 'ockrg4eU33GP', '2018-04-25 16:51:09', NULL),
(30, 'XX4zArPs4tor', '2018-04-25 16:51:09', NULL),
(31, 'pv7r2EHbVvhD', '2018-04-26 00:00:00', NULL),
(32, 'uNT7NpgcBDFD', '2018-04-26 00:00:00', NULL),
(33, 'mS5VtQCZjyJs', '2018-12-11 14:19:16', NULL),
(34, '23rqAv5elJ3G', '2018-12-11 14:19:51', NULL),
(35, 'qPEARSh49fob', '2019-01-01 12:01:01', NULL),
(36, 'FyMYJ2oeGCTX', '2019-01-01 12:01:01', NULL),
(37, 'iit5tHSLatiS', '2019-01-01 12:01:01', NULL),
(38, 'hcA5B3PLhq6E', '2019-09-03 08:08:25', NULL),
(39, 'VNEno3E4zaNz', '2019-09-03 08:08:25', NULL),
(40, '2ZB9mg1l0JXe', '2019-09-03 08:08:25', NULL),
(41, 'B9t6He7qmFXa', '2019-09-03 08:08:25', NULL),
(42, '86FkFVV4TGRg', '2019-09-03 08:08:25', NULL),
(43, 'y4A1Y0u9n2Rt', '2019-09-03 08:08:25', NULL),
(44, 'Tm5xY22MM8eC', '2019-09-03 08:08:25', NULL),
(45, '0YXdrInkjV86F', '2019-09-03 08:08:25', NULL),
(46, '99plgnkjV86', '2019-09-03 08:08:25', NULL),
(47, '0DaShInkjV86', '2019-09-03 08:08:25', NULL),
(48, '0DaShInkjVz1', '2019-09-03 08:08:25', NULL),
(49, 'y4A1Y0u9n2SS', '2019-09-03 08:08:25', NULL),
(50, '0DaShInkjV87', '2019-09-03 08:08:25', NULL),
(51, '0DaShInkjV88', '2019-09-03 08:08:25', NULL),
(52, '2019-09-04a', '2019-09-05 06:57:09', NULL),
(53, '2019-09-05c', '2019-09-07 05:56:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `email_new` varchar(155) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `logins` int(11) UNSIGNED NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `company` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0,
  `vericode` varchar(15) NOT NULL,
  `active` int(1) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `msg_exempt` int(1) NOT NULL DEFAULT 0,
  `last_confirm` datetime DEFAULT NULL,
  `protected` int(1) NOT NULL DEFAULT 0,
  `dev_user` int(1) NOT NULL DEFAULT 0,
  `msg_notification` int(1) NOT NULL DEFAULT 1,
  `force_pr` int(1) NOT NULL DEFAULT 0,
  `twoKey` varchar(16) DEFAULT NULL,
  `twoEnabled` int(1) DEFAULT 0,
  `twoDate` datetime DEFAULT NULL,
  `cloak_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `org` int(11) DEFAULT NULL,
  `account_mgr` int(11) DEFAULT 0,
  `oauth_tos_accepted` tinyint(1) DEFAULT NULL,
  `vericode_expiry` datetime DEFAULT NULL,
  `language` varchar(255) DEFAULT 'en-US'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_new`, `username`, `password`, `pin`, `fname`, `lname`, `permissions`, `logins`, `account_owner`, `account_id`, `company`, `join_date`, `last_login`, `email_verified`, `vericode`, `active`, `oauth_provider`, `oauth_uid`, `gender`, `locale`, `gpluslink`, `picture`, `created`, `modified`, `fb_uid`, `un_changed`, `msg_exempt`, `last_confirm`, `protected`, `dev_user`, `msg_notification`, `force_pr`, `twoKey`, `twoEnabled`, `twoDate`, `cloak_allowed`, `org`, `account_mgr`, `oauth_tos_accepted`, `vericode_expiry`, `language`) VALUES
(1, 'almohseneen.it@gmail.com', NULL, 'admin', '$2y$12$1v06jm2KMOXuuo3qP7erTuTIJFOnzhpds1Moa8BadnUUeX0RV3ex.', NULL, 'مدير النظام', 'Admin', 1, 2, 1, 0, 'UserSpice', '2016-01-01 00:00:00', '2019-09-07 08:11:19', 1, 'nlPsJDtyeqFWsS', 0, '', '', '', '', '', '', '0000-00-00 00:00:00', '1899-11-30 00:00:00', '', 0, 1, '2017-10-08 15:24:37', 1, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 'ar-EG'),
(2, 'noreply@userspice.com', NULL, 'user', '$2y$12$HZa0/d7evKvuHO8I3U8Ff.pOjJqsGTZqlX8qURratzP./EvWetbkK', NULL, 'Sample', 'User', 1, 0, 1, 0, 'none', '2016-01-02 00:00:00', '2017-10-08 15:47:41', 1, '2ENJN4xD8nnjOgk', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, NULL, 0, 0, 1, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 'en-US');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `ip`, `timestamp`, `user_id`, `session`) VALUES
(1, '::1', '1544553219', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_matches`
--

CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permission_matches`
--

INSERT INTO `user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(100, 1, 1),
(101, 1, 2),
(102, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `us_announcements`
--

CREATE TABLE `us_announcements` (
  `id` int(11) NOT NULL,
  `dismissed` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `ignore` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_announcements`
--

INSERT INTO `us_announcements` (`id`, `dismissed`, `link`, `title`, `message`, `ignore`, `class`) VALUES
(1, 3, 'https://www.userspice.com/updates', 'New Version', 'December 11, 2018 - Thank you for trying UserSpice Beta!', '4.5.0', 'warning');

-- --------------------------------------------------------

--
-- Table structure for table `us_fingerprints`
--

CREATE TABLE `us_fingerprints` (
  `kFingerprintID` int(11) UNSIGNED NOT NULL,
  `fkUserID` int(11) NOT NULL,
  `Fingerprint` varchar(32) NOT NULL,
  `Fingerprint_Expiry` datetime NOT NULL,
  `Fingerprint_Added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_fingerprint_assets`
--

CREATE TABLE `us_fingerprint_assets` (
  `kFingerprintAssetID` int(11) UNSIGNED NOT NULL,
  `fkFingerprintID` int(11) NOT NULL,
  `IP_Address` varchar(255) NOT NULL,
  `User_Browser` varchar(255) NOT NULL,
  `User_OS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_forms`
--

CREATE TABLE `us_forms` (
  `id` int(11) NOT NULL,
  `form` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_form_validation`
--

CREATE TABLE `us_form_validation` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_form_validation`
--

INSERT INTO `us_form_validation` (`id`, `value`, `description`, `params`) VALUES
(1, 'min', 'Minimum # of Characters', 'number'),
(2, 'max', 'Maximum # of Characters', 'number'),
(3, 'is_numeric', 'Must be a number', 'true'),
(4, 'valid_email', 'Must be a valid email address', 'true'),
(5, '<', 'Must be a number less than', 'number'),
(6, '>', 'Must be a number greater than', 'number'),
(7, '<=', 'Must be a number less than or equal to', 'number'),
(8, '>=', 'Must be a number greater than or equal to', 'number'),
(9, '!=', 'Must not be equal to', 'text'),
(10, '==', 'Must be equal to', 'text'),
(11, 'is_integer', 'Must be an integer', 'true'),
(12, 'is_timezone', 'Must be a valid timezone name', 'true'),
(13, 'is_datetime', 'Must be a valid DateTime', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `us_form_views`
--

CREATE TABLE `us_form_views` (
  `id` int(11) NOT NULL,
  `form_name` varchar(255) NOT NULL,
  `view_name` varchar(255) NOT NULL,
  `fields` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_blacklist`
--

CREATE TABLE `us_ip_blacklist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `last_user` int(11) NOT NULL DEFAULT 0,
  `reason` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_blacklist`
--

INSERT INTO `us_ip_blacklist` (`id`, `ip`, `last_user`, `reason`) VALUES
(3, '192.168.0.21', 1, 0),
(4, '192.168.0.22', 1, 0),
(10, '192.168.0.222', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_list`
--

CREATE TABLE `us_ip_list` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_list`
--

INSERT INTO `us_ip_list` (`id`, `ip`, `user_id`, `timestamp`) VALUES
(1, '::1', 1, '2017-10-09 15:20:03'),
(2, '127.0.0.1', 1, '2019-09-03 08:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_whitelist`
--

CREATE TABLE `us_ip_whitelist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_whitelist`
--

INSERT INTO `us_ip_whitelist` (`id`, `ip`) VALUES
(2, '192.168.0.21'),
(3, '192.168.0.23');

-- --------------------------------------------------------

--
-- Table structure for table `us_management`
--

CREATE TABLE `us_management` (
  `id` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `access` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_management`
--

INSERT INTO `us_management` (`id`, `page`, `view`, `feature`, `access`) VALUES
(1, '_admin_manage_ip.php', 'ip', 'IP Whitelist/Blacklist', ''),
(2, '_admin_messages.php', 'messages', 'Messages', ''),
(3, '_admin_nav.php', 'nav', 'Navigation', ''),
(4, '_admin_nav_item.php', 'nav_item', 'Navigation', ''),
(5, '_admin_notifications.php', 'notifications', 'Notifications', ''),
(6, '_admin_page.php', 'page', 'Page Management', ''),
(7, '_admin_pages.php', 'pages', 'Page Management', ''),
(10, '_admin_security_logs.php', 'security_logs', 'Security Logs', ''),
(11, '_admin_sessions.php', 'sessions', 'Session Management', ''),
(12, '_admin_templates.php', 'templates', 'Templates', ''),
(13, '_admin_tools_check_updates.php', 'updates', 'Check Updates', '');

-- --------------------------------------------------------

--
-- Table structure for table `us_plugins`
--

CREATE TABLE `us_plugins` (
  `id` int(11) NOT NULL,
  `plugin` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updates` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_plugins`
--

INSERT INTO `us_plugins` (`id`, `plugin`, `status`, `updates`) VALUES
(1, 'formbuilder', 'active', '[\"5\"]');

-- --------------------------------------------------------

--
-- Table structure for table `us_plugin_hooks`
--

CREATE TABLE `us_plugin_hooks` (
  `id` int(11) UNSIGNED NOT NULL,
  `page` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `hook` varchar(255) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `us_saas_levels`
--

CREATE TABLE `us_saas_levels` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL,
  `users` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_saas_orgs`
--

CREATE TABLE `us_saas_orgs` (
  `id` int(11) NOT NULL,
  `org` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `us_user_sessions`
--

CREATE TABLE `us_user_sessions` (
  `kUserSessionID` int(11) UNSIGNED NOT NULL,
  `fkUserID` int(11) UNSIGNED NOT NULL,
  `UserFingerprint` varchar(255) NOT NULL,
  `UserSessionIP` varchar(255) NOT NULL,
  `UserSessionOS` varchar(255) NOT NULL,
  `UserSessionBrowser` varchar(255) NOT NULL,
  `UserSessionStarted` datetime NOT NULL,
  `UserSessionLastUsed` datetime DEFAULT NULL,
  `UserSessionLastPage` varchar(255) NOT NULL,
  `UserSessionEnded` tinyint(1) NOT NULL DEFAULT 0,
  `UserSessionEnded_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ya_kafalahinfo_01`
--

CREATE TABLE `ya_kafalahinfo_01` (
  `id` int(11) NOT NULL,
  `kafilID` varchar(255) DEFAULT NULL,
  `kafalahAmount` decimal(50,0) DEFAULT NULL,
  `kafalahCurrency` varchar(255) DEFAULT NULL,
  `kafalahDuration` decimal(50,0) DEFAULT NULL,
  `kafalahLoop` varchar(255) DEFAULT NULL,
  `kafalahAytam` decimal(50,0) DEFAULT NULL,
  `kafalahType` varchar(255) DEFAULT NULL,
  `kafalahSDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ya_kafalahinfo_01_fb_fields`
--

CREATE TABLE `ya_kafalahinfo_01_fb_fields` (
  `id` int(11) NOT NULL,
  `fb_order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` text NOT NULL,
  `field_html` text NOT NULL,
  `requirements` text NOT NULL,
  `databasevalue` varchar(255) DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `database_value` varchar(255) DEFAULT NULL,
  `database_where` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ya_kafalahinfo_01_fb_fields`
--

INSERT INTO `ya_kafalahinfo_01_fb_fields` (`id`, `fb_order`, `name`, `field_type`, `field_html`, `requirements`, `databasevalue`, `database_name`, `database_value`, `database_where`) VALUES
(1, 0, 'kafilID', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\"}', '', 'ya_kafeelinfo_01', 'kName', ''),
(2, 0, 'kafalahAmount', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u0628\\u0644\\u063a \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u0628\\u0644\\u063a \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\"}', '', '', '', ''),
(3, 0, 'kafalahCurrency', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u0645\\u0644\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u0645\\u0644\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\"}', '[{\"id\":\"YER\",\"value\":\"\\u0631\\u064a\\u0627\\u0644 \\u064a\\u0645\\u0646\\u064a\"},{\"id\":\"USD\",\"value\":\"\\u062f\\u0648\\u0644\\u0627\\u0631 \\u0623\\u0645\\u0631\\u064a\\u0643\\u064a\"}]', '', '', ''),
(4, 0, 'kafalahDuration', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u062f\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u062f\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\"}', '', '', '', ''),
(5, 0, 'kafalahLoop', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062f\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062f\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\"}', '[{\"id\":\"w\",\"value\":\"\\u0627\\u0633\\u0628\\u0648\\u0639\\u064a\\u0629\"},{\"id\":\"m\",\"value\":\"\\u0634\\u0647\\u0631\\u064a\\u0629\"},{\"id\":\"\\u0633\\u0646\\u0648\\u064a\\u0629\",\"value\":\"\"}]', '', '', ''),
(6, 0, 'kafalahAytam', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u062f\\u062f \\u0627\\u0644\\u0623\\u064a\\u062a\\u0627\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u062f\\u062f \\u0627\\u0644\\u0623\\u064a\\u062a\\u0627\\u0645\"}', '', '', '', ''),
(7, 0, 'kafalahType', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0643\\u0641\\u0627\\u0644\\u0629\"}', '[{\"id\":\"c\",\"value\":\"\\u0645\\u0633\\u062a\\u0645\\u0631\\u0629\"},{\"id\":\"o\",\"value\":\"\\u0645\\u0646\\u0642\\u0637\\u0639\\u0629\"}]', '', '', ''),
(8, 0, 'kafalahSDate', 'date', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0628\\u062f\\u0621\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0628\\u062f\\u0621\"}', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ya_kafilinfo_01`
--

CREATE TABLE `ya_kafilinfo_01` (
  `id` int(11) NOT NULL,
  `kName` varchar(255) DEFAULT NULL,
  `kAddress` varchar(255) DEFAULT NULL,
  `kPhone` decimal(50,0) DEFAULT NULL,
  `kType` varchar(255) DEFAULT NULL,
  `kCountry` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ya_kafilinfo_01`
--

INSERT INTO `ya_kafilinfo_01` (`id`, `kName`, `kAddress`, `kPhone`, `kType`, `kCountry`) VALUES
(1, 'فاعل خير', 'اليمن - صنعاء', '777777777', '', 'اليمن');

-- --------------------------------------------------------

--
-- Table structure for table `ya_kafilinfo_01_fb_fields`
--

CREATE TABLE `ya_kafilinfo_01_fb_fields` (
  `id` int(11) NOT NULL,
  `fb_order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` text NOT NULL,
  `field_html` text NOT NULL,
  `requirements` text NOT NULL,
  `databasevalue` varchar(255) DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `database_value` varchar(255) DEFAULT NULL,
  `database_where` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ya_kafilinfo_01_fb_fields`
--

INSERT INTO `ya_kafilinfo_01_fb_fields` (`id`, `fb_order`, `name`, `field_type`, `field_html`, `requirements`, `databasevalue`, `database_name`, `database_value`, `database_where`) VALUES
(1, 0, 'kName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"required\":true}', '', '', '', ''),
(2, 0, 'kAddress', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\"}', '', '', '', ''),
(3, 0, 'kPhone', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\/ \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\/ \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\"}', '', '', '', ''),
(4, 0, 'kType', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0643\\u0627\\u0641\\u0644\"}', '[{\"id\":\"i\",\"value\":\"\\u062f\\u0627\\u062e\\u0644\\u064a\"},{\"id\":\"o\",\"value\":\"\\u062e\\u0627\\u0631\\u062c\\u064a\"}]', '', '', ''),
(5, 0, 'kCountry', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u062f\\u0648\\u0644\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u062f\\u0648\\u0644\\u0629\"}', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ya_yateeminfo_01`
--

CREATE TABLE `ya_yateeminfo_01` (
  `id` int(11) NOT NULL,
  `dateOfEntry` date DEFAULT NULL,
  `yName` varchar(255) DEFAULT NULL,
  `ySex` varchar(255) DEFAULT NULL,
  `yDateOfBirth` date DEFAULT NULL,
  `yBirthPlace` varchar(255) DEFAULT NULL,
  `yNationality` varchar(255) DEFAULT NULL,
  `yFeatures` text DEFAULT NULL,
  `yAddress` varchar(255) DEFAULT NULL,
  `yRankInFamily` decimal(50,0) DEFAULT NULL,
  `fDeathDate` date DEFAULT NULL,
  `fDeathReason` varchar(255) DEFAULT NULL,
  `yEduLevel` varchar(255) DEFAULT NULL,
  `yEduClass` varchar(255) DEFAULT NULL,
  `yEduSchoolName` varchar(255) DEFAULT NULL,
  `yEduSchoolPhone` decimal(50,0) DEFAULT NULL,
  `yEduNoEduReason` text DEFAULT NULL,
  `yHealthStatus` varchar(255) DEFAULT NULL,
  `yHealthSickness` text DEFAULT NULL,
  `yQuranLevel` varchar(255) DEFAULT NULL,
  `yQuranSchool` varchar(255) DEFAULT NULL,
  `rSectionName` varchar(255) DEFAULT NULL,
  `rName` varchar(255) DEFAULT NULL,
  `rSex` varchar(255) DEFAULT NULL,
  `rDateOfBirth` date DEFAULT NULL,
  `rRelation` varchar(255) DEFAULT NULL,
  `rMobile` varchar(12) DEFAULT NULL,
  `rMobilePerson` varchar(255) DEFAULT NULL,
  `rWorkName` varchar(255) DEFAULT NULL,
  `rWorkType` varchar(255) DEFAULT NULL,
  `mSection` varchar(255) DEFAULT NULL,
  `mSectionName` varchar(255) DEFAULT NULL,
  `mName` varchar(255) DEFAULT NULL,
  `mAlive` varchar(255) DEFAULT NULL,
  `mStatus` varchar(255) DEFAULT NULL,
  `mWork` varchar(255) DEFAULT NULL,
  `fNumberOfBrothers` decimal(50,0) DEFAULT NULL,
  `fRankInFamily` decimal(50,0) DEFAULT NULL,
  `fHomeType` varchar(255) DEFAULT NULL,
  `fAddress` varchar(255) DEFAULT NULL,
  `fFinanceStatus` varchar(255) DEFAULT NULL,
  `fFinanceSalary` decimal(50,0) DEFAULT NULL,
  `fFinanceSource` varchar(255) DEFAULT NULL,
  `sOpinion` text DEFAULT NULL,
  `BasicInfo` varchar(255) DEFAULT NULL,
  `identifierName` varchar(255) DEFAULT NULL,
  `identifierSection` varchar(255) DEFAULT NULL,
  `idName` varchar(255) DEFAULT NULL,
  `idMobile` varchar(12) DEFAULT NULL,
  `idAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ya_yateeminfo_01`
--

INSERT INTO `ya_yateeminfo_01` (`id`, `dateOfEntry`, `yName`, `ySex`, `yDateOfBirth`, `yBirthPlace`, `yNationality`, `yFeatures`, `yAddress`, `yRankInFamily`, `fDeathDate`, `fDeathReason`, `yEduLevel`, `yEduClass`, `yEduSchoolName`, `yEduSchoolPhone`, `yEduNoEduReason`, `yHealthStatus`, `yHealthSickness`, `yQuranLevel`, `yQuranSchool`, `rSectionName`, `rName`, `rSex`, `rDateOfBirth`, `rRelation`, `rMobile`, `rMobilePerson`, `rWorkName`, `rWorkType`, `mSection`, `mSectionName`, `mName`, `mAlive`, `mStatus`, `mWork`, `fNumberOfBrothers`, `fRankInFamily`, `fHomeType`, `fAddress`, `fFinanceStatus`, `fFinanceSalary`, `fFinanceSource`, `sOpinion`, `BasicInfo`, `identifierName`, `identifierSection`, `idName`, `idMobile`, `idAddress`) VALUES
(1, '0000-00-00', 'ككشسيبت', NULL, '0000-00-00', 'يشيب', 'يشي', 'شيب', 'شيسب', '2', '0000-00-00', 'سيب', '', '', '', '0', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ya_yateeminfo_01_fb_fields`
--

CREATE TABLE `ya_yateeminfo_01_fb_fields` (
  `id` int(11) NOT NULL,
  `fb_order` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field_type` text NOT NULL,
  `field_html` text NOT NULL,
  `requirements` text NOT NULL,
  `databasevalue` varchar(255) DEFAULT NULL,
  `database_name` varchar(255) DEFAULT NULL,
  `database_value` varchar(255) DEFAULT NULL,
  `database_where` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ya_yateeminfo_01_fb_fields`
--

INSERT INTO `ya_yateeminfo_01_fb_fields` (`id`, `fb_order`, `name`, `field_type`, `field_html`, `requirements`, `databasevalue`, `database_name`, `database_value`, `database_where`) VALUES
(1, 20, 'dateOfEntry', 'date', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0625\\u062f\\u062e\\u0627\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0625\\u062f\\u062e\\u0627\\u0644\",\"is_datetime\":true,\"required\":true}', '', '', '', ''),
(2, 30, 'yName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0631\\u0628\\u0627\\u0639\\u064a\\u0627\\u064b \\u0645\\u0639 \\u0627\\u0644\\u0644\\u0642\\u0628\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0631\\u0628\\u0627\\u0639\\u064a\\u0627\\u064b \\u0645\\u0639 \\u0627\\u0644\\u0644\\u0642\\u0628\",\"required\":true}', '', '', '', ''),
(3, 40, 'ySex', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062c\\u0646\\u0633 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062c\\u0646\\u0633 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\"}', '[{\"id\":\"m\",\"value\":\"\\u0630\\u0643\\u0631\"},{\"id\":\"f\",\"value\":\"\\u0623\\u0646\\u062b\\u0649\"}]', '', '', ''),
(4, 50, 'yDateOfBirth', 'date', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\"}', '', '', '', ''),
(5, 60, 'yBirthPlace', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u062d\\u0644 \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u062d\\u0644 \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"required\":true}', '', '', '', ''),
(6, 70, 'yNationality', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062c\\u0646\\u0633\\u064a\\u0629 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u062c\\u0646\\u0633\\u064a\\u0629 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"required\":true}', '', '', '', ''),
(7, 80, 'yFeatures', 'textarea', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u0648\\u0627\\u0647\\u0628 \\u0648\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"dir=&quot;rtl&quot;\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u0648\\u0627\\u0647\\u0628 \\u0648\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"required\":true}', '', '', '', ''),
(8, 90, 'yAddress', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u062d\\u0644 \\u0627\\u0642\\u0627\\u0645\\u0629 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 [ \\u0645\\u062d\\u0627\\u0641\\u0638\\u0629 - \\u0645\\u062f\\u064a\\u0631\\u064a\\u0629 - \\u0639\\u0632\\u0644\\u0629 \\/ \\u062d\\u064a ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u062d\\u0644 \\u0627\\u0642\\u0627\\u0645\\u0629 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 [ \\u0645\\u062d\\u0627\\u0641\\u0638\\u0629 - \\u0645\\u062f\\u064a\\u0631\\u064a\\u0629 - \\u0639\\u0632\\u0644\\u0629 \\/ \\u062d\\u064a ]\",\"required\":true}', '', '', '', ''),
(9, 100, 'yRankInFamily', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0631\\u062a\\u064a\\u0628 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0628\\u064a\\u0646 \\u0627\\u062e\\u0648\\u0627\\u0646\\u0647 \\u0648\\u0627\\u062e\\u0648\\u0627\\u062a\\u0647 [ \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0635\\u063a\\u0631 ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0631\\u062a\\u064a\\u0628 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0628\\u064a\\u0646 \\u0627\\u062e\\u0648\\u0627\\u0646\\u0647 \\u0648\\u0627\\u062e\\u0648\\u0627\\u062a\\u0647 [ \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0635\\u063a\\u0631 ]\",\"required\":true}', '', '', '', ''),
(10, 110, 'fDeathDate', 'date', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0648\\u0641\\u0627\\u0629 \\u0627\\u0644\\u0623\\u0628\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0648\\u0641\\u0627\\u0629 \\u0627\\u0644\\u0623\\u0628\",\"required\":true}', '', '', '', ''),
(11, 120, 'fDeathReason', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0633\\u0628\\u0628 \\u0648\\u0641\\u0627\\u0629 \\u0627\\u0644\\u0623\\u0628\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0633\\u0628\\u0628 \\u0648\\u0641\\u0627\\u0629 \\u0627\\u0644\\u0623\\u0628\",\"required\":true}', '', '', '', ''),
(12, 130, 'yEduLevel', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\"}', '', '', '', ''),
(13, 140, 'yEduClass', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u0635\\u0641 \\u0627\\u0644\\u062f\\u0631\\u0627\\u0633\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u0635\\u0641 \\u0627\\u0644\\u062f\\u0631\\u0627\\u0633\\u064a\"}', '', '', '', ''),
(14, 150, 'yEduSchoolName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0633\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0633\\u0629\"}', '', '', '', ''),
(15, 160, 'yEduSchoolPhone', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0633\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0633\\u0629\"}', '', '', '', ''),
(16, 170, 'yEduNoEduReason', 'textarea', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0633\\u0628\\u0628 \\u0627\\u0644\\u0627\\u0646\\u0642\\u0627\\u0637\\u0639 \\u0639\\u0646 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 [ \\u0641\\u064a \\u062d\\u0627\\u0644 \\u0627\\u0644\\u0627\\u0646\\u0642\\u0637\\u0627\\u0639 ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0633\\u0628\\u0628 \\u0627\\u0644\\u0627\\u0646\\u0642\\u0627\\u0637\\u0639 \\u0639\\u0646 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 [ \\u0641\\u064a \\u062d\\u0627\\u0644 \\u0627\\u0644\\u0627\\u0646\\u0642\\u0637\\u0627\\u0639 ]\"}', '', '', '', ''),
(17, 180, 'yHealthStatus', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0635\\u062d\\u064a\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0635\\u062d\\u064a\\u0629\"}', '', '', '', ''),
(18, 190, 'yHealthSickness', 'textarea', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0628\\u064a\\u0627\\u0646 \\u0627\\u0644\\u0645\\u0631\\u0636 [ \\u0625\\u0646 \\u0648\\u062c\\u062f ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0628\\u064a\\u0627\\u0646 \\u0627\\u0644\\u0645\\u0631\\u0636 [ \\u0625\\u0646 \\u0648\\u062c\\u062f ]\"}', '', '', '', ''),
(19, 200, 'yQuranLevel', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u0645\\u0646 \\u0627\\u0644\\u0642\\u0631\\u0622\\u0646\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u0645\\u0646 \\u0627\\u0644\\u0642\\u0631\\u0622\\u0646\"}', '', '', '', ''),
(20, 210, 'yQuranSchool', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0645\\u062f\\u0631\\u0633\\u0629 \\u0627\\u0644\\u062a\\u062d\\u0641\\u064a\\u0638\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0645\\u062f\\u0631\\u0633\\u0629 \\u0627\\u0644\\u062a\\u062d\\u0641\\u064a\\u0638\"}', '', '', '', ''),
(21, 220, 'rSectionName', 'label', '{\"div_class1\":\"\",\"div_class2\":\"form-group bg-dark text-white\",\"label\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0648\\u0635\\u064a\"}', '', '', '', ''),
(22, 230, 'rName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0648\\u0635\\u064a\",\"required\":true}', '', '', '', ''),
(23, 240, 'rSex', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062c\\u0646\\u0633 \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062c\\u0646\\u0633 \\u0627\\u0644\\u0648\\u0635\\u064a\"}', '[{\"id\":\"m\",\"value\":\"\\u0630\\u0643\\u0631\"},{\"id\":\"f\",\"value\":\"\\u0623\\u0646\\u062b\\u0649\"}]', '', '', ''),
(24, 250, 'rDateOfBirth', 'date', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0645\\u064a\\u0644\\u0627\\u062f \\u0627\\u0644\\u0648\\u0635\\u064a\"}', '', '', '', ''),
(25, 260, 'rRelation', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0635\\u0644\\u0629 \\u0642\\u0631\\u0627\\u0628\\u0629 \\u0627\\u0644\\u0648\\u0635\\u064a \\u0628\\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0635\\u0644\\u0629 \\u0642\\u0631\\u0627\\u0628\\u0629 \\u0627\\u0644\\u0648\\u0635\\u064a \\u0628\\u0627\\u0644\\u064a\\u062a\\u064a\\u0645\"}', '', '', '', ''),
(26, 270, 'rMobile', 'tel', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0631\\u0642\\u0645 \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0631\\u0642\\u0645 \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0648\\u0635\\u064a\"}', '', '', '', ''),
(27, 280, 'rMobilePerson', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0635\\u0627\\u062d\\u0628 \\u0627\\u0644\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 (\\u0645\\u0633\\u062c\\u0644 \\u0628\\u0627\\u0633\\u0645 \\u0645\\u0646)\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0635\\u0627\\u062d\\u0628 \\u0627\\u0644\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 (\\u0645\\u0633\\u062c\\u0644 \\u0628\\u0627\\u0633\\u0645 \\u0645\\u0646)\"}', '', '', '', ''),
(28, 290, 'rWorkName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062c\\u0647\\u0629 \\u0639\\u0645\\u0644 \\u0627\\u0644\\u0648\\u0635\\u064a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062c\\u0647\\u0629 \\u0639\\u0645\\u0644 \\u0627\\u0644\\u0648\\u0635\\u064a\"}', '', '', '', ''),
(29, 300, 'rWorkType', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0639\\u0645\\u0644\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0639\\u0645\\u0644\"}', '[{\"id\":\"g\",\"value\":\"\\u062d\\u0643\\u0648\\u0645\\u064a\"},{\"id\":\"s\",\"value\":\"\\u062e\\u0627\\u0635\"},{\"id\":\"c\",\"value\":\"\\u062e\\u064a\\u0631\\u064a\"},{\"id\":\"f\",\"value\":\"\\u062d\\u0631\"},{\"id\":\"n\",\"value\":\"\\u0644\\u0627 \\u064a\\u0648\\u062c\\u062f\"}]', '', '', ''),
(30, 310, 'mSectionName', 'label', '{\"div_class1\":\"\",\"div_class2\":\"form-group bg-dark text-white\",\"label\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0645\"}', '', '', '', ''),
(31, 320, 'mName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0623\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0623\\u0645\",\"required\":true}', '', '', '', ''),
(32, 330, 'mAlive', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0647\\u0644 \\u0627\\u0644\\u0623\\u0645 \\u0639\\u0644\\u0649 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062d\\u064a\\u0627\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0647\\u0644 \\u0627\\u0644\\u0623\\u0645 \\u0639\\u0644\\u0649 \\u0642\\u064a\\u062f \\u0627\\u0644\\u062d\\u064a\\u0627\\u0629\"}', '[{\"id\":\"y\",\"value\":\"\\u0646\\u0639\\u0645\"},{\"id\":\"n\",\"value\":\"\\u0644\\u0627\"}]', '', '', ''),
(33, 340, 'mStatus', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0623\\u0645\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0623\\u0645\"}', '[{\"id\":\"widow\",\"value\":\"\\u0623\\u0631\\u0645\\u0644\\u0629\"},{\"id\":\"married\",\"value\":\"\\u0645\\u062a\\u0632\\u0648\\u062c\\u0629\"}]', '', '', ''),
(34, 350, 'mWork', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0623\\u0645 [ \\u0625\\u0646 \\u0648\\u062c\\u062f ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0623\\u0645 [ \\u0625\\u0646 \\u0648\\u062c\\u062f ]\"}', '', '', '', ''),
(35, 360, 'fNumberOfBrothers', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u062f\\u062f \\u0627\\u0644\\u0627\\u062e\\u0648\\u0629 \\u0648\\u0627\\u0644\\u0623\\u062e\\u0648\\u0627\\u062a\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u062f\\u062f \\u0627\\u0644\\u0627\\u062e\\u0648\\u0629 \\u0648\\u0627\\u0644\\u0623\\u062e\\u0648\\u0627\\u062a\",\"required\":true}', '', '', '', ''),
(36, 370, 'fRankInFamily', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u062a\\u0631\\u062a\\u064a\\u0628 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0628\\u064a\\u0646 \\u0627\\u062e\\u0648\\u0627\\u0646\\u0647 \\u0648\\u0627\\u062e\\u0648\\u0627\\u062a\\u0647 [ \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0635\\u063a\\u0631 ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"1\",\"input_step\":\"\"}', '{\"display\":\"\\u062a\\u0631\\u062a\\u064a\\u0628 \\u0627\\u0644\\u064a\\u062a\\u064a\\u0645 \\u0628\\u064a\\u0646 \\u0627\\u062e\\u0648\\u0627\\u0646\\u0647 \\u0648\\u0627\\u062e\\u0648\\u0627\\u062a\\u0647 [ \\u0645\\u0646 \\u0627\\u0644\\u0623\\u0643\\u0628\\u0631 \\u0627\\u0644\\u0649 \\u0627\\u0644\\u0623\\u0635\\u063a\\u0631 ]\",\"required\":true}', '', '', '', ''),
(37, 380, 'fHomeType', 'dropdown', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0633\\u0643\\u0646\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0633\\u0643\\u0646\"}', '[{\"id\":\"o\",\"value\":\"\\u0645\\u0644\\u0643\"},{\"id\":\"r\",\"value\":\"\\u0627\\u064a\\u062c\\u0627\\u0631\"}]', '', '', ''),
(38, 390, 'fAddress', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0633\\u0643\\u0646 \\u0627\\u0644\\u0623\\u0633\\u0631\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0633\\u0643\\u0646 \\u0627\\u0644\\u0623\\u0633\\u0631\\u0629\"}', '', '', '', ''),
(39, 400, 'fFinanceStatus', 'radio', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u0648\\u0636\\u0639 \\u0627\\u0644\\u0645\\u0627\\u062f\\u064a \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u0648\\u0636\\u0639 \\u0627\\u0644\\u0645\\u0627\\u062f\\u064a \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\"}', '[{\"id\":\"m\",\"value\":\"\\u0645\\u062a\\u0648\\u0633\\u0637\"},{\"id\":\"p\",\"value\":\"\\u0641\\u0642\\u064a\\u0631\\u0629\"},{\"id\":\"v\",\"value\":\"\\u0645\\u0639\\u062f\\u0645\\u0629\"}]', '', '', ''),
(40, 410, 'fFinanceSalary', 'number', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0644\\u062f\\u062e\\u0644 \\u0627\\u0644\\u0634\\u0647\\u0631\\u064a \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u062f\\u062e\\u0644 \\u0627\\u0644\\u0634\\u0647\\u0631\\u064a \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\"}', '', '', '', ''),
(41, 420, 'fFinanceSource', 'checkbox', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0645\\u0635\\u062f\\u0631 \\u0627\\u0644\\u062f\\u062e\\u0644 \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0645\\u0635\\u062f\\u0631 \\u0627\\u0644\\u062f\\u062e\\u0644 \\u0644\\u0644\\u0623\\u0633\\u0631\\u0629\"}', '[{\"id\":\"s\",\"value\":\"\\u0631\\u0627\\u062a\\u0628 \\u0634\\u0647\\u0631\\u064a\"},{\"id\":\"h\",\"value\":\"\\u0645\\u0633\\u0627\\u0639\\u062f\\u0627\\u062a \\u0634\\u0647\\u0631\\u064a\\u0629\"},{\"id\":\"o\",\"value\":\"\\u0645\\u0635\\u0627\\u062f\\u0631 \\u0623\\u062e\\u0631\\u0649\"}]', '', '', ''),
(42, 430, 'sOpinion', 'textarea', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0631\\u0623\\u064a \\u0627\\u0644\\u0625\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0646\\u064a\\u0629 [ \\u0627\\u0644\\u0645\\u062e\\u062a\\u0635 ]\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0631\\u0623\\u064a \\u0627\\u0644\\u0625\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0646\\u064a\\u0629 [ \\u0627\\u0644\\u0645\\u062e\\u062a\\u0635 ]\"}', '', '', '', ''),
(43, 10, 'BasicInfo', 'label', '{\"div_class1\":\"\",\"div_class2\":\"form-group bg-dark text-white\",\"label\":\"\\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0633\\u0627\\u0633\\u064a\\u0629\",\"label_class\":\"form-group\",\"input_class\":\"\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0633\\u0627\\u0633\\u064a\\u0629\"}', '', '', '', ''),
(44, 440, 'identifierSection', 'label', '{\"div_class1\":\"\",\"div_class2\":\"form-group bg-dark text-white\",\"label\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\",\"label_class\":\"form-group\",\"input_class\":\"\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\"}', '', '', '', ''),
(45, 450, 'idName', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\"}', '', '', '', ''),
(46, 460, 'idMobile', 'tel', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0631\\u0642\\u0645 \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0631\\u0642\\u0645 \\u0645\\u0648\\u0628\\u0627\\u064a\\u0644 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\"}', '', '', '', ''),
(47, 470, 'idAddress', 'text', '{\"div_class1\":\"\",\"div_class2\":\"form-group\",\"label\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0633\\u0643\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\",\"label_class\":\"form-group\",\"input_class\":\"form-control\",\"input_html\":\"\",\"required\":\"\",\"input_step\":\"\"}', '{\"display\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0633\\u0643\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0641\"}', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons_logs`
--
ALTER TABLE `crons_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_formbuilder`
--
ALTER TABLE `fb_formbuilder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_javascript`
--
ALTER TABLE `fb_javascript`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_javascript_fb_fields`
--
ALTER TABLE `fb_javascript_fb_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_settings`
--
ALTER TABLE `fb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fb_settings_fb_fields`
--
ALTER TABLE `fb_settings_fb_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_menus`
--
ALTER TABLE `groups_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logs_exempt_type` (`name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`) USING BTREE;

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_announcements`
--
ALTER TABLE `us_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_fingerprints`
--
ALTER TABLE `us_fingerprints`
  ADD PRIMARY KEY (`kFingerprintID`);

--
-- Indexes for table `us_fingerprint_assets`
--
ALTER TABLE `us_fingerprint_assets`
  ADD PRIMARY KEY (`kFingerprintAssetID`);

--
-- Indexes for table `us_forms`
--
ALTER TABLE `us_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_form_validation`
--
ALTER TABLE `us_form_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_form_views`
--
ALTER TABLE `us_form_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_management`
--
ALTER TABLE `us_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_plugins`
--
ALTER TABLE `us_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_plugin_hooks`
--
ALTER TABLE `us_plugin_hooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_saas_levels`
--
ALTER TABLE `us_saas_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_saas_orgs`
--
ALTER TABLE `us_saas_orgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_user_sessions`
--
ALTER TABLE `us_user_sessions`
  ADD PRIMARY KEY (`kUserSessionID`);

--
-- Indexes for table `ya_kafalahinfo_01`
--
ALTER TABLE `ya_kafalahinfo_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ya_kafalahinfo_01_fb_fields`
--
ALTER TABLE `ya_kafalahinfo_01_fb_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ya_kafilinfo_01`
--
ALTER TABLE `ya_kafilinfo_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ya_kafilinfo_01_fb_fields`
--
ALTER TABLE `ya_kafilinfo_01_fb_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ya_yateeminfo_01`
--
ALTER TABLE `ya_yateeminfo_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ya_yateeminfo_01_fb_fields`
--
ALTER TABLE `ya_yateeminfo_01_fb_fields`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crons`
--
ALTER TABLE `crons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crons_logs`
--
ALTER TABLE `crons_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fb_formbuilder`
--
ALTER TABLE `fb_formbuilder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fb_javascript`
--
ALTER TABLE `fb_javascript`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fb_javascript_fb_fields`
--
ALTER TABLE `fb_javascript_fb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fb_settings`
--
ALTER TABLE `fb_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fb_settings_fb_fields`
--
ALTER TABLE `fb_settings_fb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups_menus`
--
ALTER TABLE `groups_menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `us_announcements`
--
ALTER TABLE `us_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `us_fingerprints`
--
ALTER TABLE `us_fingerprints`
  MODIFY `kFingerprintID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_fingerprint_assets`
--
ALTER TABLE `us_fingerprint_assets`
  MODIFY `kFingerprintAssetID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_forms`
--
ALTER TABLE `us_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_form_validation`
--
ALTER TABLE `us_form_validation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `us_form_views`
--
ALTER TABLE `us_form_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `us_management`
--
ALTER TABLE `us_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `us_plugins`
--
ALTER TABLE `us_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `us_plugin_hooks`
--
ALTER TABLE `us_plugin_hooks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_saas_levels`
--
ALTER TABLE `us_saas_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_saas_orgs`
--
ALTER TABLE `us_saas_orgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `us_user_sessions`
--
ALTER TABLE `us_user_sessions`
  MODIFY `kUserSessionID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ya_kafalahinfo_01`
--
ALTER TABLE `ya_kafalahinfo_01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ya_kafalahinfo_01_fb_fields`
--
ALTER TABLE `ya_kafalahinfo_01_fb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ya_kafilinfo_01`
--
ALTER TABLE `ya_kafilinfo_01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ya_kafilinfo_01_fb_fields`
--
ALTER TABLE `ya_kafilinfo_01_fb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ya_yateeminfo_01`
--
ALTER TABLE `ya_yateeminfo_01`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ya_yateeminfo_01_fb_fields`
--
ALTER TABLE `ya_yateeminfo_01_fb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
