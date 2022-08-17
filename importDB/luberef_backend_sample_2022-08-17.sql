# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: luberef_backend_sample
# Generation Time: 2022-08-17 14:09:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table asset_containers
# ------------------------------------------------------------

CREATE TABLE `asset_containers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_containers_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `asset_containers` WRITE;
/*!40000 ALTER TABLE `asset_containers` DISABLE KEYS */;

INSERT INTO `asset_containers` (`id`, `handle`, `title`, `disk`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,'assets','Assets','local','{\"allow_moving\": true, \"search_index\": null, \"allow_uploads\": true, \"allow_renaming\": true, \"create_folders\": true, \"allow_downloading\": true}','2022-08-14 11:23:34','2022-08-14 11:23:34');

/*!40000 ALTER TABLE `asset_containers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assets_meta
# ------------------------------------------------------------

CREATE TABLE `assets_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_meta_handle_index` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table blueprints
# ------------------------------------------------------------

CREATE TABLE `blueprints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blueprints_handle_namespace_unique` (`handle`,`namespace`),
  KEY `blueprints_namespace_index` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blueprints` WRITE;
/*!40000 ALTER TABLE `blueprints` DISABLE KEYS */;

INSERT INTO `blueprints` (`id`, `namespace`, `handle`, `data`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'default','{\"fields\": [{\"field\": {\"type\": \"markdown\", \"display\": \"Content\", \"localizable\": true}, \"handle\": \"content\"}, {\"field\": {\"type\": \"users\", \"default\": \"current\", \"display\": \"Author\", \"max_items\": 1, \"localizable\": true}, \"handle\": \"author\"}, {\"field\": {\"type\": \"template\", \"display\": \"Template\", \"localizable\": true}, \"handle\": \"template\"}]}','2022-08-17 14:07:16',NULL),
	(2,'collections.pages','pages','{\"title\": \"Pages\", \"sections\": {\"main\": {\"fields\": [{\"field\": {\"type\": \"text\", \"required\": true, \"validate\": [\"required\"]}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"replicator\", \"sets\": {\"page_banner\": {\"fields\": [{\"import\": \"page_banner\"}], \"display\": \"Page Banner\"}, \"about_section\": {\"fields\": [{\"import\": \"about_section_field\"}], \"display\": \"About Section\"}, \"bottom_banner\": {\"fields\": [{\"import\": \"bottom_banner\"}], \"display\": \"Bottom Banner\"}, \"features_section\": {\"fields\": [{\"import\": \"feature_section\"}], \"display\": \"Features Section\"}, \"overview_section\": {\"fields\": [{\"import\": \"overview_section_field\"}], \"display\": \"Overview Section\"}, \"latest_news_section\": {\"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Section Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"section_title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"link\"}, {\"field\": {\"icon\": \"entries\", \"mode\": \"default\", \"type\": \"entries\", \"create\": true, \"display\": \"News\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"news\"}], \"display\": \"Latest  News Section\"}, \"focused_item_section\": {\"fields\": [{\"import\": \"focused_item_field\"}], \"display\": \"Focused Item Section\"}, \"big_rich_slider_section\": {\"fields\": [{\"import\": \"big_rich_slider\"}], \"display\": \"Big Rich Slider Section\"}, \"features_slider_section\": {\"fields\": [{\"import\": \"features_slider_field\"}], \"display\": \"Features Slider Section\"}}, \"type\": \"replicator\", \"display\": \"Page Components\", \"collapse\": false, \"listable\": \"hidden\", \"previews\": true, \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"page_components\"}], \"__count\": 0, \"display\": \"Main\"}, \"sidebar\": {\"fields\": [{\"field\": {\"type\": \"slug\", \"localizable\": true}, \"handle\": \"slug\"}, {\"field\": {\"type\": \"entries\", \"listable\": false, \"max_items\": 1, \"collections\": [\"pages\"], \"localizable\": true}, \"handle\": \"parent\"}], \"__count\": 1, \"display\": \"Sidebar\"}}}','2022-08-14 13:17:23','2022-08-14 13:17:23');

/*!40000 ALTER TABLE `blueprints` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table collections
# ------------------------------------------------------------

CREATE TABLE `collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;

