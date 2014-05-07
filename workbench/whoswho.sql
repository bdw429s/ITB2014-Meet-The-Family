-- --------------------------------------------------------
-- Host:                         enterprise.netxn.com
-- Server version:               5.1.71 - Source distribution
-- Server OS:                    redhat-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for whoswho_gp
CREATE DATABASE IF NOT EXISTS `whoswho_gp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `whoswho_gp`;


-- Dumping structure for table whoswho_gp.friendships
CREATE TABLE IF NOT EXISTS `friendships` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `friendid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table whoswho_gp.friendships: 0 rows
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;


-- Dumping structure for table whoswho_gp.statuses
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `message` text NOT NULL,
  `createdat` datetime NOT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table whoswho_gp.statuses: 36 rows
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
REPLACE INTO `statuses` (`id`, `userid`, `message`, `createdat`, `deletedat`) VALUES
	(1, 2, 'Bad Wolf Bay', '2014-04-09 10:36:14', NULL),
	(2, 2, 'Bad Wolf', '2014-04-09 10:36:22', NULL),
	(3, 2, 'Somethings are worth getting your heart broken for', '2014-04-09 10:36:36', NULL),
	(4, 12, 'This is really kool', '2014-04-15 21:56:39', NULL),
	(5, 12, 'I am going to setup Wirebox for you!', '2014-04-21 20:45:14', NULL),
	(6, 13, 'Geronimo!!!', '2014-04-22 16:21:48', NULL),
	(7, 11, 'Rock ITB!!!', '2014-04-24 19:17:44', NULL),
	(8, 4, 'I\'m the Doctor, by the way, What\'s your name?', '2014-04-24 18:30:55', NULL),
	(9, 2, 'Rose', '2014-04-24 18:31:01', NULL),
	(10, 4, 'Nice to meet you, Rose, run for yer life!', '2014-04-24 18:31:22', NULL),
	(11, 4, 'What are you doing here?', '2014-04-24 18:32:23', NULL),
	(12, 2, 'I live here', '2014-04-24 18:32:32', NULL),
	(13, 4, 'Well, what you go and do a thing like that for? ', '2014-04-24 18:32:39', NULL),
	(14, 3, 'Everywhere we go, two words, following us: "Bad Wolf."', '2014-04-24 18:41:34', NULL),
	(25, -1, 'test', '2014-05-07 16:16:31', NULL),
	(24, 13, '<b>test</b> me\r\n', '2014-05-07 15:34:47', NULL),
	(23, 13, 'test', '2014-05-07 15:04:55', NULL),
	(22, -1, 'test', '2014-04-25 11:18:30', NULL),
	(21, -1, 'test', '2014-04-25 11:18:30', NULL),
	(26, -1, 'test', '2014-05-07 16:16:31', NULL),
	(27, -1, 'test', '2014-05-07 16:21:34', NULL),
	(28, -1, 'test', '2014-05-07 16:21:34', NULL),
	(29, -1, 'test', '2014-05-07 16:21:37', NULL),
	(30, -1, 'test', '2014-05-07 16:21:38', NULL),
	(31, -1, 'test', '2014-05-07 16:24:00', NULL),
	(32, -1, 'test', '2014-05-07 16:24:00', NULL),
	(33, -1, 'test', '2014-05-07 16:27:24', NULL),
	(34, -1, 'test', '2014-05-07 16:27:24', NULL),
	(35, -1, 'test', '2014-05-07 16:27:33', NULL),
	(36, -1, 'test', '2014-05-07 16:27:33', NULL),
	(37, -1, 'test', '2014-05-07 16:27:41', NULL),
	(38, -1, 'test', '2014-05-07 16:27:41', NULL),
	(39, -1, 'test', '2014-05-07 16:27:45', NULL),
	(40, -1, 'test', '2014-05-07 16:27:46', NULL),
	(41, -1, 'test', '2014-05-07 16:28:20', NULL),
	(42, -1, 'test', '2014-05-07 16:28:21', NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;


-- Dumping structure for table whoswho_gp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `urlid` int(11) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `about` text,
  `photo` varchar(255) DEFAULT NULL,
  `createdat` datetime NOT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table whoswho_gp.users: 12 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `urlid`, `firstName`, `lastName`, `email`, `password`, `birthdate`, `gender`, `about`, `photo`, `createdat`, `deletedat`) VALUES
	(2, NULL, 'Rose', 'Tyler', 'rose@whoswho.com', 'rose', NULL, NULL, NULL, 'rose.jpg', '2014-04-09 10:09:22', NULL),
	(3, NULL, '9th', 'Doctor', '9thdoctor@whoswho.com', '9thdoctor', NULL, NULL, NULL, '9thdoctor.jpg', '2014-04-10 08:14:08', NULL),
	(4, NULL, '10th', 'Doctor', '10thdoctor@whoswho.com', '10thdoctor', NULL, NULL, NULL, '10thdoctor.jpg', '2014-04-10 08:15:51', NULL),
	(5, NULL, '11th', 'Doctor', '11thdoctor@whoswho.com', '11thdoctor', NULL, NULL, NULL, '11thdoctor.jpg', '2014-04-10 08:16:12', NULL),
	(6, NULL, 'Mickey', 'Smith', 'mickey@whoswho.com', 'mickey', NULL, NULL, NULL, 'mickey.jpg', '2014-04-10 08:16:44', NULL),
	(7, NULL, 'River', 'Song', 'riversong@whoswho.com', 'riversong', NULL, NULL, NULL, 'riversong.jpg', '2014-04-10 08:17:02', NULL),
	(8, NULL, 'Amy', 'Pond', 'amy@whoswho.com', 'amy', NULL, NULL, NULL, 'amy.jpg', '2014-04-10 08:17:26', NULL),
	(9, NULL, 'Rory', 'Williams', 'rory@whoswho.com', 'rory', NULL, NULL, NULL, 'rory.jpg', '2014-04-10 08:17:51', NULL),
	(10, NULL, 'Martha', 'Jones', 'martha@whoswho.com', 'martha', NULL, NULL, NULL, 'martha.jpg', '2014-04-10 08:19:00', NULL),
	(11, NULL, 'Curt', 'Gratz', 'gratzc@compknowhow.com', 'test', NULL, NULL, NULL, 'cgratz.jpg', '2014-04-11 11:43:20', NULL),
	(12, NULL, 'George', 'Murphy', 'georgemurphy@websbygeorge.com', 'abc123', NULL, NULL, NULL, 'gmurphy.jpg', '2014-04-14 22:04:22', NULL),
	(13, NULL, 'Brad', 'Wood', 'brad@bradwood.com', 'test', NULL, NULL, NULL, 'bwood.jpg', '2014-04-22 16:20:43', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
