/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : work_manage

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-03-31 23:26:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `scored` int(11) DEFAULT NULL,
  `commit_state` int(11) DEFAULT '1' COMMENT '0. 未提交、为批改 1：已提交、未批改 2：已提交、已批改',
  `content_html` text,
  `content_md` text,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  `content_html` text,
  `content_md` text,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `content` text,
  `link` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `is_read` varchar(255) DEFAULT NULL,
  `created_time` bigint(20) DEFAULT NULL,
  `del_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for question
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
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('13', null, null, '完成你的第一个html页面', '<p>完成你的第一个html页面</p>\r\n', '完成你的第一个html页面', '1', null, '1490973861009', '0');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `expire` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookie` (`cookie`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('15', 'CJ8HnKYI0CkVfUSbrrwlLKLUiOS8_lof', '{\"uid\":23}', '1487233807474');
INSERT INTO `session` VALUES ('16', 'ZS5VtkGL8Dj14mmT_0UtbvO9lD5gxsHg', '{\"uid\":14}', '1486888965712');
INSERT INTO `session` VALUES ('17', 'jN2L6cMgQqzY9X5eALhR7Lg0vO9giVaH', '{\"uid\":19}', '1486890166008');
INSERT INTO `session` VALUES ('18', '_Rn3_sHyiR8_6Rd_Six2r5AGoVWe9Lo8', '{\"uid\":14}', '1487233279935');
INSERT INTO `session` VALUES ('19', 'lXSSl2zR_3zNaMuG1Lwi6uzot4WCaXhH', '{\"uid\":19}', '1487124257046');
INSERT INTO `session` VALUES ('20', '8lZ6RUH3uXht_acpBwamPqF5pWhpX_jF', null, '1487761090464');
INSERT INTO `session` VALUES ('21', 'Rn0MLKiWBfGka46VYzgE0JfkoJnCm0l2', null, '1487761090643');
INSERT INTO `session` VALUES ('22', 'rs_MdFYByfP2T0uS38RLvfruKh0gbpuE', null, '1488371314642');
INSERT INTO `session` VALUES ('23', 'oAHrOSDrrVna9E_RTKhVIt8NSa9zqmFx', null, '1488441335464');
INSERT INTO `session` VALUES ('24', 'PkeDg_DzVE4lbWB3yNo102Z_oth9l8mT', '{\"uid\":26}', '1488511572563');
INSERT INTO `session` VALUES ('25', '_Xh7_TgkTiAgQYaaBcHCz67MU8CSDty2', null, '1489067480430');
INSERT INTO `session` VALUES ('26', 'rMZgY07Ti_I_4MjvPrU_QsmZ1_XRbRVi', null, '1489067494441');
INSERT INTO `session` VALUES ('27', 'fLiDsFyDoGtTEk5kmwwuX8B_XPAluGq6', '{\"uid\":27}', '1489502721249');
INSERT INTO `session` VALUES ('28', 'Lt6S6nWGYz9prbIVu62kULy4mWoXb1mE', '{\"uid\":27}', '1489558068925');
INSERT INTO `session` VALUES ('29', 'rNF7IdwucVfLRYIsST36TME3gMasTrdK', '{\"uid\":14}', '1489566174389');
INSERT INTO `session` VALUES ('30', 'NS0g39q_LjC_m5ARnIDGSKx39BWlhQMQ', '{\"uid\":27}', '1489926677714');
INSERT INTO `session` VALUES ('31', 'MSoYIE25X7Elp7EXtlN7TFzAVSl4MIlv', null, '1489847118492');
INSERT INTO `session` VALUES ('32', '7UytV3VnHeR5fddjXC28bMXnfx5wCDff', null, '1489847192523');
INSERT INTO `session` VALUES ('33', 'bsWNoyAIbWKRZ19Q_yX8gxiCSD6_MZQb', null, '1490090435052');
INSERT INTO `session` VALUES ('34', 'QNjEl2fBfs86THt9RhQcgT20BCntWRHv', '{\"uid\":14}', '1490104208433');
INSERT INTO `session` VALUES ('35', 'sawjIC_wIF_PsoH_7vCYsvUeIBXW3Nfa', null, '1490414420434');
INSERT INTO `session` VALUES ('36', '4irCu_gsAoNKWGrKW9Ox_Flp61WCveSI', '{\"uid\":14}', '1490435805703');
INSERT INTO `session` VALUES ('37', 'ewEgqG0B_QRfBYpa4kQROAvum3am9qk_', '{\"uid\":39}', '1491060303478');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL COMMENT '0:系统管理员 1: 普通管理员 2: 普通用户',
  `has_answer` varchar(255) NOT NULL DEFAULT '' COMMENT '回答的题号（级别）',
  `pass_time` int(11) NOT NULL DEFAULT '0' COMMENT '回答通过的次数',
  `level` int(11) NOT NULL,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('39', null, '994296086@qq.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '张晗', '', '//gravatar.duoshuo.com/avatar/4e0d6a59c203498c032e91741df811e6?s=100&r=G&d=retro', '0', '', '0', '0', '1490973761651', '0');