INSERT INTO `collections` (`id`, `handle`, `title`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,'news','News','{\"dated\": false, \"mount\": null, \"sites\": [\"default\"], \"slugs\": true, \"inject\": [], \"layout\": null, \"routes\": null, \"ampable\": false, \"sort_dir\": \"asc\", \"template\": null, \"propagate\": false, \"revisions\": false, \"structure\": null, \"sort_field\": \"title\", \"taxonomies\": null, \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\"}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}','2022-08-14 11:49:07','2022-08-14 11:49:07'),
	(2,'pages','Pages','{\"dated\": false, \"mount\": null, \"sites\": [\"default\"], \"slugs\": true, \"inject\": [], \"layout\": \"layout\", \"routes\": null, \"ampable\": false, \"sort_dir\": \"asc\", \"template\": \"default\", \"propagate\": false, \"revisions\": false, \"structure\": {\"root\": true}, \"sort_field\": \"title\", \"taxonomies\": null, \"search_index\": null, \"title_formats\": [], \"default_status\": true, \"preview_targets\": [{\"label\": \"Entry\", \"format\": \"{permalink}\"}], \"past_date_behavior\": \"public\", \"future_date_behavior\": \"private\"}','2022-08-17 07:58:53','2022-08-17 07:58:53');

/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

CREATE TABLE `entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin_id` bigint(20) unsigned DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entries_origin_id_foreign` (`origin_id`),
  KEY `entries_site_index` (`site`),
  KEY `entries_uri_index` (`uri`),
  KEY `entries_collection_index` (`collection`),
  CONSTRAINT `entries_origin_id_foreign` FOREIGN KEY (`origin_id`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fieldsets
# ------------------------------------------------------------

CREATE TABLE `fieldsets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldsets_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `fieldsets` WRITE;
/*!40000 ALTER TABLE `fieldsets` DISABLE KEYS */;

