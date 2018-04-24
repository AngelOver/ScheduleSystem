/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.18 : Database - guns
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`guns` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guns`;

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` int(11) DEFAULT NULL COMMENT '父级id(备忘录归档)',
  `type` int(11) DEFAULT NULL COMMENT '便签类型(0 便签 1 文件夹)',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题(标题自动生成 前10个字)',
  `text` varchar(255) DEFAULT NULL COMMENT '便签',
  `is_show` int(11) DEFAULT NULL COMMENT '是否展示(0：否  1：是）',
  `is_top` int(11) DEFAULT NULL COMMENT '是否置顶(0：否  1：是）',
  `is_wait` int(11) DEFAULT NULL COMMENT '是否待办(0：否  1：是）',
  `wait_status` int(11) DEFAULT NULL COMMENT '代办状态(0：待办  1：完成)',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='便签表';

/*Data for the table `note` */

/*Table structure for table `plan` */

DROP TABLE IF EXISTS `plan`;

CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `remindtime` datetime DEFAULT NULL COMMENT '提醒时间',
  `remindtype` int(11) DEFAULT NULL COMMENT '提醒类型(0：准时  1：准时 2 自定义）',
  `importantstatus` int(11) DEFAULT NULL COMMENT '重要程度(A：重要 ，紧急   B：重要 ，不紧急  ）',
  `is_wholeday` int(11) DEFAULT NULL COMMENT '是否全天(0：否  1：是）',
  `is_repeat` int(11) DEFAULT NULL COMMENT '是否重复(0：否  1：是）',
  `repeatcount` int(11) DEFAULT NULL COMMENT '重复次数',
  `is_progress` int(11) DEFAULT NULL COMMENT '是否展示进度(0：否  1：是）',
  `nowprogress` varchar(45) DEFAULT NULL COMMENT '当前进度(当前重复次数)',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计划表';

/*Data for the table `plan` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`id`,`num`,`pid`,`pids`,`simplename`,`fullname`,`tips`,`version`) values (24,1,0,'[0],','总公司','总公司','',NULL),(25,2,24,'[0],[24],','开发部','开发部','',NULL),(26,3,24,'[0],[24],','运营部','运营部','',NULL),(27,4,24,'[0],[24],','战略部','战略部','',NULL),(28,2,0,'[0],','使用单位','使用单位','',NULL),(29,1,28,'[0],[28],','个人','个人','',NULL),(30,2,28,'[0],[28],','管理','管理','管理',NULL);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`num`,`pid`,`name`,`tips`) values (16,0,0,'状态',NULL),(17,1,16,'启用',NULL),(18,2,16,'禁用',NULL),(29,0,0,'性别',NULL),(30,1,29,'男',NULL),(31,2,29,'女',NULL),(35,0,0,'账号状态',NULL),(36,1,35,'启用',NULL),(37,2,35,'冻结',NULL),(38,3,35,'已删除',NULL),(43,0,0,'是否',NULL),(44,0,43,'否',NULL),(45,1,43,'是',NULL),(46,0,0,'代办状态',NULL),(47,0,46,'待办',NULL),(48,1,46,'完成',NULL),(49,0,0,'提醒类型',NULL),(50,0,49,'准时',NULL),(51,1,49,'提前10分钟',NULL),(52,2,49,'提前30分钟',NULL),(53,3,49,'提前1小时',NULL),(54,5,49,'自定义',NULL),(55,0,0,'重要程度',NULL),(56,1,55,'重要 ，紧急 ',NULL),(57,2,55,'重要 ，不紧急 ',NULL),(58,3,55,'重要 ，不紧急 ',NULL),(59,4,55,'不重要 ，不紧急 ',NULL),(60,0,0,'便签类型',NULL),(61,0,60,'便签',NULL),(62,1,60,'文件夹',NULL);

/*Table structure for table `sys_expense` */

DROP TABLE IF EXISTS `sys_expense`;

CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

/*Data for the table `sys_expense` */

/*Table structure for table `sys_login_log` */

DROP TABLE IF EXISTS `sys_login_log`;

CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='登录记录';

/*Data for the table `sys_login_log` */

