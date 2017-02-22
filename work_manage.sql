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

 Date: 02/22/2017 16:10:23 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `scored` int(11) DEFAULT NULL,
  `content_html` text,
  `content_md` text,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `answer`
-- ----------------------------
BEGIN;
INSERT INTO `answer` VALUES ('22', '5', '19', null, null, '<p>asdfasdf</p>\r\n', 'asdfasdf', '1486801910867', '0'), ('23', '6', '19', null, null, '<p>asdfadsfadsfasdf</p>\r\n', 'asdfadsfadsfasdf', '1486801928585', '0'), ('24', '6', '19', null, null, '<h1 id=\"h1-dasfdasf\"><a name=\"dasfdasf\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>dasfdasf</h1><p>dasfads</p>\r\n<blockquote>\r\n<p>dasfsdf</p>\r\n<pre><code class=\"lang-javscirpt\">function(){}\r\n</code></pre>\r\n</blockquote>\r\n', '# dasfdasf\r\ndasfads\r\n> dasfsdf\r\n```javscirpt\r\nfunction(){}\r\n```', '1486801951876', '0'), ('25', '8', '19', null, null, '<p>sadfdasfdasfadsfadsf</p>\r\n', 'sadfdasfdasfadsfadsf', '1486801983044', '0'), ('26', '7', '19', null, null, '<p>asdfdasfadsfdasf</p>\r\n', 'asdfdasfadsfdasf', '1486802060671', '0'), ('27', '7', '19', null, null, '<p>asdfsadfasdfsadf</p>\r\n', 'asdfsadfasdfsadf', '1486802087089', '0'), ('28', '5', '23', null, null, '<p>dasd sad啊说</p>\r\n', 'dasd sad啊说', '1486970744471', '0'), ('29', '5', '23', null, null, '<p>42让我放松地方</p>\r\n', '42让我放松地方', '1486971013205', '0'), ('30', '6', '23', null, null, '<p>DASDA</p>\r\n', 'DASDA', '1486971471616', '0'), ('31', '9', '23', null, null, '<p>666</p>\r\n', '666', '1486975627402', '0'), ('32', '9', '19', null, null, '<p>safdasfdasf</p>\r\n', 'safdasfdasf', '1487037644725', '0'), ('33', '8', '23', null, null, '<p>121ed</p>\r\n', '121ed', '1487086202475', '0'), ('34', '7', '23', null, null, '<p>3213213</p>\r\n', '3213213', '1487146683980', '0'), ('35', '7', '23', null, null, '<p>12312</p>\r\n', '12312', '1487146836116', '0');
COMMIT;

-- ----------------------------
--  Table structure for `comment`
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('20', '14', '22', 'hao', null, '1486801940968', '0'), ('21', '14', '25', 'guo', null, '1486802025589', '0'), ('22', '14', '24', 'buco', null, '1486802045710', '0'), ('23', '14', '26', 'butongg', null, '1486802073224', '0'), ('24', '14', '27', 'ok', null, '1486802096160', '0'), ('25', '14', '23', '过', null, '1486970774229', '0'), ('26', '14', '29', '好', null, '1486971026222', '0'), ('27', '14', '28', '56789', null, '1486971106664', '0'), ('28', '14', '30', 'OK\r\n', null, '1486971488731', '0'), ('29', '14', '31', 'en', null, '1486975637324', '0'), ('30', '14', '32', '3二七万达', null, '1487037655454', '0'), ('31', '14', '33', '1', null, '1487086215270', '0'), ('32', '14', '35', 'ok', null, '1487146879848', '0');
COMMIT;