INSERT INTO `fieldsets` (`id`, `handle`, `data`, `created_at`, `updated_at`)
VALUES
	(1,'about_section_field','{\"title\": \"About Section Field\", \"fields\": [{\"field\": {\"icon\": \"assets\", \"mode\": \"grid\", \"type\": \"assets\", \"display\": \"Logo\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"logo\"}, {\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"assets\", \"mode\": \"grid\", \"type\": \"assets\", \"display\": \"Background Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"background_image\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"collections\": [\"pages\", \"news\"], \"instructions_position\": \"above\"}, \"handle\": \"link\"}]}','2022-08-14 12:25:33','2022-08-14 12:25:33'),
	(2,'big_rich_slider','{\"title\": \"Big Rich Slider\", \"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Main Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"main_title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Main Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"main_description\"}, {\"field\": {\"icon\": \"replicator\", \"sets\": {\"slide\": {\"fields\": [{\"import\": \"rich_slide_content\"}], \"display\": \"Slide\"}}, \"type\": \"replicator\", \"display\": \"Sliders\", \"collapse\": false, \"listable\": \"hidden\", \"previews\": true, \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"sliders\"}]}','2022-08-14 11:41:28','2022-08-14 11:41:28'),
	(3,'bottom_banner','{\"title\": \"Bottom Banner\", \"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"collections\": [\"pages\"], \"instructions_position\": \"above\"}, \"handle\": \"link\"}]}','2022-08-14 11:51:18','2022-08-14 11:51:18'),
	(4,'feature_component','{\"title\": \"Feature Component\", \"fields\": [{\"field\": {\"icon\": \"assets\", \"mode\": \"list\", \"type\": \"assets\", \"display\": \"Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"image\"}, {\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}]}','2022-08-14 11:35:16','2022-08-14 11:35:16'),
	(5,'feature_section','{\"title\": \"Feature Section\", \"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Main Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"main_title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"replicator\", \"sets\": {\"feature\": {\"fields\": [{\"import\": \"feature_component\"}], \"display\": \"Feature\"}}, \"type\": \"replicator\", \"display\": \"Features\", \"collapse\": false, \"listable\": \"hidden\", \"previews\": true, \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"features\"}]}','2022-08-14 11:35:31','2022-08-14 11:35:31'),
	(6,'features_slider_field','{\"title\": \"Features Slider Field\", \"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"replicator\", \"sets\": {\"feature\": {\"fields\": [{\"import\": \"feature_component\"}], \"display\": \"Feature\"}}, \"type\": \"replicator\", \"display\": \"Features\", \"collapse\": false, \"listable\": \"hidden\", \"previews\": true, \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"features\"}]}','2022-08-14 13:16:55','2022-08-14 13:16:55'),
	(7,'focused_item_field','{\"title\": \"Focused Item Field\", \"fields\": [{\"field\": {\"icon\": \"select\", \"type\": \"select\", \"display\": \"Select Image Position\", \"options\": {\"left_image\": \"Make Image Left\", \"right_image\": \"Make Image Right\"}, \"listable\": \"hidden\", \"multiple\": false, \"taggable\": false, \"validate\": [\"required\"], \"clearable\": false, \"max_items\": 1, \"push_tags\": false, \"searchable\": true, \"visibility\": \"visible\", \"cast_booleans\": false, \"instructions_position\": \"above\"}, \"handle\": \"select_image_position\"}, {\"field\": {\"icon\": \"assets\", \"mode\": \"grid\", \"type\": \"assets\", \"display\": \"Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"image\"}, {\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"bard\", \"type\": \"bard\", \"antlers\": false, \"buttons\": [\"h3\", \"bold\"], \"display\": \"Description\", \"listable\": \"hidden\", \"previews\": true, \"save_html\": true, \"fullscreen\": true, \"visibility\": \"visible\", \"allow_source\": true, \"reading_time\": false, \"target_blank\": false, \"toolbar_mode\": \"fixed\", \"link_noopener\": false, \"link_noreferrer\": false, \"enable_input_rules\": true, \"enable_paste_rules\": true, \"remove_empty_nodes\": \"trim\", \"instructions_position\": \"above\", \"always_show_set_button\": false}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"collections\": [\"news\", \"pages\"], \"instructions_position\": \"above\"}, \"handle\": \"link\"}]}','2022-08-14 12:33:20','2022-08-14 12:33:20'),
	(8,'overview_section_field','{\"title\": \"Overview Section Field\", \"fields\": [{\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"bard\", \"type\": \"bard\", \"antlers\": false, \"buttons\": [\"bold\"], \"display\": \"Description\", \"listable\": \"hidden\", \"previews\": true, \"save_html\": true, \"fullscreen\": true, \"visibility\": \"visible\", \"allow_source\": true, \"reading_time\": false, \"target_blank\": false, \"toolbar_mode\": \"fixed\", \"link_noopener\": false, \"link_noreferrer\": false, \"enable_input_rules\": true, \"enable_paste_rules\": true, \"remove_empty_nodes\": \"trim\", \"instructions_position\": \"above\", \"always_show_set_button\": false}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"assets\", \"mode\": \"list\", \"type\": \"assets\", \"display\": \"Background Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"background_image\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"collections\": [\"pages\", \"news\"], \"instructions_position\": \"above\"}, \"handle\": \"link\"}]}','2022-08-14 11:57:49','2022-08-14 11:57:49'),
	(9,'page_banner','{\"title\": \"Page Banner\", \"fields\": [{\"field\": {\"icon\": \"toggle\", \"type\": \"toggle\", \"default\": false, \"display\": \"Has Video\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"has_video\"}, {\"field\": {\"icon\": \"assets\", \"mode\": \"grid\", \"type\": \"assets\", \"unless\": {\"has_video\": \"equals 1\"}, \"display\": \"Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"image\"}, {\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}]}','2022-08-14 11:26:13','2022-08-14 11:26:13'),
	(10,'rich_slide_content','{\"title\": \"Rich Slide Content\", \"fields\": [{\"field\": {\"icon\": \"assets\", \"mode\": \"list\", \"type\": \"assets\", \"display\": \"Image\", \"listable\": \"hidden\", \"restrict\": false, \"container\": \"assets\", \"max_files\": 1, \"visibility\": \"visible\", \"allow_uploads\": true, \"show_filename\": true, \"instructions_position\": \"above\"}, \"handle\": \"image\"}, {\"field\": {\"icon\": \"text\", \"type\": \"text\", \"antlers\": false, \"display\": \"Title\", \"listable\": \"hidden\", \"input_type\": \"text\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"title\"}, {\"field\": {\"icon\": \"textarea\", \"type\": \"textarea\", \"antlers\": false, \"display\": \"Description\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"instructions_position\": \"above\"}, \"handle\": \"description\"}, {\"field\": {\"icon\": \"link\", \"type\": \"link\", \"display\": \"Link\", \"listable\": \"hidden\", \"visibility\": \"visible\", \"collections\": [\"pages\"], \"instructions_position\": \"above\"}, \"handle\": \"link\"}]}','2022-08-14 11:41:14','2022-08-14 11:41:14');

