DROP TABLE IF EXISTS sym_authors;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_authors (`id`,`username`,`password`,`first_name`,`last_name`,`email`,`last_seen`,`user_type`,`primary`,`default_area`,`auth_token_active`,`language`) VALUES ('1','admin','d033e22ae348aeb5660fc2140aec35850c4da997','Admin','Name','dave@veodesign.co.uk','2012-07-23 19:05:34','developer','yes','','no','');



DROP TABLE IF EXISTS sym_cache;

CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_entries;

CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_extensions;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('1','database_migrations','enabled','1.0');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('2','debugdevkit','enabled','1.2.2');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('3','export_ensemble','enabled','2.0.1');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('4','jit_image_manipulation','enabled','1.15');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('5','limit_section_entries','enabled','1.0.1');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('6','maintenance_mode','enabled','1.6');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('7','markdown','enabled','1.14');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('8','profiledevkit','enabled','1.1');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('9','selectbox_link_field','enabled','1.23');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('10','symql','enabled','0.7.0');
INSERT INTO sym_extensions (`id`,`name`,`status`,`version`) VALUES ('11','xssfilter','enabled','1.1.1');



DROP TABLE IF EXISTS sym_extensions_delegates;

CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('1','1','/backend/','AppendPageAlert','appendAlert');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('2','1','/frontend/','PostQueryExecution','processQuery');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('3','1','/backend/','PostQueryExecution','processQuery');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('4','2','/frontend/','FrontendDevKitResolve','frontendDevKitResolve');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('5','2','/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('6','3','/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('7','4','/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('8','4','/system/preferences/','Save','__SavePreferences');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('9','5','/backend/','InitaliseAdminPageHead','dInitaliseAdminPageHead');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('10','5','/backend/','AdminPagePreGenerate','dAdminPagePreGenerate');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('11','5','/blueprints/sections/','AddSectionElements','dAddSectionElements');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('12','5','/blueprints/sections/','SectionPreCreate','dSaveSectionSettings');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('13','5','/blueprints/sections/','SectionPreEdit','dSaveSectionSettings');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('14','6','/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('15','6','/system/preferences/','Save','__SavePreferences');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('16','6','/system/preferences/','CustomActions','__toggleMaintenanceMode');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('17','6','/backend/','AppendPageAlert','__appendAlert');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('18','6','/blueprints/pages/','AppendPageContent','__appendType');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('19','6','/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('20','6','/frontend/','FrontendParamsResolve','__addParam');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('21','8','/frontend/','FrontendDevKitResolve','frontendDevKitResolve');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('22','8','/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('23','11','/blueprints/events/new/','AppendEventFilter','appendEventFilter');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('24','11','/blueprints/events/edit/','AppendEventFilter','appendEventFilter');
INSERT INTO sym_extensions_delegates (`id`,`extension_id`,`page`,`delegate`,`callback`) VALUES ('25','11','/frontend/','EventPreSaveFilter','eventPreSaveFilter');



DROP TABLE IF EXISTS sym_fields;

CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_author;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_checkbox;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_date;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_input;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_select;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_selectbox_link;

CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_taglist;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_textarea;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_fields_upload;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_forgotpass;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_pages;

CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_pages_types;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_sections;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') COLLATE utf8_unicode_ci DEFAULT 'asc',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `max_entries` int(11) NOT NULL DEFAULT '0',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_sections_association;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS sym_sessions;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_sessions (`session`,`session_expires`,`session_data`) VALUES ('5cd2caaec758613819188dff108ac3f5','1343070303','sym-|a:2:{s:8:"username";s:5:"admin";s:4:"pass";s:40:"d033e22ae348aeb5660fc2140aec35850c4da997";}');