insert  into `sys_login_log`(`id`,`logname`,`userid`,`createtime`,`succeed`,`message`,`ip`) values (216,'登录日志',1,'2018-04-23 16:40:59','成功',NULL,'0:0:0:0:0:0:0:1'),(217,'退出日志',1,'2018-04-23 17:18:17','成功',NULL,'0:0:0:0:0:0:0:1'),(218,'登录日志',1,'2018-04-23 17:34:21','成功',NULL,'0:0:0:0:0:0:0:1'),(219,'退出日志',1,'2018-04-23 18:03:36','成功',NULL,'0:0:0:0:0:0:0:1'),(220,'登录日志',48,'2018-04-23 18:03:45','成功',NULL,'0:0:0:0:0:0:0:1'),(221,'退出日志',48,'2018-04-23 18:04:23','成功',NULL,'0:0:0:0:0:0:0:1'),(222,'登录日志',47,'2018-04-23 18:04:31','成功',NULL,'0:0:0:0:0:0:0:1'),(223,'退出日志',47,'2018-04-23 18:04:38','成功',NULL,'0:0:0:0:0:0:0:1'),(224,'登录日志',1,'2018-04-23 18:04:43','成功',NULL,'0:0:0:0:0:0:0:1'),(225,'退出日志',1,'2018-04-23 18:04:55','成功',NULL,'0:0:0:0:0:0:0:1'),(226,'登录日志',1,'2018-04-23 18:04:59','成功',NULL,'0:0:0:0:0:0:0:1'),(227,'登录日志',1,'2018-04-23 18:22:08','成功',NULL,'0:0:0:0:0:0:0:1'),(228,'登录日志',1,'2018-04-23 18:25:58','成功',NULL,'0:0:0:0:0:0:0:1'),(229,'登录日志',1,'2018-04-23 18:29:37','成功',NULL,'0:0:0:0:0:0:0:1'),(230,'登录日志',1,'2018-04-23 18:33:50','成功',NULL,'0:0:0:0:0:0:0:1'),(231,'登录日志',1,'2018-04-23 18:38:41','成功',NULL,'0:0:0:0:0:0:0:1'),(232,'登录日志',1,'2018-04-23 18:41:07','成功',NULL,'0:0:0:0:0:0:0:1'),(233,'登录日志',1,'2018-04-23 18:58:43','成功',NULL,'0:0:0:0:0:0:0:1'),(234,'退出日志',1,'2018-04-23 18:59:28','成功',NULL,'0:0:0:0:0:0:0:1'),(235,'登录日志',1,'2018-04-23 20:23:41','成功',NULL,'0:0:0:0:0:0:0:1'),(236,'登录日志',1,'2018-04-23 20:36:00','成功',NULL,'0:0:0:0:0:0:0:1'),(237,'登录日志',1,'2018-04-24 09:07:08','成功',NULL,'0:0:0:0:0:0:0:1'),(238,'登录日志',1,'2018-04-24 10:13:25','成功',NULL,'0:0:0:0:0:0:0:1'),(239,'登录日志',1,'2018-04-24 10:26:50','成功',NULL,'0:0:0:0:0:0:0:1'),(240,'登录日志',1,'2018-04-24 10:38:57','成功',NULL,'0:0:0:0:0:0:0:1'),(241,'登录日志',1,'2018-04-24 10:41:39','成功',NULL,'0:0:0:0:0:0:0:1'),(242,'登录日志',1,'2018-04-24 10:49:41','成功',NULL,'0:0:0:0:0:0:0:1'),(243,'登录日志',1,'2018-04-24 11:46:22','成功',NULL,'0:0:0:0:0:0:0:1'),(244,'登录日志',1,'2018-04-24 13:48:40','成功',NULL,'0:0:0:0:0:0:0:1'),(245,'登录日志',1,'2018-04-24 15:18:42','成功',NULL,'0:0:0:0:0:0:0:1'),(246,'登录日志',1,'2018-04-24 15:32:12','成功',NULL,'0:0:0:0:0:0:0:1'),(247,'退出日志',1,'2018-04-24 15:32:34','成功',NULL,'0:0:0:0:0:0:0:1'),(248,'登录日志',1,'2018-04-24 15:59:40','成功',NULL,'0:0:0:0:0:0:0:1'),(249,'登录日志',1,'2018-04-24 16:10:53','成功',NULL,'0:0:0:0:0:0:0:1'),(250,'登录日志',1,'2018-04-24 16:25:40','成功',NULL,'0:0:0:0:0:0:0:1'),(251,'登录日志',1,'2018-04-24 17:07:16','成功',NULL,'0:0:0:0:0:0:0:1'),(252,'登录日志',1,'2018-04-24 17:17:48','成功',NULL,'0:0:0:0:0:0:0:1'),(253,'登录日志',1,'2018-04-24 17:25:05','成功',NULL,'0:0:0:0:0:0:0:1'),(254,'登录日志',1,'2018-04-24 17:29:41','成功',NULL,'0:0:0:0:0:0:0:1'),(255,'登录日志',1,'2018-04-24 18:03:50','成功',NULL,'0:0:0:0:0:0:0:1'),(256,'登录日志',1,'2018-04-24 18:18:49','成功',NULL,'0:0:0:0:0:0:0:1'),(257,'登录日志',1,'2018-04-24 18:21:54','成功',NULL,'0:0:0:0:0:0:0:1'),(258,'登录日志',1,'2018-04-24 18:45:49','成功',NULL,'0:0:0:0:0:0:0:1'),(259,'登录日志',1,'2018-04-24 18:50:51','成功',NULL,'0:0:0:0:0:0:0:1'),(260,'登录日志',1,'2018-04-24 18:54:46','成功',NULL,'0:0:0:0:0:0:0:1'),(261,'登录日志',1,'2018-04-24 18:56:50','成功',NULL,'0:0:0:0:0:0:0:1');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`code`,`pcode`,`pcodes`,`name`,`icon`,`url`,`num`,`levels`,`ismenu`,`tips`,`status`,`isopen`) values (105,'system','guns','[0],[guns],','系统管理','fa-user','#',4,2,1,NULL,1,1),(106,'mgr','system','[0],[system],','用户管理','','/mgr',1,2,1,NULL,1,0),(107,'mgr_add','mgr','[0],[system],[mgr],','添加用户',NULL,'/mgr/add',1,3,0,NULL,1,0),(108,'mgr_edit','mgr','[0],[system],[mgr],','修改用户',NULL,'/mgr/edit',2,3,0,NULL,1,0),(109,'mgr_delete','mgr','[0],[system],[mgr],','删除用户',NULL,'/mgr/delete',3,3,0,NULL,1,0),(110,'mgr_reset','mgr','[0],[system],[mgr],','重置密码',NULL,'/mgr/reset',4,3,0,NULL,1,0),(111,'mgr_freeze','mgr','[0],[system],[mgr],','冻结用户',NULL,'/mgr/freeze',5,3,0,NULL,1,0),(112,'mgr_unfreeze','mgr','[0],[system],[mgr],','解除冻结用户',NULL,'/mgr/unfreeze',6,3,0,NULL,1,0),(113,'mgr_setRole','mgr','[0],[system],[mgr],','分配角色',NULL,'/mgr/setRole',7,3,0,NULL,1,0),(114,'role','system','[0],[system],','角色管理',NULL,'/role',2,2,1,NULL,1,0),(115,'role_add','role','[0],[system],[role],','添加角色',NULL,'/role/add',1,3,0,NULL,1,0),(116,'role_edit','role','[0],[system],[role],','修改角色',NULL,'/role/edit',2,3,0,NULL,1,0),(117,'role_remove','role','[0],[system],[role],','删除角色',NULL,'/role/remove',3,3,0,NULL,1,0),(118,'role_setAuthority','role','[0],[system],[role],','配置权限',NULL,'/role/setAuthority',4,3,0,NULL,1,0),(119,'menu','system','[0],[system],','菜单管理',NULL,'/menu',4,2,1,NULL,1,0),(120,'menu_add','menu','[0],[system],[menu],','添加菜单',NULL,'/menu/add',1,3,0,NULL,1,0),(121,'menu_edit','menu','[0],[system],[menu],','修改菜单',NULL,'/menu/edit',2,3,0,NULL,1,0),(122,'menu_remove','menu','[0],[system],[menu],','删除菜单',NULL,'/menu/remove',3,3,0,NULL,1,0),(128,'log','system','[0],[system],','业务日志',NULL,'/log',6,2,1,NULL,1,0),(130,'druid','system','[0],[system],','监控管理',NULL,'/druid',7,2,1,NULL,1,NULL),(131,'dept','system','[0],[system],','部门管理',NULL,'/dept',3,2,1,NULL,1,NULL),(132,'dict','system','[0],[system],','字典管理',NULL,'/dict',4,2,1,NULL,1,NULL),(133,'loginLog','system','[0],[system],','登录日志',NULL,'/loginLog',6,2,1,NULL,1,NULL),(134,'log_clean','log','[0],[system],[log],','清空日志',NULL,'/log/delLog',3,3,0,NULL,1,NULL),(135,'dept_add','dept','[0],[system],[dept],','添加部门',NULL,'/dept/add',1,3,0,NULL,1,NULL),(136,'dept_update','dept','[0],[system],[dept],','修改部门',NULL,'/dept/update',1,3,0,NULL,1,NULL),(137,'dept_delete','dept','[0],[system],[dept],','删除部门',NULL,'/dept/delete',1,3,0,NULL,1,NULL),(138,'dict_add','dict','[0],[system],[dict],','添加字典',NULL,'/dict/add',1,3,0,NULL,1,NULL),(139,'dict_update','dict','[0],[system],[dict],','修改字典',NULL,'/dict/update',1,3,0,NULL,1,NULL),(140,'dict_delete','dict','[0],[system],[dict],','删除字典',NULL,'/dict/delete',1,3,0,NULL,1,NULL),(141,'notice','system','[0],[system],','通知管理',NULL,'/notice',9,2,1,NULL,1,NULL),(142,'notice_add','notice','[0],[system],[notice],','添加通知',NULL,'/notice/add',1,3,0,NULL,1,NULL),(143,'notice_update','notice','[0],[system],[notice],','修改通知',NULL,'/notice/update',2,3,0,NULL,1,NULL),(144,'notice_delete','notice','[0],[system],[notice],','删除通知',NULL,'/notice/delete',3,3,0,NULL,1,NULL),(145,'hello','guns','[0],[guns],','通知','fa-rocket','/notice/hello',1,2,1,NULL,1,NULL),(148,'code','guns','[0],[guns],','代码生成','fa-code','/code',3,2,1,NULL,1,NULL),(149,'api_mgr','guns','[0],[guns],','接口文档','fa-leaf','/swagger-ui.html',2,2,1,NULL,1,NULL),(150,'to_menu_edit','menu','[0],[system],[menu],','菜单编辑跳转','','/menu/menu_edit',4,3,0,NULL,1,NULL),(151,'menu_list','menu','[0],[system],[menu],','菜单列表','','/menu/list',5,3,0,NULL,1,NULL),(152,'to_dept_update','dept','[0],[system],[dept],','修改部门跳转','','/dept/dept_update',4,3,0,NULL,1,NULL),(153,'dept_list','dept','[0],[system],[dept],','部门列表','','/dept/list',5,3,0,NULL,1,NULL),(154,'dept_detail','dept','[0],[system],[dept],','部门详情','','/dept/detail',6,3,0,NULL,1,NULL),(155,'to_dict_edit','dict','[0],[system],[dict],','修改菜单跳转','','/dict/dict_edit',4,3,0,NULL,1,NULL),(156,'dict_list','dict','[0],[system],[dict],','字典列表','','/dict/list',5,3,0,NULL,1,NULL),(157,'dict_detail','dict','[0],[system],[dict],','字典详情','','/dict/detail',6,3,0,NULL,1,NULL),(158,'log_list','log','[0],[system],[log],','日志列表','','/log/list',2,3,0,NULL,1,NULL),(159,'log_detail','log','[0],[system],[log],','日志详情','','/log/detail',3,3,0,NULL,1,NULL),(160,'del_login_log','loginLog','[0],[system],[loginLog],','清空登录日志','','/loginLog/delLoginLog',1,3,0,NULL,1,NULL),(161,'login_log_list','loginLog','[0],[system],[loginLog],','登录日志列表','','/loginLog/list',2,3,0,NULL,1,NULL),(162,'to_role_edit','role','[0],[system],[role],','修改角色跳转','','/role/role_edit',5,3,0,NULL,1,NULL),(163,'to_role_assign','role','[0],[system],[role],','角色分配跳转','','/role/role_assign',6,3,0,NULL,1,NULL),(164,'role_list','role','[0],[system],[role],','角色列表','','/role/list',7,3,0,NULL,1,NULL),(165,'to_assign_role','mgr','[0],[system],[mgr],','分配角色跳转','','/mgr/role_assign',8,3,0,NULL,1,NULL),(166,'to_user_edit','mgr','[0],[system],[mgr],','编辑用户跳转','','/mgr/user_edit',9,3,0,NULL,1,NULL),(167,'mgr_list','mgr','[0],[system],[mgr],','用户列表','','/mgr/list',10,3,0,NULL,1,NULL),(168,'expense','guns','[0],[guns],','报销管理','fa-clone','#',5,2,1,NULL,1,NULL),(169,'expense_fill','expense','[0],[expense],','报销申请','','/expense',1,2,1,NULL,1,NULL),(170,'expense_progress','expense','[0],[expense],','报销审批','','/process',2,2,1,NULL,1,NULL),(171,'guns','0','[0],','guns系统','fa-user','#',1,1,1,NULL,1,NULL),(172,'user','0','[0],','个人信息管理','fa-user','#',2,1,1,NULL,1,NULL),(173,'user_info_update','user','[0],[user],','修改个人信息','','/mgr/user_info',1,2,1,NULL,1,NULL),(174,'user_pwd_update','user','[0],[user],','修改密码','','/mgr/user_chpwd',2,2,1,NULL,1,NULL),(175,'schedules','0','[0],','日程管理','fa-user','#',3,1,1,NULL,1,NULL),(177,'schedulesSystem','0','[0],','系统管理','fa-user','#',5,1,1,NULL,1,NULL),(178,'aboutSchedules','schedulesSystem','[0],[schedulesSystem],','关于系统','','/schedulesSystem/sss',1,2,1,NULL,1,NULL),(179,'sys_setup','schedulesSystem','[0],[schedulesSystem],','组织机构管理','','/schedulesSystem/sss',2,2,1,NULL,1,NULL),(180,'ordinary_user','0','[0],','用户管理','fa-user','#',4,1,1,NULL,1,NULL),(181,'ordinary_user_list','ordinary_user','[0],[ordinary_user],','用户列表','','/userList',1,2,1,NULL,1,NULL),(185,'setup','schedulesSystem','[0],[schedulesSystem],','组织机构','','/setup',99,2,1,NULL,1,0),(186,'setup_list','setup','[0],[guns],[system],[setup],','组织机构列表','','/setup/list',99,3,0,NULL,1,0),(187,'setup_add','setup','[0],[guns],[system],[setup],','组织机构添加','','/setup/add',99,3,0,NULL,1,0),(188,'setup_update','setup','[0],[guns],[system],[setup],','组织机构更新','','/setup/update',99,3,0,NULL,1,0),(189,'setup_delete','setup','[0],[guns],[system],[setup],','组织机构删除','','/setup/delete',99,3,0,NULL,1,0),(190,'setup_detail','setup','[0],[guns],[system],[setup],','组织机构详情','','/setup/detail',99,3,0,NULL,1,0),(192,'note','schedules','[0],[schedules],','便签管理','','/note',99,2,1,NULL,1,0),(193,'note_list','note','[0],[schedules],[note],','便签管理列表','','/note/list',99,3,0,NULL,1,0),(194,'note_add','note','[0],[schedules],[note],','便签管理添加','','/note/add',99,3,0,NULL,1,0),(195,'note_update','note','[0],[schedules],[note],','便签管理更新','','/note/update',99,3,0,NULL,1,0),(196,'note_delete','note','[0],[schedules],[note],','便签管理删除','','/note/delete',99,3,0,NULL,1,0),(197,'note_detail','note','[0],[schedules],[note],','便签管理详情','','/note/detail',99,3,0,NULL,1,0),(201,'plan','schedules','[0],[schedules],','计划管理','','/plan',99,2,1,NULL,1,0),(202,'plan_list','plan','[0],[schedules],[plan],','计划管理列表','','/plan/list',99,3,0,NULL,1,0),(203,'plan_add','plan','[0],[schedules],[plan],','计划管理添加','','/plan/add',99,3,0,NULL,1,0),(204,'plan_update','plan','[0],[schedules],[plan],','计划管理更新','','/plan/update',99,3,0,NULL,1,0),(205,'plan_delete','plan','[0],[schedules],[plan],','计划管理删除','','/plan/delete',99,3,0,NULL,1,0),(206,'plan_detail','plan','[0],[schedules],[plan],','计划管理详情','','/plan/detail',99,3,0,NULL,1,0);

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='通知表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`id`,`title`,`type`,`content`,`createtime`,`creater`) values (12,'专属链接',NULL,'<h3><strong style=\"color: inherit;\">您的专属链接：</strong><a href=\"http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">&nbsp;http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i&nbsp;</a><span style=\"color: inherit;\">(请收藏此链接，无需再登录到这里)</span></h3><p><br></p>','2018-04-23 17:40:39',1),(13,'重置专属链接',NULL,'<p>重置专属链接：&nbsp;<br>如果您的链接已经泄露，<span onclick=\"urlreset()\" style=\"\">点击</span><a href=\"www\" target=\"_blank\" style=\"\">这里</a>&nbsp;重新生成新的专属链接（旧链接将立即失效！请三思！但数据是不会丢的~）&nbsp;&nbsp;<br></p><p><br></p>','2018-04-23 17:41:19',1),(14,'最重要提醒',NULL,'<p><strong>最重要提醒：</strong>&nbsp;<br>专属链接是识别您身份的唯一途径，为了您的数据安全，请一定不要公开您的专属链接给他人！切记、切记、切记！&nbsp;&nbsp;<br></p>','2018-04-23 17:42:25',1);