/*!40000 ALTER TABLE `fieldsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table form_submissions
# ------------------------------------------------------------

CREATE TABLE `form_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_submissions_form_id_created_at_unique` (`form_id`,`created_at`),
  CONSTRAINT `form_submissions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table forms
# ------------------------------------------------------------

CREATE TABLE `forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forms_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table global_sets
# ------------------------------------------------------------

CREATE TABLE `global_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localizations` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `global_sets_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2022_08_16_163642_create_taxonomies_table',1),
	(6,'2022_08_16_163643_create_terms_table',1),
	(7,'2022_08_16_163644_create_globals_table',1),
	(8,'2022_08_16_163645_create_navigations_table',1),
	(9,'2022_08_16_163646_create_navigation_trees_table',1),
	(10,'2022_08_16_163647_create_collections_table',1),
	(11,'2022_08_16_163648_create_blueprints_table',1),
	(12,'2022_08_16_163649_create_fieldsets_table',1),
	(13,'2022_08_16_163650_create_forms_table',1),
	(14,'2022_08_16_163651_create_form_submissions_table',1),
	(15,'2022_08_16_163652_create_asset_containers_table',1),
	(16,'2022_08_16_163653_create_asset_table',1),
	(17,'2022_08_16_163654_create_revisions_table',1),
	(18,'2022_08_17_080515_create_entries_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table navigations
# ------------------------------------------------------------

CREATE TABLE `navigations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table revisions
# ------------------------------------------------------------

CREATE TABLE `revisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_key_created_at_unique` (`key`,`created_at`),
  KEY `revisions_action_index` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table taxonomies
# ------------------------------------------------------------

CREATE TABLE `taxonomies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sites` json DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxonomies_handle_unique` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table taxonomy_terms
# ------------------------------------------------------------

CREATE TABLE `taxonomy_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxonomy_terms_slug_taxonomy_site_unique` (`slug`,`taxonomy`,`site`),
  KEY `taxonomy_terms_site_index` (`site`),
  KEY `taxonomy_terms_uri_index` (`uri`),
  KEY `taxonomy_terms_taxonomy_index` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table trees
# ------------------------------------------------------------

CREATE TABLE `trees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tree` json DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trees_handle_type_locale_unique` (`handle`,`type`,`locale`),
  KEY `trees_type_index` (`type`),
  KEY `trees_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `trees` WRITE;
/*!40000 ALTER TABLE `trees` DISABLE KEYS */;

INSERT INTO `trees` (`id`, `handle`, `type`, `locale`, `tree`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,'pages','collection','default','[]','{\"initial_path\": null}','2022-08-17 14:08:13','2022-08-17 14:08:13');

/*!40000 ALTER TABLE `trees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
