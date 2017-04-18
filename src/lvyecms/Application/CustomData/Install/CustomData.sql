SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure
-- ----------------------------
DROP TABLE IF EXISTS `lvyecms_custom_data`;
CREATE TABLE `lvyecms_custom_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `adddate` int(10) unsigned NOT NULL COMMENT '添加时间',
  `typeid` varchar(255) NOT NULL COMMENT '数据类型编号',
  `data` text NOT NULL COMMENT '数据',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='自定义资料数据表';