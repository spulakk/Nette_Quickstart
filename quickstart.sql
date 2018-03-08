-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `quickstart`;
CREATE DATABASE `quickstart` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quickstart`;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `post_ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `post_ID` (`post_ID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `posts` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `comments`;
INSERT INTO `comments` (`ID`, `post_ID`, `name`, `email`, `content`, `created_at`) VALUES
(2,	3,	'krystof',	'',	'super clanek\n',	'2018-02-23 15:12:17'),
(3,	3,	'spulda',	'spulak.k@seznam.cz',	'wow!',	'2018-02-23 15:12:38'),
(4,	5,	'Karel',	'',	'pěkně upraveno :)',	'2018-02-26 18:53:17');

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE `posts`;
INSERT INTO `posts` (`ID`, `title`, `content`, `created_at`) VALUES
(1,	'Article one',	'Lorem ipsum one',	'2018-02-21 20:38:17'),
(2,	'Article two',	'Lorem ipsum two',	'2018-02-21 20:38:47'),
(3,	'Article three',	'Lorem ipsum three',	'2018-02-21 20:39:17'),
(4,	'Artitcle four',	'Lorem ipsum four',	'2018-02-23 15:50:54'),
(5,	'Article five edited',	'Lorem ipsum five',	'2018-02-23 15:52:48');

-- 2018-03-06 09:42:39
