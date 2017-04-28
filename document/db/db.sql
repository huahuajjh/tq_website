/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.6.17 : Database - tianquecms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tianquecms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tianquecms`;

/*Table structure for table `lvyecms_access` */

DROP TABLE IF EXISTS `lvyecms_access`;

CREATE TABLE `lvyecms_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `app` varchar(20) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(20) NOT NULL DEFAULT '' COMMENT '方法',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有效',
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限表';

/*Data for the table `lvyecms_access` */

/*Table structure for table `lvyecms_admin_panel` */

DROP TABLE IF EXISTS `lvyecms_admin_panel`;

CREATE TABLE `lvyecms_admin_panel` (
  `mid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(32) NOT NULL DEFAULT '' COMMENT '菜单名',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '菜单地址',
  UNIQUE KEY `userid` (`mid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='常用菜单';

/*Data for the table `lvyecms_admin_panel` */

/*Table structure for table `lvyecms_anli` */

DROP TABLE IF EXISTS `lvyecms_anli`;

CREATE TABLE `lvyecms_anli` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_anli` */

insert  into `lvyecms_anli`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`description`,`posid`,`url`,`listorder`,`status`,`sysadd`,`islink`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (1,8,'A','','/d/file/content/2017/04/thumb_58f4d59330f01.jpg','A','','A',0,'/index.php?a=shows&catid=8&id=1',0,99,1,0,'admin',1492440474,1492440474,0,0,0,0,0,0);

/*Table structure for table `lvyecms_anli_data` */

DROP TABLE IF EXISTS `lvyecms_anli_data`;

CREATE TABLE `lvyecms_anli_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_anli_data` */

insert  into `lvyecms_anli_data`(`id`,`content`,`template`,`paytype`,`allow_comment`) values (1,'A','',0,0);

/*Table structure for table `lvyecms_attachment` */

DROP TABLE IF EXISTS `lvyecms_attachment`;

CREATE TABLE `lvyecms_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `module` char(15) NOT NULL DEFAULT '' COMMENT '模块名称',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `filename` char(50) NOT NULL DEFAULT '' COMMENT '上传附件名称',
  `filepath` char(200) NOT NULL DEFAULT '' COMMENT '附件路径',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `fileext` char(10) NOT NULL DEFAULT '' COMMENT '附件扩展名',
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为图片 1为图片',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为缩略图 1为缩略图',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上传用户ID',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否后台用户上传',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `uploadip` char(15) NOT NULL DEFAULT '' COMMENT '上传ip',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '附件使用状态',
  `authcode` char(32) NOT NULL DEFAULT '' COMMENT '附件路径MD5值',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='附件表';

/*Data for the table `lvyecms_attachment` */

insert  into `lvyecms_attachment`(`aid`,`module`,`catid`,`filename`,`filepath`,`filesize`,`fileext`,`isimage`,`isthumb`,`userid`,`isadmin`,`uploadtime`,`uploadip`,`status`,`authcode`) values (3,'content',1,'thumb_58f191e952d02.jpg','content/2017/04/thumb_58f498cf25e3e.jpg',436001,'jpg',1,1,1,1,1492424911,'0.0.0.0',0,'ae3ce4deae2b33bf35b81414f023c89c'),(2,'content',1,'thumb_58f184ccc4193.jpg','content/2017/04/thumb_58f4971517e79.jpg',439275,'jpg',1,1,1,1,1492424469,'0.0.0.0',0,'8db20e01b140628e10380748ad3d5359'),(4,'content',-1,'58f0b8ffae83d.png','content/2017/04/58f49b4a0eca7.png',4786,'png',1,0,1,1,1492425546,'0.0.0.0',1,'c025775f9d66ad3d4671414d2864b135'),(5,'content',-1,'58f0ba627bce2.png','content/2017/04/58f49c0a53507.png',4084,'png',1,0,1,1,1492425738,'0.0.0.0',0,'c9c2a036d5b8afb1cb710fee7d3080f3'),(6,'content',-1,'58f095409a269.jpg','content/2017/04/58f49cba126c3.jpg',54842,'jpg',1,0,1,1,1492425914,'0.0.0.0',0,'abe16edba4a546828ee16e02553f142d'),(7,'content',-1,'58e46d2578ef6.ico','content/2017/04/58f49d2a6ab8a.ico',4286,'ico',0,0,1,1,1492426026,'0.0.0.0',1,'cc7b3f75c475433b6d9b6e20cdc54bf4'),(8,'content',0,'58da64841c49f.jpg','content/2017/04/58f4a5ec86338.jpg',177069,'jpg',1,0,1,1,1492428268,'0.0.0.0',1,'b5c94a85ec5e42772ebc4af5a8729fc4'),(9,'content',-1,'58da32a27a3a1.png','content/2017/04/58f4a6df75351.png',5312,'png',1,0,1,1,1492428511,'0.0.0.0',1,'cbc6eeca0c7118ced6bc0a12eadc78b6'),(10,'content',-1,'58da32c0be370.png','content/2017/04/58f4a6e6102df.png',5558,'png',1,0,1,1,1492428518,'0.0.0.0',1,'b199053c86adaea4b75cabd91406bb08'),(11,'content',3,'58da39550e66c.png','content/2017/04/58f4a92aaedf1.png',1943,'png',1,0,1,1,1492429098,'0.0.0.0',1,'e28eabe3694cd50576f820239fcf36ec'),(12,'content',6,'thumb_58da658b4ad19.jpg','content/2017/04/thumb_58f4d14932488.jpg',52470,'jpg',1,1,1,1,1492439369,'0.0.0.0',1,'e2dd5ecda533415f7666fc206f6708cc'),(13,'content',8,'thumb_58db6f00cf8ff.jpg','content/2017/04/thumb_58f4d59330f01.jpg',110907,'jpg',1,1,1,1,1492440467,'0.0.0.0',1,'f9e25a385d05610ca68db0fa883c175f'),(14,'content',9,'thumb_58db7b6227e79.jpg','content/2017/04/thumb_58f4d6d994fe6.jpg',82718,'jpg',1,1,1,1,1492440793,'0.0.0.0',0,'78666aa59b9648a240584c612a8d933a'),(15,'content',15,'thumb_58f098f8ab5a0.png','content/2017/04/thumb_58f4dc18a42b0.png',140494,'png',1,1,1,1,1492442136,'0.0.0.0',0,'bab493d99ea7f8d507b0d3688de9f813');

/*Table structure for table `lvyecms_attachment_index` */

DROP TABLE IF EXISTS `lvyecms_attachment_index`;

CREATE TABLE `lvyecms_attachment_index` (
  `keyid` char(30) NOT NULL DEFAULT '' COMMENT '关联id',
  `aid` char(10) NOT NULL DEFAULT '' COMMENT '附件ID',
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件关系表';

/*Data for the table `lvyecms_attachment_index` */

insert  into `lvyecms_attachment_index`(`keyid`,`aid`) values ('catid-2','4'),('catid-2','7'),('catid-2','8'),('catid-2','9'),('catid-2','10'),('c-3-2','11'),('catid-6','8'),('catid-7','8'),('c-8-1','13'),('catid-9','8'),('c-16-2','12');

/*Table structure for table `lvyecms_banner` */

DROP TABLE IF EXISTS `lvyecms_banner`;

CREATE TABLE `lvyecms_banner` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_banner` */

insert  into `lvyecms_banner`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`posid`,`url`,`listorder`,`status`,`sysadd`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (3,1,'banner1','','','','',0,'/index.php?a=shows&catid=1&id=3',0,99,1,'admin',1492424795,1492424795,0,0,0,0,0,0),(4,1,'banner2','','','','',0,'/index.php?a=shows&catid=1&id=4',0,99,1,'admin',1492424914,1492424914,0,0,0,0,0,0);

/*Table structure for table `lvyecms_banner_data` */

DROP TABLE IF EXISTS `lvyecms_banner_data`;

CREATE TABLE `lvyecms_banner_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showimage` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `golink` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_banner_data` */

insert  into `lvyecms_banner_data`(`id`,`template`,`paytype`,`allow_comment`,`showimage`,`golink`) values (3,'',0,0,'/d/file/content/2017/04/thumb_58f4971517e79.jpg','##'),(4,'',0,0,'/d/file/content/2017/04/thumb_58f498cf25e3e.jpg','');

/*Table structure for table `lvyecms_behavior` */

DROP TABLE IF EXISTS `lvyecms_behavior`;

CREATE TABLE `lvyecms_behavior` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-控制器，2-视图',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态（0：禁用，1：正常）',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '所属模块',
  `datetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

/*Data for the table `lvyecms_behavior` */

insert  into `lvyecms_behavior`(`id`,`name`,`title`,`remark`,`type`,`status`,`system`,`module`,`datetime`) values (1,'app_init','应用初始化标签位','应用初始化标签位',1,1,1,'',1381021393),(2,'path_info','PATH_INFO检测标签位','PATH_INFO检测标签位',1,1,1,'',1381021411),(3,'app_begin','应用开始标签位','应用开始标签位',1,1,1,'',1381021424),(4,'action_name','操作方法名标签位','操作方法名标签位',1,1,1,'',1381021437),(5,'action_begin','控制器开始标签位','控制器开始标签位',1,1,1,'',1381021450),(6,'view_begin','视图输出开始标签位','视图输出开始标签位',1,1,1,'',1381021463),(7,'view_parse','视图解析标签位','视图解析标签位',1,1,1,'',1381021476),(8,'template_filter','模板内容解析标签位','模板内容解析标签位',1,1,1,'',1381021488),(9,'view_filter','视图输出过滤标签位','视图输出过滤标签位',1,1,1,'',1381021621),(10,'view_end','视图输出结束标签位','视图输出结束标签位',1,1,1,'',1381021631),(11,'action_end','控制器结束标签位','控制器结束标签位',1,1,1,'',1381021642),(12,'app_end','应用结束标签位','应用结束标签位',1,1,1,'',1381021654),(13,'appframe_rbac_init','后台权限控制','后台权限控制',1,1,1,'',1381023560);

/*Table structure for table `lvyecms_behavior_log` */

DROP TABLE IF EXISTS `lvyecms_behavior_log`;

CREATE TABLE `lvyecms_behavior_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ruleid` int(10) NOT NULL DEFAULT '0' COMMENT '行为ID',
  `guid` char(50) NOT NULL DEFAULT '' COMMENT '标识',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志';

/*Data for the table `lvyecms_behavior_log` */

/*Table structure for table `lvyecms_behavior_rule` */

DROP TABLE IF EXISTS `lvyecms_behavior_rule`;

CREATE TABLE `lvyecms_behavior_rule` (
  `ruleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `behaviorid` int(11) NOT NULL DEFAULT '0' COMMENT '行为id',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '规则所属模块',
  `addons` char(20) NOT NULL DEFAULT '' COMMENT '规则所属插件',
  `rule` text COMMENT '行为规则',
  `listorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `datetime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`ruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='行为规则表';

/*Data for the table `lvyecms_behavior_rule` */

insert  into `lvyecms_behavior_rule`(`ruleid`,`behaviorid`,`system`,`module`,`addons`,`rule`,`listorder`,`datetime`) values (1,1,1,'','','phpfile:BuildLiteBehavior',0,1381021954),(2,3,1,'','','phpfile:ReadHtmlCacheBehavior',0,1381021954),(3,12,1,'','','phpfile:ShowPageTraceBehavior',0,1381021954),(4,7,1,'','','phpfile:ParseTemplateBehavior',0,1381021954),(5,8,1,'','','phpfile:ContentReplaceBehavior',0,1381021954),(6,9,1,'','','phpfile:WriteHtmlCacheBehavior',0,1381021954),(7,1,1,'','','phpfile:AppInitBehavior|module:Common',0,1381021954),(8,3,1,'','','phpfile:AppBeginBehavior|module:Common',0,1381021954),(9,6,1,'','','phpfile:ViewBeginBehavior|module:Common',0,1381021954),(10,3,0,'CustomData','','phpfile:CustomDataApi|module:CustomData',0,1492422887);

/*Table structure for table `lvyecms_cache` */

DROP TABLE IF EXISTS `lvyecms_cache`;

CREATE TABLE `lvyecms_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `key` char(100) NOT NULL DEFAULT '' COMMENT '缓存key值',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `model` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名',
  `param` char(255) NOT NULL DEFAULT '' COMMENT '参数',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统',
  PRIMARY KEY (`id`),
  KEY `ckey` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='缓存更新列队';

/*Data for the table `lvyecms_cache` */

insert  into `lvyecms_cache`(`id`,`key`,`name`,`module`,`model`,`action`,`param`,`system`) values (1,'Config','网站配置','','Config','config_cache','',1),(2,'Module','可用模块列表','','Module','module_cache','',1),(3,'Behavior','行为列表','','Behavior','behavior_cache','',1),(4,'Menu','后台菜单','Admin','Menu','menu_cache','',0),(5,'Category','栏目索引','Content','Category','category_cache','',0),(6,'Model','模型列表','Content','Model','model_cache','',0),(7,'Urlrules','URL规则','Content','Urlrule','urlrule_cache','',0),(8,'ModelField','模型字段','Content','ModelField','model_field_cache','',0),(9,'Position','推荐位','Content','Position','position_cache','',0);

/*Table structure for table `lvyecms_category` */

DROP TABLE IF EXISTS `lvyecms_category`;

CREATE TABLE `lvyecms_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `domain` varchar(200) NOT NULL DEFAULT '' COMMENT '栏目绑定域名',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `arrparentid` varchar(255) NOT NULL DEFAULT '' COMMENT '所有父ID',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，1存在',
  `arrchildid` mediumtext COMMENT '所有子栏目ID',
  `catname` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目图片',
  `description` mediumtext COMMENT '栏目描述',
  `parentdir` varchar(100) NOT NULL DEFAULT '' COMMENT '父目录',
  `catdir` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目目录',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目点击数',
  `setting` mediumtext COMMENT '相关配置信息',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否生成静态',
  `letter` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目拼音',
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `lvyecms_category` */

insert  into `lvyecms_category`(`catid`,`module`,`type`,`modelid`,`domain`,`parentid`,`arrparentid`,`child`,`arrchildid`,`catname`,`image`,`description`,`parentdir`,`catdir`,`url`,`hits`,`setting`,`listorder`,`ismenu`,`sethtml`,`letter`) values (1,'content',0,1,'',0,'0',0,'1','Banner','','','','banner','/index.php?a=lists&catid=1',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:8:\"show.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,0,0,'banner'),(2,'content',1,0,'',0,'0',1,'2,3,4,5','产品','/d/file/content/2017/04/58f4a5ec86338.jpg','历经7年的大数据实践，百分点大数据产品线全面涵盖大数据技术、大数据管理、到大数据应用的各个层级，帮助企业一站式完成大数据实施、管理及应用。','','chanpin','/index.php?a=lists&catid=2',0,'a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:16:\"page_chanpin.php\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'chanpin'),(3,'content',0,2,'',2,'0,2',0,'3','大数据应用','','数据应用绽放价值，百分点个性化系统/营销管家/舆情管家/文本分析/数据洞察等一系列大数据应用，帮助企业更好的解决大数据时代面临的销售、营销、运营、服务等方面的问题。','chanpin/','dashujuyingyong','/index.php?a=lists&catid=3',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:16:\"show_chanpin.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";s:6:\"extend\";a:2:{s:10:\"iconnormal\";s:41:\"/d/file/content/2017/04/58f4a6df75351.png\";s:9:\"iconfocus\";s:41:\"/d/file/content/2017/04/58f4a6e6102df.png\";}}',1,1,0,'dashujuyingyong'),(4,'content',0,2,'',2,'0,2',0,'4','大数据管理','','数据管理梳理价值，针对大数据时代数据分散、割裂、难以统一管理等难题，百分点开发了数据清洗/用户标识管理/用户标签管理等系统，帮助企业实现数据全生命周期的价值管理。','chanpin/','dashujuguanli','/index.php?a=lists&catid=4',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:16:\"show_chanpin.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";s:6:\"extend\";a:2:{s:10:\"iconnormal\";s:41:\"/d/file/content/2017/04/58f4a6df75351.png\";s:9:\"iconfocus\";s:41:\"/d/file/content/2017/04/58f4a6e6102df.png\";}}',3,1,0,'dashujuguanli'),(5,'content',0,2,'',2,'0,2',0,'5','大数据技术','','数据技术夯实价值，百分点大数据操作系统屏蔽底层繁复的技术，提供多工种协同作业、管理大数据采集、加工和应用环节所有资源和任务的可视化操作系统，快速提升企业大数据综合处理能力和效率。','chanpin/','dashujujishu','/index.php?a=lists&catid=5',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:16:\"show_chanpin.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";s:6:\"extend\";a:2:{s:10:\"iconnormal\";s:41:\"/d/file/content/2017/04/58f4a6df75351.png\";s:9:\"iconfocus\";s:41:\"/d/file/content/2017/04/58f4a6e6102df.png\";}}',2,1,0,'dashujujishu'),(6,'content',0,3,'',0,'0',0,'6','解决方案','/d/file/content/2017/04/58f4a5ec86338.jpg','服务近2000家企业，依托一系列实践中打磨过的技术和产品，根据企业的具体业务问题和需求，针对性的提供各行业大数据解决方案。','','jiejuefangan','/index.php?a=lists&catid=6',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:21:\"list_jiejuefangan.php\";s:13:\"show_template\";s:21:\"show_jiejuefangan.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'jiejuefangan'),(7,'content',0,4,'',0,'0',1,'7,8','案例','/d/file/content/2017/04/58f4a5ec86338.jpg','','','anli','/index.php?a=lists&catid=7',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_anli.php\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:8:\"show.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'anli'),(8,'content',0,4,'',7,'0,7',0,'8','金融','','','anli/','jinrong','/index.php?a=lists&catid=8',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:13:\"list_anli.php\";s:13:\"show_template\";s:13:\"show_anli.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'jinrong'),(9,'content',0,5,'',0,'0',1,'9,16,17','资讯','/d/file/content/2017/04/58f4a5ec86338.jpg','百分点依托大数据技术和丰富的行业经验，体察互联网+时代的变革和机遇，提供基于消费层面的用户全景画像以及行业范畴的产品、品牌、营销、舆情等全方位的分析与报告服务。','','zixun','/index.php?a=lists&catid=9',0,'a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:18:\"category_zixun.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'zixun'),(10,'content',1,0,'',0,'0',1,'10,11','资料下载','/d/file/content/2017/04/58f4a5ec86338.jpg','百分点依托大数据技术和丰富的行业经验，体察互联网+时代的变革和机遇，提供基于消费层面的用户全景画像以及行业范畴的产品、品牌、营销、舆情等全方位的分析与报告服务。','','ziliao','/index.php?a=lists&catid=10',0,'a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:15:\"page_ziliao.php\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'ziliaoxiazai'),(11,'content',0,6,'',10,'0,10',0,'11','文件组','','','ziliao/','wenjianzu','/index.php?a=lists&catid=11',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:8:\"list.php\";s:13:\"show_template\";s:8:\"show.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'wenjianzu'),(12,'content',1,0,'',0,'0',1,'12,13,14,15','关于我们','/d/file/content/2017/04/58f4a5ec86338.jpg','','','guanyuwomen','/index.php?a=lists&catid=12',0,'a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:8:\"page.php\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'guanyuwomen'),(13,'content',1,0,'',12,'0,12',1,'13','公司介绍','','','guanyuwomen/','gongsijieshao','/index.php?a=lists&catid=13',0,'a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:22:\"page_gongsijieshao.php\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'gongsijieshao'),(14,'content',1,0,'',12,'0,12',1,'14','联系我们','','','guanyuwomen/','lianxiwomen','/index.php?a=lists&catid=14',0,'a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:20:\"page_lianxiwomen.php\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}',0,1,0,'lianxiwomen'),(15,'content',0,7,'',12,'0,12',0,'15','管理团队','','','guanyuwomen/','guanlituandui','/index.php?a=lists&catid=15',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:22:\"list_guanlituandui.php\";s:13:\"show_template\";s:8:\"show.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'guanlituandui'),(16,'content',0,5,'',9,'0,9',0,'16','类别1','','','zixun/','leibie1','/index.php?a=lists&catid=16',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:14:\"list_zixun.php\";s:13:\"show_template\";s:14:\"show_zixun.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'leibie1'),(17,'content',0,5,'',9,'0,9',0,'17','资讯2','','','zixun/','zixun2','/index.php?a=lists&catid=17',0,'a:15:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:12:\"category.php\";s:13:\"list_template\";s:14:\"list_zixun.php\";s:13:\"show_template\";s:14:\"show_zixun.php\";s:19:\"list_customtemplate\";s:0:\"\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}',0,1,0,'zixun2');

/*Table structure for table `lvyecms_category_field` */

DROP TABLE IF EXISTS `lvyecms_category_field`;

CREATE TABLE `lvyecms_category_field` (
  `fid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `fieldname` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型,input',
  `setting` mediumtext COMMENT '其他',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='栏目扩展字段列表';

/*Data for the table `lvyecms_category_field` */

insert  into `lvyecms_category_field`(`fid`,`catid`,`fieldname`,`type`,`setting`,`createtime`) values (1,3,'iconnormal','file','a:4:{s:5:\"title\";s:9:\"非焦点\";s:4:\"tips\";s:22:\"文件大小：95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428545),(2,3,'iconfocus','file','a:4:{s:5:\"title\";s:6:\"焦点\";s:4:\"tips\";s:22:\"文件大小：95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428545),(3,4,'iconnormal','file','a:4:{s:5:\"title\";s:9:\"非焦点\";s:4:\"tips\";s:22:\"图片大小：95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428696),(4,4,'iconfocus','file','a:4:{s:5:\"title\";s:6:\"焦点\";s:4:\"tips\";s:23:\"图片大小： 95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428696),(5,5,'iconnormal','file','a:4:{s:5:\"title\";s:9:\"非焦点\";s:4:\"tips\";s:22:\"图片大小：95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428879),(6,5,'iconfocus','file','a:4:{s:5:\"title\";s:6:\"焦点\";s:4:\"tips\";s:22:\"图片大小：95 * 95\";s:5:\"style\";s:0:\"\";s:6:\"option\";s:24:\"选项名称1|选项值1\";}',1492428879);

/*Table structure for table `lvyecms_category_priv` */

DROP TABLE IF EXISTS `lvyecms_category_priv`;

CREATE TABLE `lvyecms_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色或者组ID',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为管理员 1、管理员',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '动作',
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目权限表';

/*Data for the table `lvyecms_category_priv` */

/*Table structure for table `lvyecms_chanpin` */

DROP TABLE IF EXISTS `lvyecms_chanpin`;

CREATE TABLE `lvyecms_chanpin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_chanpin` */

insert  into `lvyecms_chanpin`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`description`,`posid`,`url`,`listorder`,`status`,`sysadd`,`islink`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (1,3,'A','','/d/file/content/2017/04/58f4a92aaedf1.png','B','','C',0,'/index.php?a=shows&catid=3&id=1',0,99,1,0,'admin',1492429105,1492429105,0,0,0,0,0,0),(2,3,'E','','/d/file/content/2017/04/58f4a92aaedf1.png','F','','G',0,'/index.php?a=shows&catid=3&id=2',0,99,1,0,'admin',1492429161,1492429161,0,0,0,0,0,0);

/*Table structure for table `lvyecms_chanpin_data` */

DROP TABLE IF EXISTS `lvyecms_chanpin_data`;

CREATE TABLE `lvyecms_chanpin_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `superiority` mediumtext COLLATE utf8_unicode_ci,
  `feature` mediumtext COLLATE utf8_unicode_ci,
  `applicationscene` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_chanpin_data` */

insert  into `lvyecms_chanpin_data`(`id`,`template`,`paytype`,`allow_comment`,`relation`,`superiority`,`feature`,`applicationscene`) values (1,'',0,0,'','D','E','F'),(2,'',0,0,'1','H','I','J');

/*Table structure for table `lvyecms_config` */

DROP TABLE IF EXISTS `lvyecms_config`;

CREATE TABLE `lvyecms_config` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `varname` varchar(20) NOT NULL DEFAULT '',
  `info` varchar(100) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='网站配置表';

/*Data for the table `lvyecms_config` */

insert  into `lvyecms_config`(`id`,`varname`,`info`,`groupid`,`value`) values (1,'sitename','网站名称',1,'LvyeCMS内容管理系统'),(2,'siteurl','网站网址',1,'/'),(3,'sitefileurl','附件地址',1,'/d/file/'),(4,'siteemail','站点邮箱',1,'admin@admin.com'),(6,'siteinfo','网站介绍',1,'LvyeCMS网站管理系统,是一款完全开源免费的PHP+MYSQL系统.核心采用了Thinkphp框架等众多开源软件,同时核心功能也作为开源软件发布'),(7,'sitekeywords','网站关键字',1,'LvyeCMS内容管理系统'),(8,'uploadmaxsize','允许上传附件大小',1,'20240'),(9,'uploadallowext','允许上传附件类型',1,'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf|ico'),(10,'qtuploadmaxsize','前台允许上传附件大小',1,'200'),(11,'qtuploadallowext','前台允许上传附件类型',1,'jpg|jpeg|gif'),(12,'watermarkenable','是否开启图片水印',1,'1'),(13,'watermarkminwidth','水印-宽',1,'300'),(14,'watermarkminheight','水印-高',1,'100'),(15,'watermarkimg','水印图片',1,'/statics/images/mark_bai.png'),(16,'watermarkpct','水印透明度',1,'80'),(17,'watermarkquality','JPEG 水印质量',1,'85'),(18,'watermarkpos','水印位置',1,'7'),(19,'theme','主题风格',1,'Default'),(20,'ftpstatus','FTP上传',1,'0'),(21,'ftpuser','FTP用户名',1,''),(22,'ftppassword','FTP密码',1,''),(23,'ftphost','FTP服务器地址',1,''),(24,'ftpport','FTP服务器端口',1,'21'),(25,'ftppasv','FTP是否开启被动模式',1,'1'),(26,'ftpssl','FTP是否使用SSL连接',1,'0'),(27,'ftptimeout','FTP超时时间',1,'10'),(28,'ftpuppat','FTP上传目录',1,'/'),(29,'mail_type','邮件发送模式',1,'1'),(30,'mail_server','邮件服务器',1,'smtp.qq.com'),(31,'mail_port','邮件发送端口',1,'25'),(32,'mail_from','发件人地址',1,'admin@abc3210.com'),(33,'mail_auth','密码验证',1,'1'),(34,'mail_user','邮箱用户名',1,''),(35,'mail_password','邮箱密码',1,''),(36,'mail_fname','发件人名称',1,'LvyeCMS管理员'),(37,'domainaccess','指定域名访问',1,'0'),(38,'generate','是否生成首页',1,'1'),(39,'index_urlruleid','首页URL规则',1,'11'),(40,'indextp','首页模板',1,'index.php'),(41,'tagurl','TagURL规则',1,'8'),(42,'checkcode_type','验证码类型',1,'0'),(43,'attachment_driver','附件驱动',1,'Local'),(44,'addonsite','开放平台',1,'http://addon.lvyecms.com/');

/*Table structure for table `lvyecms_config_field` */

DROP TABLE IF EXISTS `lvyecms_config_field`;

CREATE TABLE `lvyecms_config_field` (
  `fid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `fieldname` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型,input',
  `setting` mediumtext COMMENT '其他',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网站配置，扩展字段列表';

/*Data for the table `lvyecms_config_field` */

/*Table structure for table `lvyecms_custom_data` */

DROP TABLE IF EXISTS `lvyecms_custom_data`;

CREATE TABLE `lvyecms_custom_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `adddate` int(10) unsigned NOT NULL COMMENT '添加时间',
  `typeid` varchar(255) NOT NULL COMMENT '数据类型编号',
  `data` text NOT NULL COMMENT '数据',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='自定义资料数据表';

/*Data for the table `lvyecms_custom_data` */

insert  into `lvyecms_custom_data`(`id`,`title`,`adddate`,`typeid`,`data`) values (1,'顶部LOGO 大小：260 * 38',1492425549,'downfile','/d/file/content/2017/04/58f49b4a0eca7.png'),(2,'底部LOGO 大小：104 * 30',1492425741,'downfile','/d/file/content/2017/04/58f49c0a53507.png'),(3,'客服QQ',1492425843,'textarea','44062549'),(4,'热线电话',1492425869,'textarea','**-*******-**'),(5,'微信公众号二维码 大小：258 * 258',1492425918,'downfile','/d/file/content/2017/04/58f49cba126c3.jpg'),(6,'标题 icon 大小：32 * 32 ，条件：必须是 ico 文件',1492426031,'downfile','/d/file/content/2017/04/58f49d2a6ab8a.ico'),(7,'公司介绍',1492504243,'markdown','>   **在linux中，由于地位的特殊性，在安装应用程序的时候是区别与windows桌面操作系统的。在作为服务器的时候往往不会启用桌面，因此想要在applications列表中查找应用程序的需求自然不复存在，但是在个人开发或者调试的时候大多使用的是linux桌面版本。除了通过linux的软件包管理器安装的应用程序，凡是通过`源码编译安装`、`解压二进制`等形式安装的软件将无法在applications列表中被查找。事实上这种情况我们往往是创建软连接到`/usr/bin`目录中。接下来我们要简单的实现将我们自定义安装的应用程序添加到applications列表中。**\r\n\r\n![我的linux系统](http://upload-images.jianshu.io/upload_images/1982272-de885bdbf96a3c49.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n# linux是如何管理应用程序列表的\r\n  添加一个应用程序到applications列表中是很简单的，关键是要明白其中的道理，知其然，更知其所以然，方能举一反三。以下图为例，这是一张在linux中进行应用程序搜索时的界面：\r\n\r\n![搜索应用程序](http://upload-images.jianshu.io/upload_images/1982272-221691b5872f6431.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n  上图所展现的效果就是我们要达到的目的，将应用程序添加到这个区域内，以便快速的被检索到。尽管linux已经可以十分方便的在终端进行程序搜索，但是我们认为基于桌面方式的应用程序列表的搜索依然是有必要的。这对于在一定范围内提高效率是有建设意义的，同时对于linux的普及也有具有积极的作用。\r\n\r\n  要达到这个目的，我们需要先弄清楚linux是如何管理应用程序的。我们先观察一个特殊的目录，这个目录位于：`/usr/share/applications/`。根据目录的名称可以得到很大的启示，share是共享的，表明这里的设置范围是系统级别的，share下面的applications意义也十分明显，就是应用程序。接下来我们观察applications目录中的内容：\r\n\r\n![applications](http://upload-images.jianshu.io/upload_images/1982272-96d4c30942f17ccb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n  你一定可以看到很多以*.desktop为后缀名的文件，没错，就是这些文件，linux通过这个目录下的配置文件来管理应用程序。当然了，linux对应用程序的管理和搜索不会如此简单（尽管这是我们希望达到的目的），但是这对于我们自定义程序已经足够了。\r\n\r\n  值得一提的是，你即已经懂得linux管理应用程序浏览的原理，那么就可以对比一下windows的管理方式，windows利用快捷方式，实际上这也可以看做一种快捷方式，当你通过文件浏览器进入这个目录的时候，我们是可以双击或者单击这些desktop文件的，这也能运行一个程序，原理十分简单，那就是该标准文件已经具备一切可以运行的数据结构。\r\n\r\n![打开应用程序](http://upload-images.jianshu.io/upload_images/1982272-1c9060b8f7f032c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n\r\n  接下来我们要做的就是在这个目录下面创建一个.desktop配置文件，我们以java的ide软件`idea intellij`为例，将这个通过解压的ide程序添加到applications列表中。\r\n\r\n  首先，在`/usr/share/applications/`目录下创建一个idea.desktop文件。\r\n为了方便我们可以随便在该目录下复制一个desktop文件即可，然后重命名并且打开这个文件进行编辑。\r\n\r\n  其次，我们来观察这个文件的必要内容：\r\n\r\n![desktop文件内容](http://upload-images.jianshu.io/upload_images/1982272-19ea6699470bd6ed.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n  接下来我们依次介绍每个配置节点的意义：\r\n* [Desktop Entry]    必填，表明该文件是一个Desktop Entry文件，节点意思十分明显，桌面入口。Desktop Entry实际上是一个文件标准，该标准由FreeDesktop.org制定；\r\n\r\n* Comment    这是应用程序的描述，通常会在搜索应用程序的界面看到这个描述（鼠标放到应用程序图标上时）；\r\n\r\n* Comment[zh_CN]    同样的作用，表明使用中文。同理，[]里面可以书写多国语言；\r\n\r\n* Exec    必填，应用程序启动的指令，可以带上参数运行，实际上这与在终端的启动指令是一样的；\r\n\r\n* GenericName    应用程序通用名称，他会显示在搜索结果以及非搜索结果中；\r\n\r\n* MimeType    可选，熟悉web开发的人员应当十分熟悉，这是表明映射；\r\n\r\n* Name    必填，该值定义了应用程序的名称，这个设置同理可以使用Name[en]等字样，在不同的语言环境下面，会使用对应的Name值；\r\n\r\n* StartupNotify    可选，该值是bool值（[true | false]），这个设置只有在`Type`类型是`application`的时候才有意义；\r\n\r\n* Terminal   可选，该值也是bool值（[true | false]） ，并且只有在`Type`为`application`时有意义，该值指出了相关应用程序(Exec值)是否需要在终端中运行；\r\n\r\n* Type    必填，这是一个枚举值，它定义了desktop文件的类型。常见的数值是`Application`和`Link`。`Application`表示当前文件指向一个应用程序，而`Link`表明当前文件指向一个URL，即链接文件；\r\n\r\n* Categories    可选，只有在`Type`类型是`Application`时才有意义。`Categories`的值表明了相关应用程序在菜单中显示的类别，关于类别的定义参见`Desktop Specification Menu`的具体定义，如图：\r\n\r\n![类别](http://upload-images.jianshu.io/upload_images/1982272-4f04ba0c833d9182.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)\r\n\r\n* Icon    可选，该值定义了当前desktop文件在应用程序浏览器中所显示的图标，如果该值给定的是一个绝对路径，那么该路径下的图标将会被直接使用，反之，linux系统将使用`Icon Theme Specifacation`在系统指定的图标目录下定位所需要使用的图标文件。\r\n\r\n  还有很多的节点配置这里不做过多介绍，相信读者看到上述的定义已经可以做到举一反三的查询。'),(8,'联系我们',1492442194,'markdown','联系我们A');

/*Table structure for table `lvyecms_customlist` */

DROP TABLE IF EXISTS `lvyecms_customlist`;

CREATE TABLE `lvyecms_customlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义列表ID',
  `url` char(100) NOT NULL DEFAULT '' COMMENT '访问地址',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '列表标题',
  `title` varchar(120) NOT NULL DEFAULT '' COMMENT '网页标题',
  `keywords` varchar(40) NOT NULL DEFAULT '' COMMENT '网页关键字',
  `description` text COMMENT '页面简介',
  `totalsql` text COMMENT '数据统计SQL',
  `listsql` text COMMENT '数据查询SQL',
  `lencord` int(11) NOT NULL DEFAULT '0' COMMENT '每页显示',
  `urlruleid` int(11) NOT NULL DEFAULT '0' COMMENT 'URL规则ID',
  `urlrule` varchar(120) NOT NULL DEFAULT '' COMMENT 'URL规则',
  `template` mediumtext COMMENT '模板',
  `listpath` varchar(60) NOT NULL DEFAULT '' COMMENT '列表模板文件',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义列表';

/*Data for the table `lvyecms_customlist` */

/*Table structure for table `lvyecms_customtemp` */

DROP TABLE IF EXISTS `lvyecms_customtemp`;

CREATE TABLE `lvyecms_customtemp` (
  `tempid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '模板ID',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `tempname` varchar(30) NOT NULL DEFAULT '' COMMENT '模板完整文件名',
  `temppath` varchar(200) NOT NULL DEFAULT '' COMMENT '模板生成路径',
  `temptext` mediumtext COMMENT '模板内容',
  PRIMARY KEY (`tempid`),
  KEY `tempname` (`tempname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义模板表';

/*Data for the table `lvyecms_customtemp` */

/*Table structure for table `lvyecms_guanlituandui` */

DROP TABLE IF EXISTS `lvyecms_guanlituandui`;

CREATE TABLE `lvyecms_guanlituandui` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_guanlituandui` */

insert  into `lvyecms_guanlituandui`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`posid`,`url`,`listorder`,`status`,`sysadd`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (1,15,'vvv','','/d/file/content/2017/04/thumb_58f4dc18a42b0.png','','',0,'/index.php?a=shows&catid=15&id=1',0,99,1,'admin',1492442138,1492442138,0,0,0,0,0,0);

/*Table structure for table `lvyecms_guanlituandui_data` */

DROP TABLE IF EXISTS `lvyecms_guanlituandui_data`;

CREATE TABLE `lvyecms_guanlituandui_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_guanlituandui_data` */

insert  into `lvyecms_guanlituandui_data`(`id`,`content`,`template`,`paytype`,`allow_comment`) values (1,'* Jack . J . Jia\r\n* 软件工程师\r\n* 项目经理\r\n* 项目经理* 项目经理\r\n* 项目经理\r\n* 项目经理\r\n* 项目经理\r\n* 项目经理\r\n* 项目经理\r\n* 项目经理','',0,0);

/*Table structure for table `lvyecms_jiejuefangan` */

DROP TABLE IF EXISTS `lvyecms_jiejuefangan`;

CREATE TABLE `lvyecms_jiejuefangan` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_jiejuefangan` */

insert  into `lvyecms_jiejuefangan`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`description`,`posid`,`url`,`listorder`,`status`,`sysadd`,`islink`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (1,6,'A','','/d/file/content/2017/04/thumb_58f4d14932488.jpg','A','','B',0,'/index.php?a=shows&catid=6&id=1',0,99,1,0,'admin',1492439390,1492439390,0,0,0,0,0,0);

/*Table structure for table `lvyecms_jiejuefangan_data` */

DROP TABLE IF EXISTS `lvyecms_jiejuefangan_data`;

CREATE TABLE `lvyecms_jiejuefangan_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_jiejuefangan_data` */

insert  into `lvyecms_jiejuefangan_data`(`id`,`content`,`template`,`paytype`,`allow_comment`,`relation`) values (1,'Cv\r\nCv\r\nCv\r\nCvCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv\r\nCv','',0,0,'2|2,1');

/*Table structure for table `lvyecms_locking` */

DROP TABLE IF EXISTS `lvyecms_locking`;

CREATE TABLE `lvyecms_locking` (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `locktime` int(10) NOT NULL DEFAULT '0' COMMENT '锁定时间',
  KEY `userid` (`userid`),
  KEY `onlinetime` (`locktime`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='信息锁定';

/*Data for the table `lvyecms_locking` */

/*Table structure for table `lvyecms_loginlog` */

DROP TABLE IF EXISTS `lvyecms_loginlog`;

CREATE TABLE `lvyecms_loginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '登录帐号',
  `logintime` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间戳',
  `loginip` char(20) NOT NULL DEFAULT '' COMMENT '登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,1为登录成功，0为登录失败',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '尝试错误密码',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '其他说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='后台登陆日志表';

/*Data for the table `lvyecms_loginlog` */

insert  into `lvyecms_loginlog`(`id`,`username`,`logintime`,`loginip`,`status`,`password`,`info`) values (1,'admin',1492422747,'0.0.0.0',1,'密码保密','用户名登录'),(2,'admin',1492425449,'0.0.0.0',1,'密码保密','用户名登录'),(3,'admin',1492442247,'0.0.0.0',1,'密码保密','用户名登录'),(4,'admin',1492485713,'0.0.0.0',1,'密码保密','用户名登录'),(5,'admin',1492503592,'0.0.0.0',1,'密码保密','用户名登录'),(6,'admin',1493370858,'127.0.0.1',1,'密码保密','用户名登录');

/*Table structure for table `lvyecms_menu` */

DROP TABLE IF EXISTS `lvyecms_menu`;

CREATE TABLE `lvyecms_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `app` char(20) NOT NULL DEFAULT '' COMMENT '应用标识',
  `controller` char(20) NOT NULL DEFAULT '' COMMENT '控制键',
  `action` char(20) NOT NULL DEFAULT '' COMMENT '方法',
  `parameter` char(255) NOT NULL DEFAULT '' COMMENT '附加参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

/*Data for the table `lvyecms_menu` */

insert  into `lvyecms_menu`(`id`,`name`,`parentid`,`app`,`controller`,`action`,`parameter`,`type`,`status`,`remark`,`listorder`) values (1,'缓存更新',0,'Admin','Index','cache','',1,0,'',0),(2,'我的面板',0,'Admin','Config','index','',0,1,'',0),(3,'设置',0,'Admin','Config','index','',0,1,'',0),(4,'个人信息',2,'Admin','Adminmanage','myinfo','',0,1,'',0),(5,'修改个人信息',4,'Admin','Adminmanage','myinfo','',1,1,'',0),(6,'修改密码',4,'Admin','Adminmanage','chanpass','',1,1,'',0),(7,'系统设置',3,'Admin','Config','index','',0,1,'',0),(8,'站点配置',7,'Admin','Config','index','',1,1,'',0),(9,'邮箱配置',8,'Admin','Config','mail','',1,1,'',0),(10,'附件配置',8,'Admin','Config','attach','',1,1,'',0),(11,'高级配置',8,'Admin','Config','addition','',1,1,'',0),(12,'扩展配置',8,'Admin','Config','extend','',1,1,'',0),(13,'行为管理',7,'Admin','Behavior','index','',1,1,'',0),(14,'行为日志',13,'Admin','Behavior','logs','',1,1,'',0),(15,'编辑行为',13,'Admin','Behavior','edit','',1,0,'',0),(16,'删除行为',13,'Admin','Behavior','delete','',1,0,'',0),(17,'后台菜单管理',7,'Admin','Menu','index','',1,1,'',0),(18,'添加菜单',17,'Admin','Menu','add','',1,1,'',0),(19,'修改',17,'Admin','Menu','edit','',1,0,'',0),(20,'删除',17,'Admin','Menu','delete','',1,0,'',0),(21,'管理员设置',3,'Admin','Management','index','',0,1,'',0),(22,'管理员管理',21,'Admin','Management','manager','',1,1,'',0),(23,'添加管理员',22,'Admin','Management','adminadd','',1,1,'',0),(24,'编辑管理信息',22,'Admin','Management','edit','',1,0,'',0),(25,'删除管理员',22,'Admin','Management','delete','',1,0,'',0),(26,'角色管理',21,'Admin','Rbac','rolemanage','',1,1,'',0),(27,'添加角色',26,'Admin','Rbac','roleadd','',1,1,'',0),(28,'删除角色',26,'Admin','Rbac','roledelete','',1,0,'',0),(29,'角色编辑',26,'Admin','Rbac','roleedit','',1,0,'',0),(30,'角色授权',26,'Admin','Rbac','authorize','',1,0,'',0),(31,'日志管理',3,'Admin','Logs','index','',0,1,'',0),(32,'后台登陆日志',31,'Admin','Logs','loginlog','',1,1,'',0),(33,'后台操作日志',31,'Admin','Logs','index','',1,1,'',0),(34,'删除一个月前的登陆日志',32,'Admin','Logs','deleteloginlog','',1,1,'',0),(35,'删除一个月前的操作日志',33,'Admin','Logs','deletelog','',1,1,'',0),(36,'添加行为',13,'Admin','Behavior','add','',1,1,'',0),(37,'模块',0,'Admin','Module','index','',0,1,'',0),(42,'本地模块管理',37,'Admin','Module','local','',0,1,'',0),(43,'模块管理',42,'Admin','Module','index','',1,1,'',0),(44,'内容',0,'Content','Index','index','',0,1,'',0),(45,'内容管理',44,'Content','Content','index','',0,1,'',0),(46,'内容相关设置',44,'Content','Category','index','',0,1,'',0),(47,'栏目列表',46,'Content','Category','index','',1,1,'',0),(48,'添加栏目',47,'Content','Category','add','',1,1,'',0),(49,'添加单页',47,'Content','Category','singlepage','',1,1,'',0),(50,'添加外部链接栏目',47,'Content','Category','wadd','',1,1,'',0),(51,'编辑栏目',47,'Content','Category','edit','',1,0,'',0),(52,'删除栏目',47,'Content','Category','delete','',1,0,'',0),(53,'栏目属性转换',47,'Content','Category','categoryshux','',1,0,'',0),(54,'模型管理',46,'Content','Models','index','',1,1,'',0),(55,'创建新模型',54,'Content','Models','add','',1,1,'',0),(56,'删除模型',54,'Content','Models','delete','',1,0,'',0),(57,'编辑模型',54,'Content','Models','edit','',1,0,'',0),(58,'模型禁用',54,'Content','Models','disabled','',1,0,'',0),(59,'模型导入',54,'Content','Models','import','',1,1,'',0),(60,'字段管理',54,'Content','Field','index','',1,0,'',0),(61,'字段修改',60,'Content','Field','edit','',1,0,'',0),(62,'字段删除',60,'Content','Field','delete','',1,0,'',0),(63,'字段状态',60,'Content','Field','disabled','',1,0,'',0),(64,'模型预览',60,'Content','Field','priview','',1,0,'',0),(65,'管理内容',45,'Content','Content','index','',1,1,'',0),(66,'附件管理',45,'Attachment','Atadmin','index','',1,1,'',0),(67,'删除',66,'Attachment','Atadmin','delete','',1,0,'',0),(68,'发布管理',44,'Content','Createhtml','index','',0,1,'',0),(69,'批量更新栏目页',68,'Content','Createhtml','category','',1,1,'',0),(70,'生成首页',68,'Content','Createhtml','index','',1,1,'',0),(71,'批量更新URL',68,'Content','Createhtml','update_urls','',1,1,'',0),(72,'批量更新内容页',68,'Content','Createhtml','update_show','',1,1,'',0),(73,'刷新自定义页面',68,'Template','Custompage','createhtml','',1,1,'',0),(74,'URL规则管理',46,'Content','Urlrule','index','',1,1,'',0),(75,'添加规则',74,'Content','Urlrule','add','',1,1,'',0),(76,'编辑',74,'Content','Urlrule','edit','',1,0,'',0),(77,'删除',74,'Content','Urlrule','delete','',1,0,'',0),(78,'推荐位管理',46,'Content','Position','index','',1,1,'',0),(79,'信息管理',78,'Content','Position','item','',1,0,'',0),(80,'添加推荐位',78,'Content','Position','add','',1,1,'',0),(81,'修改推荐位',78,'Content','Position','edit','',1,0,'',0),(82,'删除推荐位',78,'Content','Position','delete','',1,0,'',0),(83,'信息编辑',79,'Content','Position','item_manage','',1,0,'',0),(84,'信息排序',79,'Content','Position','item_listorder','',1,0,'',0),(85,'数据重建',78,'Content','Position','rebuilding','',1,0,'',0),(86,'Tags管理',45,'Content','Tags','index','',1,1,'',0),(87,'修改',86,'Content','Tags','edit','',1,0,'',0),(88,'删除',86,'Content','Tags','delete','',1,0,'',0),(89,'Tags数据重建',86,'Content','Tags','create','',1,1,'',0),(90,'界面',0,'Template','Style','index','',0,1,'',0),(91,'模板管理',90,'Template','Style','index','',0,1,'',0),(92,'模板风格',91,'Template','Style','index','',1,1,'',0),(93,'添加模板页',92,'Template','Style','add','',1,1,'',0),(94,'删除模板',92,'Template','Style','delete','',1,0,'',0),(95,'修改模板',92,'Template','Style','edit','',1,0,'',0),(96,'主题管理',91,'Template','Theme','index','',1,1,'',0),(97,'主题更换',96,'Template','Theme','chose','',1,0,'',0),(98,'自定义页面',90,'Template','Custompage','index','',0,1,'',0),(99,'自定义页面',98,'Template','Custompage','index','',1,1,'',0),(100,'添加自定义页面',99,'Template','Custompage','add','',1,1,'',0),(101,'删除自定义页面',99,'Template','Custompage','delete','',1,0,'',0),(102,'编辑自定义页面',99,'Template','Custompage','edit','',1,0,'',0),(103,'自定义列表',98,'Template','Customlist','index','',1,1,'',0),(104,'添加列表',103,'Template','Customlist','add','',1,1,'',0),(105,'删除列表',103,'Template','Customlist','delete','',1,0,'',0),(106,'编辑列表',103,'Template','Customlist','edit','',1,0,'',0),(107,'生成列表',103,'Template','Customlist','generate','',1,0,'',0),(108,'安装模块',39,'Admin','Moduleshop','install','',1,0,'',0),(109,'升级模块',39,'Admin','Moduleshop','upgrade','',1,0,'',0),(110,'安装插件',40,'Admin','Addonshop','install','',1,0,'',0),(111,'升级插件',40,'Admin','Addonshop','upgrade','',1,0,'',0),(112,'栏目授权',26,'Admin','Rbac','setting_cat_priv','',1,0,'',0),(114,'自定义资料',45,'CustomData','Index','index','',1,1,'自定义资料管理！',0);

/*Table structure for table `lvyecms_model` */

DROP TABLE IF EXISTS `lvyecms_model`;

CREATE TABLE `lvyecms_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `description` char(100) NOT NULL DEFAULT '' COMMENT '描述',
  `tablename` char(20) NOT NULL DEFAULT '' COMMENT '表名',
  `setting` text COMMENT '配置信息',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '信息数',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启全站搜索',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用 1禁用',
  `default_style` char(30) NOT NULL DEFAULT '' COMMENT '风格',
  `category_template` char(30) NOT NULL DEFAULT '' COMMENT '栏目模板',
  `list_template` char(30) NOT NULL DEFAULT '' COMMENT '列表模板',
  `show_template` char(30) NOT NULL DEFAULT '' COMMENT '内容模板',
  `js_template` varchar(30) NOT NULL DEFAULT '' COMMENT 'JS模板',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模块标识',
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='内容模型列表';

/*Data for the table `lvyecms_model` */

insert  into `lvyecms_model`(`modelid`,`name`,`description`,`tablename`,`setting`,`addtime`,`items`,`enablesearch`,`disabled`,`default_style`,`category_template`,`list_template`,`show_template`,`js_template`,`sort`,`type`) values (1,'首页Banner','轮播图','banner','',1492423769,0,0,0,'','','','','',0,0),(2,'产品','','chanpin','',1492427257,0,0,0,'','','','','',0,0),(3,'解决方案','','jiejuefangan','',1492438471,0,0,0,'','','','','',0,0),(4,'案例','','anli','',1492439838,0,0,0,'','','','','',0,0),(5,'资讯','','zixun','',1492440556,0,0,0,'','','','','',0,0),(6,'资料','','ziliao','',1492440994,0,0,0,'','','','','',0,0),(7,'管理团队','','guanlituandui','',1492441458,0,0,0,'','','','','',0,0);

/*Table structure for table `lvyecms_model_field` */

DROP TABLE IF EXISTS `lvyecms_model_field`;

CREATE TABLE `lvyecms_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `field` varchar(20) NOT NULL DEFAULT '' COMMENT '字段名',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '别名',
  `tips` text COMMENT '字段提示',
  `css` varchar(30) NOT NULL DEFAULT '' COMMENT '表单样式',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小值',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大值',
  `pattern` varchar(255) NOT NULL DEFAULT '' COMMENT '数据校验正则',
  `errortips` varchar(255) NOT NULL DEFAULT '' COMMENT '数据校验未通过的提示信息',
  `formtype` varchar(20) NOT NULL DEFAULT '' COMMENT '字段类型',
  `setting` mediumtext,
  `formattribute` varchar(255) NOT NULL DEFAULT '',
  `unsetgroupids` varchar(255) NOT NULL DEFAULT '',
  `unsetroleids` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否内部字段 1是',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统字段 1 是',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '值唯一',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为基本信息',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为搜索条件',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '在前台投稿中显示',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为全站搜索信息',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否入库到推荐位',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 禁用 0启用',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='模型字段列表';

/*Data for the table `lvyecms_model_field` */

insert  into `lvyecms_model_field`(`fieldid`,`modelid`,`field`,`name`,`tips`,`css`,`minlength`,`maxlength`,`pattern`,`errortips`,`formtype`,`setting`,`formattribute`,`unsetgroupids`,`unsetroleids`,`iscore`,`issystem`,`isunique`,`isbase`,`issearch`,`isadd`,`isfulltext`,`isposition`,`listorder`,`disabled`,`isomnipotent`) values (1,1,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(2,1,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(4,1,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,1,0),(5,1,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(7,1,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(8,1,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(9,1,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(10,1,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(22,1,'golink','跳转地址','跳转到第三方网站记得加上 http://','',0,0,'','','text','a:7:{s:4:\"size\";s:3:\"400\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,0,0,0,20,0,0),(21,1,'showimage','展示图片','图片大小：1920 * 699','',1,0,'','','image','a:12:{s:5:\"width\";s:3:\"400\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"0\";s:15:\"upload_allowext\";s:20:\"gif|jpg|jpeg|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:4:\"1920\";s:13:\"images_height\";s:3:\"699\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,1,0,0,19,0,0),(12,1,'thumb','缩略图','','',0,100,'','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,1,0),(13,1,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(30,2,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(15,1,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(16,1,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,1,0),(17,1,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(29,2,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(19,1,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(23,2,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(24,2,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(25,2,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,17,0,0),(26,2,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,0,0),(27,2,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(31,2,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(32,2,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(33,2,'relation','客户案例','','',0,255,'','','omnipotent','a:4:{s:8:\"formtext\";s:470:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >\n<ul class=\"list-dot\" id=\"relation_text\">\n</ul>\n<input type=\"button\" value=\"添加客户案例\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加客户案例\',1)\" class=\"btn\">\n<span class=\"edit_content\">\n  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">\n</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,0,0,0,1,0,8,0,0),(34,2,'thumb','缩略图','图片大小： 37 * 37','',0,100,'','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,0,0),(35,2,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(46,3,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(37,2,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(38,2,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,0,0),(39,2,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(40,2,'description','摘要','','',0,255,'','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','',0,1,0,1,0,1,1,1,5,0,0),(41,2,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(43,2,'superiority','优势','','',0,0,'','','markdown','a:7:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,1,1,0,19,0,0),(44,2,'feature','功能','','',0,0,'','','markdown','a:7:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,1,1,0,20,0,0),(45,2,'applicationscene','应用场景','','',0,0,'','','markdown','a:7:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,1,1,0,21,0,0),(47,3,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(48,3,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,17,0,0),(49,3,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,0,0),(50,3,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(52,3,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(53,3,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(54,3,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(55,3,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(56,3,'relation','客户案例','','',0,255,'','','omnipotent','a:4:{s:8:\"formtext\";s:470:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >\n<ul class=\"list-dot\" id=\"relation_text\">\n</ul>\n<input type=\"button\" value=\"添加客户案例\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加客户案例\',1)\" class=\"btn\">\n<span class=\"edit_content\">\n  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">\n</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,0,0,0,1,0,8,0,0),(57,3,'thumb','缩略图','图片大小：280 * 344','',0,100,'','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:3:\"280\";s:13:\"images_height\";s:3:\"344\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,0,0),(58,3,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(60,3,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(61,3,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,0,0),(62,3,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(63,3,'description','摘要','','',0,255,'','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','',0,1,0,1,0,1,1,1,5,0,0),(64,3,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(65,3,'content','内容','','',0,0,'','内容不能为空','markdown','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,1,0,1,1,0,6,0,0),(66,4,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(67,4,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(68,4,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,17,0,0),(69,4,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,0,0),(70,4,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(86,5,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(72,4,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(73,4,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(74,4,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(75,4,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(87,5,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(88,5,'islink','转向链接','','',0,0,'','','islink','','','','',0,1,0,0,0,1,0,0,17,0,0),(89,5,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,0,0),(90,5,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(77,4,'thumb','缩略图','图片大小： 529 * 348','',0,100,'','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:3:\"529\";s:13:\"images_height\";s:3:\"348\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,0,0),(78,4,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(80,4,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(81,4,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,0,0),(82,4,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(83,4,'description','摘要','','',0,255,'','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','',0,1,0,1,0,1,1,1,5,0,0),(84,4,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(85,4,'content','内容','','',0,0,'','内容不能为空','markdown','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,1,0,1,1,0,6,0,0),(106,6,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(92,5,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(93,5,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(94,5,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(95,5,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(107,6,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(126,6,'wenjian','文件','','',1,0,'','','downfile','a:11:{s:5:\"width\";s:3:\"400\";s:12:\"defaultvalue\";s:0:\"\";s:15:\"upload_allowext\";s:20:\"gif|jpg|jpeg|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:10:\"statistics\";s:0:\"\";s:12:\"downloadlink\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,0,0,1,0,1,0,0,19,0,0),(109,6,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,1,0),(110,6,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(97,5,'thumb','缩略图','图片大小：248 * 154','',0,100,'','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:3:\"248\";s:13:\"images_height\";s:3:\"154\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,0,0),(98,5,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(115,6,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(100,5,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(101,5,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,0,0),(102,5,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(103,5,'description','摘要','','',0,255,'','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','',0,1,0,1,0,1,1,1,5,0,0),(104,5,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(105,5,'content','内容','','',0,0,'','内容不能为空','markdown','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,1,0,1,1,0,6,0,0),(112,6,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(113,6,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(114,6,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(127,7,'status','状态','','',0,2,'','','box','','','','',1,1,0,1,0,0,0,0,15,0,0),(128,7,'username','用户名','','',0,20,'','','text','','','','',1,1,0,1,0,0,0,0,16,0,0),(130,7,'template','内容页模板','','',0,30,'','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,0,0,0,0,0,0,0,13,1,0),(117,6,'thumb','缩略图','','',0,100,'','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,1,0),(118,6,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(120,6,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(121,6,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,1,0),(122,6,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(136,7,'listorder','排序','','',0,6,'','','number','','','','',1,1,0,1,0,0,0,0,18,0,0),(124,6,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(131,7,'allow_comment','允许评论','','',0,0,'','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1\r\n不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','',0,0,0,0,0,0,0,0,14,1,0),(133,7,'inputtime','真实发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',1,1,0,0,0,0,0,1,11,0,0),(134,7,'posid','推荐位','','',0,0,'','','posid','a:4:{s:5:\"width\";s:3:\"125\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,1,0,0,0,1,11,1,0),(135,7,'url','URL','','',0,100,'','','text','','','','',1,1,0,1,0,0,0,1,12,0,0),(138,7,'thumb','缩略图','图片大小：216 * 216','',0,100,'','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:3:\"216\";s:13:\"images_height\";s:3:\"216\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,1,0,0,0,1,0,1,7,0,0),(139,7,'catid','栏目','','',1,6,'/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,0,0,1,0,0),(141,7,'title','标题','','inputtitle',1,80,'','请输入标题','title','','','','',0,1,0,1,1,1,1,1,3,0,0),(142,7,'keywords','关键词','多关键词之间用空格隔开','',0,40,'','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99',0,1,0,1,1,1,1,0,4,1,0),(143,7,'tags','TAGS','多关之间用空格或者“,”隔开','',0,0,'','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','',0,1,0,1,0,0,0,0,4,1,0),(145,7,'updatetime','发布时间','','',0,0,'','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','',0,1,0,0,0,0,0,0,10,0,0),(146,7,'content','内容','','',0,0,'','内容不能为空','markdown','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:6:\"height\";s:3:\"600\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','',0,0,0,1,0,1,1,0,6,0,0);

/*Table structure for table `lvyecms_module` */

DROP TABLE IF EXISTS `lvyecms_module`;

CREATE TABLE `lvyecms_module` (
  `module` varchar(15) NOT NULL COMMENT '模块',
  `modulename` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '签名',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内置模块',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '版本',
  `setting` mediumtext COMMENT '设置信息',
  `installtime` int(10) NOT NULL DEFAULT '0' COMMENT '安装时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`module`),
  KEY `sign` (`sign`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已安装模块列表';

/*Data for the table `lvyecms_module` */

insert  into `lvyecms_module`(`module`,`modulename`,`sign`,`iscore`,`disabled`,`version`,`setting`,`installtime`,`updatetime`,`listorder`) values ('CustomData','自定义资料','b05344b0b2eecaa55328c00aeb5fd361',0,1,'1.0.4','',1492422887,1492422887,0);

/*Table structure for table `lvyecms_operationlog` */

DROP TABLE IF EXISTS `lvyecms_operationlog`;

CREATE TABLE `lvyecms_operationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `uid` smallint(6) NOT NULL DEFAULT '0' COMMENT '操作帐号ID',
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `ip` char(20) NOT NULL DEFAULT '' COMMENT 'IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0错误提示，1为正确提示',
  `info` text COMMENT '其他说明',
  `get` varchar(255) NOT NULL DEFAULT '' COMMENT 'get数据',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='后台操作日志表';

/*Data for the table `lvyecms_operationlog` */

insert  into `lvyecms_operationlog`(`id`,`uid`,`time`,`ip`,`status`,`info`,`get`) values (1,1,1492422761,'0.0.0.0',0,'提示语：该模块要求系统最低版本为：2.0.0！<br/>模块：Admin,控制器：Module,方法：install<br/>请求方式：Ajax','http://localhost/admin.php?m=Module&a=install&module=CustomData'),(2,1,1492422784,'0.0.0.0',0,'提示语：该模块要求系统最低版本为：2.0.0！<br/>模块：Admin,控制器：Module,方法：install<br/>请求方式：Ajax','http://localhost/admin.php?m=Module&a=install&module=CustomData'),(3,1,1492422785,'0.0.0.0',0,'提示语：该模块要求系统最低版本为：2.0.0！<br/>模块：Admin,控制器：Module,方法：install<br/>请求方式：Ajax','http://localhost/admin.php?m=Module&a=install&module=CustomData'),(4,1,1492422887,'0.0.0.0',1,'提示语：模块安装成功！<br/>模块：Admin,控制器：Module,方法：install<br/>请求方式：Ajax','http://localhost/admin.php?m=Module&a=install&module=CustomData'),(5,1,1492422915,'0.0.0.0',1,'提示语：清理缓存目录[Data]成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(6,1,1492422916,'0.0.0.0',1,'提示语：清理缓存目录[Temp]成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site'),(7,1,1492422916,'0.0.0.0',1,'提示语：即将更新站点缓存！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&dir=%2CData'),(8,1,1492422920,'0.0.0.0',1,'提示语：更新缓存：网站配置<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&dir=%2CData%2CTemp'),(9,1,1492422921,'0.0.0.0',1,'提示语：更新缓存：可用模块列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=1'),(10,1,1492422922,'0.0.0.0',1,'提示语：更新缓存：行为列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=2'),(11,1,1492422922,'0.0.0.0',1,'提示语：更新缓存：后台菜单<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=3'),(12,1,1492422923,'0.0.0.0',1,'提示语：更新缓存：栏目索引<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=4'),(13,1,1492422924,'0.0.0.0',1,'提示语：更新缓存：模型列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=5'),(14,1,1492422924,'0.0.0.0',1,'提示语：更新缓存：URL规则<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=6'),(15,1,1492422925,'0.0.0.0',1,'提示语：更新缓存：模型字段<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=7'),(16,1,1492422926,'0.0.0.0',1,'提示语：更新缓存：推荐位<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=8'),(17,1,1492422927,'0.0.0.0',1,'提示语：缓存更新完毕！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=9'),(18,1,1492423769,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(19,1,1492423822,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(20,1,1492423833,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(21,1,1492423841,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(22,1,1492423850,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(23,1,1492423857,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(24,1,1492423859,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(25,1,1492423866,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(26,1,1492423871,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(27,1,1492423881,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(28,1,1492423901,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(29,1,1492423906,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=1'),(30,1,1492423944,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=3&modelid=1'),(31,1,1492423977,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=3&modelid=1'),(32,1,1492424172,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=1'),(33,1,1492424183,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(34,1,1492424223,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=21&modelid=1'),(35,1,1492424333,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(36,1,1492424452,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=1'),(37,1,1492424474,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=1'),(38,1,1492424495,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Content,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=classlist&catid=1'),(39,1,1492424603,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(40,1,1492424659,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=1'),(41,1,1492424682,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=1'),(42,1,1492424692,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=1&id=2'),(43,1,1492424758,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=1&id=2'),(44,1,1492424765,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=1&id=2'),(45,1,1492424771,'0.0.0.0',1,'提示语：删除成功！<br/>模块：Content,控制器：Content,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=classlist&catid=1'),(46,1,1492424774,'0.0.0.0',1,'提示语：删除成功！<br/>模块：Content,控制器：Content,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=classlist&catid=1'),(47,1,1492424795,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=1'),(48,1,1492424830,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=22&modelid=1'),(49,1,1492424837,'0.0.0.0',1,'提示语：清理缓存目录[Data]成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(50,1,1492424839,'0.0.0.0',1,'提示语：清理缓存目录[Temp]成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site'),(51,1,1492424840,'0.0.0.0',1,'提示语：即将更新站点缓存！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&dir=%2CData'),(52,1,1492424844,'0.0.0.0',1,'提示语：更新缓存：网站配置<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&dir=%2CData%2CTemp'),(53,1,1492424845,'0.0.0.0',1,'提示语：更新缓存：可用模块列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=1'),(54,1,1492424846,'0.0.0.0',1,'提示语：更新缓存：行为列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=2'),(55,1,1492424847,'0.0.0.0',1,'提示语：更新缓存：后台菜单<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=3'),(56,1,1492424848,'0.0.0.0',1,'提示语：更新缓存：栏目索引<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=4'),(57,1,1492424848,'0.0.0.0',1,'提示语：更新缓存：模型列表<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=5'),(58,1,1492424849,'0.0.0.0',1,'提示语：更新缓存：URL规则<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=6'),(59,1,1492424850,'0.0.0.0',1,'提示语：更新缓存：模型字段<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=7'),(60,1,1492424850,'0.0.0.0',1,'提示语：更新缓存：推荐位<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=8'),(61,1,1492424851,'0.0.0.0',1,'提示语：缓存更新完毕！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache&type=site&stop=9'),(62,1,1492424877,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=1&id=3'),(63,1,1492424884,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=1&id=3'),(64,1,1492424914,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=1'),(65,1,1492425549,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(66,1,1492425582,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(67,1,1492425741,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(68,1,1492425780,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(69,1,1492425843,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(70,1,1492425869,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(71,1,1492425918,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(72,1,1492425979,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Admin,控制器：Config,方法：attach<br/>请求方式：Ajax','http://localhost/admin.php?m=Config&a=attach&menuid=8'),(73,1,1492426031,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(74,1,1492426046,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(75,1,1492427257,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(76,1,1492427271,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(77,1,1492427280,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=2'),(78,1,1492427306,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(79,1,1492427443,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=33&modelid=2'),(80,1,1492427452,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(81,1,1492427456,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=2'),(82,1,1492427464,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=2'),(83,1,1492427521,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=34&modelid=2'),(84,1,1492427615,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=2'),(85,1,1492427649,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(86,1,1492427708,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=2'),(87,1,1492428130,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=2'),(88,1,1492428139,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(89,1,1492428159,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=2'),(90,1,1492428302,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=singlepage&menuid=47'),(91,1,1492428324,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=2'),(92,1,1492428337,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=2'),(93,1,1492428426,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(94,1,1492428545,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=3'),(95,1,1492428565,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=3'),(96,1,1492428644,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(97,1,1492428697,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=4'),(98,1,1492428719,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=4'),(99,1,1492428835,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(100,1,1492428879,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=5'),(101,1,1492428896,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=5'),(102,1,1492428928,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=2'),(103,1,1492428986,'0.0.0.0',1,'提示语：栏目总数:<font color=\"#FF0000\">5</font>,每次处理:<font color=\"#FF0000\">100</font>,进度:<font color=\"#FF0000\">1/1</font>,栏目缓存更新中...<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&menuid=47'),(104,1,1492428987,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(105,1,1492429105,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=3'),(106,1,1492429161,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=3'),(107,1,1492438471,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(108,1,1492438500,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=3'),(109,1,1492438565,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=3'),(110,1,1492438672,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=57&modelid=3'),(111,1,1492438840,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=56&modelid=3'),(112,1,1492438903,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=3'),(113,1,1492438917,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=3'),(114,1,1492438926,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=3'),(115,1,1492438962,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=65&modelid=3'),(116,1,1492439068,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(117,1,1492439390,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=6'),(118,1,1492439584,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(119,1,1492439702,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(120,1,1492439838,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(121,1,1492439851,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=4'),(122,1,1492439863,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=4'),(123,1,1492439885,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=85&modelid=4'),(124,1,1492439929,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=77&modelid=4'),(125,1,1492439946,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=4'),(126,1,1492439950,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=4'),(127,1,1492439954,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=4'),(128,1,1492439962,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=4'),(129,1,1492440108,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(130,1,1492440162,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&parentid=7'),(131,1,1492440420,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(132,1,1492440474,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=8'),(133,1,1492440556,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(134,1,1492440601,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=5'),(135,1,1492440606,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=5'),(136,1,1492440632,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=105&modelid=5'),(137,1,1492440663,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=97&modelid=5'),(138,1,1492440688,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=5'),(139,1,1492440695,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=5'),(140,1,1492440698,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=5'),(141,1,1492440708,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=5'),(142,1,1492440763,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(143,1,1492440799,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=9'),(144,1,1492440901,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(145,1,1492440940,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=9'),(146,1,1492440994,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(147,1,1492441028,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(148,1,1492441035,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(149,1,1492441043,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(150,1,1492441048,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(151,1,1492441053,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(152,1,1492441056,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(153,1,1492441060,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(154,1,1492441067,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(155,1,1492441075,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(156,1,1492441082,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(157,1,1492441094,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(158,1,1492441100,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=6'),(159,1,1492441158,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Field,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=add&modelid=6'),(160,1,1492441171,'0.0.0.0',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Field,方法：listorder<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=6'),(161,1,1492441234,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=singlepage&menuid=47'),(162,1,1492441294,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(163,1,1492441317,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=11'),(164,1,1492441378,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(165,1,1492441458,'0.0.0.0',1,'提示语：添加模型成功！<br/>模块：Content,控制器：Models,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Models&a=add&menuid=54'),(166,1,1492441476,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=7'),(167,1,1492441480,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=7'),(168,1,1492441485,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=7'),(169,1,1492441492,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=7'),(170,1,1492441510,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=146&modelid=7'),(171,1,1492441563,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Field,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Field&a=edit&fieldid=138&modelid=7'),(172,1,1492441588,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=7'),(173,1,1492441593,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=7'),(174,1,1492441600,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=7'),(175,1,1492441612,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=7'),(176,1,1492441619,'0.0.0.0',1,'提示语：操作成功！<br/>模块：Content,控制器：Field,方法：disabled<br/>请求方式：GET','http://localhost/index.php?m=Field&modelid=7'),(177,1,1492441629,'0.0.0.0',1,'提示语：字段删除成功！<br/>模块：Content,控制器：Field,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Field&modelid=7'),(178,1,1492441684,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=singlepage&menuid=47'),(179,1,1492441733,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=singlepage&parentid=12'),(180,1,1492441759,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=singlepage&parentid=12'),(181,1,1492441773,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=13'),(182,1,1492441786,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=14'),(183,1,1492441821,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&menuid=47'),(184,1,1492442010,'0.0.0.0',1,'提示语：栏目总数:<font color=\"#FF0000\">15</font>,每次处理:<font color=\"#FF0000\">100</font>,进度:<font color=\"#FF0000\">1/1</font>,栏目缓存更新中...<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category'),(185,1,1492442011,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(186,1,1492442012,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(187,1,1492442017,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(188,1,1492442095,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=12'),(189,1,1492442138,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=15'),(190,1,1492442177,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(191,1,1492442194,'0.0.0.0',1,'提示语：添加成功！<br/>模块：CustomData,控制器：Index,方法：add<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=add'),(192,1,1492442235,'0.0.0.0',1,'提示语：注销成功！<br/>模块：Admin,控制器：Public,方法：logout<br/>请求方式：GET','http://localhost/admin.php'),(193,1,1492479751,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(194,1,1492479990,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(195,1,1492480005,'0.0.0.0',1,'提示语：删除成功！<br/>模块：Content,控制器：Content,方法：delete<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=classlist&catid=9'),(196,1,1492480018,'0.0.0.0',1,'提示语：栏目属性转换成功！<br/>模块：Content,控制器：Category,方法：categoryshux<br/>请求方式：GET','http://localhost/index.php?m=Category&menuid=47'),(197,1,1492480068,'0.0.0.0',1,'提示语：更新成功！<br/>模块：Content,控制器：Category,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=edit&catid=9'),(198,1,1492480080,'0.0.0.0',1,'提示语：栏目总数:<font color=\"#FF0000\">15</font>,每次处理:<font color=\"#FF0000\">100</font>,进度:<font color=\"#FF0000\">1/1</font>,栏目缓存更新中...<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category'),(199,1,1492480082,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(200,1,1492480176,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&parentid=9'),(201,1,1492480183,'0.0.0.0',1,'提示语：栏目总数:<font color=\"#FF0000\">16</font>,每次处理:<font color=\"#FF0000\">100</font>,进度:<font color=\"#FF0000\">1/1</font>,栏目缓存更新中...<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category'),(202,1,1492480185,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(203,1,1492480233,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Content,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=add&catid=16'),(204,1,1492480834,'0.0.0.0',1,'提示语：模板缓存清理成功！<br/>模块：Admin,控制器：Index,方法：cache<br/>请求方式：GET','http://localhost/admin.php?a=cache'),(205,1,1492485631,'0.0.0.0',1,'提示语：注销成功！<br/>模块：Admin,控制器：Public,方法：logout<br/>请求方式：GET','http://localhost/admin.php'),(206,1,1492500374,'0.0.0.0',1,'提示语：添加成功！<br/>模块：Content,控制器：Category,方法：add<br/>请求方式：Ajax','http://localhost/index.php?m=Category&a=add&parentid=9'),(207,1,1492500379,'0.0.0.0',1,'提示语：栏目总数:<font color=\"#FF0000\">17</font>,每次处理:<font color=\"#FF0000\">100</font>,进度:<font color=\"#FF0000\">1/1</font>,栏目缓存更新中...<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category'),(208,1,1492500380,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(209,1,1492500381,'0.0.0.0',1,'提示语：缓存更新成功！<br/>模块：Content,控制器：Category,方法：public_cache<br/>请求方式：GET','http://localhost/index.php?m=Category&a=public_cache'),(210,1,1492500879,'0.0.0.0',1,'提示语：注销成功！<br/>模块：Admin,控制器：Public,方法：logout<br/>请求方式：GET','http://localhost/back.php'),(211,1,1492503611,'0.0.0.0',1,'提示语：修改成功！<br/>模块：CustomData,控制器：Index,方法：edit<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=edit&id=7'),(212,1,1492504243,'0.0.0.0',1,'提示语：修改成功！<br/>模块：CustomData,控制器：Index,方法：edit<br/>请求方式：POST','http://localhost/index.php?g=CustomData&a=edit&id=7'),(213,1,1492571260,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=15&id=1'),(214,1,1492572549,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=15&id=1'),(215,1,1492579432,'0.0.0.0',1,'提示语：修改成功！<br/>模块：Content,控制器：Content,方法：edit<br/>请求方式：Ajax','http://localhost/index.php?m=Content&a=edit&catid=6&id=1'),(216,1,1493370880,'127.0.0.1',1,'提示语：排序更新成功！<br/>模块：Content,控制器：Category,方法：index<br/>请求方式：Ajax','http://127.0.0.5/index.php?m=Category&menuid=47');

/*Table structure for table `lvyecms_page` */

DROP TABLE IF EXISTS `lvyecms_page`;

CREATE TABLE `lvyecms_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `style` varchar(24) NOT NULL DEFAULT '' COMMENT '样式',
  `keywords` varchar(40) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` text COMMENT '内容',
  `template` varchar(30) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`catid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页内容表';

/*Data for the table `lvyecms_page` */

/*Table structure for table `lvyecms_position` */

DROP TABLE IF EXISTS `lvyecms_position`;

CREATE TABLE `lvyecms_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `modelid` char(30) NOT NULL DEFAULT '' COMMENT '模型id',
  `catid` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '推荐位名称',
  `maxnum` smallint(5) NOT NULL DEFAULT '20' COMMENT '最大存储数据量',
  `extention` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位';

/*Data for the table `lvyecms_position` */

/*Table structure for table `lvyecms_position_data` */

DROP TABLE IF EXISTS `lvyecms_position_data`;

CREATE TABLE `lvyecms_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位ID',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模型',
  `modelid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `thumb` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有缩略图',
  `data` mediumtext COMMENT '数据信息',
  `listorder` mediumint(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `expiration` int(10) NOT NULL,
  `extention` char(30) NOT NULL DEFAULT '',
  `synedit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否同步编辑',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推荐位数据表';

/*Data for the table `lvyecms_position_data` */

/*Table structure for table `lvyecms_role` */

DROP TABLE IF EXISTS `lvyecms_role`;

CREATE TABLE `lvyecms_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `parentid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息列表';

/*Data for the table `lvyecms_role` */

insert  into `lvyecms_role`(`id`,`name`,`parentid`,`status`,`remark`,`create_time`,`update_time`,`listorder`) values (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0),(2,'站点管理员',1,1,'站点管理员',1329633722,1399780945,0),(3,'发布人员',2,1,'发布人员',1329633733,1399798954,0);

/*Table structure for table `lvyecms_tags` */

DROP TABLE IF EXISTS `lvyecms_tags`;

CREATE TABLE `lvyecms_tags` (
  `tagid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'tagID',
  `tag` char(20) NOT NULL DEFAULT '' COMMENT 'tag名称',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo简介',
  `style` char(5) NOT NULL DEFAULT '' COMMENT '附加状态码',
  `usetimes` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '信息总数',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后使用时间',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `lasthittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最近访问时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `tag` (`tag`),
  KEY `usetimes` (`usetimes`,`listorder`),
  KEY `hits` (`hits`,`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tags主表';

/*Data for the table `lvyecms_tags` */

/*Table structure for table `lvyecms_tags_content` */

DROP TABLE IF EXISTS `lvyecms_tags_content`;

CREATE TABLE `lvyecms_tags_content` (
  `tag` char(20) NOT NULL COMMENT 'tag名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '信息地址',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '标题',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  KEY `modelid` (`modelid`,`contentid`),
  KEY `tag` (`tag`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tags数据表';

/*Data for the table `lvyecms_tags_content` */

/*Table structure for table `lvyecms_terms` */

DROP TABLE IF EXISTS `lvyecms_terms`;

CREATE TABLE `lvyecms_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parentid` smallint(5) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名称',
  `module` varchar(200) NOT NULL DEFAULT '' COMMENT '所属模块',
  `setting` mediumtext COMMENT '相关配置信息',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

/*Data for the table `lvyecms_terms` */

/*Table structure for table `lvyecms_urlrule` */

DROP TABLE IF EXISTS `lvyecms_urlrule`;

CREATE TABLE `lvyecms_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `file` varchar(20) NOT NULL DEFAULT '' COMMENT '所属文件',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '生成静态规则 1 静态',
  `urlrule` varchar(255) NOT NULL DEFAULT '' COMMENT 'url规则',
  `example` varchar(255) NOT NULL DEFAULT '' COMMENT '示例',
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='内容模型URL规则';

/*Data for the table `lvyecms_urlrule` */

insert  into `lvyecms_urlrule`(`urlruleid`,`module`,`file`,`ishtml`,`urlrule`,`example`) values (1,'content','category',0,'index.php?a=lists&catid={$catid}|index.php?a=lists&catid={$catid}&page={$page}','动态：index.php?a=lists&catid=1&page=1'),(2,'content','category',1,'{$categorydir}{$catdir}/index.shtml|{$categorydir}{$catdir}/index_{$page}.shtml','静态：news/china/1000.shtml'),(3,'content','show',1,'{$year}/{$catdir}_{$month}/{$id}.shtml|{$year}/{$catdir}_{$month}/{$id}_{$page}.shtml','静态：2010/catdir_07/1_2.shtml'),(4,'content','show',0,'index.php?a=shows&catid={$catid}&id={$id}|index.php?a=shows&catid={$catid}&id={$id}&page={$page}','动态：index.php?m=Index&a=shows&catid=1&id=1'),(5,'content','category',1,'news/{$catid}.shtml|news/{$catid}-{$page}.shtml','静态：news/1.shtml'),(6,'content','category',0,'list-{$catid}.html|list-{$catid}-{$page}.html','伪静态：list-1-1.html'),(7,'content','tags',0,'index.php?a=tags&amp;tagid={$tagid}|index.php?a=tags&amp;tagid={$tagid}&amp;page={$page}','动态：index.php?a=tags&amp;tagid=1'),(8,'content','tags',0,'index.php?a=tags&amp;tag={$tag}|/index.php?a=tags&amp;tag={$tag}&amp;page={$page}','动态：index.php?a=tags&amp;tag=标签'),(9,'content','tags',0,'tag-{$tag}.html|tag-{$tag}-{$page}.html','伪静态：tag-标签.html'),(10,'content','tags',0,'tag-{$tagid}.html|tag-{$tagid}-{$page}.html','伪静态：tag-1.html'),(11,'content','index',1,'index.html|index_{$page}.html','静态：index_2.html'),(12,'content','index',0,'index.html|index_{$page}.html','伪静态：index_2.html'),(13,'content','index',0,'index.php|index.php?page={$page}','动态：index.php?page=2'),(14,'content','category',1,'download.shtml|download_{$page}.shtml','静态：download.shtml'),(15,'content','show',1,'{$categorydir}{$id}.shtml|{$categorydir}{$id}_{$page}.shtml','静态：/父栏目/1.shtml'),(16,'content','show',1,'{$catdir}/{$id}.shtml|{$catdir}/{$id}_{$page}.shtml','示例：/栏目/1.html');

/*Table structure for table `lvyecms_user` */

DROP TABLE IF EXISTS `lvyecms_user`;

CREATE TABLE `lvyecms_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称/姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `bind_account` varchar(50) NOT NULL DEFAULT '' COMMENT '绑定帐户',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `verify` varchar(32) NOT NULL DEFAULT '' COMMENT '证验码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '对应角色ID',
  `info` text COMMENT '信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

/*Data for the table `lvyecms_user` */

insert  into `lvyecms_user`(`id`,`username`,`nickname`,`password`,`bind_account`,`last_login_time`,`last_login_ip`,`verify`,`email`,`remark`,`create_time`,`update_time`,`status`,`role_id`,`info`) values (1,'admin','未知','9edc12391143c2ac219852a87db354f9','',1493370858,'127.0.0.1','L2JgdO','admin@abc3210.com','备注信息',1492422653,1492422653,1,1,'');

/*Table structure for table `lvyecms_ziliao` */

DROP TABLE IF EXISTS `lvyecms_ziliao`;

CREATE TABLE `lvyecms_ziliao` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_ziliao` */

insert  into `lvyecms_ziliao`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`posid`,`url`,`listorder`,`status`,`sysadd`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (1,11,'哈哈','','','','',0,'/index.php?a=shows&catid=11&id=1',0,99,1,'admin',1492441317,1492441317,0,0,0,0,0,0);

/*Table structure for table `lvyecms_ziliao_data` */

DROP TABLE IF EXISTS `lvyecms_ziliao_data`;

CREATE TABLE `lvyecms_ziliao_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `wenjian` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_ziliao_data` */

insert  into `lvyecms_ziliao_data`(`id`,`template`,`paytype`,`allow_comment`,`wenjian`) values (1,'',0,0,'/d/file/content/2017/04/thumb_58f4d6d994fe6.jpg');

/*Table structure for table `lvyecms_zixun` */

DROP TABLE IF EXISTS `lvyecms_zixun`;

CREATE TABLE `lvyecms_zixun` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(24) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `posid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_zixun` */

insert  into `lvyecms_zixun`(`id`,`catid`,`title`,`style`,`thumb`,`keywords`,`tags`,`description`,`posid`,`url`,`listorder`,`status`,`sysadd`,`islink`,`username`,`inputtime`,`updatetime`,`views`,`yesterdayviews`,`dayviews`,`weekviews`,`monthviews`,`viewsupdatetime`) values (2,16,'A','','/d/file/content/2017/04/thumb_58f4d14932488.jpg','A','','A',0,'/index.php?a=shows&catid=16&id=2',0,99,1,0,'admin',1492480233,1492480233,0,0,0,0,0,0);

/*Table structure for table `lvyecms_zixun_data` */

DROP TABLE IF EXISTS `lvyecms_zixun_data`;

CREATE TABLE `lvyecms_zixun_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `template` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `lvyecms_zixun_data` */

insert  into `lvyecms_zixun_data`(`id`,`content`,`template`,`paytype`,`allow_comment`) values (2,'A','',0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
