-- MySQL dump 10.11
--
-- Host: database.concord.org    Database: ccportal
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
-- Table structure for table `portal_access_log`
--

DROP TABLE IF EXISTS `portal_access_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_access_log` (
  `access_log_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `school_id` int(11) default NULL,
  `access_time` datetime default NULL,
  `server_name` varchar(255) default '',
  `referring_site` varchar(255) default '',
  `request_uri` varchar(255) default '',
  `ip_address` varchar(255) default '',
  `request_type` varchar(255) default '',
  PRIMARY KEY  (`access_log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1501535 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_accommodation_usage`
--

DROP TABLE IF EXISTS `portal_accommodation_usage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_accommodation_usage` (
  `usage_id` int(11) NOT NULL auto_increment,
  `usage_accommodation` int(11) NOT NULL default '0',
  `usage_type` varchar(255) character set utf8 default NULL,
  `usage_type_id` int(11) NOT NULL default '0',
  `usage_value` varchar(255) character set utf8 default NULL,
  `creation_date` datetime default NULL,
  `last_update` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`usage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_accommodations`
--

DROP TABLE IF EXISTS `portal_accommodations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_accommodations` (
  `accommodation_id` int(11) NOT NULL auto_increment,
  `accommodation_project` int(11) NOT NULL default '0',
  `accommodation_name` varchar(255) character set utf8 NOT NULL default '',
  `accommodation_description` varchar(255) character set utf8 NOT NULL default '',
  `accommodation_content` text character set utf8 NOT NULL,
  `accommodation_type` varchar(255) character set utf8 NOT NULL default '',
  `accommodation_values` varchar(255) character set utf8 NOT NULL default '',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`accommodation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_activities`
--

DROP TABLE IF EXISTS `portal_activities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_activities` (
  `activity_id` int(11) NOT NULL auto_increment,
  `activity_level` int(11) NOT NULL default '0',
  `activity_subject` int(11) NOT NULL default '0',
  `activity_unit` int(11) NOT NULL default '0',
  `activity_name` varchar(255) NOT NULL default '',
  `activity_order` int(11) NOT NULL default '0',
  `activity_description` text,
  `model_type` enum('DIY','MW','Web','Probe','NetLogo','PhET','Seismic Eruption','MAC','Other','None','Seismic Waves','Qualitative Grapher','Linear Transformer','Quadratic Grapher','Piecewise Linear Grapher','Function Analyzer') NOT NULL default 'None',
  `sensor_type` enum('Temperature','Light','Pressure','Voltage','Force - 5N','Force - 50N','Motion','Relative Humidity','CO2','Oxygen Gas','pH','Salinity','Raw Data','Raw Voltage','None','Microphone') NOT NULL default 'None',
  `diy_identifier` varchar(255) NOT NULL default '',
  `diy_uuid` varchar(255) NOT NULL default '',
  `activity_models` varchar(255) NOT NULL default '',
  `activity_sensors` varchar(255) NOT NULL default '',
  `activity_materials` varchar(255) NOT NULL default '',
  `activity_author` varchar(255) NOT NULL default '',
  `activity_status` enum('Public','Edited','Ready','Development','Planned','Written','Tested') NOT NULL default 'Public',
  `activity_notes` text NOT NULL,
  `activity_teacher_guide` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`activity_id`),
  KEY `unit_index` (`activity_unit`,`activity_order`),
  KEY `subject_index` (`activity_subject`,`activity_order`),
  KEY `level_index` (`activity_level`,`activity_order`)
) ENGINE=MyISAM AUTO_INCREMENT=9377 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_class_activities`
--

DROP TABLE IF EXISTS `portal_class_activities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_class_activities` (
  `class_activity_id` int(11) NOT NULL auto_increment,
  `class_id` int(11) NOT NULL default '0',
  `activity_id` int(11) NOT NULL default '0',
  `original_activity_id` int(11) NOT NULL default '0',
  `status` varchar(10) default 'active',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_activity_id`),
  KEY `class_id_index` USING BTREE (`class_id`,`status`),
  KEY `activity_id_index` USING BTREE (`activity_id`,`status`),
  KEY `class_activity_index` (`class_id`,`activity_id`),
  KEY `activity_class_index` (`activity_id`,`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12302 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_class_diy_activities`
--

DROP TABLE IF EXISTS `portal_class_diy_activities`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_class_diy_activities` (
  `class_diy_activity_id` int(11) NOT NULL auto_increment,
  `class_id` int(11) NOT NULL default '0',
  `diy_activity_id` int(11) NOT NULL default '0',
  `project_id` int(11) NOT NULL default '0',
  `status` varchar(10) default 'active',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_diy_activity_id`),
  KEY `class_id_index` (`class_id`,`status`),
  KEY `diy_id_index` (`diy_activity_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1403 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_class_students`
--

DROP TABLE IF EXISTS `portal_class_students`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_class_students` (
  `class_student_id` int(11) NOT NULL auto_increment,
  `class_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_student_id`),
  KEY `class_id_index` (`class_id`),
  KEY `member_id_index` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27677 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_class_words`
--

DROP TABLE IF EXISTS `portal_class_words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_class_words` (
  `class_word_id` int(11) NOT NULL auto_increment,
  `class_word` varchar(255) NOT NULL default '',
  `class_id` int(11) NOT NULL default '0',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_word_id`),
  KEY `class_word` (`class_word`)
) ENGINE=MyISAM AUTO_INCREMENT=7043 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_classes`
--

DROP TABLE IF EXISTS `portal_classes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_classes` (
  `class_id` int(11) NOT NULL auto_increment,
  `class_uuid` varchar(36) NOT NULL default '',
  `class_name` varchar(255) NOT NULL default '',
  `class_semester_year` varchar(255) NOT NULL,
  `class_school` int(11) NOT NULL default '0',
  `class_teacher` int(11) NOT NULL default '0',
  `class_state` varchar(64) NOT NULL default 'active',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_id`),
  KEY `teacher_index` (`class_teacher`,`class_state`),
  KEY `school_index` (`class_school`,`class_state`)
) ENGINE=MyISAM AUTO_INCREMENT=2339 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_comments_ratings`
--

DROP TABLE IF EXISTS `portal_comments_ratings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_comments_ratings` (
  `comment_id` int(11) NOT NULL auto_increment,
  `comment_author` int(11) NOT NULL default '0',
  `comment_title` varchar(255) NOT NULL default '',
  `comment_body` text NOT NULL,
  `comment_diy_identifier` int(11) NOT NULL default '0',
  `comment_rating` double NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`comment_id`),
  KEY `comment_diy_identifier` (`comment_diy_identifier`),
  KEY `comment_author` (`comment_author`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_districts`
