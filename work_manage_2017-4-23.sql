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

 Date: 04/23/2017 10:42:34 AM
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
  `commit_state` int(11) DEFAULT '1' COMMENT '0. 未提交、为批改 1：已提交、未批改 2：已提交、已批改',
  `content_html` text,
  `content_md` text,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `answer`
-- ----------------------------
BEGIN;
INSERT INTO `answer` VALUES ('1', '13', '39', null, '70', '2', '<p>不知道你是不是第一次面试，如果是的，那太正常的，对对方的未知会导致你本能的怯场。如果你面了很多次了，又善于找规律，你会发现都是些套路，不管是前端还是后端。而且你面着面着你会发现你的水平提升了，不敢说你技术水平真的提升了，至少你面试水平会有一个很明显的提升。<br>常的，对对方的未知会导致你本能的怯场。</p>\r\n', '不知道你是不是第一次面试，如果是的，那太正常的，对对方的未知会导致你本能的怯场。如果你面了很多次了，又善于找规律，你会发现都是些套路，不管是前端还是后端。而且你面着面着你会发现你的水平提升了，不敢说你技术水平真的提升了，至少你面试水平会有一个很明显的提升。\r\n常的，对对方的未知会导致你本能的怯场。\r\n\r\n', '1491980325429', '0'), ('2', '14', '39', null, null, '1', '<p>而且的无多多无</p>\r\n<p>&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=”stylesheet” href=”/static/editor/css/editormd.min.css撒大声地而且的无多多无</p>\r\n<p>&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=”stylesheet”而且的无多多无</p>\r\n<p>&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=”stylesheet””&gt;<br>撒旦撒旦而且的无多多无</p>\r\n<p>&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=&quot;stylesheet&quot; href=&quot;/static/editor/css/editormd.min.css&quot;&gt;&lt;link rel=”stylesheet”</p>\r\n', '而且的无多多无\r\n<link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css撒大声地而且的无多多无\r\n<link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\"而且的无多多无\r\n<link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\"\">\r\n撒旦撒旦而且的无多多无\r\n<link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\" href=\"/static/editor/css/editormd.min.css\"><link rel=\"stylesheet\"', '1491981533358', '0'), ('3', '15', '39', null, null, '1', '<p>啊大三的复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(“sel”).value = “1”}else{document.getElementById(“sel”).value = “0”}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(“sel”).value = “1”}else{document.getElementById(“sel”).value = “0”}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(“sel”).value = “1”}else{document.getElementById(“sel”).value = “0”}</p>\r\n', '啊大三的复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(\"sel\").value = \"1\"}else{document.getElementById(\"sel\").value = \"0\"}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(\"sel\").value = \"1\"}else{document.getElementById(\"sel\").value = \"0\"}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(\"sel\").value = \"1\"}else{document.getElementById(\"sel\").value = \"0\"}', '1492091452438', '0'), ('4', '13', '40', null, null, '1', '<p>回答个问题</p>\r\n', '回答个问题', '1492094130032', '0'), ('5', '15', '40', null, null, '1', '<p>测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)测测测$(‘.ans-content’).css(‘height’, slideHeight + ‘px’)</p>\r\n', '测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')测测测$(\'.ans-content\').css(\'height\', slideHeight + \'px\')', '1492094190882', '0'), ('6', '16', '39', null, null, '1', '<p>复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(“sel”).value = “1”}else{document.getElementById(“sel”).value = “0”}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(“sel”).value = “1”}else{document.getElementById(“sel”).value = “0”}</p>\r\n', '复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(\"sel\").value = \"1\"}else{document.getElementById(\"sel\").value = \"0\"}复选框有个onchange()事件，你在这个事件裏去操作好啦。在onchange事件里if(sel.checked == true){document.getElementById(\"sel\").value = \"1\"}else{document.getElementById(\"sel\").value = \"0\"}', '1492094415517', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('1', '39', '1', 'asdads', null, '1492090311785', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `message`
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES ('1', '39', '0', '你通过了关于 完成你的第一个html页面 的回答，恭喜你升了一级！', '/question/details?id=13', '0', '1', '1492090311795', '0');
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

-- ----------------------------
--  Table structure for `right`
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `right`
-- ----------------------------
BEGIN;
INSERT INTO `right` VALUES ('1', 'SEE_MORE', '查看更多');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '0: 系统管理员 1: 普通管理员 2: 毕业用户 3: 学员 4: 非学员用户 5: 游客',
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '0', '系统管理员', '001', null), ('2', '1', '普通管理员', '002', null), ('3', '2', '毕业用户', '003', null), ('4', '3', '学员', '004', null), ('5', '4', '普通用户', '005', null), ('6', '5', '游客', '006', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `session`
-- ----------------------------
BEGIN;
INSERT INTO `session` VALUES ('47', 'Bx78KRw_nH1Zpgp5Kf2pXkZjStt1PH_4', '{\"uid\":39}', '1492610013129'), ('48', 'fypkBZC6IK8A_aSS7pliWJIJHgkznqhe', null, '1492610025891'), ('49', 'IVRQ8XyXaIxzYNLMmAVlyDyLsBWrLNX4', null, '1492610026115'), ('50', 'GmJTaWclC1_Hcm0KaXP8xNT0oq2KLmAC', '{\"uid\":39}', '1492610170826'), ('51', 'kXJ0DcPAvS8_p_F4WM5pZpiQ8Ceh6yID', '{\"uid\":39}', '1492867564227'), ('52', 'AZBvn9ImBtRPbva4gkrwAPdatEcuzVLY', null, '1492966471087'), ('53', '9149j5RWVLviag5r3p8GH11_SAw3EAlR', null, '1492966493211'), ('54', 'RaK4MEWjEBkSGl_tl9sPk_K6Ug8V6Uoj', null, '1492967217203'), ('55', 'WzxdzNSOwb088_vciUcGZUd85S39k0SX', null, '1492967217552');
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
  `realname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '4' COMMENT '0:系统管理员 1: 普通管理员 2: 毕业用户 3：学员 4：非学员用户  5: 游客',
  `rightnames` varchar(255) DEFAULT NULL,
  `cansees` varchar(255) DEFAULT NULL COMMENT '可查看的问题id',
  `has_answer` varchar(255) NOT NULL DEFAULT '' COMMENT '回答的题号（级别）',
  `pass_time` int(11) NOT NULL DEFAULT '0' COMMENT '回答通过的次数',
  `level` int(11) NOT NULL,
  `created_time` bigint(20) NOT NULL,
  `del_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('39', null, '994296086@qq.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '张晗', 'chaos', '//gravatar.duoshuo.com/avatar/4e0d6a59c203498c032e91741df811e6?s=100&r=G&d=retro', '0', '查看更多', 'null15,15,16,', '13,14,14,14,14,13,13,15,15,16,', '0', '1', '1490973761651', '0'), ('40', null, '66@qq.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '223', 'chosq', '//gravatar.duoshuo.com/avatar/6420dca71a58e22302bf4d38dccd9909?s=100&r=G&d=retro', '4', null, '1,13,15,15,', '13,15,15,', '0', '0', '1490976334098', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
