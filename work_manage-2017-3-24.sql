/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : work_manage

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-03-24 15:59:51
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('65', '9', '14', null, null, '1', '<p>阿诗丹顿撒打算</p>\r\n', '阿诗丹顿撒打算', '1490006731270', '0');
INSERT INTO `answer` VALUES ('66', '5', '14', null, null, '1', '<p>测试2</p>\r\n', '测试2', '1490008039189', '0');
INSERT INTO `answer` VALUES ('67', '6', '14', null, null, '2', '<p>测试</p>\r\n', '测试', '1490008762072', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('34', '14', '66', 'ok啦', null, '1490008156941', '0');
INSERT INTO `comment` VALUES ('35', '14', '67', 'pass', null, '1490008768270', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '23', null, '恭喜你回答通过了，你升了一级，离50级大神又近了一步！', null, null, '1', '1486975637345', '0');
INSERT INTO `message` VALUES ('2', null, null, null, '/question/details?id=9', null, null, '1487037655486', '0');
INSERT INTO `message` VALUES ('3', '23', '0', '你的回答JS初级教学通过了，你升了一级！', '/question/details?id=8', '0', '1', '1487086215282', '0');
INSERT INTO `message` VALUES ('4', '23', '0', '你通过了关于如何布局 的回答，你升了一级！', '/question/details?id=7', '0', '1', '1487146879858', '0');
INSERT INTO `message` VALUES ('5', '14', '0', '你通过了关于如何入门前端 的回答，你升了一级！', '/question/details?id=5', '0', '1', '1489471845265', '0');
INSERT INTO `message` VALUES ('6', '14', '0', '你通过了关于如何入门前端 的回答，你升了一级！', '/question/details?id=5', '0', '1', '1490008156983', '0');
INSERT INTO `message` VALUES ('7', '14', '0', '你通过了关于html语义化 的回答，你升了一级！', '/question/details?id=6', '0', '1', '1490008768349', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('5', null, null, '如何入门前端', '<h1 id=\"h1-u5165u95E8u7B2Cu4E00u8282u8BFE\"><a name=\"入门第一节课\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>入门第一节课</h1>', '# 入门第一节课', '1', null, '1485351898237', '0');
INSERT INTO `question` VALUES ('6', null, null, 'html语义化', '<h2 id=\"h2-u6807u7B7Eu8BEDu4E49u5316\"><a name=\"标签语义化\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>标签语义化</h2><ul>\r\n<li>video</li></ul>\r\n', '## 标签语义化\r\n\r\n- video', '2', null, '1485352470382', '0');
INSERT INTO `question` VALUES ('7', null, null, '如何布局', '<h1 id=\"h1-u5E03u5C40\"><a name=\"布局\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>布局</h1>', '# 布局', '3', null, '1485353107612', '0');
INSERT INTO `question` VALUES ('8', null, null, 'JS初级教学', '<p>192.168.1.1</p>\r\n', '192.168.1.1', '4', null, '1486087251857', '0');
INSERT INTO `question` VALUES ('9', null, null, '制作电商网站', '<p>制作电商网站</p>\r\n', '制作电商网站', '5', null, '1486460286434', '0');
INSERT INTO `question` VALUES ('11', null, null, '温习HTML标签知识', '<p>熟悉div\\span等标签</p>\r\n', '熟悉div\\span等标签', '6', null, '1486800743840', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

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
INSERT INTO `session` VALUES ('36', '4irCu_gsAoNKWGrKW9Ox_Flp61WCveSI', null, '1490423007561');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL COMMENT '0:系统管理员 1: 普通管理员 2: 普通用户',
  `has_answer` varchar(255) NOT NULL DEFAULT '' COMMENT '回答的题号（级别）',
  `pass_time` int(11) NOT NULL DEFAULT '0' COMMENT '回答通过的次数',
  `level` int(11) NOT NULL,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('14', null, '994296086@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/4e0d6a59c203498c032e91741df811e6?s=100&r=G&d=retro', '0', '1,555555979556', '0', '2', '1486800446728', '0');
INSERT INTO `user` VALUES ('19', null, '810881283@qq.com', 'b1a7b037a74cee8b725d92068f14ec13e3a7f62c', '', '/static/upload/user/pic1486803279658.jpg', '2', '1,4,2,3,2,5,', '0', '5', '1486801893900', '0');
INSERT INTO `user` VALUES ('20', null, '123@qq.com', 'b1a7b037a74cee8b725d92068f14ec13e3a7f62c', null, '//gravatar.duoshuo.com/avatar/487f87505f619bf9ea08f26bb34f8118?s=100&r=G&d=retro', '2', '', '0', '0', '1486802196884', '0');
INSERT INTO `user` VALUES ('21', null, '666@qq.coom', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/d0885bf5ed3fc42bcbc6d4d485cabf18?s=100&r=G&d=retro', '2', '', '0', '0', '1486970104057', '0');
INSERT INTO `user` VALUES ('22', null, '666@qq.com', 'df8f8f4308ee4bd6814d9ce222de44abffa9e94c', null, '//gravatar.duoshuo.com/avatar/cdf2628d43f941c34796949e0857e3a5?s=100&r=G&d=retro', '2', '', '0', '0', '1486970129844', '0');
INSERT INTO `user` VALUES ('23', null, '666@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/cdf2628d43f941c34796949e0857e3a5?s=100&r=G&d=retro', '2', '1,1,2,5,4,3,', '0', '5', '1486970149217', '0');
INSERT INTO `user` VALUES ('24', null, '2@qq.com', '8be3c943b1609fffbfc51aad666d0a04adf83c9d', '昵称', '//gravatar.duoshuo.com/avatar/4f987513d1e66d3d02d60b7d82667000?s=100&r=G&d=retro', '2', '', '0', '0', '1488376032395', '0');
INSERT INTO `user` VALUES ('25', null, '邮箱', '8be3c943b1609fffbfc51aad666d0a04adf83c9d', '昵称', '//gravatar.duoshuo.com/avatar/3bc5e602b2d4c7fffe79258e2ac6952e?s=100&r=G&d=retro', '2', '', '0', '0', '1488376117746', '0');
INSERT INTO `user` VALUES ('26', null, '99@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '枫', '//gravatar.duoshuo.com/avatar/c17171a5fb2a3d78fb7af31a7f1af263?s=100&r=G&d=retro', '2', '', '0', '0', '1488377307631', '0');
INSERT INTO `user` VALUES ('27', null, 'a@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'xiao', '//gravatar.duoshuo.com/avatar/f2a999adb12113e2e1a77ac6081a8999?s=100&r=G&d=retro', '2', '', '0', '0', '1489758327284', '0');