--

DROP TABLE IF EXISTS `portal_districts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_districts` (
  `district_id` int(11) NOT NULL auto_increment,
  `district_name` varchar(255) NOT NULL default '',
  `district_address_1` varchar(255) NOT NULL default '',
  `district_address_2` varchar(255) NOT NULL default '',
  `district_city` varchar(255) NOT NULL default '',
  `district_state` varchar(255) NOT NULL default '',
  `district_zip` varchar(255) NOT NULL default '',
  `district_country` varchar(255) NOT NULL default '',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1787 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_levels`
--

DROP TABLE IF EXISTS `portal_levels`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_levels` (
  `level_id` int(11) NOT NULL auto_increment,
  `level_name` varchar(255) NOT NULL default '',
  `level_description` text NOT NULL,
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_links`
--

DROP TABLE IF EXISTS `portal_links`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_links` (
  `link_id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `link_parent` int(11) NOT NULL,
  `link_order` int(11) NOT NULL,
  `link_nav_title` varchar(125) NOT NULL,
  `link_title` varchar(250) NOT NULL,
  `link_style` varchar(250) NOT NULL,
  `link_href` varchar(350) NOT NULL,
  `link_description` varchar(1500) NOT NULL,
  `link_enabled` enum('Yes','No') NOT NULL default 'Yes',
  `require_login` enum('Yes','No') NOT NULL default 'No',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY  (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_members`
--

DROP TABLE IF EXISTS `portal_members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_members` (
  `member_id` int(11) NOT NULL auto_increment,
  `member_username` varchar(255) NOT NULL default '',
  `member_password` varchar(255) NOT NULL default '',
  `member_password_ue` varchar(255) default NULL,
  `member_first_name` varchar(255) NOT NULL default '',
  `member_last_name` varchar(255) NOT NULL default '',
  `member_email` varchar(255) NOT NULL default '',
  `member_type` varchar(255) default NULL,
  `member_grade` varchar(255) default NULL,
  `member_source` varchar(255) default NULL,
  `member_school` int(11) NOT NULL default '0',
  `member_state` varchar(64) NOT NULL default 'active',
  `cc_member_id` int(11) NOT NULL default '0',
  `diy_member_id` int(11) NOT NULL default '0',
  `sds_member_id` int(11) NOT NULL default '0',
  `member_interface` int(11) NOT NULL default '6',
  `taking_course` int(11) NOT NULL default '0',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`member_id`),
  UNIQUE KEY `member_username` (`member_username`),
  UNIQUE KEY `member_email` (`member_email`),
  KEY `member_type` (`member_type`),
  KEY `school_index` USING BTREE (`member_school`,`member_type`(10))
) ENGINE=MyISAM AUTO_INCREMENT=27747 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_project_configurations`
--

DROP TABLE IF EXISTS `portal_project_configurations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_project_configurations` (
  `project_configuration_id` int(11) NOT NULL auto_increment,
  `project_id` int(11) default NULL,
  `diy_url` varchar(255) default NULL,
  `diy_database_name` varchar(255) default NULL,
  `diy_database_host` varchar(255) default NULL,
  `diy_database_user` varchar(255) default NULL,
  `diy_database_password` varchar(255) default NULL,
  `diy_database_table_prefix` varchar(255) default NULL,
  `diy_activity_type` varchar(255) default NULL,
  `sds_portal` int(11) default NULL,
  PRIMARY KEY  (`project_configuration_id`),
  KEY `project_index` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_projects`
--

DROP TABLE IF EXISTS `portal_projects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_projects` (
  `project_id` int(11) NOT NULL auto_increment,
  `project_name` varchar(255) NOT NULL default '',
  `project_title` varchar(255) NOT NULL default '',
  `project_description` text NOT NULL,
  `project_logo` varchar(255) NOT NULL default '',
  `project_url` varchar(255) NOT NULL default '',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `project_diy_url` varchar(255) default NULL,
  `project_activity_type` varchar(255) default NULL,
  `project_sds_portal` int(11) default NULL,
  PRIMARY KEY  (`project_id`),
  KEY `sds_portal_index` (`project_sds_portal`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_reserved_class_words`
--

DROP TABLE IF EXISTS `portal_reserved_class_words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_reserved_class_words` (
  `class_word_id` int(11) NOT NULL auto_increment,
  `class_word` varchar(255) NOT NULL default '',
  `teacher_id` int(11) NOT NULL default '0',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`class_word_id`),
  KEY `class_word` (`class_word`)
) ENGINE=MyISAM AUTO_INCREMENT=377 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_schools`
--

DROP TABLE IF EXISTS `portal_schools`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_schools` (
  `school_id` int(11) NOT NULL auto_increment,
  `school_name` varchar(255) NOT NULL default '',
  `school_department` varchar(200) default NULL,
  `school_district` varchar(255) default NULL,
  `school_address_1` varchar(255) NOT NULL default '',
  `school_address_2` varchar(255) NOT NULL default '',
  `school_city` varchar(255) NOT NULL default '',
  `school_state` varchar(255) NOT NULL default '',
  `school_zip` varchar(255) NOT NULL default '',
  `school_country` varchar(255) NOT NULL default '',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1291 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_subjects`
--

DROP TABLE IF EXISTS `portal_subjects`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_subjects` (
  `subject_id` int(11) NOT NULL auto_increment,
  `subject_name` varchar(255) NOT NULL default '',
  `subject_description` text NOT NULL,
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`subject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `portal_units`
--

DROP TABLE IF EXISTS `portal_units`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `portal_units` (
  `unit_id` int(11) NOT NULL auto_increment,
  `unit_name` varchar(255) NOT NULL default '',
  `unit_order` int(11) NOT NULL default '0',
  `unit_description` text NOT NULL,
  `unit_notes` text NOT NULL,
  `unit_project` int(11) NOT NULL default '1',
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`unit_id`),
  KEY `project_index` (`unit_project`,`unit_order`),
  KEY `order_index` (`unit_order`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-13 17:40:36
