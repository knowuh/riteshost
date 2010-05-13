-- MySQL dump 10.11
--
-- Host: database.concord.org    Database: mystery4
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
-- Table structure for table `mystery_access_log`
--

DROP TABLE IF EXISTS `mystery_access_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_access_log` (
  `record_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `user_ip_address` varchar(20) NOT NULL default '',
  `user_action` varchar(50) NOT NULL default '',
  `user_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_request` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Exception Log';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_binary_fields`
--

DROP TABLE IF EXISTS `mystery_binary_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_binary_fields` (
  `bf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `filename_field_name` char(35) NOT NULL default '',
  `size_field_name` char(35) NOT NULL default '',
  `type_field_name` char(35) NOT NULL default '',
  `width_field_name` char(35) NOT NULL default '',
  `height_field_name` char(35) NOT NULL default '',
  `path_to_file` char(250) NOT NULL default 'binaries',
  `max_size_of_file` int(11) NOT NULL default '500000',
  `rename_file` enum('yes','no') NOT NULL default 'yes',
  `overwrite_file` enum('yes','no') NOT NULL default 'no',
  `external_processor` char(255) NOT NULL default '',
  PRIMARY KEY  (`bf_id`),
  UNIQUE KEY `table_id` (`table_id`,`filename_field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_configuration`
--

DROP TABLE IF EXISTS `mystery_configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_configuration` (
  `record_id` int(11) NOT NULL auto_increment,
  `directive` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`),
  UNIQUE KEY `directive` (`directive`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COMMENT='This table holds configuration information';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_countries`
--

DROP TABLE IF EXISTS `mystery_countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_countries` (
  `country_id` int(11) NOT NULL auto_increment,
  `country_abbr` char(2) NOT NULL default '',
  `country_name` char(50) NOT NULL default '',
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1 COMMENT='Countries of the world';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_custom_actions`
--

DROP TABLE IF EXISTS `mystery_custom_actions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_custom_actions` (
  `action_id` int(11) NOT NULL auto_increment,
  `action_file_name` char(50) NOT NULL default '',
  `action_label` char(35) NOT NULL default '',
  PRIMARY KEY  (`action_id`),
  UNIQUE KEY `action_label` (`action_label`),
  UNIQUE KEY `action_file_name` (`action_file_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_custom_main_menu_items`
--

DROP TABLE IF EXISTS `mystery_custom_main_menu_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_custom_main_menu_items` (
  `menu_item_id` int(11) NOT NULL auto_increment,
  `menu_item_name` varchar(50) NOT NULL default '',
  `menu_item_action` varchar(50) NOT NULL default '',
  `menu_item_file` varchar(200) NOT NULL default '',
  `menu_item_status` enum('Active','Inactive') NOT NULL default 'Active',
  `menu_item_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`menu_item_id`),
  UNIQUE KEY `menu_item_action` (`menu_item_action`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Main Menu Items';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_custom_menus`
--

DROP TABLE IF EXISTS `mystery_custom_menus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_custom_menus` (
  `menu_id` int(11) NOT NULL auto_increment,
  `menu_file_name` char(50) NOT NULL default '',
  `menu_label` char(35) NOT NULL default '',
  PRIMARY KEY  (`menu_id`),
  UNIQUE KEY `menu_label` (`menu_label`),
  UNIQUE KEY `menu_file_name` (`menu_file_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_custom_triggers`
--

DROP TABLE IF EXISTS `mystery_custom_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_custom_triggers` (
  `trigger_id` int(11) NOT NULL auto_increment,
  `trigger_file_name` char(50) NOT NULL default '',
  `trigger_label` char(35) NOT NULL default '',
  `trigger_when` enum('before','after') NOT NULL default 'before',
  `trigger_condition` enum('all','insert','update','delete') NOT NULL default 'all',
  PRIMARY KEY  (`trigger_id`),
  UNIQUE KEY `trigger_file_name` (`trigger_file_name`),
  UNIQUE KEY `trigger_label` (`trigger_label`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_error_log`
--

DROP TABLE IF EXISTS `mystery_error_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_error_log` (
  `error_id` int(11) NOT NULL auto_increment,
  `error_type` varchar(255) NOT NULL default '',
  `error_message` text NOT NULL,
  `error_file` varchar(255) NOT NULL default '',
  `error_line` varchar(255) NOT NULL default '',
  `error_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`error_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4838005 DEFAULT CHARSET=latin1 COMMENT='Mystery Error Log';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_foreign_keys`
--

DROP TABLE IF EXISTS `mystery_foreign_keys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_foreign_keys` (
  `foreign_key_id` int(11) NOT NULL auto_increment,
  `local_table_id` int(11) NOT NULL default '0',
  `local_table_field` char(35) NOT NULL default '',
  `foreign_table_id` int(11) NOT NULL default '0',
  `foreign_table_label_field` char(150) NOT NULL default '',
  `foreign_table_value_field` char(35) NOT NULL default '',
  `list_display_type` enum('select','radio') NOT NULL default 'select',
  PRIMARY KEY  (`foreign_key_id`),
  UNIQUE KEY `local_table_id` (`local_table_id`,`local_table_field`,`foreign_table_id`,`foreign_table_value_field`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_group_hidden_fields`
--

DROP TABLE IF EXISTS `mystery_group_hidden_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_group_hidden_fields` (
  `hf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`hf_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_group_view_only_fields`
--

DROP TABLE IF EXISTS `mystery_group_view_only_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_group_view_only_fields` (
  `vo_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`vo_id`),
  UNIQUE KEY `table_id` (`table_id`,`group_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_groups`
--

DROP TABLE IF EXISTS `mystery_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` char(35) NOT NULL default '',
  `group_desc` char(255) NOT NULL default '',
  PRIMARY KEY  (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_groups_tables`
--

DROP TABLE IF EXISTS `mystery_groups_tables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_groups_tables` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_security_log`
--

DROP TABLE IF EXISTS `mystery_security_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_security_log` (
  `record_id` int(11) NOT NULL auto_increment,
  `exception_type` text NOT NULL,
  `exception_code` varchar(20) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `user_ip_address` varchar(20) NOT NULL default '',
  `user_action` varchar(50) NOT NULL default '',
  `user_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_request` varchar(255) NOT NULL default '',
  `user_variables` text NOT NULL,
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Exception Log';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_sessions`
--

DROP TABLE IF EXISTS `mystery_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_sessions` (
  `session_id` int(11) NOT NULL auto_increment,
  `session_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `session_key` varchar(255) NOT NULL default '',
  `session_data` mediumtext NOT NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1685845 DEFAULT CHARSET=latin1 COMMENT='Mystery Session Data Storage';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_states`
--

DROP TABLE IF EXISTS `mystery_states`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_states` (
  `state_id` int(11) NOT NULL auto_increment,
  `state_abbr` char(2) NOT NULL default '',
  `state_name` char(40) NOT NULL default '',
  PRIMARY KEY  (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COMMENT='US States List';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_table_custom_actions`
--

DROP TABLE IF EXISTS `mystery_table_custom_actions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_table_custom_actions` (
  `ca_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `action_id` int(11) NOT NULL default '0',
  `ca_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ca_id`),
  UNIQUE KEY `table_id` (`table_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_table_custom_menus`
--

DROP TABLE IF EXISTS `mystery_table_custom_menus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_table_custom_menus` (
  `cm_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `menu_id` int(11) NOT NULL default '0',
  `cm_group_restriction` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cm_id`),
  UNIQUE KEY `table_id` (`table_id`,`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_table_custom_triggers`
--

DROP TABLE IF EXISTS `mystery_table_custom_triggers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_table_custom_triggers` (
  `ct_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `trigger_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ct_id`),
  UNIQUE KEY `table_id` (`table_id`,`trigger_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_tables`
--

DROP TABLE IF EXISTS `mystery_tables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_tables` (
  `table_id` int(11) NOT NULL auto_increment,
  `table_database` char(50) NOT NULL default '',
  `table_real_name` char(50) NOT NULL default '',
  `table_display_name` char(100) NOT NULL default '',
  `table_display_comment` char(255) NOT NULL default '',
  `table_display_data_word` char(50) NOT NULL default 'data',
  `table_display_field_type` enum('yes','no') NOT NULL default 'no',
  `table_display_functions` enum('yes','no') NOT NULL default 'no',
  `table_default_action` char(35) NOT NULL default 'view_data',
  `table_default_query` char(255) NOT NULL default '',
  `table_default_order_field` char(35) NOT NULL default '',
  `table_default_reverse_sort` enum('yes','no') NOT NULL default 'no',
  `table_default_display` enum('horizontal','vertical') NOT NULL default 'horizontal',
  `table_default_display_fields` char(255) NOT NULL default '',
  `table_default_display_rows` int(4) NOT NULL default '25',
  `table_default_display_width` int(3) NOT NULL default '50',
  `table_primary_key` char(35) NOT NULL default '',
  `table_owner_key` char(35) NOT NULL default '',
  `table_owner_type` enum('','user','group') NOT NULL default '',
  `table_is_many_to_many` enum('yes','no') NOT NULL default 'no',
  `table_display_in_portal` enum('yes','no') NOT NULL default 'no',
  PRIMARY KEY  (`table_id`),
  UNIQUE KEY `table_name_db` (`table_real_name`,`table_database`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_user_hidden_fields`
--

DROP TABLE IF EXISTS `mystery_user_hidden_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_user_hidden_fields` (
  `hf_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`hf_id`),
  UNIQUE KEY `table_id` (`table_id`,`user_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_user_view_only_fields`
--

DROP TABLE IF EXISTS `mystery_user_view_only_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_user_view_only_fields` (
  `vo_id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `field_name` char(35) NOT NULL default '',
  PRIMARY KEY  (`vo_id`),
  UNIQUE KEY `table_id` (`table_id`,`user_id`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_users`
--

DROP TABLE IF EXISTS `mystery_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_username` varchar(50) NOT NULL default '',
  `user_password` varchar(32) NOT NULL default '',
  `user_valid_ip` varchar(20) NOT NULL default '*',
  `user_email` varchar(75) NOT NULL default '',
  `user_first_name` varchar(50) NOT NULL default '',
  `user_last_name` varchar(50) NOT NULL default '',
  `user_record_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_creation_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `user_token` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM AUTO_INCREMENT=22152 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_users_groups`
--

DROP TABLE IF EXISTS `mystery_users_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_users_groups` (
  `ug_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ug_id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mystery_users_info`
--

DROP TABLE IF EXISTS `mystery_users_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mystery_users_info` (
  `user_info_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `user_first_name` char(50) NOT NULL default '',
  `user_last_name` char(50) NOT NULL default '',
  `user_address_1` char(100) NOT NULL default '',
  `user_address_2` char(100) NOT NULL default '',
  `user_address_3` char(100) NOT NULL default '',
  `user_city` char(50) NOT NULL default '',
  `user_state` char(50) NOT NULL default '',
  `user_zip` char(15) NOT NULL default '',
  `user_province` char(50) NOT NULL default '',
  `user_postal_code` char(20) NOT NULL default '',
  `user_country` char(50) NOT NULL default '',
  `user_telephone` char(30) NOT NULL default '',
  `user_occupation` enum('','Student','Homemaker','Professional','Other') NOT NULL default '',
  `user_record_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_token` char(32) NOT NULL default '',
  PRIMARY KEY  (`user_info_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-13 17:40:14