-- ----------------------------
--  Table structure for `message`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `message`
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES ('1', '23', null, '恭喜你回答通过了，你升了一级，离50级大神又近了一步！', null, null, '1', '1486975637345', '0'), ('2', null, null, null, '/question/details?id=9', null, null, '1487037655486', '0'), ('3', '23', '0', '你的回答JS初级教学通过了，你升了一级！', '/question/details?id=8', '0', '1', '1487086215282', '0'), ('4', '23', '0', '你通过了关于如何布局 的回答，你升了一级！', '/question/details?id=7', '0', '1', '1487146879858', '0');
COMMIT;

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
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `question`
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES ('5', null, null, '如何入门前端', '<h1 id=\"h1-u5165u95E8u7B2Cu4E00u8282u8BFE\"><a name=\"入门第一节课\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>入门第一节课</h1>', '# 入门第一节课', '1', null, '1485351898237', '0'), ('6', null, null, 'html语义化', '<h2 id=\"h2-u6807u7B7Eu8BEDu4E49u5316\"><a name=\"标签语义化\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>标签语义化</h2><ul>\r\n<li>video</li></ul>\r\n', '## 标签语义化\r\n\r\n- video', '2', null, '1485352470382', '0'), ('7', null, null, '如何布局', '<h1 id=\"h1-u5E03u5C40\"><a name=\"布局\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>布局</h1>', '# 布局', '3', null, '1485353107612', '0'), ('8', null, null, 'JS初级教学', '<p>192.168.1.1</p>\r\n', '192.168.1.1', '4', null, '1486087251857', '0'), ('9', null, null, '制作电商网站', '<p>制作电商网站</p>\r\n', '制作电商网站', '5', null, '1486460286434', '0'), ('11', null, null, '温习HTML标签知识', '<p>熟悉div\\span等标签</p>\r\n', '熟悉div\\span等标签', '6', null, '1486800743840', '0');
COMMIT;

-- ----------------------------
--  Table structure for `session`
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `session`
-- ----------------------------
BEGIN;
INSERT INTO `session` VALUES ('15', 'CJ8HnKYI0CkVfUSbrrwlLKLUiOS8_lof', '{\"uid\":23}', '1487233807474'), ('16', 'ZS5VtkGL8Dj14mmT_0UtbvO9lD5gxsHg', '{\"uid\":14}', '1486888965712'), ('17', 'jN2L6cMgQqzY9X5eALhR7Lg0vO9giVaH', '{\"uid\":19}', '1486890166008'), ('18', '_Rn3_sHyiR8_6Rd_Six2r5AGoVWe9Lo8', '{\"uid\":14}', '1487233279935'), ('19', 'lXSSl2zR_3zNaMuG1Lwi6uzot4WCaXhH', '{\"uid\":19}', '1487124257046'), ('20', '8lZ6RUH3uXht_acpBwamPqF5pWhpX_jF', null, '1487761090464'), ('21', 'Rn0MLKiWBfGka46VYzgE0JfkoJnCm0l2', null, '1487761090643');
COMMIT;

-- ----------------------------
--  Table structure for `user`
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('14', null, '994296086@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/4e0d6a59c203498c032e91741df811e6?s=100&r=G&d=retro', '0', '', '0', '0', '1486800446728', '0'), ('19', null, '810881283@qq.com', 'b1a7b037a74cee8b725d92068f14ec13e3a7f62c', '', '/static/upload/user/pic1486803279658.jpg', '2', '1,4,2,3,2,5,', '0', '5', '1486801893900', '0'), ('20', null, '123@qq.com', 'b1a7b037a74cee8b725d92068f14ec13e3a7f62c', null, '//gravatar.duoshuo.com/avatar/487f87505f619bf9ea08f26bb34f8118?s=100&r=G&d=retro', '2', '', '0', '0', '1486802196884', '0'), ('21', null, '666@qq.coom', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/d0885bf5ed3fc42bcbc6d4d485cabf18?s=100&r=G&d=retro', '2', '', '0', '0', '1486970104057', '0'), ('22', null, '666@qq.com', 'df8f8f4308ee4bd6814d9ce222de44abffa9e94c', null, '//gravatar.duoshuo.com/avatar/cdf2628d43f941c34796949e0857e3a5?s=100&r=G&d=retro', '2', '', '0', '0', '1486970129844', '0'), ('23', null, '666@qq.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', null, '//gravatar.duoshuo.com/avatar/cdf2628d43f941c34796949e0857e3a5?s=100&r=G&d=retro', '2', '1,1,2,5,4,3,', '0', '5', '1486970149217', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
