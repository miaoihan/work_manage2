/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : work_manage

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 04/23/2017 11:39:35 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_html` text,
  `content_md` text,
  `level` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `is_good` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为优秀作业',
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `question`
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES ('13', null, null, '完成你的第一个html页面', '<p>完成你的第一个html页面</p>\r\n', '完成你的第一个html页面', '1', null, '0', '1490973861009', '0'), ('15', null, null, '测试一下', '<p>测试</p>\r\n', '测试', '2', null, '0', '1492091382110', '0'), ('16', null, null, '提问', '<p>的撒大所多</p>\r\n', '的撒大所多', '3', null, '0', '1492094407370', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
