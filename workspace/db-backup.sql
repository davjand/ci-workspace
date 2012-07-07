DROP TABLE sym_authors;

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
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_authors VALUES("1","jetbackwards","36b15a1d240416d2296b913b2a22d51809eac403","Thomas","Johnson","jetbackwards@gmail.com","2012-02-27 14:23:08","developer","yes","","no","");



DROP TABLE sym_cache;

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




DROP TABLE sym_entries;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_entries VALUES("1","1","1","2012-02-19 21:11:30","2012-02-19 21:11:30");
INSERT INTO sym_entries VALUES("2","1","1","2012-02-19 21:12:02","2012-02-19 21:12:02");



DROP TABLE sym_entries_data_1;

CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_entries_data_1 VALUES("5","1","hello-world","Hello World!");
INSERT INTO sym_entries_data_1 VALUES("6","2","hola-mundo","Hola Mundo!");



DROP TABLE sym_entries_data_2;

CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_entries_data_2 VALUES("1","1","Here is Edward Bear, coming downstairs now—bump, bump, bump—on the back of his head, behind Christopher Robin. It is, as far as he knows, the only way of coming downstairs, but sometimes he feels that there really is another way, if only he could stop bumping for a moment and think of it.","");
INSERT INTO sym_entries_data_2 VALUES("2","2","He aquí al Oso Eduardo bajando las escaleras con la cabeza—plom, plom, plom—de la mano de Christopher Robin. Es la única manera que él conoce de bajar las escaleras, aunque a veces piensa que deber haber otra forma mejor que seguramente la descubriría si pudiera dejar de darse golpes en la cabeza y pararse a pensar.","");



DROP TABLE sym_entries_data_3;

CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_entries_data_3 VALUES("1","1","2012-02-19T22:32:00+00:00","1329690720","1329690720");
INSERT INTO sym_entries_data_3 VALUES("2","2","2012-02-19T22:33:00+00:00","1329690780","1329690780");



DROP TABLE sym_entries_data_4;

CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_entries_data_4 VALUES("1","1","english","English");
INSERT INTO sym_entries_data_4 VALUES("2","2","spanish","Spanish");



DROP TABLE sym_etf_conditions;

CREATE TABLE `sym_etf_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortorder` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `senders` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recipients` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page` int(11) NOT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_etf_logs;

CREATE TABLE `sym_etf_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `success` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senders` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_etf_templates;

CREATE TABLE `sym_etf_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conditions` int(11) unsigned DEFAULT NULL,
  `datasources` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_extensions;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_extensions VALUES("1","debugdevkit","enabled","1.2.1");
INSERT INTO sym_extensions VALUES("2","markdown","enabled","1.13");
INSERT INTO sym_extensions VALUES("3","frontendmembermanager","enabled","1.0.12");
INSERT INTO sym_extensions VALUES("4","emailtemplatefilter","enabled","1.1.0");



DROP TABLE sym_extensions_delegates;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_extensions_delegates VALUES("1","1","/frontend/","FrontendDevKitResolve","frontendDevKitResolve");
INSERT INTO sym_extensions_delegates VALUES("2","1","/frontend/","ManipulateDevKitNavigation","manipulateDevKitNavigation");
INSERT INTO sym_extensions_delegates VALUES("3","3","/frontend/","FrontendPageResolved","initialize");
INSERT INTO sym_extensions_delegates VALUES("4","3","/frontend/","FrontendParamsResolve","parameters");
INSERT INTO sym_extensions_delegates VALUES("5","3","/system/preferences/","AddCustomPreferenceFieldsets","addCustomPreferenceFieldsets");
INSERT INTO sym_extensions_delegates VALUES("6","4","/blueprints/events/edit/","AppendEventFilter","addFilterToEventEditor");
INSERT INTO sym_extensions_delegates VALUES("7","4","/blueprints/events/new/","AppendEventFilter","addFilterToEventEditor");
INSERT INTO sym_extensions_delegates VALUES("8","4","/frontend/","EventFinalSaveFilter","eventFinalSaveFilter");
INSERT INTO sym_extensions_delegates VALUES("9","4","/frontend/","FrontendPageResolved","setPage");
INSERT INTO sym_extensions_delegates VALUES("10","4","/frontend/","FrontendParamsResolve","setParams");



DROP TABLE sym_fields;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_fields VALUES("1","Greeting Title","greeting-title","input","1","yes","0","main","yes");
INSERT INTO sym_fields VALUES("2","Greeting Content","greeting-content","textarea","1","no","1","main","no");
INSERT INTO sym_fields VALUES("3","Date","date","date","1","no","2","sidebar","yes");
INSERT INTO sym_fields VALUES("4","Language","language","select","1","no","3","sidebar","yes");



DROP TABLE sym_fields_author;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_checkbox;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_date;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_fields_date VALUES("2","3","yes");



DROP TABLE sym_fields_input;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_fields_input VALUES("3","1","");



DROP TABLE sym_fields_memberemail;

CREATE TABLE `sym_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_memberpassword;

CREATE TABLE `sym_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` int(11) unsigned NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'good',
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_memberstatus;

CREATE TABLE `sym_fields_memberstatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_select;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_fields_select VALUES("1","4","no","no","no","Chinese, Spanish, English, Hindi, Arabic, Bengali, Portuguese, Russian, Japanese, German, Javanese, Punjabi, Wu, Telugu, Vietnamese, Marathi, French, Korean, Tamil, Italian","");



DROP TABLE sym_fields_taglist;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fields_textarea;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_fields_textarea VALUES("2","2","","15");



DROP TABLE sym_fields_upload;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_fmm_tracking;

CREATE TABLE `sym_fmm_tracking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned DEFAULT NULL,
  `access_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`access_id`,`client_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_forgotpass;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE sym_pages;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_pages VALUES("1","","Home","home","","","greetings","","1");



DROP TABLE sym_pages_types;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_pages_types VALUES("2","1","index");



DROP TABLE sym_sections;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') COLLATE utf8_unicode_ci DEFAULT 'asc',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_sections VALUES("1","Greetings","greetings","1","","asc","no","Content");



DROP TABLE sym_sections_association;

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




DROP TABLE sym_sessions;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO sym_sessions VALUES("o5aa2dh9gdfv7c0f40a09gdjg0","1329694405","sym-|a:2:{s:8:\"username\";s:12:\"jetbackwards\";s:4:\"pass\";s:40:\"36b15a1d240416d2296b913b2a22d51809eac403\";}");
INSERT INTO sym_sessions VALUES("98dbskmnke2ro0ircakesqf711","1330352588","sym-|a:2:{s:8:\"username\";s:12:\"jetbackwards\";s:4:\"pass\";s:40:\"36b15a1d240416d2296b913b2a22d51809eac403\";}");



