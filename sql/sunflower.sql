-- MySQL dump 10.11
--
-- Host: database.concord.org    Database: sunflower
-- ------------------------------------------------------
-- Server version	5.0.77

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calendar_emails_2009`
--

DROP TABLE IF EXISTS `calendar_emails_2009`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `calendar_emails_2009` (
  `id` int(11) NOT NULL auto_increment,
  `email_address` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_downloads`
--

DROP TABLE IF EXISTS `cc_downloads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_downloads` (
  `download_id` int(11) NOT NULL auto_increment,
  `download_name` varchar(255) NOT NULL default '',
  `download_desc` text NOT NULL,
  `download_image_file` varchar(50) NOT NULL default '',
  `download_image_type` varchar(50) NOT NULL default '',
  `download_image_size` int(11) NOT NULL default '0',
  `download_image_width` int(11) NOT NULL default '0',
  `download_image_height` int(11) NOT NULL default '0',
  `project_id` int(11) NOT NULL default '0',
  `general_link` varchar(100) NOT NULL default '',
  `windows_link` varchar(100) NOT NULL default '',
  `linux_link` varchar(100) NOT NULL default '',
  `palm_link` varchar(100) NOT NULL default '',
  `pocket_pc_link` varchar(100) NOT NULL default '',
  `mac_classic_link` varchar(100) NOT NULL default '',
  `mac_osx_link` varchar(100) NOT NULL default '',
  `source_link` varchar(100) NOT NULL default '',
  `documentation_link` varchar(100) NOT NULL default '',
  `require_auth` enum('no','yes') NOT NULL default 'no',
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `row_owner` int(11) NOT NULL default '0',
  PRIMARY KEY  (`download_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='Files available for download';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_lists`
--

DROP TABLE IF EXISTS `cc_lists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_lists` (
  `list_id` int(11) NOT NULL auto_increment,
  `list_name` char(100) NOT NULL default '',
  `list_desc` char(255) NOT NULL default '',
  `list_type` enum('E-mail','Print') NOT NULL default 'E-mail',
  `row_owner` int(11) NOT NULL default '0',
  PRIMARY KEY  (`list_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_original_mailing_list`
--

DROP TABLE IF EXISTS `cc_original_mailing_list`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_original_mailing_list` (
  `id` int(11) NOT NULL default '0',
  `first` varchar(255) NOT NULL default '',
  `last` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `org` varchar(255) NOT NULL default '',
  `add1` varchar(255) NOT NULL default '',
  `add2` varchar(255) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `state` varchar(255) NOT NULL default '',
  `zip` varchar(255) NOT NULL default '',
  `country` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `cat` varchar(255) NOT NULL default '',
  `source` varchar(255) NOT NULL default '',
  `bandwidth` varchar(255) NOT NULL default '',
  `os` varchar(255) NOT NULL default '',
  `comments` varchar(255) NOT NULL default '',
  `optout` tinyint(4) NOT NULL default '0',
  `processed` tinyint(4) NOT NULL default '0',
  `emailplus` tinyint(4) NOT NULL default '0',
  `fecha2` varchar(255) NOT NULL default '',
  `prevpage` varchar(255) NOT NULL default '',
  `subtype` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='transfer table';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_presentations`
--

DROP TABLE IF EXISTS `cc_presentations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_presentations` (
  `file_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `active` tinyint(1) NOT NULL default '1',
  `descr` text,
  `category_id` int(5) NOT NULL default '0',
  `file_name` varchar(255) NOT NULL default '',
  `file_size` int(11) NOT NULL default '0',
  `file_kind` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_presentations_category`
--

DROP TABLE IF EXISTS `cc_presentations_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_presentations_category` (
  `category_id` int(5) NOT NULL auto_increment,
  `category_name` varchar(32) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_print_subscriptions`
--

DROP TABLE IF EXISTS `cc_print_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_print_subscriptions` (
  `id` int(11) NOT NULL auto_increment,
  `first` varchar(255) NOT NULL default '',
  `last` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `org` varchar(255) NOT NULL default '',
  `add1` varchar(255) NOT NULL default '',
  `add2` varchar(255) NOT NULL default '',
  `city` varchar(255) NOT NULL default '',
  `state` varchar(255) NOT NULL default '',
  `zip` varchar(255) NOT NULL default '',
  `country` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `cat` varchar(255) NOT NULL default '',
  `source` varchar(255) NOT NULL default '',
  `bandwidth` varchar(255) NOT NULL default '',
  `os` varchar(255) NOT NULL default '',
  `comments` varchar(255) NOT NULL default '',
  `optout` tinyint(4) NOT NULL default '0',
  `processed` tinyint(4) NOT NULL default '0',
  `emailplus` tinyint(4) NOT NULL default '0',
  `fecha2` varchar(255) NOT NULL default '',
  `prevpage` varchar(255) NOT NULL default '',
  `subtype` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7379 DEFAULT CHARSET=latin1 COMMENT='transfer table';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_projects`
--

DROP TABLE IF EXISTS `cc_projects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_projects` (
  `project_id` int(11) NOT NULL auto_increment,
  `project_cc_number` varchar(10) NOT NULL default '',
  `project_name` varchar(255) NOT NULL default '',
  `project_email` varchar(100) NOT NULL default '',
  `project_url` varchar(255) NOT NULL default '',
  `project_blurb` varchar(255) NOT NULL default '',
  `project_status` enum('Active','Completed','Planned') NOT NULL default 'Active',
  `row_owner` int(11) NOT NULL default '0',
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COMMENT='Project Info for Downloads';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_publications`
--

DROP TABLE IF EXISTS `cc_publications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_publications` (
  `pub_id` int(11) NOT NULL auto_increment,
  `pub_short_name` varchar(35) NOT NULL default '',
  `project_number` varchar(50) NOT NULL default '',
  `project_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `authors` varchar(255) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `category` enum('','Modeling Research','Online Learning','Handhelds','Probeware','Sustainable Development Education') NOT NULL default '',
  `type` enum('','Book','Book Chapter','Journal Article','Conference Paper','Working Paper','White Paper','Technical Report','Documentation','Curriculum Material','Newsletter Article','Essay') NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  `citation` text NOT NULL,
  `web_address` varchar(255) NOT NULL default '',
  `file_name` varchar(50) NOT NULL default '',
  `file_type` varchar(50) NOT NULL default '',
  `file_size` int(11) NOT NULL default '0',
  `row_owner` int(11) NOT NULL default '0',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`pub_id`),
  UNIQUE KEY `pub_short_name` (`pub_short_name`),
  KEY `authors` (`authors`),
  KEY `title` (`title`),
  KEY `keywords` (`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Concord Publications';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_subscriptions`
--

DROP TABLE IF EXISTS `cc_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_subscriptions` (
  `record_id` int(11) NOT NULL auto_increment,
  `visitor_id` int(11) NOT NULL default '0',
  `list_id` int(11) NOT NULL default '0',
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `visitor_id` (`visitor_id`,`list_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8442 DEFAULT CHARSET=latin1 COMMENT='Which visitors are subscribed to which subscriptions';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_surveys`
--

DROP TABLE IF EXISTS `cc_surveys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_surveys` (
  `survey_id` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `shortname` varchar(25) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `status` enum('listed','unlisted') NOT NULL default 'listed',
  `file_name` varchar(50) NOT NULL default '',
  `file_type` varchar(50) NOT NULL default '',
  `file_size` int(11) NOT NULL default '0',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`survey_id`),
  UNIQUE KEY `shortname` (`shortname`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_taf_statistics`
--

DROP TABLE IF EXISTS `cc_taf_statistics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_taf_statistics` (
  `record_id` int(11) NOT NULL auto_increment,
  `request_uri` varchar(255) NOT NULL default '',
  `page_title` varchar(255) NOT NULL default '',
  `ip_address` varchar(50) NOT NULL default '0',
  `user_agent` varchar(255) NOT NULL default '',
  `access_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_un_subscriptions`
--

DROP TABLE IF EXISTS `cc_un_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_un_subscriptions` (
  `record_id` int(11) NOT NULL auto_increment,
  `subscription_id` int(11) NOT NULL default '0',
  `subscription_key` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4449 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cc_visitor_downloads`
--

DROP TABLE IF EXISTS `cc_visitor_downloads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cc_visitor_downloads` (
  `record_id` int(11) NOT NULL auto_increment,
  `visitor_id` int(11) NOT NULL default '0',
  `visitor_email` char(75) NOT NULL default '',
  `download_id` int(11) NOT NULL default '0',
  `ip_address` char(25) NOT NULL default '',
  `referrer` char(255) NOT NULL default '',
  `download_time` int(11) NOT NULL default '0',
  `browser` char(100) NOT NULL default '',
  `platform` char(10) NOT NULL default '',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30234 DEFAULT CHARSET=latin1 COMMENT='Visitor Download INformation';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccatoms_wise`
--

DROP TABLE IF EXISTS `ccatoms_wise`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccatoms_wise` (
  `file_id` int(11) NOT NULL auto_increment,
  `file_name` varchar(255) NOT NULL default '',
  `file_size` int(11) NOT NULL default '0',
  `file_kind` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='WISE File Uploads';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_downloads`
--

DROP TABLE IF EXISTS `ccr_downloads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_downloads` (
  `record_id` int(11) NOT NULL auto_increment,
  `resource_id` int(11) NOT NULL default '0',
  `visitor_email` varchar(255) NOT NULL default '',
  `ip_address` varchar(255) NOT NULL default '',
  `referrer` varchar(255) NOT NULL default '',
  `download_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `browser` varchar(255) NOT NULL default '',
  `platform` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=334755 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_object_properties`
--

DROP TABLE IF EXISTS `ccr_object_properties`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_object_properties` (
  `record_id` int(11) NOT NULL auto_increment,
  `object_id` int(11) NOT NULL default '0',
  `property_id` int(11) NOT NULL default '0',
  `default_property` tinyint(4) NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `object_property_info` text NOT NULL,
  `object_property_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=730 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_objects`
--

DROP TABLE IF EXISTS `ccr_objects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_objects` (
  `object_id` int(11) NOT NULL auto_increment,
  `object_title` varchar(255) NOT NULL default '',
  `object_description` text NOT NULL,
  `object_restriction` enum('','email','confirmation') NOT NULL default '',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_properties`
--

DROP TABLE IF EXISTS `ccr_properties`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_properties` (
  `property_id` int(11) NOT NULL auto_increment,
  `property_name` varchar(255) NOT NULL default '',
  `property_description` varchar(255) NOT NULL default '',
  `property_icon` varchar(255) NOT NULL default '',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`property_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_relationships`
--

DROP TABLE IF EXISTS `ccr_relationships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_relationships` (
  `record_id` int(11) NOT NULL auto_increment,
  `parent_object_id` int(11) NOT NULL default '0',
  `child_object_id` int(11) NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ccr_sidebars`
--

DROP TABLE IF EXISTS `ccr_sidebars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ccr_sidebars` (
  `record_id` int(11) NOT NULL auto_increment,
  `object_id` int(11) NOT NULL default '0',
  `url_match` varchar(255) NOT NULL default '',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_info`
--

DROP TABLE IF EXISTS `course_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_info` (
  `course_id` int(11) NOT NULL auto_increment,
  `course_title` char(255) NOT NULL default '',
  `course_homepage` char(150) NOT NULL default '',
  `course_instructor` char(100) NOT NULL default '',
  `course_instructor_email` char(75) NOT NULL default '',
  `course_duration` char(250) NOT NULL default '',
  `course_cost` char(75) NOT NULL default '',
  PRIMARY KEY  (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Course Information';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_registrations`
--

DROP TABLE IF EXISTS `course_registrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_registrations` (
  `record_id` int(11) NOT NULL auto_increment,
  `course_session_id` int(11) NOT NULL default '0',
  `first_name` varchar(50) NOT NULL default '',
  `last_name` varchar(50) NOT NULL default '',
  `organization` varchar(75) NOT NULL default '',
  `address_1` varchar(75) NOT NULL default '',
  `address_2` varchar(75) NOT NULL default '',
  `city` varchar(50) NOT NULL default '',
  `state` varchar(50) NOT NULL default '',
  `zip` varchar(15) NOT NULL default '',
  `country` varchar(50) NOT NULL default '',
  `email_address` varchar(75) NOT NULL default '',
  `phone_number` varchar(25) NOT NULL default '',
  `referred_by` varchar(50) NOT NULL default '',
  `graduate_credit` enum('No','Yes') NOT NULL default 'No',
  `payment_method` varchar(100) NOT NULL default '',
  `payment_received` enum('No','Yes') NOT NULL default 'No',
  `comments` text NOT NULL,
  `random_password` varchar(15) NOT NULL default '',
  `date_created` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=latin1 COMMENT='Course Registrations';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_sessions`
--

DROP TABLE IF EXISTS `course_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `course_sessions` (
  `record_id` int(11) NOT NULL auto_increment,
  `course_id` int(11) NOT NULL default '0',
  `start_date` date NOT NULL default '0000-00-00',
  `early_bird_end_date` date NOT NULL default '2002-06-21',
  `display_course` enum('Yes','No') NOT NULL default 'Yes',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COMMENT='Concord Consortium Courses';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `general_ip_country`
--

DROP TABLE IF EXISTS `general_ip_country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `general_ip_country` (
  `id` int(11) NOT NULL auto_increment,
  `range_start` int(11) NOT NULL default '0',
  `range_end` int(11) NOT NULL default '0',
  `country_code` char(2) NOT NULL default '',
  `country_name` varchar(75) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16911 DEFAULT CHARSET=latin1 COMMENT='IP to Country Database';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hw_survey`
--

DROP TABLE IF EXISTS `hw_survey`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hw_survey` (
  `record_id` int(11) NOT NULL auto_increment,
  `row_owner` int(11) NOT NULL default '0',
  `contact_name` varchar(50) NOT NULL default '',
  `contact_phone` varchar(50) NOT NULL default '',
  `contact_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `importance` enum('1','2','3','4','5') NOT NULL default '1',
  `importance_why` text NOT NULL,
  `reasons` text NOT NULL,
  `alternative` text NOT NULL,
  `alternative_name` varchar(50) NOT NULL default '',
  `donation` text NOT NULL,
  `donation_amount` int(11) NOT NULL default '0',
  `subscription` text NOT NULL,
  `subscription_amount` int(11) NOT NULL default '0',
  `record_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='HighWired Survey';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hw_video_logs`
--

DROP TABLE IF EXISTS `hw_video_logs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hw_video_logs` (
  `record_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `request` varchar(255) NOT NULL default '',
  `request_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `request_ip` varchar(20) NOT NULL default '',
  `request_domain` varchar(75) NOT NULL default '',
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100122 DEFAULT CHARSET=latin1 COMMENT='HighWired User Video Logs';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mac_faq_categories`
--

DROP TABLE IF EXISTS `mac_faq_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_faq_categories` (
  `cat_id` int(11) NOT NULL auto_increment,
  `cat_name` varchar(100) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `cat_order` int(11) NOT NULL default '500',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='FAQ Categories';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mac_faq_items`
--

DROP TABLE IF EXISTS `mac_faq_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_faq_items` (
  `item_id` int(11) NOT NULL auto_increment,
  `item_category` int(11) NOT NULL default '0',
  `item_question` text NOT NULL,
  `item_answer` text NOT NULL,
  `item_order` int(11) NOT NULL default '500',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='FAQ Items';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mac_school_contacts`
--

DROP TABLE IF EXISTS `mac_school_contacts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_school_contacts` (
  `contact_id` int(11) NOT NULL auto_increment,
  `school_id` int(11) NOT NULL default '0',
  `contact_name` varchar(100) NOT NULL default '',
  `contact_type` enum('','Teacher','Principal','Dept. Head','Technical','Other','Science Liaison') NOT NULL default '',
  `contact_phone` varchar(25) NOT NULL default '',
  `contact_email` varchar(50) NOT NULL default '',
  `contact_office` varchar(50) NOT NULL default '',
  `contact_notes` text NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COMMENT='MAC School Contacts';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mac_school_data`
--

DROP TABLE IF EXISTS `mac_school_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_school_data` (
  `record_id` int(11) NOT NULL auto_increment,
  `school_id` int(11) NOT NULL default '0',
  `data_year` year(4) NOT NULL default '2003',
  `school_population` int(11) NOT NULL default '0',
  `free_lunch_percentage` int(11) NOT NULL default '0',
  `science_teachers_number` int(11) NOT NULL default '0',
  `science_class_size` int(11) NOT NULL default '0',
  `other_languages` varchar(255) NOT NULL default '',
  `student_grouping` varchar(255) NOT NULL default '',
  `notes` text NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='MAC School Data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mac_schools`
--

DROP TABLE IF EXISTS `mac_schools`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_schools` (
  `school_id` int(11) NOT NULL auto_increment,
  `school_name` varchar(255) NOT NULL default '',
  `school_project_type` enum('Partner','Member','Contributing','Lab','Other') NOT NULL default 'Member',
  `school_address` varchar(255) NOT NULL default '',
  `school_city` varchar(100) NOT NULL default '',
  `school_state` char(2) NOT NULL default '',
  `school_zip` varchar(10) NOT NULL default '',
  `school_phone` varchar(20) NOT NULL default '',
  `school_type` enum('Urban','Suburban','Rural') NOT NULL default 'Urban',
  `school_notes` text NOT NULL,
  `workshop_date` date NOT NULL default '0000-00-00',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='MAC Schools';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_binary_fields`
--

DROP TABLE IF EXISTS `mystri_binary_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_binary_fields` (
  `bf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `filename_field_name` char(35) NOT NULL default '',
  `size_field_name` char(35) NOT NULL default '',
  `type_field_name` char(35) NOT NULL default '',
  `height_field_name` char(35) NOT NULL default '',
  `width_field_name` char(35) NOT NULL default '',
  `path_to_file` char(250) NOT NULL default '',
  `max_size_of_file` int(11) NOT NULL default '500000',
  `rename_file` enum('yes','no') NOT NULL default 'yes',
  `overwrite_file` enum('yes','no') NOT NULL default 'no',
  `external_processor` char(255) NOT NULL default '',
  PRIMARY KEY  (`bf_id`),
  UNIQUE KEY `table_id` (`table_id`,`filename_field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_configuration`
--

DROP TABLE IF EXISTS `mystri_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_configuration` (
  `record_id` int(11) NOT NULL auto_increment,
  `directive` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `directive` (`directive`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='This table holds configuration information';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_countries`
--

DROP TABLE IF EXISTS `mystri_countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_countries` (
  `country_id` int(11) NOT NULL auto_increment,
  `country_abbr` char(2) NOT NULL default '',
  `country_name` char(50) NOT NULL default '',
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=latin1 COMMENT='Countries of the world';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_custom_actions`
--

DROP TABLE IF EXISTS `mystri_custom_actions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_custom_actions` (
  `action_id` int(11) NOT NULL auto_increment,
  `action_file_name` char(50) NOT NULL default '',
  `action_label` char(35) NOT NULL default '',
  PRIMARY KEY  (`action_id`),
  UNIQUE KEY `action_label` (`action_label`),
  UNIQUE KEY `action_file_name` (`action_file_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_custom_main_menu_items`
--

DROP TABLE IF EXISTS `mystri_custom_main_menu_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_custom_main_menu_items` (
  `menu_item_id` int(11) NOT NULL auto_increment,
  `menu_item_name` varchar(50) NOT NULL default '',
  `menu_item_action` varchar(50) NOT NULL default '',
  `menu_item_file` varchar(200) NOT NULL default '',
  `menu_item_status` enum('Active','Inactive') NOT NULL default 'Active',
  `menu_item_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`menu_item_id`),
  UNIQUE KEY `menu_item_action` (`menu_item_action`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='Main Menu Items';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_custom_menus`
--

DROP TABLE IF EXISTS `mystri_custom_menus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_custom_menus` (
  `menu_id` int(11) NOT NULL auto_increment,
  `menu_file_name` char(50) NOT NULL default '',
  `menu_label` char(35) NOT NULL default '',
  PRIMARY KEY  (`menu_id`),
  UNIQUE KEY `menu_label` (`menu_label`),
  UNIQUE KEY `menu_file_name` (`menu_file_name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_custom_triggers`
--

DROP TABLE IF EXISTS `mystri_custom_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_custom_triggers` (
  `trigger_id` int(11) NOT NULL auto_increment,
  `trigger_file_name` char(50) NOT NULL default '',
  `trigger_label` char(35) NOT NULL default '',
  `trigger_when` enum('before','after') NOT NULL default 'before',
  `trigger_condition` enum('all','insert','update','delete') NOT NULL default 'all',
  PRIMARY KEY  (`trigger_id`),
  UNIQUE KEY `trigger_file_name` (`trigger_file_name`),
  UNIQUE KEY `trigger_label` (`trigger_label`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_failed_logins`
--

DROP TABLE IF EXISTS `mystri_failed_logins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_failed_logins` (
  `record_id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `password` varchar(35) NOT NULL default '',
  `failure_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `ip_address` varchar(20) NOT NULL default '',
  `failure_code` char(3) NOT NULL default '',
  `failure_type` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5044 DEFAULT CHARSET=latin1 COMMENT='Failed Logins Table';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_foreign_keys`
--

DROP TABLE IF EXISTS `mystri_foreign_keys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_foreign_keys` (
  `foreign_key_id` int(11) NOT NULL auto_increment,
  `local_table_id` int(11) NOT NULL default '0',
  `local_table_field` varchar(35) NOT NULL default '',
  `foreign_table_id` int(11) NOT NULL default '0',
  `foreign_table_label_field` varchar(150) NOT NULL default '',
  `foreign_table_value_field` varchar(35) NOT NULL default '',
  `custom_fk_query` text NOT NULL,
  `list_display_type` enum('select','radio') NOT NULL default 'select',
  PRIMARY KEY  (`foreign_key_id`),
  UNIQUE KEY `local_table_id` (`local_table_id`,`local_table_field`,`foreign_table_id`,`foreign_table_value_field`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_group_hidden_fields`
--

DROP TABLE IF EXISTS `mystri_group_hidden_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_group_hidden_fields` (
  `hf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`hf_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_group_view_only_fields`
--

DROP TABLE IF EXISTS `mystri_group_view_only_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_group_view_only_fields` (
  `vo_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`vo_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_groups`
--

DROP TABLE IF EXISTS `mystri_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` char(35) NOT NULL default '',
  `group_desc` char(255) NOT NULL default '',
  PRIMARY KEY  (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_groups_tables`
--

DROP TABLE IF EXISTS `mystri_groups_tables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_groups_tables` (
  `gt_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL default '0',
  `table_id` int(11) NOT NULL default '0',
  `access_type` enum('row','table') NOT NULL default 'row',
  `select_access` enum('yes','no') NOT NULL default 'yes',
  `insert_access` enum('yes','no') NOT NULL default 'yes',
  `update_access` enum('yes','no') NOT NULL default 'yes',
  `delete_access` enum('yes','no') NOT NULL default 'yes',
  PRIMARY KEY  (`gt_id`),
  UNIQUE KEY `group_id` (`group_id`,`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_hidden_fields`
--

DROP TABLE IF EXISTS `mystri_hidden_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_hidden_fields` (
  `hf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`hf_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_logs`
--

DROP TABLE IF EXISTS `mystri_logs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_logs` (
  `record_id` int(11) NOT NULL auto_increment,
  `exception_type` varchar(50) NOT NULL default '',
  `exception_code` varchar(20) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `user_ip_address` varchar(20) NOT NULL default '',
  `user_action` varchar(50) NOT NULL default '',
  `user_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_request` varchar(255) NOT NULL default '',
  `user_variables` text NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='Exception Log';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_table_custom_actions`
--

DROP TABLE IF EXISTS `mystri_table_custom_actions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_table_custom_actions` (
  `ca_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `action_id` int(11) NOT NULL default '0',
  `ca_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ca_id`),
  UNIQUE KEY `table_id` (`table_id`,`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_table_custom_menus`
--

DROP TABLE IF EXISTS `mystri_table_custom_menus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_table_custom_menus` (
  `cm_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `menu_id` int(11) NOT NULL default '0',
  `cm_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cm_id`),
  UNIQUE KEY `table_id` (`table_id`,`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_table_custom_triggers`
--

DROP TABLE IF EXISTS `mystri_table_custom_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_table_custom_triggers` (
  `ct_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `trigger_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ct_id`),
  UNIQUE KEY `table_id` (`table_id`,`trigger_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_table_views`
--

DROP TABLE IF EXISTS `mystri_table_views`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_table_views` (
  `view_id` int(11) NOT NULL auto_increment,
  `view_name` varchar(255) NOT NULL default '',
  `view_description` varchar(255) NOT NULL default '',
  `view_query` text NOT NULL,
  `table_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`view_id`),
  UNIQUE KEY `view_name` (`view_name`,`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_tables`
--

DROP TABLE IF EXISTS `mystri_tables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_tables` (
  `table_id` int(11) NOT NULL auto_increment,
  `table_database` char(50) NOT NULL default 'sunflower',
  `table_real_name` char(50) NOT NULL default '',
  `table_display_name` char(100) NOT NULL default '',
  `table_display_comment` char(255) NOT NULL default '',
  `table_display_data_word` char(50) NOT NULL default 'data',
  `table_display_field_type` enum('yes','no') NOT NULL default 'no',
  `table_display_functions` enum('yes','no') NOT NULL default 'no',
  `table_default_action` char(35) NOT NULL default 'view_data',
  `table_default_query` char(255) NOT NULL default '',
  `table_default_order_field` char(255) NOT NULL default '',
  `table_default_reverse_sort` enum('yes','no') NOT NULL default 'no',
  `table_default_display` enum('horizontal','vertical') NOT NULL default 'horizontal',
  `table_default_display_fields` char(255) NOT NULL default '',
  `table_default_display_rows` int(4) NOT NULL default '30',
  `table_default_display_width` int(3) NOT NULL default '50',
  `table_primary_key` char(35) NOT NULL default '',
  `table_owner_key` char(35) NOT NULL default '',
  `table_owner_type` enum('','user','group') NOT NULL default '',
  `table_is_many_to_many` enum('yes','no') NOT NULL default 'no',
  `table_display_in_portal` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`table_id`),
  UNIQUE KEY `table_name_db` (`table_real_name`,`table_database`)
) ENGINE=MyISAM AUTO_INCREMENT=731 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_us_states`
--

DROP TABLE IF EXISTS `mystri_us_states`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_us_states` (
  `state_id` int(11) NOT NULL auto_increment,
  `state_abbr` char(2) NOT NULL default '',
  `state_name` char(40) NOT NULL default '',
  PRIMARY KEY  (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='US States List';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_user_hidden_fields`
--

DROP TABLE IF EXISTS `mystri_user_hidden_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_user_hidden_fields` (
  `hf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`hf_id`),
  UNIQUE KEY `table_id` (`table_id`,`user_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_user_openids`
--

DROP TABLE IF EXISTS `mystri_user_openids`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_user_openids` (
  `record_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `openid_url` varchar(255) NOT NULL,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `url` (`openid_url`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_user_view_only_fields`
--

DROP TABLE IF EXISTS `mystri_user_view_only_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_user_view_only_fields` (
  `vo_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`vo_id`),
  UNIQUE KEY `table_id` (`table_id`,`user_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_users`
--

DROP TABLE IF EXISTS `mystri_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_username` varchar(50) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_valid_ip` varchar(20) NOT NULL default '*',
  `user_email` varchar(75) NOT NULL default '',
  `user_first_name` varchar(50) NOT NULL default '',
  `user_last_name` varchar(50) NOT NULL default '',
  `user_address_1` varchar(100) NOT NULL default '',
  `user_address_2` varchar(100) NOT NULL default '',
  `user_address_3` varchar(100) NOT NULL default '',
  `user_city` varchar(50) NOT NULL default '',
  `user_state` varchar(50) NOT NULL default '',
  `user_zip` varchar(15) NOT NULL default '',
  `user_province` varchar(50) NOT NULL default '',
  `user_postal_code` varchar(20) NOT NULL default '',
  `user_country` varchar(50) NOT NULL default '',
  `user_telephone` varchar(30) NOT NULL default '',
  `user_occupation` enum('','K-12 Educator','Technology Director','Educational Researcher','University Faculty','Software Developer','Educational Materials Provider','Other') NOT NULL default '',
  `user_website` varchar(255) NOT NULL default '',
  `verified_educator` enum('','yes','no') NOT NULL default '',
  `user_how_heard` varchar(255) NOT NULL default '',
  `user_creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_last_access` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_record_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_token` varchar(32) NOT NULL default '',
  `user_access_key` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM AUTO_INCREMENT=63781 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_users_groups`
--

DROP TABLE IF EXISTS `mystri_users_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_users_groups` (
  `ug_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ug_id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_users_temp`
--

DROP TABLE IF EXISTS `mystri_users_temp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_users_temp` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_username` varchar(50) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_valid_ip` varchar(20) NOT NULL default '*',
  `user_email` varchar(75) NOT NULL default '',
  `user_first_name` varchar(50) NOT NULL default '',
  `user_last_name` varchar(50) NOT NULL default '',
  `user_address_1` varchar(100) NOT NULL default '',
  `user_address_2` varchar(100) NOT NULL default '',
  `user_address_3` varchar(100) NOT NULL default '',
  `user_city` varchar(50) NOT NULL default '',
  `user_state` varchar(50) NOT NULL default '',
  `user_zip` varchar(15) NOT NULL default '',
  `user_province` varchar(50) NOT NULL default '',
  `user_postal_code` varchar(20) NOT NULL default '',
  `user_country` varchar(50) NOT NULL default '',
  `user_telephone` varchar(30) NOT NULL default '',
  `user_occupation` enum('','K-12 Educator','Technology Director','Educational Researcher','University Faculty','Software Developer','Educational Materials Provider','Other') NOT NULL default '',
  `verified_educator` enum('','yes','no') NOT NULL default '',
  `user_how_heard` varchar(255) NOT NULL default '',
  `user_creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_last_access` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_record_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_token` varchar(32) NOT NULL default '',
  `user_access_key` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystri_view_only_fields`
--

DROP TABLE IF EXISTS `mystri_view_only_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystri_view_only_fields` (
  `vo_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`vo_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `news_items` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL default '',
  `type` enum('News','Highlight','Clipping') NOT NULL default 'News',
  `status` enum('Current','Archived') NOT NULL default 'Current',
  `entry_date` date NOT NULL default '0000-00-00',
  `image_file` varchar(100) NOT NULL default '',
  `image_size` int(11) NOT NULL default '0',
  `image_type` varchar(100) NOT NULL default '',
  `image_width` int(11) NOT NULL default '0',
  `image_height` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=latin1 COMMENT='News Items for Concord Web Site';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `news_releases`
--

DROP TABLE IF EXISTS `news_releases`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `news_releases` (
  `id` int(11) NOT NULL auto_increment,
  `release_short_name` varchar(30) NOT NULL default '',
  `release_status` enum('Current','Archive') NOT NULL default 'Current',
  `release_date` date NOT NULL default '0000-00-00',
  `release_title` varchar(255) NOT NULL default '',
  `release_copy` text NOT NULL,
  `contact_name` varchar(100) NOT NULL default 'Janet Hadingham',
  `contact_phone` varchar(25) NOT NULL default '(978) 371-1368',
  `contact_email` varchar(50) NOT NULL default 'jhadingham@concord.org',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `release_short_name` (`release_short_name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Press Releases';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rex_cat_relation`
--

DROP TABLE IF EXISTS `rex_cat_relation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rex_cat_relation` (
  `record_id` int(11) NOT NULL auto_increment,
  `parent_category` int(11) default NULL,
  `child_category` int(11) default NULL,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `parent_child` (`child_category`,`parent_category`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='This table has relationships for categories';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rex_categories`
--

DROP TABLE IF EXISTS `rex_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rex_categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `category_short_name` varchar(255) NOT NULL default '',
  `category_long_name` varchar(255) NOT NULL default '',
  `category_description` text NOT NULL,
  `row_owner` int(11) NOT NULL default '0',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`category_id`),
  UNIQUE KEY `category_short_name` (`category_short_name`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='This table holds the item categories';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rex_configuration`
--

DROP TABLE IF EXISTS `rex_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rex_configuration` (
  `record_id` int(11) NOT NULL auto_increment,
  `directive` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `directive` (`directive`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='This table holds configuration information';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rex_item_relation`
--

DROP TABLE IF EXISTS `rex_item_relation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rex_item_relation` (
  `record_id` int(11) NOT NULL auto_increment,
  `item_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `cat` (`category_id`,`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=781 DEFAULT CHARSET=latin1 COMMENT='This table has relationships for categories';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rex_items`
--

DROP TABLE IF EXISTS `rex_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rex_items` (
  `item_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `status` enum('Active','Inactive') NOT NULL default 'Active',
  `require_auth` enum('yes','no') NOT NULL default 'no',
  `description` text NOT NULL,
  `general_link` varchar(255) NOT NULL default '',
  `windows_link` varchar(255) NOT NULL default '',
  `linux_link` varchar(255) NOT NULL default '',
  `mac_classic_link` varchar(255) NOT NULL default '',
  `mac_osx_link` varchar(255) NOT NULL default '',
  `palm_link` varchar(255) NOT NULL default '',
  `pocket_pc_link` varchar(255) NOT NULL default '',
  `source_link` varchar(255) NOT NULL default '',
  `documentation_link` varchar(255) NOT NULL default '',
  `demo_link` varchar(255) NOT NULL default '',
  `image_file` varchar(100) NOT NULL default '',
  `image_type` varchar(100) NOT NULL default '',
  `image_size` int(11) NOT NULL default '0',
  `image_width` int(11) NOT NULL default '0',
  `image_height` int(11) NOT NULL default '0',
  `binary_file` varchar(100) NOT NULL default '',
  `binary_type` varchar(100) NOT NULL default '',
  `binary_size` int(11) NOT NULL default '0',
  `authors` varchar(255) NOT NULL default '',
  `citation` text NOT NULL,
  `row_owner` int(11) NOT NULL default '0',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=latin1 COMMENT='This table holds the items';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sm_districts`
--

DROP TABLE IF EXISTS `sm_districts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sm_districts` (
  `row_owner` int(11) NOT NULL default '0',
  `district_id` int(11) NOT NULL auto_increment,
  `district_name` varchar(255) NOT NULL default '',
  `district_state` char(2) NOT NULL default '',
  `district_url` varchar(255) NOT NULL default 'http://',
  `state_data` varchar(255) NOT NULL default 'http://',
  `educational_goal` text NOT NULL,
  `district_overview` text NOT NULL,
  `tpd_program_overview` text NOT NULL,
  `seeing_math_strategy` text NOT NULL,
  `district_image_file` varchar(50) NOT NULL default '',
  `district_image_size` int(11) NOT NULL default '0',
  `district_image_type` varchar(50) NOT NULL default '',
  `district_image_height` int(11) NOT NULL default '0',
  `district_image_width` int(11) NOT NULL default '0',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Seeing Math Districts';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sm_people`
--

DROP TABLE IF EXISTS `sm_people`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sm_people` (
  `record_id` int(11) NOT NULL auto_increment,
  `row_owner` int(11) NOT NULL default '0',
  `district` int(11) NOT NULL default '0',
  `school` int(11) NOT NULL default '0',
  `first_name` varchar(30) NOT NULL default '',
  `last_name` varchar(30) NOT NULL default '',
  `gender` enum('','Male','Female') NOT NULL default '',
  `salutation` enum('','Dr.','Mr.','Ms.','Mrs.') NOT NULL default '',
  `email_1` varchar(75) NOT NULL default '',
  `email_2` varchar(75) NOT NULL default '',
  `phone_1` varchar(25) NOT NULL default '',
  `phone_2` varchar(25) NOT NULL default '',
  `fax` varchar(25) NOT NULL default '',
  `seeing_math_role` enum('','Local Authority','On-Site Facilitator','Participant Teacher') NOT NULL default '',
  `teaching_start_date` int(4) NOT NULL default '0',
  `academic_preparation` enum('','Graduate','Masters','Doctorate','Post Doctorate') NOT NULL default '',
  `area_of_expertise` varchar(70) NOT NULL default '',
  `position` varchar(100) NOT NULL default '',
  `computer_access_school` enum('','Classroom','Lab','Library') NOT NULL default '',
  `computer_access_home` enum('','Yes','No') NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COMMENT='Seeing Math Particpants';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sm_schools`
--

DROP TABLE IF EXISTS `sm_schools`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sm_schools` (
  `row_owner` int(11) NOT NULL default '0',
  `school_id` int(11) NOT NULL auto_increment,
  `school_district` int(11) NOT NULL default '0',
  `school_name` varchar(255) NOT NULL default '',
  `school_level` enum('','Elementary','Middle School','High School','Elementary and Middle School','Middle and High School','Elementary and High School','Elementary, Middle and High School') NOT NULL default '',
  `school_goal` text NOT NULL,
  `school_url` varchar(255) NOT NULL default '',
  `seeing_math_in_school` text NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='Seeing Math Schools';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sm_tpd_activities`
--

DROP TABLE IF EXISTS `sm_tpd_activities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sm_tpd_activities` (
  `district_id` int(11) NOT NULL default '0',
  `row_owner` int(11) NOT NULL default '0',
  `school_id` int(11) NOT NULL default '0',
  `activity_id` int(11) NOT NULL auto_increment,
  `activity_name` varchar(255) NOT NULL default '',
  `study_topics_of_mathematics` enum('','Yes','No') NOT NULL default '',
  `study_teaching_of_mathematics` enum('','Yes','No') NOT NULL default '',
  `study_inquiry_based_learning` enum('','Yes','No') NOT NULL default '',
  `study_case_based_learning` enum('','Yes','No') NOT NULL default '',
  `study_cooperative_learning` enum('','Yes','No') NOT NULL default '',
  `study_technology_based_learning` enum('','Yes','No') NOT NULL default '',
  `start_date` date NOT NULL default '0000-00-00',
  `end_date` date NOT NULL default '0000-00-00',
  `description` text NOT NULL,
  `participants` text NOT NULL,
  `positive_aspects` text NOT NULL,
  `negative_aspects` text NOT NULL,
  `seeing_math_impact` text NOT NULL,
  `local_impact` text NOT NULL,
  `pre_contact` date NOT NULL default '0000-00-00',
  `post_contact` date NOT NULL default '0000-00-00',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`activity_id`),
  FULLTEXT KEY `activity_name` (`activity_name`,`description`,`positive_aspects`,`negative_aspects`,`seeing_math_impact`,`local_impact`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='Seeing Math TPD Activities';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sm_tpd_materials`
--

DROP TABLE IF EXISTS `sm_tpd_materials`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sm_tpd_materials` (
  `material_id` int(11) NOT NULL auto_increment,
  `activity_id` int(11) NOT NULL default '0',
  `row_owner` int(11) NOT NULL default '0',
  `material_name` varchar(75) NOT NULL default '',
  `material_description` varchar(255) NOT NULL default '',
  `material_link` varchar(255) NOT NULL default '',
  `material_file_name` varchar(35) NOT NULL default '',
  `material_file_size` int(11) NOT NULL default '0',
  `material_file_type` varchar(50) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`material_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Seeing Math TPD materials';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vpb_faq_categories`
--

DROP TABLE IF EXISTS `vpb_faq_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vpb_faq_categories` (
  `cat_id` int(11) NOT NULL auto_increment,
  `cat_name` varchar(100) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `cat_order` int(11) NOT NULL default '500',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_name` (`cat_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='FAQ Categories';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vpb_faq_items`
--

DROP TABLE IF EXISTS `vpb_faq_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vpb_faq_items` (
  `item_id` int(11) NOT NULL auto_increment,
  `item_category` int(11) NOT NULL default '0',
  `item_question` text NOT NULL,
  `item_answer` text NOT NULL,
  `item_order` int(11) NOT NULL default '500',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='FAQ Items';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vpb_registrations`
--

DROP TABLE IF EXISTS `vpb_registrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vpb_registrations` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(30) NOT NULL default '',
  `last_name` varchar(30) NOT NULL default '',
  `email_address` varchar(50) NOT NULL default '',
  `city` varchar(50) NOT NULL default '',
  `state` varchar(50) NOT NULL default '',
  `country` varchar(255) NOT NULL default '',
  `occupation` varchar(255) NOT NULL default '',
  `content_area` varchar(255) NOT NULL default '',
  `workplace` varchar(255) NOT NULL default '',
  `how_discovered` varchar(255) NOT NULL default '',
  `expected_use` varchar(255) NOT NULL default '',
  `download_file` varchar(50) NOT NULL default '',
  `registration_date` date NOT NULL default '0000-00-00',
  `modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1670 DEFAULT CHARSET=latin1 COMMENT='VPB Registration Data';
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-13 17:40:56