/*Table structure for table `sys_operation_log` */

DROP TABLE IF EXISTS `sys_operation_log`;

CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8 COMMENT='操作日志';

/*Data for the table `sys_operation_log` */

insert  into `sys_operation_log`(`id`,`logtype`,`logname`,`userid`,`classname`,`method`,`createtime`,`succeed`,`message`) values (550,'业务日志','修改管理员',1,'com.stylefeng.guns.modular.system.controller.UserMgrController','edit','2018-04-23 16:41:20','成功','账号=admin;;;字段名称:头像,旧值:girl.gif,新值:a7ca2a81-9856-426d-a7cc-7b1f092c37c0.jpg'),(551,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:43:16','成功','菜单名称=guns系统'),(552,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:43:39','成功','菜单名称=系统管理;;;字段名称:菜单父编号,旧值:0,新值:171'),(553,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:43:53','成功','菜单名称=guns系统;;;字段名称:菜单图标,旧值:,新值:fa-user'),(554,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:44:13','成功','菜单名称=通知;;;字段名称:菜单父编号,旧值:0,新值:171'),(555,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:44:25','成功','菜单名称=代码生成;;;字段名称:菜单父编号,旧值:0,新值:171'),(556,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:44:31','成功','菜单名称=接口文档;;;字段名称:菜单父编号,旧值:0,新值:171'),(557,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:44:37','成功','菜单名称=报销管理;;;字段名称:菜单父编号,旧值:0,新值:171'),(558,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 16:45:02','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批'),(559,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 16:45:14','成功','角色名称=临时,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知'),(560,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:46:29','成功','菜单名称=个人信息管理'),(561,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:47:27','成功','菜单名称=修改个人信息'),(562,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:48:04','成功','菜单名称=修改密码'),(563,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 16:48:16','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批,个人信息管理,修改个人信息,修改密码'),(564,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 16:48:20','成功','角色名称=临时,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,个人信息管理,修改个人信息,修改密码'),(565,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:50:19','成功','菜单名称=修改个人信息;;;'),(566,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:50:28','成功','菜单名称=修改密码;;;'),(567,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:51:00','成功','菜单名称=个人信息管理;;;字段名称:菜单排序号,旧值:1,新值:2'),(568,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:53:11','成功','菜单名称=修改个人信息;;;字段名称:null,旧值:0,新值:1'),(569,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:53:19','成功','菜单名称=修改密码;;;字段名称:null,旧值:0,新值:1'),(570,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:53:56','成功','菜单名称=修改个人信息;;;字段名称:url地址,旧值:#,新值:/user/updtaeUser'),(571,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 16:54:13','成功','菜单名称=修改密码;;;字段名称:url地址,旧值:#,新值:/user/updatePwd'),(572,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:57:45','成功','菜单名称=日程管理'),(573,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:58:51','成功','菜单名称=计划管理'),(574,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 16:59:50','成功','菜单名称=系统管理'),(575,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 17:00:39','成功','菜单名称=关于系统'),(576,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 17:01:39','成功','菜单名称=组织机构'),(577,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 17:01:49','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批,个人信息管理,修改个人信息,修改密码,日程管理,计划管理,系统管理,关于系统,组织机构'),(578,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 17:01:55','成功','角色名称=临时,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,个人信息管理,修改个人信息,修改密码,日程管理,计划管理,系统管理,关于系统,组织机构'),(579,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:35:42','成功','标题=最重要提醒'),(580,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:36:21','成功','标题=专属链接'),(581,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:37:14','成功','标题=重置链接'),(582,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 17:37:59','成功','标题=最重要提醒;;;字段名称:内容,旧值:<h3><strong>最重要提醒：</strong></h3><p><span style=\"color: inherit;\">专属链接是识别您身份的唯一途径，为了您的数据安全，请一定不要公开您的专属链接给他人！切记、切记、切记！</span>&nbsp;&nbsp;&nbsp;</p>,新值:<h3><strong>最重要提醒：</strong></h3><p><span style=\"color: inherit;\">专属链接是识别您身份的唯一途径，为了您的数据安全，请一定不要公开您的专属链接给他人！切记、切记、切记！</span>&nbsp;&nbsp;&nbsp;</p><p><br></p>'),(583,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 17:39:06','成功','标题=重置链接1;;;字段名称:标题,旧值:重置链接,新值:重置链接1;;;字段名称:内容,旧值:<p><strong>重置专属链接(仅高级账户可用)：</strong>&nbsp;<br>如果您的链接已经泄露，<span onclick=\"urlreset()\">点击</span><a href=\"www.baidu.com\" target=\"_blank\">这里</a>&nbsp;重新生成新的专属链接（旧链接将立即失效！请三思！但数据是不会丢的~）&nbsp;&nbsp;<br></p>,新值:<p><strong>重置专属链接(仅高级账户可用)：</strong>&nbsp;<br>如果您的链接已经泄露，<span onclick=\"urlreset()\">点击</span><a href=\"www.baidu.com\" target=\"_blank\">这里</a>&nbsp;重新生成新的专属链接（旧链接将立即失效！请三思！但数据是不会丢的~）&nbsp;&nbsp;<br></p><p><br></p>'),(584,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 17:39:09','成功','标题=专属链接1;;;字段名称:标题,旧值:专属链接,新值:专属链接1;;;字段名称:内容,旧值:<p><strong>您的专属链接：</strong><a href=\"http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i\" target=\"_blank\">http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i</a>(请收藏此链接，无需再登录到这里)&nbsp;&nbsp;<br></p>,新值:<p><strong>您的专属链接：</strong><a href=\"http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i\" target=\"_blank\">http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i</a>(请收藏此链接，无需再登录到这里)&nbsp;&nbsp;<br></p><p><br></p>'),(585,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 17:39:14','成功','标题=最重要提醒1;;;字段名称:标题,旧值:最重要提醒,新值:最重要提醒1'),(586,'业务日志','删除通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','delete','2018-04-23 17:39:58','成功','null=11'),(587,'业务日志','删除通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','delete','2018-04-23 17:40:01','成功','null=10'),(588,'业务日志','删除通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','delete','2018-04-23 17:40:04','成功','null=9'),(589,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:40:39','成功','标题=专属链接'),(590,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:41:19','成功','标题=重置专属链接'),(591,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 17:42:08','成功','标题=重置专属链接;;;字段名称:内容,旧值:<p><strong>重置专属链接：</strong>&nbsp;<br>如果您的链接已经泄露，<span onclick=\"urlreset()\">点击</span><a href=\"www\" target=\"_blank\">这里</a>&nbsp;重新生成新的专属链接（旧链接将立即失效！请三思！但数据是不会丢的~）&nbsp;&nbsp;<br></p>,新值:<p>重置专属链接：&nbsp;<br>如果您的链接已经泄露，<span onclick=\"urlreset()\" style=\"\">点击</span><a href=\"www\" target=\"_blank\" style=\"\">这里</a>&nbsp;重新生成新的专属链接（旧链接将立即失效！请三思！但数据是不会丢的~）&nbsp;&nbsp;<br></p><p><br></p>'),(592,'业务日志','新增通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','add','2018-04-23 17:42:25','成功','标题=最重要提醒'),(593,'业务日志','删除通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','delete','2018-04-23 17:48:57','成功','null=8'),(594,'业务日志','删除通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','delete','2018-04-23 17:49:00','成功','null=6'),(595,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 17:50:05','成功','菜单名称=日程管理;;;字段名称:菜单图标,旧值:,新值:fa-user'),(596,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 17:50:13','成功','菜单名称=系统管理;;;字段名称:菜单图标,旧值:,新值:fa-user'),(597,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 17:52:26','成功','菜单名称=用户管理'),(598,'业务日志','菜单新增',1,'com.stylefeng.guns.modular.system.controller.MenuController','add','2018-04-23 17:53:38','成功','菜单名称=用户列表'),(599,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 17:53:47','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批,个人信息管理,修改个人信息,修改密码,日程管理,计划管理,系统管理,关于系统,组织机构,用户管理,用户列表'),(600,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-23 17:55:03','成功','菜单名称=系统管理;;;字段名称:菜单排序号,旧值:4,新值:5'),(601,'业务日志','添加部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','add','2018-04-23 17:57:13','成功','部门简称=普通用户'),(602,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-23 17:57:59','成功','部门简称=使用者;;;字段名称:部门简称,旧值:普通用户,新值:使用者;;;字段名称:部门全称,旧值:普通用户,新值:使用者;;;字段名称:备注,旧值:普通用户,新值:使用者'),(603,'业务日志','添加部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','add','2018-04-23 17:58:22','成功','部门简称=个人用户'),(604,'业务日志','添加部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','add','2018-04-23 17:58:53','成功','部门简称=管理员'),(605,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-23 17:58:57','成功','部门简称=管理员;;;'),(606,'业务日志','添加角色',1,'com.stylefeng.guns.modular.system.controller.RoleController','add','2018-04-23 17:59:35','成功','角色名称=个人用户'),(607,'业务日志','添加角色',1,'com.stylefeng.guns.modular.system.controller.RoleController','add','2018-04-23 18:00:08','成功','角色名称=管理员'),(608,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 18:00:21','成功','角色名称=个人用户,资源名称=个人信息管理,修改个人信息,修改密码,日程管理,计划管理'),(609,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-23 18:00:53','成功','角色名称=管理员,资源名称=个人信息管理,修改个人信息,修改密码,日程管理,计划管理,系统管理,关于系统,组织机构,用户管理,用户列表'),(610,'业务日志','删除角色',1,'com.stylefeng.guns.modular.system.controller.RoleController','remove','2018-04-23 18:01:03','成功','角色名称='),(611,'业务日志','添加管理员',1,'com.stylefeng.guns.modular.system.controller.UserMgrController','add','2018-04-23 18:02:53','成功','账号=sys_admin'),(612,'业务日志','分配角色',1,'com.stylefeng.guns.modular.system.controller.UserMgrController','setRole','2018-04-23 18:03:02','成功','账号=sys_admin,角色名称集合=管理员'),(613,'业务日志','添加管理员',1,'com.stylefeng.guns.modular.system.controller.UserMgrController','add','2018-04-23 18:03:24','成功','账号=sys_user'),(614,'业务日志','分配角色',1,'com.stylefeng.guns.modular.system.controller.UserMgrController','setRole','2018-04-23 18:03:33','成功','账号=sys_user,角色名称集合=个人用户'),(615,'业务日志','修改通知',1,'com.stylefeng.guns.modular.system.controller.NoticeController','update','2018-04-23 18:52:28','成功','标题=专属链接;;;字段名称:内容,旧值:<h3><strong>重</strong><strong style=\"color: inherit;\">您的专属链接：</strong><a href=\"http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">&nbsp;http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i&nbsp;</a><span style=\"color: inherit;\">(请收藏此链接，无需再登录到这里)</span></h3><p><br></p>,新值:<h3><strong style=\"color: inherit;\">您的专属链接：</strong><a href=\"http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">&nbsp;http://gtd.gogojie.com/?host=GQlRaBo3lfGVh16i&nbsp;</a><span style=\"color: inherit;\">(请收藏此链接，无需再登录到这里)</span></h3><p><br></p>'),(616,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 09:53:06','成功','菜单名称=修改密码;;;字段名称:url地址,旧值:/user/updatePwd,新值:/system/user/user_chpwd'),(617,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 09:54:24','成功','菜单名称=修改密码;;;字段名称:url地址,旧值:/system/user/user_chpwd,新值:/mgr/changePwd'),(618,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 09:54:40','成功','菜单名称=修改个人信息;;;字段名称:url地址,旧值:/user/updtaeUser,新值:/mgr/user_info'),(619,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 09:56:44','成功','菜单名称=修改密码;;;字段名称:url地址,旧值:/mgr/changePwd,新值:/mgr/user_chpwd'),(620,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-24 10:27:28','成功','部门简称=使用单位;;;字段名称:部门简称,旧值:使用者,新值:使用单位;;;字段名称:部门全称,旧值:使用者,新值:使用单位;;;字段名称:备注,旧值:使用者,新值:'),(621,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-24 10:28:02','成功','部门简称=使用单位;;;'),(622,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-24 10:28:21','成功','部门简称=个人;;;字段名称:部门简称,旧值:个人用户,新值:个人;;;字段名称:部门全称,旧值:个人用户,新值:个人;;;字段名称:备注,旧值:个人用户,新值:'),(623,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-24 10:28:42','成功','部门简称=管理员;;;'),(624,'业务日志','修改部门',1,'com.stylefeng.guns.modular.system.controller.DeptController','update','2018-04-24 10:29:01','成功','部门简称=管理;;;字段名称:部门简称,旧值:管理员,新值:管理;;;字段名称:部门全称,旧值:管理员,新值:管理;;;字段名称:备注,旧值:管理员,新值:管理'),(625,'异常日志','',1,NULL,NULL,'2018-04-24 15:21:55','失败','com.stylefeng.guns.core.exception.GunsException: 字典的值必须为数字\r\n	at com.stylefeng.guns.modular.system.service.impl.DictServiceImpl.addDict(DictServiceImpl.java:55)\r\n	at com.stylefeng.guns.modular.system.service.impl.DictServiceImplTTFastClassBySpringCGLIBTT74491abc.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptorT1.proceedWithInvocation(TransactionInterceptor.java:99)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:282)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:96)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\r\n	at com.stylefeng.guns.modular.system.service.impl.DictServiceImplTTEnhancerBySpringCGLIBTT2625a3ed.addDict(<generated>)\r\n	at com.stylefeng.guns.modular.system.controller.DictController.add(DictController.java:86)\r\n	at com.stylefeng.guns.modular.system.controller.DictControllerTTFastClassBySpringCGLIBTT76f61b2.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:738)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:157)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.GeneratedMethodAccessor108.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\r\n	at com.stylefeng.guns.core.aop.LogAop.recordSysLog(LogAop.java:45)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:85)\r\n	at com.stylefeng.guns.core.aop.PermissionAop.doPermission(PermissionAop.java:62)\r\n	at sun.reflect.GeneratedMethodAccessor158.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:629)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:618)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:168)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:179)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:673)\r\n	at com.stylefeng.guns.modular.system.controller.DictControllerTTEnhancerBySpringCGLIBTT531ac461.add(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:133)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:97)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:827)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:738)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:85)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:967)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:901)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:872)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:108)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:868)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n'),(626,'业务日志','添加字典记录',1,'com.stylefeng.guns.modular.system.controller.DictController','add','2018-04-24 15:22:42','成功','字典名称=是否置顶,字典内容=0:否;1:是;'),(627,'业务日志','修改字典',1,'com.stylefeng.guns.modular.system.controller.DictController','update','2018-04-24 15:23:12','成功','字典名称=是否,字典内容=0:否;1:是;;;;'),(628,'业务日志','添加字典记录',1,'com.stylefeng.guns.modular.system.controller.DictController','add','2018-04-24 15:23:48','成功','字典名称=代办状态,字典内容=0:待办;1:完成;'),(629,'业务日志','添加字典记录',1,'com.stylefeng.guns.modular.system.controller.DictController','add','2018-04-24 15:25:33','成功','字典名称=提醒类型,字典内容=0:准时;1:提前10分钟;2:提前30分钟;3:提前1小时;5:自定义;'),(630,'业务日志','添加字典记录',1,'com.stylefeng.guns.modular.system.controller.DictController','add','2018-04-24 15:26:53','成功','字典名称=重要程度,字典内容=1:重要 ，紧急 ;2:重要 ，不紧急 ;3:重要 ，不紧急 ;4:不重要 ，不紧急 ;'),(631,'业务日志','添加字典记录',1,'com.stylefeng.guns.modular.system.controller.DictController','add','2018-04-24 15:28:10','成功','字典名称=便签类型,字典内容=0:便签;1:文件夹;'),(632,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:08:06','成功','菜单名称=关于系统;;;字段名称:菜单编号,旧值:abouSchedules,新值:aboutSchedules'),(633,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:08:37','成功','菜单名称=组织机构;;;字段名称:菜单编号,旧值:aboutSystem,新值:sys_setup'),(634,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:09:11','成功','菜单名称=用户列表;;;字段名称:菜单编号,旧值:userList,新值:ordinary_user_list'),(635,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:11:00','成功','菜单名称=组织机构管理;;;字段名称:菜单名称,旧值:组织机构,新值:组织机构管理'),(636,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:15:30','成功','菜单名称=组织机构;;;字段名称:菜单父编号,旧值:105,新值:177'),(637,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-24 17:16:01','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批,个人信息管理,修改个人信息,修改密码,日程管理,计划管理,系统管理,关于系统,组织机构管理,组织机构,组织机构列表,组织机构添加,组织机构更新,组织机构删除,组织机构详情,用户管理,用户列表'),(638,'业务日志','修改菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','edit','2018-04-24 17:22:17','成功','菜单名称=个人计划管理;;;字段名称:菜单名称,旧值:计划管理,新值:个人计划管理'),(639,'业务日志','删除菜单',1,'com.stylefeng.guns.modular.system.controller.MenuController','remove','2018-04-24 17:25:28','成功','菜单id=176'),(640,'业务日志','配置权限',1,'com.stylefeng.guns.modular.system.controller.RoleController','setAuthority','2018-04-24 17:25:40','成功','角色名称=超级管理员,资源名称=guns系统,系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,报销管理,报销申请,报销审批,个人信息管理,修改个人信息,修改密码,日程管理,便签管理,便签管理列表,便签管理添加,便签管理更新,便签管理删除,便签管理详情,计划管理,计划管理列表,计划管理添加,计划管理更新,计划管理删除,计划管理详情,系统管理,关于系统,组织机构管理,组织机构,组织机构列表,组织机构添加,组织机构更新,组织机构删除,组织机构详情,用户管理,用户列表');

/*Table structure for table `sys_relation` */

DROP TABLE IF EXISTS `sys_relation`;

CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4340 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_relation` */

insert  into `sys_relation`(`id`,`menuid`,`roleid`) values (4164,172,6),(4165,173,6),(4166,174,6),(4167,175,6),(4169,172,7),(4170,173,7),(4171,174,7),(4172,175,7),(4174,177,7),(4175,178,7),(4176,179,7),(4177,180,7),(4178,181,7),(4254,171,1),(4255,105,1),(4256,106,1),(4257,107,1),(4258,108,1),(4259,109,1),(4260,110,1),(4261,111,1),(4262,112,1),(4263,113,1),(4264,165,1),(4265,166,1),(4266,167,1),(4267,114,1),(4268,115,1),(4269,116,1),(4270,117,1),(4271,118,1),(4272,162,1),(4273,163,1),(4274,164,1),(4275,119,1),(4276,120,1),(4277,121,1),(4278,122,1),(4279,150,1),(4280,151,1),(4281,128,1),(4282,134,1),(4283,158,1),(4284,159,1),(4285,130,1),(4286,131,1),(4287,135,1),(4288,136,1),(4289,137,1),(4290,152,1),(4291,153,1),(4292,154,1),(4293,132,1),(4294,138,1),(4295,139,1),(4296,140,1),(4297,155,1),(4298,156,1),(4299,157,1),(4300,133,1),(4301,160,1),(4302,161,1),(4303,141,1),(4304,142,1),(4305,143,1),(4306,144,1),(4307,145,1),(4308,148,1),(4309,149,1),(4310,168,1),(4311,169,1),(4312,170,1),(4313,172,1),(4314,173,1),(4315,174,1),(4316,175,1),(4317,192,1),(4318,193,1),(4319,194,1),(4320,195,1),(4321,196,1),(4322,197,1),(4323,201,1),(4324,202,1),(4325,203,1),(4326,204,1),(4327,205,1),(4328,206,1),(4329,177,1),(4330,178,1),(4331,179,1),(4332,185,1),(4333,186,1),(4334,187,1),(4335,188,1),(4336,189,1),(4337,190,1),(4338,180,1),(4339,181,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`num`,`pid`,`name`,`deptid`,`tips`,`version`) values (1,1,0,'超级管理员',24,'administrator',1),(6,2,0,'个人用户',29,'user',NULL),(7,3,0,'管理员',30,'sys_admin',NULL);

/*Table structure for table `sys_setup` */

DROP TABLE IF EXISTS `sys_setup`;

CREATE TABLE `sys_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `website_name` varchar(50) DEFAULT '' COMMENT '网站名称',
  `website_code` varchar(50) DEFAULT '' COMMENT '网站英文简称',
  `website_url` varchar(50) DEFAULT '' COMMENT '网站地址',
  `logo` varchar(100) DEFAULT '' COMMENT 'LOGO',
  `toptitle` varchar(50) DEFAULT NULL COMMENT '顶端标题',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键字',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `username` varchar(50) DEFAULT NULL COMMENT '主办方',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `hotline` varchar(50) DEFAULT NULL COMMENT '服务热线',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `about` varchar(255) DEFAULT NULL COMMENT '关于系统',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='组织机构';

/*Data for the table `sys_setup` */

insert  into `sys_setup`(`id`,`website_name`,`website_code`,`website_url`,`logo`,`toptitle`,`keyword`,`describe`,`username`,`tel`,`hotline`,`address`,`email`,`about`) values (1,'日程管理系统','SS','a3r.top','','日程管理','日程管理','毕业设计，基于mybatis的时间日程管理系统','张亮','17607121045','17607121045','武汉纺织大学','2424123787@qq.com','无'),(6,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`avatar`,`account`,`password`,`salt`,`name`,`birthday`,`sex`,`email`,`phone`,`roleid`,`deptid`,`status`,`createtime`,`version`) values (1,'a7ca2a81-9856-426d-a7cc-7b1f092c37c0.jpg','admin','be412b892087594f39bfd7dcaa2ddebe','8pgby','张三','2017-05-05 00:00:00',2,'sn93@qq.com','18200000000','1',27,1,'2016-01-29 08:49:53',25),(44,NULL,'test','45abb7879f6a8268f1ef600e6038ac73','ssts3','test','2017-05-01 00:00:00',1,'abc@123.com','','5',26,3,'2017-05-16 20:33:37',NULL),(45,NULL,'boss','71887a5ad666a18f709e1d4e693d5a35','1f7bf','老板','2017-12-04 00:00:00',1,'','','1',24,1,'2017-12-04 22:24:02',NULL),(46,NULL,'manager','b53cac62e7175637d4beb3b16b2f7915','j3cs9','经理','2017-12-04 00:00:00',1,'','','1',24,1,'2017-12-04 22:24:24',NULL),(47,NULL,'sys_admin','b455473e438e6c27290ed4c875b8d3c7','r8fkx','sys_admin','2018-04-23 00:00:00',1,'','','7',30,1,'2018-04-23 18:02:53',NULL),(48,NULL,'sys_user','3656d94c3533dfcb3f74fde5ea96de58','ik3l2','sys_user','2018-04-23 00:00:00',2,'','','6',29,1,'2018-04-23 18:03:23',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
