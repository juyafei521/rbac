/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : rbac

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-08-16 22:14:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL COMMENT '所属分类的id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` text NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '文章内容',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `author` varchar(100) NOT NULL COMMENT '作者',
  `count` int(11) unsigned DEFAULT NULL COMMENT '浏览次数',
  `praiseId` int(11) unsigned DEFAULT NULL COMMENT '关联点赞表的id',
  `sort_oder` int(11) unsigned NOT NULL COMMENT '排序',
  `date` int(11) unsigned DEFAULT NULL COMMENT '发布时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('6', '18', '喂喂喂', '温网', '温网', 'a8e2ece7e5e899748fa291308ba37e3f9f4a0bc8.png', '温网', null, null, '11', '1471093772', null);

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('最高管理权限', '1', '1470833667');
INSERT INTO `auth_assignment` VALUES ('游客查看权限', '8', '1470838983');
INSERT INTO `auth_assignment` VALUES ('游客查看权限', '9', '1470839219');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1470833600', '1470833600');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1470834176', '1470834176');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1470834003', '1470834003');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1470834111', '1470834111');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1470834109', '1470834109');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1470834113', '1470834113');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1470834110', '1470834110');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1470834116', '1470834116');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1470833911', '1470833911');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1470834009', '1470834009');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1470834120', '1470834120');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1470834122', '1470834122');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1470834117', '1470834117');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1470834121', '1470834121');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1470834118', '1470834118');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1470834012', '1470834012');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1470834131', '1470834131');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1470834126', '1470834126');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1470834129', '1470834129');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1470834123', '1470834123');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1470834133', '1470834133');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1470834128', '1470834128');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1470834125', '1470834125');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1470834015', '1470834015');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1470834143', '1470834143');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1470834139', '1470834139');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1470834141', '1470834141');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1470834136', '1470834136');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1470834145', '1470834145');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1470834140', '1470834140');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1470834137', '1470834137');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1470834017', '1470834017');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1470834150', '1470834150');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1470834148', '1470834148');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1470834147', '1470834147');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1470834152', '1470834152');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1470834151', '1470834151');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1470834020', '1470834020');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1470834157', '1470834157');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1470834159', '1470834159');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1470834154', '1470834154');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1470834158', '1470834158');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1470834155', '1470834155');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1470834175', '1470834175');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1470834174', '1470834174');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1470834171', '1470834171');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1470834164', '1470834164');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1470834161', '1470834161');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1470834166', '1470834166');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1470834167', '1470834167');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1470834169', '1470834169');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1470834170', '1470834170');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1470834168', '1470834168');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1470834163', '1470834163');
INSERT INTO `auth_item` VALUES ('/article/*', '2', null, null, null, '1471005464', '1471005464');
INSERT INTO `auth_item` VALUES ('/article/create', '2', null, null, null, '1471005460', '1471005460');
INSERT INTO `auth_item` VALUES ('/article/delete', '2', null, null, null, '1471005463', '1471005463');
INSERT INTO `auth_item` VALUES ('/article/index', '2', null, null, null, '1471005457', '1471005457');
INSERT INTO `auth_item` VALUES ('/article/update', '2', null, null, null, '1471005461', '1471005461');
INSERT INTO `auth_item` VALUES ('/article/view', '2', null, null, null, '1471005459', '1471005459');
INSERT INTO `auth_item` VALUES ('/category/*', '2', null, null, null, '1470922522', '1470922522');
INSERT INTO `auth_item` VALUES ('/category/create', '2', null, null, null, '1470922517', '1470922517');
INSERT INTO `auth_item` VALUES ('/category/delete', '2', null, null, null, '1470922520', '1470922520');
INSERT INTO `auth_item` VALUES ('/category/index', '2', null, null, null, '1470922514', '1470922514');
INSERT INTO `auth_item` VALUES ('/category/update', '2', null, null, null, '1470922519', '1470922519');
INSERT INTO `auth_item` VALUES ('/category/view', '2', null, null, null, '1470922515', '1470922515');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1470834188', '1470834188');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1470834185', '1470834185');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1470834178', '1470834178');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1470834183', '1470834183');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1470834179', '1470834179');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1470834182', '1470834182');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1470834180', '1470834180');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1470834200', '1470834200');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1470834198', '1470834198');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1470834196', '1470834196');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1470834195', '1470834195');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1470834187', '1470834187');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1470834194', '1470834194');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1470834189', '1470834189');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1470834206', '1470834206');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1470834202', '1470834202');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1470834203', '1470834203');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1470834204', '1470834204');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1470834205', '1470834205');
INSERT INTO `auth_item` VALUES ('最高管理权限', '2', null, null, null, '1470833651', '1470833651');
INSERT INTO `auth_item` VALUES ('游客查看权限', '2', '允许登录和浏览后台，不允许操作', null, null, '1470838887', '1470838887');
INSERT INTO `auth_item` VALUES ('用户管理员', '1', '用于管理用户组', null, null, '1470839467', '1470839467');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('最高管理权限', '/*');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/site/index');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/site/login');
INSERT INTO `auth_item_child` VALUES ('游客查看权限', '/site/logout');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) DEFAULT NULL,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('16', '电子产品', '0');
INSERT INTO `category` VALUES ('18', '手机', '16');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('3', '权限管理', null, null, '2', 0x7B2269636F6E223A202266612066612D6765617273222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('4', '路由列表', '3', '/admin/route/index', '1', null);
INSERT INTO `menu` VALUES ('5', '权限列表', '3', '/admin/permission/index', '2', null);
INSERT INTO `menu` VALUES ('7', '角色列表', '3', '/admin/role/index', '3', null);
INSERT INTO `menu` VALUES ('8', '分配权限', '3', '/admin/assignment/index', '4', null);
INSERT INTO `menu` VALUES ('9', '菜单列表', '3', '/admin/menu/index', '5', null);
INSERT INTO `menu` VALUES ('10', '管理员管理', null, null, '3', 0x7B2269636F6E223A202266612066612D75736572222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('11', '管理员列表', '10', '/admin/user/index', null, null);
INSERT INTO `menu` VALUES ('12', '添加管理员', '10', '/admin/user/signup', null, null);
INSERT INTO `menu` VALUES ('14', '仪表盘', null, '/site/index', '1', 0x7B2269636F6E223A202266612066612D64617368626F617264222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('19', '修改密码', '10', '/admin/user/change-password', '3', null);
INSERT INTO `menu` VALUES ('21', '文章管理', null, null, '4', null);
INSERT INTO `menu` VALUES ('22', '文章分类', '21', '/category/index', '1', null);
INSERT INTO `menu` VALUES ('23', '文章列表', '21', '/article/index', '2', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(250) NOT NULL,
  `password_reset_token` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `auth_key` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(50) DEFAULT NULL,
  `updated_at` int(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2y$13$tqNgDX0pLjw15WAAhdahmOmjFZe4yTRJRcOSt.AMrNWtxTAvrDphu', 'g4d20BJJLXKbpmMBOFjBltVIFfe7pkhQ_1470838676', '775628993@qq.com', '95LsJKBlpX2vz-RLkg5j3pyfePG1bm0P', '10', '1470752082', '1470838676', '');
INSERT INTO `user` VALUES ('8', 'admin_test', '$2y$13$glnW6SJw2At/PecOrDit7.PThtdGcVyiDuzftkUbhnLB.TCBB9EuO', null, '2974730998@qq.com', 'jYQgYuMxkWhmktLCbQ38DwunEHJyg9_z', '10', '1470755960', '1470755960', '');
INSERT INTO `user` VALUES ('9', 'demo_test', '$2y$13$k5W0ZmG3ZYu4SEgEp63LQeEXDfG.1.57CMivXzVhscVTA3vjbt8AO', null, '12345678@qq.com', 'nxyzD8uuNpFRfIJxjmbzoyGwQyv715GL', '10', '1470839020', '1470839020', '');
