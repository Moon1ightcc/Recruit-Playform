/*
 Navicat Premium Data Transfer

 Source Server         : shake
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 03/11/2022 15:19:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (11, 'rct_company', '企业信息表', NULL, NULL, 'RctCompany', 'crud', 'com.ruoyi.recruit', 'recruit', 'company', '企业信息', 'Ayase', '0', '/', '{}', 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31', NULL);
INSERT INTO `gen_table` VALUES (15, 'rct_category', '岗位分类', NULL, NULL, 'RctCategory', 'crud', 'com.ruoyi.recruit', 'recruit', 'category', '岗位分类', 'Ayase', '0', '/', '{}', 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15', NULL);
INSERT INTO `gen_table` VALUES (16, 'rct_position', '招聘岗位', NULL, NULL, 'RctPosition', 'crud', 'com.ruoyi.recruit', 'recruit', 'position', '招聘岗位', 'Ayasae', '0', '/', '{\"parentMenuId\":\"2061\"}', 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25', NULL);
INSERT INTO `gen_table` VALUES (17, 'rct_delivery', '投递岗位信息', NULL, NULL, 'RctDelivery', 'crud', 'com.ruoyi.recruit', 'recruit', 'delivery', '简历投递信息', 'Ayase', '0', '/', '{\"parentMenuId\":\"2061\"}', 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55', NULL);
INSERT INTO `gen_table` VALUES (18, 'rct_resume', '简历信息', NULL, NULL, 'RctResume', 'crud', 'com.ruoyi.recruit', 'recruit', 'resume', '简历信息', 'Ayase', '0', '/', '{\"parentMenuId\":\"2061\"}', 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56', '主要负责管理求职用户生成的简历信息');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 265 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (55, '4', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (56, '4', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (57, '4', 'person_name', '用户姓名', 'varchar(30)', 'String', 'personName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (58, '4', 'education', '学历', 'bigint', 'Long', 'education', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_education_type', 4, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (59, '4', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (60, '4', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (61, '4', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'sys_user_sex', 7, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (62, '4', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (63, '4', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (64, '4', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'radio', 'sys_normal_disable', 10, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (65, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (66, '4', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (67, '4', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (68, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (69, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (70, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (71, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (72, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 18, 'admin', '2022-08-29 23:47:35', '', '2022-09-01 15:05:26');
INSERT INTO `gen_table_column` VALUES (118, '8', 'business_id', 'ID', 'bigint', 'Long', 'businessId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (119, '8', 'business_name', '公司名称', 'varchar(30)', 'String', 'businessName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (120, '8', 'business_address', '公司地址', 'varchar(100)', 'String', 'businessAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (121, '8', 'phonenumber', '联系电话', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (122, '8', 'business_logo', '公司LOGO', 'varchar(100)', 'String', 'businessLogo', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 5, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (123, '8', 'business_license', '营业执照', 'varchar(100)', 'String', 'businessLicense', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 6, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (124, '8', 'auditing_status', '审核状态（0未审核 1审核中 2审核成功 3审核失败）', 'char(1)', 'String', 'auditingStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_company_auditing', 7, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (125, '8', 'business_nature', '公司性质', 'varchar(20)', 'String', 'businessNature', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_company_nature', 8, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (126, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (127, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (128, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (129, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (130, '8', 'user_id', '所属用户ID', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', '', 13, 'admin', '2022-09-03 14:05:23', '', '2022-09-03 16:21:46');
INSERT INTO `gen_table_column` VALUES (131, '9', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (132, '9', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (133, '9', 'hr_name', '用户昵称', 'varchar(30)', 'String', 'hrName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (134, '9', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (135, '9', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (136, '9', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 6, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (137, '9', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (138, '9', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (139, '9', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_notice_status', 9, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (140, '9', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (141, '9', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (142, '9', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (143, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (144, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (145, '9', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (146, '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (147, '9', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2022-09-03 15:27:28', '', '2022-09-03 15:54:59');
INSERT INTO `gen_table_column` VALUES (167, '11', 'company_id', 'ID', 'bigint', 'Long', 'companyId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (168, '11', 'company_name', '公司名称', 'varchar(30)', 'String', 'companyName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (169, '11', 'company_address', '公司地址', 'varchar(100)', 'String', 'companyAddress', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (170, '11', 'phonenumber', '联系电话', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (171, '11', 'logo', '公司Logo', 'varchar(100)', 'String', 'logo', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 5, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (172, '11', 'license', '营业执照', 'varchar(100)', 'String', 'license', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'imageUpload', '', 6, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (173, '11', 'status', '审核状态（0未审核 1审核中 2审核成功 3审核失败）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_company_auditing', 7, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (174, '11', 'nature', '公司性质', 'varchar(20)', 'String', 'nature', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_company_nature', 8, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (175, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (176, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, '1', '1', 'LIKE', 'datetime', '', 12, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (177, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (178, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (179, '11', 'user_id', '所属用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-10-15 11:06:35', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (180, '11', 'remark', '公司描述', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, '', '2022-10-15 11:14:52', '', '2022-10-19 09:17:31');
INSERT INTO `gen_table_column` VALUES (219, '15', 'position_id', '岗位ID', 'bigint', 'Long', 'positionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (220, '15', 'position_name', '岗位名称', 'varchar(255)', 'String', 'positionName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (221, '15', 'parent_id', '父ID', 'int', 'Long', 'parentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (222, '15', 'description', '岗位描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (223, '15', 'create_time', '创建时间', 'varchar(255)', 'String', 'createTime', '0', '0', NULL, '0', NULL, '1', NULL, 'EQ', 'input', '', 5, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (224, '15', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-10-16 15:58:25', '', '2022-10-16 16:22:15');
INSERT INTO `gen_table_column` VALUES (225, '16', 'recruit_id', '招聘岗位id', 'bigint', 'Long', 'recruitId', '1', '1', NULL, '0', NULL, '1', '0', 'EQ', 'input', '', 1, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (226, '16', 'position_name', '招聘岗位名称', 'varchar(255)', 'String', 'positionName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (227, '16', 'requirement', '招聘要求', 'varchar(255)', 'String', 'requirement', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (228, '16', 'work_city', '工作城市', 'varchar(255)', 'String', 'workCity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (229, '16', 'phone', '联系电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (230, '16', 'start_time', '发布时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (231, '16', 'deadline', '截止时间', 'datetime', 'Date', 'deadline', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (232, '16', 'numbers', '招聘人数', 'int', 'Long', 'numbers', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (233, '16', 'max_salary', '最高薪资', 'decimal(20,2)', 'BigDecimal', 'maxSalary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (234, '16', 'min_salary', '最低薪资', 'decimal(20,2)', 'BigDecimal', 'minSalary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (235, '16', 'company_id', '公司id', 'bigint', 'Long', 'companyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (236, '16', 'status', '审核（0 通过、1 驳回）', 'char(2)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_recruit_type', 12, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (237, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:25');
INSERT INTO `gen_table_column` VALUES (238, '16', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-10-16 15:58:25', '', '2022-10-17 20:40:26');
INSERT INTO `gen_table_column` VALUES (239, '17', 'delivery_id', 'ID', 'bigint', 'Long', 'deliveryId', '1', '1', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (240, '17', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (241, '17', 'nick_name', '用户名称', 'varchar(255)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (242, '17', 'position_id', '岗位信息ID', 'bigint', 'Long', 'positionId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (243, '17', 'position_name', '岗位名称', 'varchar(255)', 'String', 'positionName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (244, '17', 'delivery_status', '投递状态', 'varchar(255)', 'String', 'deliveryStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'rct_delivery_status', 6, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (245, '17', 'company_id', '公司ID', 'bigint', 'Long', 'companyId', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (246, '17', 'company_name', '公司名称', 'varchar(255)', 'String', 'companyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (247, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, '1', '1', 'BETWEEN', 'datetime', '', 9, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (248, '17', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-10-17 16:41:02', '', '2022-10-17 19:45:55');
INSERT INTO `gen_table_column` VALUES (249, '18', 'resume_id', '简历ID', 'bigint', 'Long', 'resumeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (250, '18', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (252, '18', 'sex', '性别', 'char(2)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'select', 'rct_sex_type', 4, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (253, '18', 'health_status', '健康状态', 'varchar(255)', 'String', 'healthStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_health_status', 5, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (254, '18', 'job_intention', '求职意向', 'varchar(255)', 'String', 'jobIntention', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (255, '18', 'politics_status', '政治面貌', 'varchar(255)', 'String', 'politicsStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'rct_politics_type', 7, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (256, '18', 'education', '最高学历', 'varchar(255)', 'String', 'education', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'select', 'sys_education_type', 8, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (257, '18', 'birthday', '生日', 'datetime', 'Date', 'birthday', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 9, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (258, '18', 'major', '所学专业', 'varchar(255)', 'String', 'major', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (259, '18', 'present_address', '现居地', 'varchar(255)', 'String', 'presentAddress', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (260, '18', 'phone', '联系电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 12, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (261, '18', 'email', '邮箱', 'varchar(255)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (262, '18', 'award', '所获奖项', 'varchar(255)', 'String', 'award', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (263, '18', 'self_evaluation', '自我评价', 'varchar(255)', 'String', 'selfEvaluation', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (264, '18', 'resume_file', '简历附件', 'varchar(255)', 'String', 'resumeFile', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'fileUpload', '', 16, 'admin', '2022-10-18 09:31:39', '', '2022-10-18 14:20:56');
INSERT INTO `gen_table_column` VALUES (265, '18', 'nick_name', '用户姓名', 'varchar(255)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, '', '2022-10-18 10:41:27', '', '2022-10-18 14:20:56');

-- ----------------------------
-- Table structure for rct_category
-- ----------------------------
DROP TABLE IF EXISTS `rct_category`;
CREATE TABLE `rct_category`  (
  `position_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `parent_id` int NULL DEFAULT NULL COMMENT '父ID',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `level` int NULL DEFAULT NULL COMMENT '分类等级',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rct_category
-- ----------------------------
INSERT INTO `rct_category` VALUES (1, '后端开发', 0, '后端开发主要做的是逻辑功能等模块', '2022-10-16 14:02:33', '2022-10-16 14:06:04', NULL);
INSERT INTO `rct_category` VALUES (2, '前端开发', 0, '前端开发是创建WEB页面呈现给用户的过程', '2022-10-15 20:37:55', '2022-10-16 15:43:06', NULL);
INSERT INTO `rct_category` VALUES (3, '大数据开发', 0, '大数据工程师对大量数据的采集、清洗、分析', '2022-10-15 20:38:29', '2022-10-15 20:47:53', NULL);
INSERT INTO `rct_category` VALUES (4, '人工智能', 0, '人工智能是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术', '2022-10-15 20:41:40', '2022-10-15 20:45:03', NULL);
INSERT INTO `rct_category` VALUES (5, '网络安全', 0, '网络安全是指网络系统的硬件、软件及其系统中的数据受到保护', '2022-10-15 20:42:36', '2022-10-15 20:45:39', NULL);
INSERT INTO `rct_category` VALUES (6, '人事/财务/行政', 0, '人事/财务/行政技术大分类', '2022-10-15 20:43:55', NULL, NULL);
INSERT INTO `rct_category` VALUES (7, '教育培训', 0, '教育培训机构', '2022-10-15 20:46:08', '2022-10-16 15:43:42', NULL);
INSERT INTO `rct_category` VALUES (8, 'Java', 1, '使用Java技术进行后端开发', '2022-10-15 20:46:44', '2022-10-15 20:55:50', NULL);
INSERT INTO `rct_category` VALUES (9, 'C++', 1, '使用C++语言进行后端开发', '2022-10-15 20:48:55', '2022-10-15 20:55:55', NULL);
INSERT INTO `rct_category` VALUES (11, 'React', 2, '使用react进行前端开发', '2022-10-15 21:00:27', '2022-10-15 21:01:08', NULL);
INSERT INTO `rct_category` VALUES (12, '.Net', 2, '.Net前端开发工程师', '2022-10-15 21:02:23', NULL, NULL);
INSERT INTO `rct_category` VALUES (13, 'Python', 4, '使用Python语言训练Al模型', '2022-10-15 21:03:34', '2022-10-31 08:52:10', NULL);
INSERT INTO `rct_category` VALUES (21, 'Go', 1, '使用Go语言进行后端开发', '2022-10-17 15:30:10', '2022-10-17 15:30:40', NULL);
INSERT INTO `rct_category` VALUES (22, 'Vue', 2, '是用Vue进行开发前端页面', '2022-10-30 22:20:49.577', NULL, NULL);
INSERT INTO `rct_category` VALUES (23, 'R', 4, 'R编程是一种专门用于解决数值/统计问题的语言。', '2022-10-30 22:25:06', '2022-10-31 08:52:06', NULL);
INSERT INTO `rct_category` VALUES (24, 'Hive', 3, 'hive是基于Hadoop的一个数据仓库工具，用来进行数据提取、转化、加载，这是一种可以存储、查询和分析存储在Hadoop中的大规模数据的机制。', '2022-10-31 08:52:53.978', NULL, NULL);
INSERT INTO `rct_category` VALUES (25, 'Spark', 3, 'Spark 是一种与 Hadoop 相似的开源集群计算环境，但是两者之间还存在一些不同之处，这些有用的不同之处使 Spark 在某些工作负载方面表现得更加优越，换句话说，Spark 启用了内存分布数据集，除了能够提供交互式查询外，它还可以优化迭代工作负载。', '2022-10-31 08:55:27.698', NULL, NULL);
INSERT INTO `rct_category` VALUES (26, 'Hadoop', 3, 'Hadoop是一个由Apache基金会所开发的分布式系统基础架构。用户可以在不了解分布式底层细节的情况下，开发分布式程序。充分利用集群的威力进行高速运算和存储', '2022-10-31 08:56:07.854', NULL, NULL);
INSERT INTO `rct_category` VALUES (27, 'Javascript', 5, 'JavaScript是一种高级编程语言，通常被称为网络的“通用语言”。由于Java的广泛使用，可以了解到网站和其他应用程序如何工作的概念，以及用来抵御恶意用户的最佳设计。', '2022-10-31 09:00:03.925', NULL, NULL);
INSERT INTO `rct_category` VALUES (28, 'PHP', 5, 'PHP是用于开发网站的服务器端编程语言。 由于大多数网站都是使用PHP创建的，因此学习该语言可以知道如何抵御入侵者。', '2022-10-31 09:00:18.925', NULL, NULL);

-- ----------------------------
-- Table structure for rct_company
-- ----------------------------
DROP TABLE IF EXISTS `rct_company`;
CREATE TABLE `rct_company`  (
  `company_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公司LOGO',
  `license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '营业执照',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '审核状态（0未审核 1审核中 2审核成功 3审核失败）',
  `nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司性质',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint NOT NULL COMMENT '所属用户ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司描述',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rct_company
-- ----------------------------
INSERT INTO `rct_company` VALUES (100, '网易公司', '杭州', '16670002111', '/profile/upload/2022/10/31/网易Logo_20221031153004A004.jpg', '/profile/upload/2022/10/15/营业执照_20221015173633A001.jpeg', '1', '0', '', '2022-10-15 14:14:01', '', '2022-10-31 15:30:06', 114, '网易是中国领先的互联网技术公司,为用户提供免费邮箱、游戏、搜索引擎服务,开设新闻、娱乐、体育等30多个内容频道,及博客、视频、论坛等互动交流,网聚人的力量。');
INSERT INTO `rct_company` VALUES (101, '腾讯公司', '深圳', '18273816758', '/profile/upload/2022/10/15/腾讯_20221015201926A001.jpeg', '/profile/upload/2022/10/15/营业执照_20221015201937A002.jpeg', '2', '0', '', '2022-10-15 20:20:14', '', '2022-10-27 19:33:13', 102, '腾讯于1998年11月成立,是一家互联网公司,通过技术丰富互联网用户的生活,助力企业数字化升级。我们的使命是“用户为本 科技向善”');
INSERT INTO `rct_company` VALUES (104, '三星集团', '广州', '17820337963', '/profile/upload/2022/10/22/Samsung_20221022172527A001.jpeg', '/profile/upload/2022/10/22/营业执照_20221022172530A002.jpeg', '2', '0', '', '2022-10-22 17:18:18', '', '2022-10-27 19:28:41', 131, '三星集团（英文：SAMSUNG、韩文：삼성）是韩国最大的跨国企业集团，三星集团包括众多的国际下属企业，旗下子公司有：三星电子、三星物产、三星人寿保险等，业务涉及电子、金融、机械、化学等众多领域。');
INSERT INTO `rct_company` VALUES (105, '阿里巴巴集团', '杭州', '16738244462', '/profile/upload/2022/10/26/alibaba_logo_20221026162435A001.jpeg', '/profile/upload/2022/10/26/营业执照_20221026162441A002.jpeg', '2', '0', '', '2022-10-24 17:18:18', '', '2022-10-27 19:28:46', 133, NULL);
INSERT INTO `rct_company` VALUES (106, '美团', '北京', '17860002013', '/profile/upload/2022/10/30/美团logo_20221030214620A001.jpeg', '/profile/upload/2022/10/30/营业执照_20221030214628A002.jpeg', '2', '0', '', '2022-10-30 21:40:54', '', '2022-10-30 21:48:09', 134, '美团是一家科技零售公司。美团以“零售+科技”的战略践行“帮大家吃得更好，生活更好”的公司使命。自2010年3月成立以来，美团持续推动服务零售和商品零售在需求侧和供给侧的数字化升级，和广大合作伙伴一起努');
INSERT INTO `rct_company` VALUES (107, '饿了么', '上海', '17628106325', '/profile/upload/2022/10/30/饿了么logo_20221030221252A003.jpeg', '/profile/upload/2022/10/30/营业执照_20221030221306A004.jpeg', '2', '0', '', '2022-10-30 22:09:52', '', '2022-10-30 22:13:30', 135, '“饿了么”是2008年创立的本地生活平台，主营在线外卖、新零售、即时配送和餐饮供应链等业务。创业12年，饿了么以“Everything 30min”为使命，致力于用科技打造本地生活服务平台');

-- ----------------------------
-- Table structure for rct_delivery
-- ----------------------------
DROP TABLE IF EXISTS `rct_delivery`;
CREATE TABLE `rct_delivery`  (
  `delivery_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `position_id` bigint NULL DEFAULT NULL COMMENT '岗位信息ID',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `delivery_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投递状态(0投递中，1通过，2驳回)',
  `company_id` bigint NULL DEFAULT NULL COMMENT '公司ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`delivery_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rct_delivery
-- ----------------------------
INSERT INTO `rct_delivery` VALUES (12, 113, '李相赫', 4, 'React工程师', '1', 100, '网易公司', '2022-10-24 17:08:16', '2022-10-31 13:44:32');
INSERT INTO `rct_delivery` VALUES (14, 113, '李相赫', 6, 'Go工程师', '1', 101, '腾讯公司', '2022-10-24 17:13:40', '2022-10-27 19:36:41');
INSERT INTO `rct_delivery` VALUES (16, 117, '白家浩', 9, 'Java主程', '1', 104, '三星集团', '2022-10-31 10:41:47', '2022-10-31 10:46:15');
INSERT INTO `rct_delivery` VALUES (17, 117, '白家浩', 11, 'PHP实习生', '1', 105, '阿里巴巴集团', '2022-10-31 10:41:54', '2022-10-31 10:46:17');
INSERT INTO `rct_delivery` VALUES (18, 117, '白家浩', 7, 'java开发工程师', '1', 104, '三星集团', '2022-10-31 10:45:55', '2022-10-31 10:46:20');
INSERT INTO `rct_delivery` VALUES (19, 117, '白家浩', 1, 'Java工程师', '1', 100, '网易公司', '2022-10-31 15:05:10', '2022-10-31 15:14:51');
INSERT INTO `rct_delivery` VALUES (20, 117, '白家浩', 2, 'C++工程师', '0', 100, '网易公司', '2022-10-31 16:13:40', NULL);
INSERT INTO `rct_delivery` VALUES (21, 113, '李相赫', 1, 'Java工程师', '0', 100, '网易公司', '2022-10-31 16:45:07', NULL);

-- ----------------------------
-- Table structure for rct_position
-- ----------------------------
DROP TABLE IF EXISTS `rct_position`;
CREATE TABLE `rct_position`  (
  `recruit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '招聘岗位id',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '招聘岗位名称',
  `requirement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '招聘要求',
  `work_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `start_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `category_id` bigint NULL DEFAULT NULL COMMENT '岗位分类id',
  `deadline` datetime NULL DEFAULT NULL COMMENT '截止时间',
  `numbers` int NULL DEFAULT NULL COMMENT '招聘人数',
  `max_salary` decimal(20, 2) NULL DEFAULT NULL COMMENT '最高薪资',
  `min_salary` decimal(20, 2) NULL DEFAULT NULL COMMENT '最低薪资',
  `company_id` bigint NOT NULL COMMENT '公司id',
  `status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核（0 通过、1 驳回）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`recruit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rct_position
-- ----------------------------
INSERT INTO `rct_position` VALUES (1, 'Java工程师', '<p>三年以上JAVA研发经验，掌握JVM、数据库、常用缓存介质，良好的数据敏感度及逻辑思维能力，出色的数据分析及解决问题能力；</p>', '南京', '13135246325', '2022-10-05 00:00:00', 8, '2022-10-21 00:00:00', 10, 10000.00, 7000.00, 100, '1', '2022-10-16 11:47:48', '2022-10-31 17:01:36');
INSERT INTO `rct_position` VALUES (2, 'C++工程师', '<p>1、可以熟练使用c/c++ 开发语言，精通windows下多线程多进程开发；</p><p><br></p><p>2、根据项目计划，在保质保量的前提下，按时完成开发任务；</p><p><br></p><p>3、负责相关产品的功能模块设计，负责相关产品的功能模块设计；</p><p><br></p><p>4、解决产品开发中发现的问题；</p><p><br></p><p>5、负责产品文档的撰写；</p><p><br></p><p>6、负责编写产品的核心代码；</p><p><br></p><p>7、负责检查、维护数据库中的数据。</p>', '深圳', '16670002910', '2022-10-03 00:00:00', 9, '2022-10-19 00:00:00', 20, 19000.00, 10000.00, 100, '1', '2022-10-16 17:19:03', '2022-10-31 17:01:31');
INSERT INTO `rct_position` VALUES (4, 'React工程师', '<p>1.计算机或相关专业，大专以上学历，3年以上前端开发工作经验；</p><p>2.能对系统前端的性能、架构进行深入优化，提高系统性能、可靠性及可扩展性；</p><p>3.熟悉UI设计开发，熟悉canvas 或svg 动画开发经验优先；</p><p>4.有实际的React2年以上经验优先；对React生态熟悉者优先，熟悉redux、hooks 者优先。</p><p>5.具有良好的代码风格、接口设计与程序架构，对前端工程化有深入实践者优先；</p><p>6.较强的学习能力，良好的沟通能力，具备良好的知识沉淀习惯，有技术博客撰写，github开源项目者优先。</p><p>7.可以尽快到岗优先。</p>', '北京', '13135246325', '2022-10-25 00:00:00', 11, '2022-11-23 00:00:00', 20, 18000.00, 13000.00, 100, '1', '2022-10-17 15:26:02', '2022-10-31 17:01:28');
INSERT INTO `rct_position` VALUES (6, 'Go工程师', '1. 热爱编程，有良好的编程开发习惯；\n2. 熟悉Golang语言，有3年以上项目开发经验；熟悉微服务框架；\n3. 熟悉web后台技术，包括http，tcp/ip 协议、数据库（MySQL/mongodb等）、redis、消息队列等；\n4. 深入理解协程，锁，信道 等。\n5、熟练使用git 并有协同开发经验。\n5.责任心强,良好的对外沟通和团队协作能力。\n6. 工作认真负责，有良好的团队意识和沟通能力；\n7.熟练常用的liunx命令、能够在Mac/liunx 环境下开发优先。', '广州', '16670002111', '2022-10-04 00:00:00', 21, '2022-10-13 00:00:00', 10, 20000.00, 16000.00, 101, '1', '2022-10-17 15:36:16', '2022-10-17 20:15:22');
INSERT INTO `rct_position` VALUES (7, 'java开发工程师', '岗位职责：\n1、完成直接主管下达的研发任务，按研发规范提交最终成果；\n2、能根据设计方案和计划进行编码实现，在进度和质量上符合方案和计划要求。\n任职要求：\n1、计算机相关专业,本科以上学历； \n2、熟悉Java语言，熟悉J2EE体系架构和MVC设计模式；\n2、熟悉Struts、Spring、Hibernate、IBatis、MyBatis等主流开发框架；\n3、熟悉使用Java、JSP、HTML、Java Script、XML等常用编程语言进行开发； \n5、掌握Oracle、SQLServer、MySQL等至少一种数据库的应用开发与日常管理。', '广州', '16738246564', '2022-10-03 00:00:00', 8, '2022-10-31 00:00:00', 20, 8000.00, 12000.00, 104, '1', '2022-10-31 09:17:09', '2022-10-31 09:19:10');
INSERT INTO `rct_position` VALUES (8, 'Java开发实习生', '任职要求\n1、计算机相关专业全日制本科，应届毕业生；\n2、有一定的linux和Java基础，有Java开发实习经验优先， 了解JVM调试工具、linux调试工具；\n3、了解UML建模、常用设计模式；\n4、熟悉Spring cloud/SpringBoot/Mybatis等框架， 对网络、IO、多线程、高并发等有实践经验；\n5、熟悉MySQL、Redis、activeMQ、kafka等常见存储系统/组件的使用， 有深入了解相关组件底层模型和优化经验者优先\n6、有Spark/HBase/Elasticsearch/Presto/Kylin等大数据相关的开发经验者优先；', '广州', '13762534655', '2022-10-12 00:00:00', 8, '2022-10-29 00:00:00', 10, 4000.00, 7000.00, 104, '1', '2022-10-31 09:20:22', '2022-10-31 09:23:04');
INSERT INTO `rct_position` VALUES (9, 'Java主程', '1.完成平台框架搭建，组织协调完成PC、小程序、APP的开发计划\n2.监听所有硬件设备的实时在线监听工作和离线状态微信推送\n3.前后端分离，沟通协调完成整理目标\n4.具有SAAS平台的开发经验优先\n5.至少有3年以上开发经验（低于3年经验，有信心承担后台工作的可以自荐）\n6.有软硬件交互经验的优先\n7.具备安卓开发经验的优先\n8.懂前端有经验的优先\n9.有从0-1项目开发经验的优先\n10.能独立完成项目的优先', '广州', '18748927001', '2022-10-04 00:00:00', 8, '2022-11-02 00:00:00', 10, 7000.00, 12000.00, 104, '1', '2022-10-31 09:22:42', '2022-10-31 09:23:07');
INSERT INTO `rct_position` VALUES (10, 'C++算法工程师', '岗位职责：\n1、研究TET,HEX等网格生成及算法，实现和完善三维模型网格剖分相关问题；\n2、负责网格算法相关的技术合作项目；\n4、研究和完善nurbs模型和mesh模型的几何错误修复。\n岗位要求：\n1、硕士以上学历，计算机科学与技术、软件工程、机械工程及自动化、计算数学、应用数学、电子科学与技术等理工科相关专业；\n2、掌握C/C++编程语言；具备有限元基础理论知识；\n3、了解TET，HEX等网格生成算法，修补算法。', '北京', '18273886822', '2022-09-02 00:00:00', 9, '2022-10-25 00:00:00', 15, 15000.00, 30000.00, 105, '1', '2022-10-31 09:33:32', '2022-10-31 09:42:01');
INSERT INTO `rct_position` VALUES (11, 'PHP实习生', '岗位描述：\n1、负责微信、支付宝、银联等第三方接口的研发工作\n2、负责公司 saas 系统（会员积分、营销卡券、在线商城、数据报表）的研发工作\n岗位要求：\n1．精通 PHP 编程，至少熟练使用过一种 PHP 主流开发框架如： Laravel 、 Thinkphp 等\n2．熟练使用 Linux 系统， Shell脚本，熟悉 Nginx 配置及优化\n3．熟悉 Mysql 能够编写 SQL 和对已有 SQL 语句进行优化。熟悉 Redis 各种数据类型及使用场景\n4．具备良好的编程习惯，熟练掌握 OOP 编程和常见设计模式\n5．具备团队开发经验，熟练掌握 SVN 、Git 等常见工具的使用', '杭州', '16764282713', '2022-10-01 00:00:00', 28, '2022-10-27 00:00:00', 10, 5000.00, 7000.00, 105, '1', '2022-10-31 09:35:15', '2022-10-31 09:42:09');
INSERT INTO `rct_position` VALUES (12, 'hadoop大数据开发工程师', '岗位要求\n1、计算机相关专业，3年以上大数据处理相关工作经验；\n2、熟悉Java和Scala开发体系，扎实的编程基础、优秀的编码能力、对代码质量有极致的追求；\n3、熟悉Spark、Flink、Kafka、Clickhouse、Hbase、HDFS、Yarn、Hive、Mapreduce、Redis原理，有丰富的项目开发经验；\n4、对数据处理、数据建模、数据分析等有深刻认识和实战经验，主导过相关技术中台、数据中台建设者优先；\n5、具有良好的算法及数据结构基础，具备海量数据处理经验，从事过互联网大规模计算、大数据处理者优先；\n6、具备数据仓库领域知识和技能者优先，包括但不局限于：数据建模、元数据管理、数据开发测试工具与方法、数据质量管理；\n7、熟练使用maven/gradle、git等项目管理工具；\n8、熟悉Java后端开发、Spring boot、Hibernate/Mybatis的优先考虑；\n9、具有快速定位问题的能力和较强的学习能力；\n10、能自我驱动，有较强的沟通能力及团队合作精神，强烈的责任感及进取精神。', '苏州', '18273846677', '2022-10-03 00:00:00', 26, '2022-10-28 00:00:00', 10, 15000.00, 30000.00, 105, '1', '2022-10-31 09:40:49', '2022-10-31 09:42:06');
INSERT INTO `rct_position` VALUES (13, '(Python)爬虫工程师实习生', '岗位职责：\n1、负责各类电商、新闻、社交平台和app端数据抓取；\n2、负责移动应用的逆向分析与开发，完成高质量编码和测试工作；\n3、参与项目重点、难点模块的技术攻关；\n4、参与终端项目的架构与优化；\n任职要求：\n1、本科及以上学历，计算机相关专业，23年应届毕业生；\n2、熟悉linux平台，掌握Python/java/shell/http协议，熟悉HTML、DOM、XPath，了解git、maven、svn等工具和实践，注重工程规范；\n3、了解app端数据抓取（有逆向、脱壳等经验），了解Apktool、dex2jar、JD-GUI等工具；\n4、有Android应用开发经验/iOS逆向经验者优先；\n5、了解x86/x64/arm架构的反汇编技术；\n6、性格开朗、善于沟通，有良好的自我驱动学习能力，注重效率和团队意识。', '济南', '17273642818', '2022-10-01 00:00:00', 13, '2022-10-27 00:00:00', 20, 4000.00, 7000.00, 106, '1', '2022-10-31 10:23:31', '2022-10-31 10:45:23');

-- ----------------------------
-- Table structure for rct_resume
-- ----------------------------
DROP TABLE IF EXISTS `rct_resume`;
CREATE TABLE `rct_resume`  (
  `resume_id` bigint NOT NULL AUTO_INCREMENT COMMENT '简历ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `health_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康状态',
  `job_intention` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '求职意向',
  `politics_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所学专业',
  `present_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居地',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `award` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所获奖项',
  `self_evaluation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我评价',
  `resume_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简历附件',
  PRIMARY KEY (`resume_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rct_resume
-- ----------------------------
INSERT INTO `rct_resume` VALUES (1, 113, '李相赫', '0', '0', 'Java后端开发、运维、测试', '0', '0', '1996-10-09 00:00:00', '软件工程专业', '广东中山', '17780002810', 'foreverfaker@163.com', '蓝桥杯省赛三等奖', '积极向上，乐观，有责任心', '/profile/upload/2022/10/20/青软-Java开发工程师-李茂_20221020172439A018.pdf');
INSERT INTO `rct_resume` VALUES (8, 117, '白家浩', '0', '1', '大数据方向，以及人工智能方向', '0', '1', '2001-11-05 00:00:00', '电子通信工程', '湖北武汉', '18273332818', 'jdg369@163.com', 'ACM二等奖', '抗压能力优秀，乐于和他人沟通', '/profile/upload/2022/10/20/青软-Java开发工程师-李茂_202210201724');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-08-25 15:32:19', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-08-25 15:32:19', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-08-25 15:32:19', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-08-25 15:32:19', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-14 20:37:07', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'EKKO科技', 0, '李茂', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-13 20:31:21');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '广州总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-13 20:34:04');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-08-25 15:32:19', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-08-25 15:32:19', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '本科', '0', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:39:53', '', NULL, '本科学历');
INSERT INTO `sys_dict_data` VALUES (101, 1, '硕士', '1', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:40:23', 'admin', '2022-08-29 19:50:21', '研究生学历');
INSERT INTO `sys_dict_data` VALUES (102, 2, '博士', '2', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:50:37', '', NULL, '博士学历');
INSERT INTO `sys_dict_data` VALUES (103, 3, '大专', '3', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:50:59', '', NULL, '大专学历');
INSERT INTO `sys_dict_data` VALUES (104, 4, '高中', '4', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:51:40', 'admin', '2022-08-29 19:52:09', '高中学历');
INSERT INTO `sys_dict_data` VALUES (105, 5, '初中', '5', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:52:00', '', NULL, '初中学历');
INSERT INTO `sys_dict_data` VALUES (106, 6, '小学', '6', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-08-29 19:52:34', '', NULL, '小学学历');
INSERT INTO `sys_dict_data` VALUES (107, 0, '未认证', '0', 'rct_company_auditing', NULL, 'warning', 'N', '0', 'admin', '2022-09-03 10:15:07', 'admin', '2022-10-18 23:06:41', '未审核的公司无法发布岗位');
INSERT INTO `sys_dict_data` VALUES (108, 2, '审核通过', '2', 'rct_company_auditing', NULL, 'success', 'N', '0', 'admin', '2022-09-03 10:16:17', 'admin', '2022-10-18 22:55:22', '审核通过后即可发布岗位');
INSERT INTO `sys_dict_data` VALUES (109, 1, '审核中', '1', 'rct_company_auditing', NULL, 'primary', 'N', '0', 'admin', '2022-09-03 10:17:14', 'admin', '2022-10-18 22:55:19', '等待管理员进行审核,审核成功即可发布岗位');
INSERT INTO `sys_dict_data` VALUES (110, 3, '审核失败', '3', 'rct_company_auditing', NULL, 'danger', 'N', '0', 'admin', '2022-09-03 10:19:09', 'admin', '2022-09-03 10:19:42', '审核失败，管理员未通过,请重新上传企业信息');
INSERT INTO `sys_dict_data` VALUES (111, 0, '私企', '0', 'rct_company_nature', NULL, 'default', 'N', '0', 'admin', '2022-09-03 11:33:46', 'admin', '2022-10-15 13:51:40', '私企企业');
INSERT INTO `sys_dict_data` VALUES (112, 1, '国企', '1', 'rct_company_nature', NULL, 'default', 'N', '0', 'admin', '2022-09-03 11:34:27', 'admin', '2022-10-15 13:51:43', '国企企业');
INSERT INTO `sys_dict_data` VALUES (113, 2, '其他', '2', 'rct_company_nature', NULL, 'default', 'N', '0', 'admin', '2022-09-03 14:10:25', 'admin', '2022-10-15 13:51:46', '其他类型企业');
INSERT INTO `sys_dict_data` VALUES (114, 1, '通过', '1', 'rct_recruit_type', NULL, 'success', 'N', '0', 'admin', '2022-10-16 00:44:55', 'admin', '2022-10-16 17:20:59', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '驳回', '2', 'rct_recruit_type', NULL, 'danger', 'N', '0', 'admin', '2022-10-16 00:45:14', 'admin', '2022-10-16 17:21:04', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '待审核', '0', 'rct_recruit_type', NULL, 'warning', 'N', '0', 'admin', '2022-10-16 17:20:06', 'admin', '2022-10-16 17:21:08', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '审核中', '0', 'rct_delivery_status', NULL, 'primary', 'N', '0', 'admin', '2022-10-17 17:02:39', 'admin', '2022-10-17 17:02:52', NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '通过', '1', 'rct_delivery_status', NULL, 'success', 'N', '0', 'admin', '2022-10-17 17:03:32', 'admin', '2022-10-17 17:07:36', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 2, '拒绝', '2', 'rct_delivery_status', NULL, 'danger', 'N', '0', 'admin', '2022-10-17 17:03:45', 'admin', '2022-10-17 17:07:32', NULL);
INSERT INTO `sys_dict_data` VALUES (120, 7, '中专', '7', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-10-18 10:27:20', 'admin', '2022-10-18 10:34:54', '中专学历');
INSERT INTO `sys_dict_data` VALUES (121, 0, '其他', '8', 'sys_education_type', NULL, 'default', 'N', '0', 'admin', '2022-10-18 10:27:48', 'admin', '2022-10-18 10:34:36', '其他');
INSERT INTO `sys_dict_data` VALUES (122, 0, '健康', '0', 'rct_health_status', NULL, 'success', 'N', '0', 'admin', '2022-10-18 11:27:25', 'admin', '2022-10-18 11:27:41', NULL);
INSERT INTO `sys_dict_data` VALUES (123, 1, '良好', '1', 'rct_health_status', NULL, 'success', 'N', '0', 'admin', '2022-10-18 11:27:51', 'admin', '2022-10-18 11:28:43', NULL);
INSERT INTO `sys_dict_data` VALUES (124, 2, '一般', '2', 'rct_health_status', NULL, 'primary', 'N', '0', 'admin', '2022-10-18 11:28:07', 'admin', '2022-10-18 11:28:14', NULL);
INSERT INTO `sys_dict_data` VALUES (125, 3, '较差', '3', 'rct_health_status', NULL, 'warning', 'N', '0', 'admin', '2022-10-18 11:28:33', 'admin', '2022-10-18 11:28:49', NULL);
INSERT INTO `sys_dict_data` VALUES (128, 0, '群众', '0', 'rct_politics_type', NULL, 'primary', 'N', '0', 'admin', '2022-10-18 14:15:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 1, '共青团员', '1', 'rct_politics_type', NULL, 'primary', 'N', '0', 'admin', '2022-10-18 14:16:00', 'admin', '2022-10-18 14:16:28', NULL);
INSERT INTO `sys_dict_data` VALUES (130, 2, '中共党员', '2', 'rct_politics_type', NULL, 'primary', 'N', '0', 'admin', '2022-10-18 14:16:17', 'admin', '2022-10-18 14:16:25', NULL);
INSERT INTO `sys_dict_data` VALUES (131, 3, ' 无党派人士', '3', 'rct_politics_type', NULL, 'primary', 'N', '0', 'admin', '2022-10-18 14:16:51', 'admin', '2022-10-18 14:17:01', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '教育背景', 'sys_education_type', '0', 'admin', '2022-08-29 19:36:55', '', NULL, '教育背景列表');
INSERT INTO `sys_dict_type` VALUES (101, '公司审核', 'rct_company_auditing', '0', 'admin', '2022-09-03 10:11:51', 'admin', '2022-10-18 23:05:46', '公司审核类型');
INSERT INTO `sys_dict_type` VALUES (102, '企业性质', 'rct_company_nature', '0', 'admin', '2022-09-03 11:32:33', 'admin', '2022-10-18 23:06:08', '企业性质');
INSERT INTO `sys_dict_type` VALUES (104, '招聘信息审核状态', 'rct_recruit_type', '0', 'admin', '2022-10-16 00:44:16', 'admin', '2022-10-18 11:32:31', '招聘岗位审核');
INSERT INTO `sys_dict_type` VALUES (105, '投递简历状态', 'rct_delivery_status', '0', 'admin', '2022-10-17 17:01:51', '', NULL, '企业进行审核简历的状态');
INSERT INTO `sys_dict_type` VALUES (106, '健康状态', 'rct_health_status', '0', 'admin', '2022-10-18 11:25:59', 'admin', '2022-10-18 11:26:14', '求职用户身体健康状态');
INSERT INTO `sys_dict_type` VALUES (108, '政治面貌类型', 'rct_politics_type', '0', 'admin', '2022-10-18 11:42:43', 'admin', '2022-10-18 11:43:20', '政治面貌类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-08-25 15:32:19', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 695 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 11:11:16');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-27 11:28:15');
INSERT INTO `sys_logininfor` VALUES (592, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 11:28:33');
INSERT INTO `sys_logininfor` VALUES (593, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:42:15');
INSERT INTO `sys_logininfor` VALUES (594, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-27 16:20:57');
INSERT INTO `sys_logininfor` VALUES (595, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:21:27');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:35:44');
INSERT INTO `sys_logininfor` VALUES (597, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 17:13:55');
INSERT INTO `sys_logininfor` VALUES (598, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-27 17:34:00');
INSERT INTO `sys_logininfor` VALUES (599, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 17:34:12');
INSERT INTO `sys_logininfor` VALUES (600, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 19:16:25');
INSERT INTO `sys_logininfor` VALUES (601, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-27 19:16:41');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 19:17:16');
INSERT INTO `sys_logininfor` VALUES (603, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-10-27 19:30:53');
INSERT INTO `sys_logininfor` VALUES (604, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-10-27 19:30:53');
INSERT INTO `sys_logininfor` VALUES (605, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2022-10-27 19:31:01');
INSERT INTO `sys_logininfor` VALUES (606, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-10-27 19:31:01');
INSERT INTO `sys_logininfor` VALUES (607, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '验证码错误', '2022-10-27 19:31:30');
INSERT INTO `sys_logininfor` VALUES (608, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-27 19:31:34');
INSERT INTO `sys_logininfor` VALUES (609, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-10-27 19:36:03');
INSERT INTO `sys_logininfor` VALUES (610, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '验证码错误', '2022-10-27 19:36:09');
INSERT INTO `sys_logininfor` VALUES (611, 'mikasa', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-27 19:36:13');
INSERT INTO `sys_logininfor` VALUES (612, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 19:41:39');
INSERT INTO `sys_logininfor` VALUES (613, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 09:24:52');
INSERT INTO `sys_logininfor` VALUES (614, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 10:08:09');
INSERT INTO `sys_logininfor` VALUES (615, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-28 10:15:43');
INSERT INTO `sys_logininfor` VALUES (616, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 10:15:46');
INSERT INTO `sys_logininfor` VALUES (617, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 20:37:33');
INSERT INTO `sys_logininfor` VALUES (618, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-28 20:42:50');
INSERT INTO `sys_logininfor` VALUES (619, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-28 20:43:53');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-28 20:43:58');
INSERT INTO `sys_logininfor` VALUES (621, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 20:44:02');
INSERT INTO `sys_logininfor` VALUES (622, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 14:24:59');
INSERT INTO `sys_logininfor` VALUES (623, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 18:39:08');
INSERT INTO `sys_logininfor` VALUES (624, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 20:54:19');
INSERT INTO `sys_logininfor` VALUES (625, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 20:54:23');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 20:54:52');
INSERT INTO `sys_logininfor` VALUES (627, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-10-30 21:40:53');
INSERT INTO `sys_logininfor` VALUES (628, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 21:41:09');
INSERT INTO `sys_logininfor` VALUES (629, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-30 21:47:27');
INSERT INTO `sys_logininfor` VALUES (630, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 21:49:45');
INSERT INTO `sys_logininfor` VALUES (631, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 21:49:51');
INSERT INTO `sys_logininfor` VALUES (632, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 21:50:02');
INSERT INTO `sys_logininfor` VALUES (633, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 21:50:16');
INSERT INTO `sys_logininfor` VALUES (634, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 21:51:02');
INSERT INTO `sys_logininfor` VALUES (635, '阿水', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-10-30 22:09:52');
INSERT INTO `sys_logininfor` VALUES (636, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-30 22:11:29');
INSERT INTO `sys_logininfor` VALUES (637, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 22:11:34');
INSERT INTO `sys_logininfor` VALUES (638, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 22:15:34');
INSERT INTO `sys_logininfor` VALUES (639, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-30 22:15:45');
INSERT INTO `sys_logininfor` VALUES (640, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-30 22:15:49');
INSERT INTO `sys_logininfor` VALUES (641, 'jackeyLove', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-30 22:16:13');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '验证码错误', '2022-10-31 08:51:19');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 08:51:23');
INSERT INTO `sys_logininfor` VALUES (644, 'khan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-10-31 09:08:45');
INSERT INTO `sys_logininfor` VALUES (645, 'khan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-31 09:08:47');
INSERT INTO `sys_logininfor` VALUES (646, 'khan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 09:08:51');
INSERT INTO `sys_logininfor` VALUES (647, 'khan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 09:25:23');
INSERT INTO `sys_logininfor` VALUES (648, 'ning', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-31 09:30:28');
INSERT INTO `sys_logininfor` VALUES (649, 'ning', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 09:30:31');
INSERT INTO `sys_logininfor` VALUES (650, '369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：369 不存在', '2022-10-31 09:46:15');
INSERT INTO `sys_logininfor` VALUES (651, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 09:46:31');
INSERT INTO `sys_logininfor` VALUES (652, 'ning', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 09:47:11');
INSERT INTO `sys_logininfor` VALUES (653, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-10-31 10:03:09');
INSERT INTO `sys_logininfor` VALUES (654, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 10:03:12');
INSERT INTO `sys_logininfor` VALUES (655, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 10:41:32');
INSERT INTO `sys_logininfor` VALUES (656, 'rookie', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 10:53:19');
INSERT INTO `sys_logininfor` VALUES (657, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-10-31 13:28:15');
INSERT INTO `sys_logininfor` VALUES (658, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 13:28:18');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 13:29:11');
INSERT INTO `sys_logininfor` VALUES (660, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-10-31 15:03:07');
INSERT INTO `sys_logininfor` VALUES (661, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:03:12');
INSERT INTO `sys_logininfor` VALUES (662, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:08:28');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:08:32');
INSERT INTO `sys_logininfor` VALUES (664, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:08:51');
INSERT INTO `sys_logininfor` VALUES (665, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:09:42');
INSERT INTO `sys_logininfor` VALUES (666, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:10:32');
INSERT INTO `sys_logininfor` VALUES (667, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:10:35');
INSERT INTO `sys_logininfor` VALUES (668, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:11:14');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:11:20');
INSERT INTO `sys_logininfor` VALUES (670, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:11:36');
INSERT INTO `sys_logininfor` VALUES (671, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:13:03');
INSERT INTO `sys_logininfor` VALUES (672, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-31 15:13:09');
INSERT INTO `sys_logininfor` VALUES (673, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:13:12');
INSERT INTO `sys_logininfor` VALUES (674, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-31 15:16:20');
INSERT INTO `sys_logininfor` VALUES (675, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:16:23');
INSERT INTO `sys_logininfor` VALUES (676, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:28:37');
INSERT INTO `sys_logininfor` VALUES (677, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 15:28:57');
INSERT INTO `sys_logininfor` VALUES (678, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 15:39:14');
INSERT INTO `sys_logininfor` VALUES (679, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:13:13');
INSERT INTO `sys_logininfor` VALUES (680, 'jdg369', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 16:13:49');
INSERT INTO `sys_logininfor` VALUES (681, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:13:59');
INSERT INTO `sys_logininfor` VALUES (682, 'faker', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 16:46:24');
INSERT INTO `sys_logininfor` VALUES (683, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-31 16:46:46');
INSERT INTO `sys_logininfor` VALUES (684, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:46:49');
INSERT INTO `sys_logininfor` VALUES (685, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:48:02');
INSERT INTO `sys_logininfor` VALUES (686, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-10-31 16:53:38');
INSERT INTO `sys_logininfor` VALUES (687, 'zeus', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:53:51');
INSERT INTO `sys_logininfor` VALUES (688, 'zeus', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-10-31 16:53:55');
INSERT INTO `sys_logininfor` VALUES (689, 'zeus', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:54:00');
INSERT INTO `sys_logininfor` VALUES (690, 'faker', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-10-31 16:54:07');
INSERT INTO `sys_logininfor` VALUES (691, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 18:42:09');
INSERT INTO `sys_logininfor` VALUES (692, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 18:42:12');
INSERT INTO `sys_logininfor` VALUES (693, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-31 18:42:26');
INSERT INTO `sys_logininfor` VALUES (694, 'zeus', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-31 19:07:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2088 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '1', '0', '', 'system', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-28 20:51:21', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 8, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:29:43', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 9, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:31:04', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '管理员', 2052, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-10-13 19:12:51', 'admin', '2022-10-14 14:57:18', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 0, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:27:29', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-25 15:32:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-14 20:36:51', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 0, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-15 13:26:21', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 0, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-15 13:20:51', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:31:56', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 0, 6, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-15 13:23:27', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'logs', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-18 10:25:54', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-25 15:32:19', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2022-08-25 15:32:19', 'admin', '2022-09-02 11:32:22', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 0, 12, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:32:40', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-08-25 15:32:19', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-08-25 15:32:19', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-08-25 15:32:19', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-08-25 15:32:19', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-08-25 15:32:19', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 0, 11, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-10-13 20:11:26', 'admin', '2022-10-22 17:32:46', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-08-25 15:32:19', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-08-25 15:32:19', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-08-25 15:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '用户管理', 0, 1, 'userlist', NULL, NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2022-10-13 19:16:49', 'admin', '2022-10-15 13:15:49', '');
INSERT INTO `sys_menu` VALUES (2053, '求职用户', 2052, 1, 'applicant', 'system/user/applicant/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'applicants', 'admin', '2022-10-14 14:44:16', 'admin', '2022-10-14 14:53:38', '');
INSERT INTO `sys_menu` VALUES (2054, '企业用户', 2052, 2, 'enterprise', 'system/user/enterprise/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'recruit', 'admin', '2022-10-14 14:47:10', 'admin', '2022-10-15 13:12:34', '');
INSERT INTO `sys_menu` VALUES (2055, '公司信息', 2061, 1, 'company', 'system/recruit/company/index', NULL, 1, 0, 'C', '0', '0', 'recruit:company:list', 'company', 'admin', '2022-10-15 12:59:11', 'admin', '2022-10-15 13:21:34', '企业信息菜单');
INSERT INTO `sys_menu` VALUES (2056, '企业信息查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:company:query', '#', 'admin', '2022-10-15 12:59:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '企业信息新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:company:add', '#', 'admin', '2022-10-15 12:59:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '企业信息修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:company:edit', '#', 'admin', '2022-10-15 12:59:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '企业信息删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:company:remove', '#', 'admin', '2022-10-15 12:59:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '企业信息导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:company:export', '#', 'admin', '2022-10-15 12:59:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '招聘管理', 0, 0, 'recruit', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'guide', 'admin', '2022-10-15 13:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '岗位分类', 2061, 1, 'category', 'system/recruit/category/index', NULL, 1, 0, 'C', '0', '0', 'recruit:category:list', 'job', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-17 19:08:21', '岗位分类菜单');
INSERT INTO `sys_menu` VALUES (2063, '岗位分类查询', 2062, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:category:query', '#', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-16 13:36:37', '');
INSERT INTO `sys_menu` VALUES (2064, '岗位分类新增', 2062, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:category:add', '#', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-16 13:36:44', '');
INSERT INTO `sys_menu` VALUES (2065, '岗位分类修改', 2062, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:category:edit', '#', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-16 13:36:51', '');
INSERT INTO `sys_menu` VALUES (2066, '岗位分类删除', 2062, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:category:remove', '#', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-16 13:36:57', '');
INSERT INTO `sys_menu` VALUES (2067, '岗位分类导出', 2062, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:category:export', '#', 'admin', '2022-10-15 20:07:56', 'admin', '2022-10-16 13:37:04', '');
INSERT INTO `sys_menu` VALUES (2068, '招聘信息', 2061, 1, 'position', 'system/recruit/position/index', NULL, 1, 0, 'C', '0', '0', 'recruit:position:list', 'message', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-17 14:49:52', '招聘岗位菜单');
INSERT INTO `sys_menu` VALUES (2069, '招聘岗位查询', 2068, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:position:query', '#', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-16 13:43:56', '');
INSERT INTO `sys_menu` VALUES (2070, '招聘岗位新增', 2068, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:position:add', '#', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-16 13:44:05', '');
INSERT INTO `sys_menu` VALUES (2071, '招聘岗位修改', 2068, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:position:edit', '#', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-16 13:44:13', '');
INSERT INTO `sys_menu` VALUES (2072, '招聘岗位删除', 2068, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:position:remove', '#', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-16 13:44:20', '');
INSERT INTO `sys_menu` VALUES (2073, '招聘岗位导出', 2068, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:position:export', '#', 'admin', '2022-10-16 11:07:49', 'admin', '2022-10-16 13:44:27', '');
INSERT INTO `sys_menu` VALUES (2074, '二级岗位查询', 2062, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'recruit:category:listNotParent', '#', 'admin', '2022-10-17 14:54:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '简历投递信息', 2061, 1, 'delivery', 'system/recruit/delivery/index', NULL, 1, 0, 'C', '0', '0', 'recruit:delivery:list', 'log', 'admin', '2022-10-17 17:34:04', 'admin', '2022-10-17 19:07:02', '简历投递信息菜单');
INSERT INTO `sys_menu` VALUES (2076, '简历投递信息查询', 2075, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:delivery:query', '#', 'admin', '2022-10-17 17:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '简历投递信息新增', 2075, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:delivery:add', '#', 'admin', '2022-10-17 17:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '简历投递信息修改', 2075, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:delivery:edit', '#', 'admin', '2022-10-17 17:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '简历投递信息删除', 2075, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:delivery:remove', '#', 'admin', '2022-10-17 17:34:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '简历投递信息导出', 2075, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:delivery:export', '#', 'admin', '2022-10-17 17:34:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '简历信息', 2061, 1, 'resume', 'system/recruit/resume/index', NULL, 1, 0, 'C', '0', '0', 'recruit:resume:list', 'resume', 'admin', '2022-10-18 13:58:32', 'admin', '2022-10-19 15:17:47', '简历信息菜单');
INSERT INTO `sys_menu` VALUES (2082, '简历信息查询', 2081, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:resume:query', '#', 'admin', '2022-10-18 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '简历信息新增', 2081, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:resume:add', '#', 'admin', '2022-10-18 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '简历信息修改', 2081, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:resume:edit', '#', 'admin', '2022-10-18 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '简历信息删除', 2081, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:resume:remove', '#', 'admin', '2022-10-18 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '简历信息导出', 2081, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'recruit:resume:export', '#', 'admin', '2022-10-18 13:58:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '公司查询简历列表', 2081, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'recruit:resume:listResume', '#', 'admin', '2022-10-18 20:57:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2022-10-21 EKKO新版本发布啦', '2', 0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-31 10:16:42', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2022-10-31 EKKO后台系统凌晨维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-31 10:16:51', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 596 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (502, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":100,\"companyName\":\"网易公司\",\"createTime\":\"2022-10-24 17:08:13\",\"deliveryId\":11,\"deliveryStatus\":\"1\",\"nickName\":\"李相赫\",\"params\":{},\"position\":{\"companyId\":100,\"createTime\":\"2022-10-24 17:08:13\",\"params\":{},\"positionName\":\"C++工程师\"},\"positionId\":2,\"positionName\":\"C++工程师\",\"updateTime\":\"2022-10-27 19:22:10.096\",\"userId\":113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:22:10');
INSERT INTO `sys_oper_log` VALUES (503, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":100,\"companyName\":\"网易公司\",\"createTime\":\"2022-10-24 17:08:16\",\"deliveryId\":12,\"deliveryStatus\":\"1\",\"nickName\":\"李相赫\",\"params\":{},\"position\":{\"companyId\":100,\"createTime\":\"2022-10-24 17:08:16\",\"params\":{},\"positionName\":\"React工程师\"},\"positionId\":4,\"positionName\":\"React工程师\",\"updateTime\":\"2022-10-27 19:22:15.353\",\"userId\":113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:22:15');
INSERT INTO `sys_oper_log` VALUES (504, '角色管理', 2, 'com.zeus.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 18:04:33\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2061,2055,2056,2057,2058,2059,2060,2062,2063,2067,2074,2068,2069,2073,2075,2076,2080,2087,2054,102,1012,107],\"params\":{},\"remark\":\"需要管理员认证通过后,才能进行审核操作\",\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:25:41');
INSERT INTO `sys_oper_log` VALUES (505, '角色管理', 2, 'com.zeus.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 18:01:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2061,2055,2056,2057,2058,2059,2060,2062,2063,2064,2065,2066,2067,2074,2068,2069,2070,2071,2072,2073,2076,2078,2080,2087,2054,1012,1013,1014,1015,1016,1017,1018,1019,1030,1031,1032,1033,1034,500,1039,1040,1041,501,1042,1043,1044,1045,1025,1026,1027,1028,1029,107,1035,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,112,113,114,115,116,1055,1056,1057,1058,1059,1060],\"params\":{},\"remark\":\"企业用户能够管理公司，审核求职者提交的简历\",\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:27:44');
INSERT INTO `sys_oper_log` VALUES (506, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"杭州\",\"companyId\":100,\"companyName\":\"网易公司\",\"createBy\":\"\",\"createTime\":\"2022-10-15 14:14:01\",\"license\":\"/profile/upload/2022/10/15/营业执照_20221015173633A001.jpeg\",\"logo\":\"/profile/upload/2022/10/19/网易Logo_20221019153221A014.jpg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"16670002111\",\"remark\":\"网易是中国领先的互联网技术公司,为用户提供免费邮箱、游戏、搜索引擎服务,开设新闻、娱乐、体育等30多个内容频道,及博客、视频、论坛等互动交流,网聚人的力量。\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-27 19:28:33.629\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:28:33');
INSERT INTO `sys_oper_log` VALUES (507, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"广州\",\"companyId\":104,\"companyName\":\"三星集团\",\"createBy\":\"\",\"createTime\":\"2022-10-22 17:18:18\",\"license\":\"/profile/upload/2022/10/22/营业执照_20221022172530A002.jpeg\",\"logo\":\"/profile/upload/2022/10/22/Samsung_20221022172527A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"17820337963\",\"remark\":\"三星集团（英文：SAMSUNG、韩文：삼성）是韩国最大的跨国企业集团，三星集团包括众多的国际下属企业，旗下子公司有：三星电子、三星物产、三星人寿保险等，业务涉及电子、金融、机械、化学等众多领域。\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-27 19:28:40.602\",\"userId\":131}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:28:40');
INSERT INTO `sys_oper_log` VALUES (508, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"杭州\",\"companyId\":105,\"companyName\":\"阿里巴巴集团\",\"createBy\":\"\",\"createTime\":\"2022-10-24 17:18:18\",\"license\":\"/profile/upload/2022/10/26/营业执照_20221026162441A002.jpeg\",\"logo\":\"/profile/upload/2022/10/26/alibaba_logo_20221026162435A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"16738244462\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-27 19:28:46.004\",\"userId\":133}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:28:46');
INSERT INTO `sys_oper_log` VALUES (509, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"深圳\",\"companyId\":101,\"companyName\":\"腾讯公司\",\"createBy\":\"\",\"createTime\":\"2022-10-15 20:20:14\",\"license\":\"/profile/upload/2022/10/15/营业执照_20221015201937A002.jpeg\",\"logo\":\"/profile/upload/2022/10/15/腾讯_20221015201926A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"18273816758\",\"remark\":\"腾讯于1998年11月成立,是一家互联网公司,通过技术丰富互联网用户的生活,助力企业数字化升级。我们的使命是“用户为本 科技向善”\",\"status\":\"3\",\"updateBy\":\"\",\"updateTime\":\"2022-10-27 19:29:00.845\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:29:00');
INSERT INTO `sys_oper_log` VALUES (510, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"/profile/avatar/2022/10/16/blob_20221016141715A001.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2022-10-14 19:57:31\",\"delFlag\":\"0\",\"email\":\"zeus@163.com\",\"loginDate\":\"2022-10-24 20:29:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"宙斯\",\"params\":{},\"phonenumber\":\"13335246325\",\"postIds\":[10],\"remark\":\"hr\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":114,\"userName\":\"zeus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:29:25');
INSERT INTO `sys_oper_log` VALUES (511, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-22 17:18:18\",\"delFlag\":\"0\",\"email\":\"aem133994679@163.com\",\"loginDate\":\"2022-10-22 17:21:51\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"金河东\",\"params\":{},\"phonenumber\":\"17820337963\",\"postIds\":[10],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":131,\"userName\":\"khan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:29:33');
INSERT INTO `sys_oper_log` VALUES (512, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-26 16:17:11\",\"delFlag\":\"0\",\"email\":\"ning@163.com\",\"loginDate\":\"2022-10-26 16:20:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"高振宁\",\"params\":{},\"phonenumber\":\"16738244462\",\"postIds\":[10],\"remark\":\"hr\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":133,\"userName\":\"ning\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:29:40');
INSERT INTO `sys_oper_log` VALUES (513, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:31:26');
INSERT INTO `sys_oper_log` VALUES (514, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'mikasa', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":101,\"license\":\"/profile/upload/2022/10/15/营业执照_20221015201937A002.jpeg\",\"logo\":\"/profile/upload/2022/10/15/腾讯_20221015201926A001.jpeg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-27 19:32:40.632\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:32:40');
INSERT INTO `sys_oper_log` VALUES (515, '个人信息', 2, 'com.zeus.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'mikasa', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"createTime\":\"2022-10-14 14:01:10\",\"delFlag\":\"0\",\"email\":\"mikasa@qq.com\",\"loginIp\":\"\",\"nickName\":\"三笠\",\"params\":{},\"phonenumber\":\"13135246325\",\"remark\":\"hr\",\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":102,\"userName\":\"mikasa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:32:48');
INSERT INTO `sys_oper_log` VALUES (516, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'mikasa', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":101,\"license\":\"/profile/upload/2022/10/15/营业执照_20221015201937A002.jpeg\",\"logo\":\"/profile/upload/2022/10/15/腾讯_20221015201926A001.jpeg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-27 19:32:57.812\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:32:57');
INSERT INTO `sys_oper_log` VALUES (517, '个人信息', 2, 'com.zeus.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'mikasa', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"createTime\":\"2022-10-14 14:01:10\",\"delFlag\":\"0\",\"email\":\"mikasa@qq.com\",\"loginIp\":\"\",\"nickName\":\"三笠\",\"params\":{},\"phonenumber\":\"13135246325\",\"remark\":\"hr\",\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":102,\"userName\":\"mikasa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:33:02');
INSERT INTO `sys_oper_log` VALUES (518, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"深圳\",\"companyId\":101,\"companyName\":\"腾讯公司\",\"createBy\":\"\",\"createTime\":\"2022-10-15 20:20:14\",\"license\":\"/profile/upload/2022/10/15/营业执照_20221015201937A002.jpeg\",\"logo\":\"/profile/upload/2022/10/15/腾讯_20221015201926A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"18273816758\",\"remark\":\"腾讯于1998年11月成立,是一家互联网公司,通过技术丰富互联网用户的生活,助力企业数字化升级。我们的使命是“用户为本 科技向善”\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-27 19:33:13.334\",\"userId\":102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:33:13');
INSERT INTO `sys_oper_log` VALUES (519, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-10-14 14:01:10\",\"delFlag\":\"0\",\"email\":\"mikasa@qq.com\",\"loginDate\":\"2022-10-27 19:31:34\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"三笠\",\"params\":{},\"phonenumber\":\"13135246325\",\"postIds\":[10],\"remark\":\"hr\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"mikasa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:33:41');
INSERT INTO `sys_oper_log` VALUES (520, '角色管理', 2, 'com.zeus.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 18:01:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2061,2055,2056,2057,2058,2059,2060,2062,2063,2064,2065,2066,2067,2074,2068,2069,2070,2071,2072,2073,2075,2076,2078,2080,2087,2054,1012,1013,1014,1015,1016,1017,1018,1019,1030,1031,1032,1033,1034,500,1039,1040,1041,501,1042,1043,1044,1045,1025,1026,1027,1028,1029,107,1035,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,112,113,114,115,116,1055,1056,1057,1058,1059,1060],\"params\":{},\"remark\":\"企业用户能够管理公司，审核求职者提交的简历\",\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:34:45');
INSERT INTO `sys_oper_log` VALUES (521, '角色管理', 2, 'com.zeus.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 18:01:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2061,2055,2056,2057,2058,2059,2060,2062,2063,2064,2065,2066,2067,2074,2068,2069,2070,2071,2072,2073,2075,2076,2078,2080,2087,2054,1012,1013,1014,1015,1016,1017,1018,1019,1030,1031,1032,1033,1034,500,1039,1040,1041,501,1042,1043,1044,1045,1025,1026,1027,1028,1029,107,1035,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,112,113,114,115,116,1055,1056,1057,1058,1059,1060],\"params\":{},\"remark\":\"企业用户能够管理公司，审核求职者提交的简历\",\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:35:39');
INSERT INTO `sys_oper_log` VALUES (522, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'mikasa', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":101,\"companyName\":\"腾讯公司\",\"createTime\":\"2022-10-24 17:13:40\",\"deliveryId\":14,\"deliveryStatus\":\"1\",\"nickName\":\"李相赫\",\"params\":{},\"position\":{\"companyId\":101,\"createTime\":\"2022-10-24 17:13:40\",\"params\":{},\"positionName\":\"Go工程师\"},\"positionId\":6,\"positionName\":\"Go工程师\",\"updateTime\":\"2022-10-27 19:36:41.454\",\"userId\":113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-27 19:36:41');
INSERT INTO `sys_oper_log` VALUES (523, '菜单管理', 2, 'com.zeus.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-08-25 15:32:19\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-28 20:51:21');
INSERT INTO `sys_oper_log` VALUES (524, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'rookie', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":106,\"license\":\"/profile/upload/2022/10/30/营业执照_20221030214628A002.jpeg\",\"logo\":\"/profile/upload/2022/10/30/美团logo_20221030214620A001.jpeg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-30 21:46:31.468\",\"userId\":134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:46:31');
INSERT INTO `sys_oper_log` VALUES (525, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"北京\",\"companyId\":106,\"companyName\":\"美团\",\"createBy\":\"\",\"createTime\":\"2022-10-30 21:40:54\",\"license\":\"/profile/upload/2022/10/30/营业执照_20221030214628A002.jpeg\",\"logo\":\"/profile/upload/2022/10/30/美团logo_20221030214620A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"17860002013\",\"remark\":\"美团是一家科技零售公司。美团以“零售+科技”的战略践行“帮大家吃得更好，生活更好”的公司使命。自2010年3月成立以来，美团持续推动服务零售和商品零售在需求侧和供给侧的数字化升级，和广大合作伙伴一起努\",\"status\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2022-10-30 21:48:03.567\",\"userId\":134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:48:03');
INSERT INTO `sys_oper_log` VALUES (526, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"北京\",\"companyId\":106,\"companyName\":\"美团\",\"createBy\":\"\",\"createTime\":\"2022-10-30 21:40:54\",\"license\":\"/profile/upload/2022/10/30/营业执照_20221030214628A002.jpeg\",\"logo\":\"/profile/upload/2022/10/30/美团logo_20221030214620A001.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"17860002013\",\"remark\":\"美团是一家科技零售公司。美团以“零售+科技”的战略践行“帮大家吃得更好，生活更好”的公司使命。自2010年3月成立以来，美团持续推动服务零售和商品零售在需求侧和供给侧的数字化升级，和广大合作伙伴一起努\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-30 21:48:08.961\",\"userId\":134}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:48:08');
INSERT INTO `sys_oper_log` VALUES (527, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-30 21:40:53\",\"delFlag\":\"0\",\"email\":\"foreveraimer@qq.com\",\"loginDate\":\"2022-10-30 21:41:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"宋义进\",\"params\":{},\"phonenumber\":\"17860002013\",\"postIds\":[10],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":134,\"userName\":\"rookie\"}', '{\"msg\":\"修改用户\'rookie\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-10-30 21:48:37');
INSERT INTO `sys_oper_log` VALUES (528, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-30 21:40:53\",\"delFlag\":\"0\",\"email\":\"foreveraimer123@qq.com\",\"loginDate\":\"2022-10-30 21:41:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"宋义进\",\"params\":{},\"phonenumber\":\"17860002013\",\"postIds\":[10],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":134,\"userName\":\"rookie\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:48:56');
INSERT INTO `sys_oper_log` VALUES (529, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-21 22:41:28\",\"delFlag\":\"0\",\"email\":\"foreveraimer12@qq.com\",\"loginIp\":\"\",\"nickName\":\"谷歌\",\"params\":{},\"phonenumber\":\"19972222818\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":120,\"userName\":\"Chorme\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:51:45');
INSERT INTO `sys_oper_log` VALUES (530, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-21 22:41:28\",\"delFlag\":\"0\",\"email\":\"chorme@qq.com\",\"loginIp\":\"\",\"nickName\":\"谷歌\",\"params\":{},\"phonenumber\":\"19972222818\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":120,\"userName\":\"Chorme\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:52:01');
INSERT INTO `sys_oper_log` VALUES (531, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-21 23:16:15\",\"delFlag\":\"0\",\"email\":\"theshy@qq.com\",\"loginDate\":\"2022-10-21 23:16:39\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"姜承録\",\"params\":{},\"phonenumber\":\"18973817682\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"applicant\",\"roleName\":\"求职者\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":128,\"userName\":\"theShy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:52:12');
INSERT INTO `sys_oper_log` VALUES (532, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-26 14:22:18\",\"delFlag\":\"0\",\"email\":\"kanavi@qq.com\",\"loginDate\":\"2022-10-26 16:03:56\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"徐进赫\",\"params\":{},\"phonenumber\":\"13135246377\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"applicant\",\"roleName\":\"求职者\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":132,\"userName\":\"kanavi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:52:25');
INSERT INTO `sys_oper_log` VALUES (533, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-21 21:46:08\",\"delFlag\":\"0\",\"email\":\"firefox@qq.com\",\"loginDate\":\"2022-10-21 21:48:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"火狐狸\",\"params\":{},\"phonenumber\":\"16673332811\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"applicant\",\"roleName\":\"求职者\",\"roleSort\":\"4\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":119,\"userName\":\"FireFox\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:52:35');
INSERT INTO `sys_oper_log` VALUES (534, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"/profile/avatar/2022/10/14/blob_20221014163508A001.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2022-10-13 17:44:23\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2022-10-20 14:29:11\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"小智\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 21:53:13');
INSERT INTO `sys_oper_log` VALUES (535, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'jackeyLove', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":107,\"license\":\"/profile/upload/2022/10/30/营业执照_20221030221306A004.jpeg\",\"logo\":\"/profile/upload/2022/10/30/饿了么logo_20221030221252A003.jpeg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-30 22:13:07.973\",\"userId\":135}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 22:13:08');
INSERT INTO `sys_oper_log` VALUES (536, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyAddress\":\"上海\",\"companyId\":107,\"companyName\":\"饿了么\",\"createBy\":\"\",\"createTime\":\"2022-10-30 22:09:52\",\"license\":\"/profile/upload/2022/10/30/营业执照_20221030221306A004.jpeg\",\"logo\":\"/profile/upload/2022/10/30/饿了么logo_20221030221252A003.jpeg\",\"nature\":\"0\",\"params\":{},\"phonenumber\":\"17628106325\",\"remark\":\"“饿了么”是2008年创立的本地生活平台，主营在线外卖、新零售、即时配送和餐饮供应链等业务。创业12年，饿了么以“Everything 30min”为使命，致力于用科技打造本地生活服务平台\",\"status\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2022-10-30 22:13:29.769\",\"userId\":135}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 22:13:29');
INSERT INTO `sys_oper_log` VALUES (537, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-30 22:09:51\",\"delFlag\":\"0\",\"email\":\"yukkino@foxmail.com\",\"loginDate\":\"2022-10-30 22:11:35\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"喻文波\",\"params\":{},\"phonenumber\":\"17628106325\",\"postIds\":[10],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"no_auth_company\",\"roleName\":\"未认证企业用户\",\"roleSort\":\"5\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":135,\"userName\":\"jackeyLove\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 22:13:55');
INSERT INTO `sys_oper_log` VALUES (538, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-30 22:20:49.577\",\"description\":\"是用Vue进行开发前端页面\",\"params\":{},\"parentId\":2,\"positionId\":22,\"positionName\":\"Vue\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 22:20:49');
INSERT INTO `sys_oper_log` VALUES (539, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-30 22:25:06.019\",\"description\":\"R编程是一种专门用于解决数值/统计问题的语言。\",\"params\":{},\"parentId\":3,\"positionId\":23,\"positionName\":\"R\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-30 22:25:06');
INSERT INTO `sys_oper_log` VALUES (540, '招聘分类', 2, 'com.zeus.web.controller.recruit.RctCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-30 22:25:06\",\"description\":\"R编程是一种专门用于解决数值/统计问题的语言。\",\"params\":{},\"parentId\":4,\"positionId\":23,\"positionName\":\"R\",\"updateTime\":\"2022-10-31 08:52:06.035\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 08:52:06');
INSERT INTO `sys_oper_log` VALUES (541, '招聘分类', 2, 'com.zeus.web.controller.recruit.RctCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-15 21:03:34\",\"description\":\"使用Python语言训练Al模型\",\"params\":{},\"parentId\":4,\"positionId\":13,\"positionName\":\"Python\",\"updateTime\":\"2022-10-31 08:52:09.982\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 08:52:10');
INSERT INTO `sys_oper_log` VALUES (542, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-31 08:52:53.978\",\"description\":\"hive是基于Hadoop的一个数据仓库工具，用来进行数据提取、转化、加载，这是一种可以存储、查询和分析存储在Hadoop中的大规模数据的机制。\",\"params\":{},\"parentId\":3,\"positionId\":24,\"positionName\":\"Hive\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 08:52:54');
INSERT INTO `sys_oper_log` VALUES (543, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-31 08:55:27.698\",\"description\":\"Spark 是一种与 Hadoop 相似的开源集群计算环境，但是两者之间还存在一些不同之处，这些有用的不同之处使 Spark 在某些工作负载方面表现得更加优越，换句话说，Spark 启用了内存分布数据集，除了能够提供交互式查询外，它还可以优化迭代工作负载。\",\"params\":{},\"parentId\":3,\"positionId\":25,\"positionName\":\"Spark\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 08:55:27');
INSERT INTO `sys_oper_log` VALUES (544, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-31 08:56:07.854\",\"description\":\"Hadoop是一个由Apache基金会所开发的分布式系统基础架构。用户可以在不了解分布式底层细节的情况下，开发分布式程序。充分利用集群的威力进行高速运算和存储\",\"params\":{},\"parentId\":3,\"positionId\":26,\"positionName\":\"Hadoop\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 08:56:07');
INSERT INTO `sys_oper_log` VALUES (545, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-31 09:00:03.925\",\"description\":\"JavaScript是一种高级编程语言，通常被称为网络的“通用语言”。由于Java的广泛使用，可以了解到网站和其他应用程序如何工作的概念，以及用来抵御恶意用户的最佳设计。\",\"params\":{},\"parentId\":5,\"positionId\":27,\"positionName\":\"Javascript\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:00:03');
INSERT INTO `sys_oper_log` VALUES (546, '招聘分类', 1, 'com.zeus.web.controller.recruit.RctCategoryController.add()', 'POST', 1, 'admin', NULL, '/recruit/category', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-10-31 09:00:18.925\",\"description\":\"PHP是用于开发网站的服务器端编程语言。 由于大多数网站都是使用PHP创建的，因此学习该语言可以知道如何抵御入侵者。\",\"params\":{},\"parentId\":5,\"positionId\":28,\"positionName\":\"PHP\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:00:18');
INSERT INTO `sys_oper_log` VALUES (547, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'khan', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":104,\"createTime\":\"2022-10-31 09:17:08.69\",\"deadline\":\"2022-10-31 00:00:00\",\"maxSalary\":8000,\"minSalary\":12000,\"numbers\":20,\"params\":{},\"phone\":\"16738246564\",\"positionName\":\"java开发工程师\",\"recruitId\":7,\"requirement\":\"任职要求：\\n1、计算机相关专业,本科以上学历； \\n2、熟悉Java语言，熟悉J2EE体系架构和MVC设计模式；\\n2、熟悉Struts、Spring、Hibernate、IBatis、MyBatis\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"0\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:17:08');
INSERT INTO `sys_oper_log` VALUES (548, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'khan', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:17:09\",\"params\":{},\"positionName\":\"java开发工程师\"},\"company\":{\"companyId\":104,\"createTime\":\"2022-10-31 09:17:09\",\"params\":{},\"status\":\"0\"},\"companyId\":104,\"createTime\":\"2022-10-31 09:17:09\",\"deadline\":\"2022-10-31 00:00:00\",\"maxSalary\":8000,\"minSalary\":12000,\"numbers\":20,\"params\":{},\"phone\":\"16738246564\",\"positionName\":\"java开发工程师\",\"recruitId\":7,\"requirement\":\"岗位职责：\\n1、完成直接主管下达的研发任务，按研发规范提交最终成果；\\n2、能根据设计方案和计划进行编码实现，在进度和质量上符合方案和计划要求。\\n任职要求：\\n1、计算机相关专业,本科以上学历； \\n2、熟悉Java语言，熟悉J2EE体系架构和MVC设计模式；\\n2、熟悉Struts、Spring、Hibernate、IBatis、MyBatis等主流开发框架；\\n3、熟悉使用Java、JSP、HTML、Java Script、XML等常用编程语言进行开发； \\n5、掌握Oracle、SQLServer、MySQL等至少一种数据库的应用开发与日常管理。\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"0\",\"updateTime\":\"2022-10-31 09:17:55.224\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:17:55');
INSERT INTO `sys_oper_log` VALUES (549, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:17:09\",\"params\":{},\"positionName\":\"java开发工程师\",\"updateTime\":\"2022-10-31 09:17:55\"},\"company\":{\"companyId\":104,\"createTime\":\"2022-10-31 09:17:09\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2022-10-31 09:17:55\"},\"companyId\":104,\"createTime\":\"2022-10-31 09:17:09\",\"deadline\":\"2022-10-31 00:00:00\",\"maxSalary\":8000,\"minSalary\":12000,\"numbers\":20,\"params\":{},\"phone\":\"16738246564\",\"positionName\":\"java开发工程师\",\"recruitId\":7,\"requirement\":\"岗位职责：\\n1、完成直接主管下达的研发任务，按研发规范提交最终成果；\\n2、能根据设计方案和计划进行编码实现，在进度和质量上符合方案和计划要求。\\n任职要求：\\n1、计算机相关专业,本科以上学历； \\n2、熟悉Java语言，熟悉J2EE体系架构和MVC设计模式；\\n2、熟悉Struts、Spring、Hibernate、IBatis、MyBatis等主流开发框架；\\n3、熟悉使用Java、JSP、HTML、Java Script、XML等常用编程语言进行开发； \\n5、掌握Oracle、SQLServer、MySQL等至少一种数据库的应用开发与日常管理。\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:19:09.875\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:19:09');
INSERT INTO `sys_oper_log` VALUES (550, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'khan', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":104,\"createTime\":\"2022-10-31 09:20:21.841\",\"deadline\":\"2022-10-29 00:00:00\",\"maxSalary\":4000,\"minSalary\":7000,\"numbers\":10,\"params\":{},\"phone\":\"13762534655\",\"positionName\":\"Java开发实习生\",\"recruitId\":8,\"requirement\":\"任职要求\\n1、计算机相关专业全日制本科，应届毕业生；\\n2、有一定的linux和Java基础，有Java开发实习经验优先， 了解JVM调试工具、linux调试工具；\\n3、了解UML建模、常用设计模式；\\n4、熟悉Spring cloud/SpringBoot/Mybatis等框架， 对网络、IO、多线程、高并发等有实践经验；\\n5、熟悉MySQL、Redis、activeMQ、kafka等常见存储系统/组件的使用， 有深入了解相关组件底层模型和优化经验者优先\\n6、有Spark/HBase/Elasticsearch/Presto/Kylin等大数据相关的开发经验者优先；\",\"startTime\":\"2022-10-12 00:00:00\",\"status\":\"0\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:20:21');
INSERT INTO `sys_oper_log` VALUES (551, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'khan', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":104,\"createTime\":\"2022-10-31 09:22:41.795\",\"deadline\":\"2022-11-02 00:00:00\",\"maxSalary\":7000,\"minSalary\":12000,\"numbers\":10,\"params\":{},\"phone\":\"18748927001\",\"positionName\":\"Java主程\",\"recruitId\":9,\"requirement\":\"1.完成平台框架搭建，组织协调完成PC、小程序、APP的开发计划\\n2.监听所有硬件设备的实时在线监听工作和离线状态微信推送\\n3.前后端分离，沟通协调完成整理目标\\n4.具有SAAS平台的开发经验优先\\n5.至少有3年以上开发经验（低于3年经验，有信心承担后台工作的可以自荐）\\n6.有软硬件交互经验的优先\\n7.具备安卓开发经验的优先\\n8.懂前端有经验的优先\\n9.有从0-1项目开发经验的优先\\n10.能独立完成项目的优先\",\"startTime\":\"2022-10-04 00:00:00\",\"status\":\"0\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:22:41');
INSERT INTO `sys_oper_log` VALUES (552, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:20:22\",\"params\":{},\"positionName\":\"Java开发实习生\"},\"company\":{\"companyId\":104,\"createTime\":\"2022-10-31 09:20:22\",\"params\":{},\"status\":\"0\"},\"companyId\":104,\"createTime\":\"2022-10-31 09:20:22\",\"deadline\":\"2022-10-29 00:00:00\",\"maxSalary\":4000,\"minSalary\":7000,\"numbers\":10,\"params\":{},\"phone\":\"13762534655\",\"positionName\":\"Java开发实习生\",\"recruitId\":8,\"requirement\":\"任职要求\\n1、计算机相关专业全日制本科，应届毕业生；\\n2、有一定的linux和Java基础，有Java开发实习经验优先， 了解JVM调试工具、linux调试工具；\\n3、了解UML建模、常用设计模式；\\n4、熟悉Spring cloud/SpringBoot/Mybatis等框架， 对网络、IO、多线程、高并发等有实践经验；\\n5、熟悉MySQL、Redis、activeMQ、kafka等常见存储系统/组件的使用， 有深入了解相关组件底层模型和优化经验者优先\\n6、有Spark/HBase/Elasticsearch/Presto/Kylin等大数据相关的开发经验者优先；\",\"startTime\":\"2022-10-12 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:23:04.446\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:23:04');
INSERT INTO `sys_oper_log` VALUES (553, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:22:42\",\"params\":{},\"positionName\":\"Java主程\"},\"company\":{\"companyId\":104,\"createTime\":\"2022-10-31 09:22:42\",\"params\":{},\"status\":\"0\"},\"companyId\":104,\"createTime\":\"2022-10-31 09:22:42\",\"deadline\":\"2022-11-02 00:00:00\",\"maxSalary\":7000,\"minSalary\":12000,\"numbers\":10,\"params\":{},\"phone\":\"18748927001\",\"positionName\":\"Java主程\",\"recruitId\":9,\"requirement\":\"1.完成平台框架搭建，组织协调完成PC、小程序、APP的开发计划\\n2.监听所有硬件设备的实时在线监听工作和离线状态微信推送\\n3.前后端分离，沟通协调完成整理目标\\n4.具有SAAS平台的开发经验优先\\n5.至少有3年以上开发经验（低于3年经验，有信心承担后台工作的可以自荐）\\n6.有软硬件交互经验的优先\\n7.具备安卓开发经验的优先\\n8.懂前端有经验的优先\\n9.有从0-1项目开发经验的优先\\n10.能独立完成项目的优先\",\"startTime\":\"2022-10-04 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:23:07.358\",\"workCity\":\"广州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:23:07');
INSERT INTO `sys_oper_log` VALUES (554, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'ning', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":105,\"createTime\":\"2022-10-31 09:33:32.351\",\"deadline\":\"2022-10-25 00:00:00\",\"maxSalary\":15000,\"minSalary\":30000,\"numbers\":15,\"params\":{},\"phone\":\"18273886822\",\"positionName\":\"C++算法工程师\",\"recruitId\":10,\"requirement\":\"岗位职责：\\n1、研究TET,HEX等网格生成及算法，实现和完善三维模型网格剖分相关问题；\\n2、负责网格算法相关的技术合作项目；\\n4、研究和完善nurbs模型和mesh模型的几何错误修复。\\n岗位要求：\\n1、硕士以上学历，计算机科学与技术、软件工程、机械工程及自动化、计算数学、应用数学、电子科学与技术等理工科相关专业；\\n2、掌握C/C++编程语言；具备有限元基础理论知识；\\n3、了解TET，HEX等网格生成算法，修补算法。\",\"startTime\":\"2022-09-02 00:00:00\",\"status\":\"0\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:33:32');
INSERT INTO `sys_oper_log` VALUES (555, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'ning', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":105,\"createTime\":\"2022-10-31 09:35:14.798\",\"deadline\":\"2022-10-27 00:00:00\",\"maxSalary\":5000,\"minSalary\":7000,\"numbers\":10,\"params\":{},\"phone\":\"16764282713\",\"positionName\":\"PHP实习生\",\"recruitId\":11,\"requirement\":\"岗位描述：\\n1、负责微信、支付宝、银联等第三方接口的研发工作\\n2、负责公司 saas 系统（会员积分、营销卡券、在线商城、数据报表）的研发工作\\n岗位要求：\\n1．精通 PHP 编程，至少熟练使用过一种 PHP 主流开发框架如： Laravel 、 Thinkphp 等\\n2．熟练使用 Linux 系统， Shell脚本，熟悉 Nginx 配置及优化\\n3．熟悉 Mysql 能够编写 SQL 和对已有 SQL 语句进行优化。熟悉 Redis 各种数据类型及使用场景\\n4．具备良好的编程习惯，熟练掌握 OOP 编程和常见设计模式\\n5．具备团队开发经验，熟练掌握 SVN 、Git 等常见工具的使用\",\"startTime\":\"2022-10-01 00:00:00\",\"status\":\"0\",\"workCity\":\"杭州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:35:14');
INSERT INTO `sys_oper_log` VALUES (556, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'ning', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"companyId\":105,\"createTime\":\"2022-10-31 09:40:48.78\",\"deadline\":\"2022-10-28 00:00:00\",\"maxSalary\":15000,\"minSalary\":30000,\"numbers\":10,\"params\":{},\"phone\":\"18273846677\",\"positionName\":\"hadoop大数据开发工程师\",\"recruitId\":12,\"requirement\":\"岗位要求\\n1、计算机相关专业，3年以上大数据处理相关工作经验；\\n2、熟悉Java和Scala开发体系，扎实的编程基础、优秀的编码能力、对代码质量有极致的追求；\\n3、熟悉Spark、Flink、Kafka、Clickhouse、Hbase、HDFS、Yarn、Hive、Mapreduce、Redis原理，有丰富的项目开发经验；\\n4、对数据处理、数据建模、数据分析等有深刻认识和实战经验，主导过相关技术中台、数据中台建设者优先；\\n5、具有良好的算法及数据结构基础，具备海量数据处理经验，从事过互联网大规模计算、大数据处理者优先；\\n6、具备数据仓库领域知识和技能者优先，包括但不局限于：数据建模、元数据管\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"0\",\"workCity\":\"苏州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:40:48');
INSERT INTO `sys_oper_log` VALUES (557, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'ning', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:40:49\",\"params\":{},\"positionName\":\"hadoop大数据开发工程师\"},\"company\":{\"companyId\":105,\"createTime\":\"2022-10-31 09:40:49\",\"params\":{},\"status\":\"0\"},\"companyId\":105,\"createTime\":\"2022-10-31 09:40:49\",\"deadline\":\"2022-10-28 00:00:00\",\"maxSalary\":15000,\"minSalary\":30000,\"numbers\":10,\"params\":{},\"phone\":\"18273846677\",\"positionName\":\"hadoop大数据开发工程师\",\"recruitId\":12,\"requirement\":\"岗位要求\\n1、计算机相关专业，3年以上大数据处理相关工作经验；\\n2、熟悉Java和Scala开发体系，扎实的编程基础、优秀的编码能力、对代码质量有极致的追求；\\n3、熟悉Spark、Flink、Kafka、Clickhouse、Hbase、HDFS、Yarn、Hive、Mapreduce、Redis原理，有丰富的项目开发经验；\\n4、对数据处理、数据建模、数据分析等有深刻认识和实战经验，主导过相关技术中台、数据中台建设者优先；\\n5、具有良好的算法及数据结构基础，具备海量数据处理经验，从事过互联网大规模计算、大数据处理者优先；\\n6、具备数据仓库领域知识和技能者优先，包括但不局限于：数据建模、元数据管理、数据开发测试工具与方法、数据质量管理；\\n7、熟练使用maven/gradle、git等项目管理工具；\\n8、熟悉Java后端开发、Spring boot、Hibernate/Mybatis的优先考虑；\\n9、具有快速定位问题的能力和较强的学习能力；\\n10、能自我驱动，有较强的沟通能力及团队合作精神，强烈的责任感及进取精神。\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"0\",\"updateTime\":\"2022-10-31 09:41:32.43\",\"workCity\":\"苏州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:41:32');
INSERT INTO `sys_oper_log` VALUES (558, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:33:32\",\"params\":{},\"positionName\":\"C++算法工程师\"},\"categoryId\":9,\"company\":{\"companyId\":105,\"createTime\":\"2022-10-31 09:33:32\",\"params\":{},\"status\":\"0\"},\"companyId\":105,\"createTime\":\"2022-10-31 09:33:32\",\"deadline\":\"2022-10-25 00:00:00\",\"maxSalary\":15000,\"minSalary\":30000,\"numbers\":15,\"params\":{},\"phone\":\"18273886822\",\"positionName\":\"C++算法工程师\",\"recruitId\":10,\"requirement\":\"岗位职责：\\n1、研究TET,HEX等网格生成及算法，实现和完善三维模型网格剖分相关问题；\\n2、负责网格算法相关的技术合作项目；\\n4、研究和完善nurbs模型和mesh模型的几何错误修复。\\n岗位要求：\\n1、硕士以上学历，计算机科学与技术、软件工程、机械工程及自动化、计算数学、应用数学、电子科学与技术等理工科相关专业；\\n2、掌握C/C++编程语言；具备有限元基础理论知识；\\n3、了解TET，HEX等网格生成算法，修补算法。\",\"startTime\":\"2022-09-02 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:42:01.109\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:42:01');
INSERT INTO `sys_oper_log` VALUES (559, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:40:49\",\"params\":{},\"positionName\":\"hadoop大数据开发工程师\",\"updateTime\":\"2022-10-31 09:41:32\"},\"company\":{\"companyId\":105,\"createTime\":\"2022-10-31 09:40:49\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2022-10-31 09:41:32\"},\"companyId\":105,\"createTime\":\"2022-10-31 09:40:49\",\"deadline\":\"2022-10-28 00:00:00\",\"maxSalary\":15000,\"minSalary\":30000,\"numbers\":10,\"params\":{},\"phone\":\"18273846677\",\"positionName\":\"hadoop大数据开发工程师\",\"recruitId\":12,\"requirement\":\"岗位要求\\n1、计算机相关专业，3年以上大数据处理相关工作经验；\\n2、熟悉Java和Scala开发体系，扎实的编程基础、优秀的编码能力、对代码质量有极致的追求；\\n3、熟悉Spark、Flink、Kafka、Clickhouse、Hbase、HDFS、Yarn、Hive、Mapreduce、Redis原理，有丰富的项目开发经验；\\n4、对数据处理、数据建模、数据分析等有深刻认识和实战经验，主导过相关技术中台、数据中台建设者优先；\\n5、具有良好的算法及数据结构基础，具备海量数据处理经验，从事过互联网大规模计算、大数据处理者优先；\\n6、具备数据仓库领域知识和技能者优先，包括但不局限于：数据建模、元数据管理、数据开发测试工具与方法、数据质量管理；\\n7、熟练使用maven/gradle、git等项目管理工具；\\n8、熟悉Java后端开发、Spring boot、Hibernate/Mybatis的优先考虑；\\n9、具有快速定位问题的能力和较强的学习能力；\\n10、能自我驱动，有较强的沟通能力及团队合作精神，强烈的责任感及进取精神。\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:42:05.934\",\"workCity\":\"苏州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:42:05');
INSERT INTO `sys_oper_log` VALUES (560, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 09:35:15\",\"params\":{},\"positionName\":\"PHP实习生\"},\"categoryId\":28,\"company\":{\"companyId\":105,\"createTime\":\"2022-10-31 09:35:15\",\"params\":{},\"status\":\"0\"},\"companyId\":105,\"createTime\":\"2022-10-31 09:35:15\",\"deadline\":\"2022-10-27 00:00:00\",\"maxSalary\":5000,\"minSalary\":7000,\"numbers\":10,\"params\":{},\"phone\":\"16764282713\",\"positionName\":\"PHP实习生\",\"recruitId\":11,\"requirement\":\"岗位描述：\\n1、负责微信、支付宝、银联等第三方接口的研发工作\\n2、负责公司 saas 系统（会员积分、营销卡券、在线商城、数据报表）的研发工作\\n岗位要求：\\n1．精通 PHP 编程，至少熟练使用过一种 PHP 主流开发框架如： Laravel 、 Thinkphp 等\\n2．熟练使用 Linux 系统， Shell脚本，熟悉 Nginx 配置及优化\\n3．熟悉 Mysql 能够编写 SQL 和对已有 SQL 语句进行优化。熟悉 Redis 各种数据类型及使用场景\\n4．具备良好的编程习惯，熟练掌握 OOP 编程和常见设计模式\\n5．具备团队开发经验，熟练掌握 SVN 、Git 等常见工具的使用\",\"startTime\":\"2022-10-01 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 09:42:08.514\",\"workCity\":\"杭州\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 09:42:08');
INSERT INTO `sys_oper_log` VALUES (561, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-30 21:40:53\",\"delFlag\":\"0\",\"email\":\"foreveraimer123@qq.com\",\"loginDate\":\"2022-10-30 21:50:16\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"宋义进\",\"params\":{},\"phonenumber\":\"17860002013\",\"postIds\":[10],\"remark\":\"hr\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":134,\"userName\":\"rookie\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:02:46');
INSERT INTO `sys_oper_log` VALUES (562, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-22 17:18:18\",\"delFlag\":\"0\",\"email\":\"aem133994679@163.com\",\"loginDate\":\"2022-10-31 09:08:51\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"金河东\",\"params\":{},\"phonenumber\":\"17820337963\",\"postIds\":[10],\"remark\":\"hr\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":131,\"userName\":\"khan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:02:49');
INSERT INTO `sys_oper_log` VALUES (563, '用户管理', 2, 'com.zeus.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-10-30 22:09:51\",\"delFlag\":\"0\",\"email\":\"yukkino@foxmail.com\",\"loginDate\":\"2022-10-30 22:15:49\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"喻文波\",\"params\":{},\"phonenumber\":\"17628106325\",\"postIds\":[10],\"remark\":\"ceo\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":135,\"userName\":\"jackeyLove\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:02:56');
INSERT INTO `sys_oper_log` VALUES (564, '通知公告', 2, 'com.zeus.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-08-25 15:32:19\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 EKKO新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:16:23');
INSERT INTO `sys_oper_log` VALUES (565, '通知公告', 2, 'com.zeus.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-08-25 15:32:19\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2018-07-01 EKKO后台系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:16:31');
INSERT INTO `sys_oper_log` VALUES (566, '通知公告', 2, 'com.zeus.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-08-25 15:32:19\",\"noticeContent\":\"<p>新版本内容</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2022-10-21 EKKO新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-31 10:16:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:16:42');
INSERT INTO `sys_oper_log` VALUES (567, '通知公告', 2, 'com.zeus.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-08-25 15:32:19\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2022-10-31 EKKO后台系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-31 10:16:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:16:51');
INSERT INTO `sys_oper_log` VALUES (568, '招聘岗位', 1, 'com.zeus.web.controller.recruit.RctPositionController.add()', 'POST', 1, 'rookie', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"companyId\":106,\"createTime\":\"2022-10-31 10:23:31.408\",\"deadline\":\"2022-10-27 00:00:00\",\"maxSalary\":4000,\"minSalary\":7000,\"numbers\":20,\"params\":{},\"phone\":\"17273642818\",\"positionName\":\"(Python)爬虫工程师实习生\",\"recruitId\":13,\"requirement\":\"岗位职责：\\n1、负责各类电商、新闻、社交平台和app端数据抓取；\\n2、负责移动应用的逆向分析与开发，完成高质量编码和测试工作；\\n3、参与项目重点、难点模块的技术攻关；\\n4、参与终端项目的架构与优化；\\n任职要求：\\n1、本科及以上学历，计算机相关专业，23年应届毕业生；\\n2、熟悉linux平台，掌握Python/java/shell/http协议，熟悉HTML、DOM、XPath，了解git、maven、svn等工具和实践，注重工程规范；\\n3、了解app端数据抓取（有逆向、脱壳等经验），了解Apktool、dex2jar、JD-GUI等工具；\\n4、有Android应用开发经验/iOS逆向经验者优先；\\n5、了解x86/x64/arm架构的反汇编技术；\\n6、性格开朗、善于沟通，有良好的自我驱动学习能力，注重效率和团队意识。\",\"startTime\":\"2022-10-01 00:00:00\",\"status\":\"0\",\"workCity\":\"济南\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:23:31');
INSERT INTO `sys_oper_log` VALUES (569, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 10:23:31\",\"params\":{},\"positionName\":\"(Python)爬虫工程师实习生\"},\"categoryId\":13,\"company\":{\"companyId\":106,\"createTime\":\"2022-10-31 10:23:31\",\"params\":{},\"status\":\"0\"},\"companyId\":106,\"createTime\":\"2022-10-31 10:23:31\",\"deadline\":\"2022-10-27 00:00:00\",\"maxSalary\":4000,\"minSalary\":7000,\"numbers\":20,\"params\":{},\"phone\":\"17273642818\",\"positionName\":\"(Python)爬虫工程师实习生\",\"recruitId\":13,\"requirement\":\"岗位职责：\\n1、负责各类电商、新闻、社交平台和app端数据抓取；\\n2、负责移动应用的逆向分析与开发，完成高质量编码和测试工作；\\n3、参与项目重点、难点模块的技术攻关；\\n4、参与终端项目的架构与优化；\\n任职要求：\\n1、本科及以上学历，计算机相关专业，23年应届毕业生；\\n2、熟悉linux平台，掌握Python/java/shell/http协议，熟悉HTML、DOM、XPath，了解git、maven、svn等工具和实践，注重工程规范；\\n3、了解app端数据抓取（有逆向、脱壳等经验），了解Apktool、dex2jar、JD-GUI等工具；\\n4、有Android应用开发经验/iOS逆向经验者优先；\\n5、了解x86/x64/arm架构的反汇编技术；\\n6、性格开朗、善于沟通，有良好的自我驱动学习能力，注重效率和团队意识。\",\"startTime\":\"2022-10-01 00:00:00\",\"status\":\"0\",\"updateTime\":\"2022-10-31 10:45:20.889\",\"workCity\":\"济南\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:45:20');
INSERT INTO `sys_oper_log` VALUES (570, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-31 10:23:31\",\"params\":{},\"positionName\":\"(Python)爬虫工程师实习生\",\"updateTime\":\"2022-10-31 10:45:21\"},\"categoryId\":13,\"company\":{\"companyId\":106,\"createTime\":\"2022-10-31 10:23:31\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2022-10-31 10:45:21\"},\"companyId\":106,\"createTime\":\"2022-10-31 10:23:31\",\"deadline\":\"2022-10-27 00:00:00\",\"maxSalary\":4000,\"minSalary\":7000,\"numbers\":20,\"params\":{},\"phone\":\"17273642818\",\"positionName\":\"(Python)爬虫工程师实习生\",\"recruitId\":13,\"requirement\":\"岗位职责：\\n1、负责各类电商、新闻、社交平台和app端数据抓取；\\n2、负责移动应用的逆向分析与开发，完成高质量编码和测试工作；\\n3、参与项目重点、难点模块的技术攻关；\\n4、参与终端项目的架构与优化；\\n任职要求：\\n1、本科及以上学历，计算机相关专业，23年应届毕业生；\\n2、熟悉linux平台，掌握Python/java/shell/http协议，熟悉HTML、DOM、XPath，了解git、maven、svn等工具和实践，注重工程规范；\\n3、了解app端数据抓取（有逆向、脱壳等经验），了解Apktool、dex2jar、JD-GUI等工具；\\n4、有Android应用开发经验/iOS逆向经验者优先；\\n5、了解x86/x64/arm架构的反汇编技术；\\n6、性格开朗、善于沟通，有良好的自我驱动学习能力，注重效率和团队意识。\",\"startTime\":\"2022-10-01 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 10:45:23.219\",\"workCity\":\"济南\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:45:23');
INSERT INTO `sys_oper_log` VALUES (571, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":100,\"companyName\":\"网易公司\",\"createTime\":\"2022-10-25 19:15:23\",\"deliveryId\":15,\"deliveryStatus\":\"1\",\"nickName\":\"李相赫\",\"params\":{},\"position\":{\"companyId\":100,\"createTime\":\"2022-10-25 19:15:23\",\"params\":{},\"positionName\":\"Java工程师\"},\"positionId\":1,\"positionName\":\"Java工程师\",\"updateTime\":\"2022-10-31 10:46:12.437\",\"userId\":113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:46:12');
INSERT INTO `sys_oper_log` VALUES (572, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":104,\"companyName\":\"三星集团\",\"createTime\":\"2022-10-31 10:41:47\",\"deliveryId\":16,\"deliveryStatus\":\"1\",\"nickName\":\"白家浩\",\"params\":{},\"position\":{\"companyId\":104,\"createTime\":\"2022-10-31 10:41:47\",\"params\":{},\"positionName\":\"Java主程\"},\"positionId\":9,\"positionName\":\"Java主程\",\"updateTime\":\"2022-10-31 10:46:15.054\",\"userId\":117}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:46:15');
INSERT INTO `sys_oper_log` VALUES (573, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":105,\"companyName\":\"阿里巴巴集团\",\"createTime\":\"2022-10-31 10:41:54\",\"deliveryId\":17,\"deliveryStatus\":\"1\",\"nickName\":\"白家浩\",\"params\":{},\"position\":{\"companyId\":105,\"createTime\":\"2022-10-31 10:41:54\",\"params\":{},\"positionName\":\"PHP实习生\"},\"positionId\":11,\"positionName\":\"PHP实习生\",\"updateTime\":\"2022-10-31 10:46:17.133\",\"userId\":117}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:46:17');
INSERT INTO `sys_oper_log` VALUES (574, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"companyId\":104,\"companyName\":\"三星集团\",\"createTime\":\"2022-10-31 10:45:55\",\"deliveryId\":18,\"deliveryStatus\":\"1\",\"nickName\":\"白家浩\",\"params\":{},\"position\":{\"companyId\":104,\"createTime\":\"2022-10-31 10:45:55\",\"params\":{},\"positionName\":\"java开发工程师\"},\"positionId\":7,\"positionName\":\"java开发工程师\",\"updateTime\":\"2022-10-31 10:46:20.057\",\"userId\":117}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 10:46:20');
INSERT INTO `sys_oper_log` VALUES (575, '用户管理', 5, 'com.zeus.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userType\":\"11\"}', NULL, 0, NULL, '2022-10-31 10:48:34');
INSERT INTO `sys_oper_log` VALUES (576, '用户管理', 5, 'com.zeus.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userType\":\"11\"}', NULL, 0, NULL, '2022-10-31 11:38:42');
INSERT INTO `sys_oper_log` VALUES (577, '用户管理', 5, 'com.zeus.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userType\":\"12\"}', NULL, 0, NULL, '2022-10-31 11:39:09');
INSERT INTO `sys_oper_log` VALUES (578, '用户管理', 5, 'com.zeus.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userType\":\"10\"}', NULL, 0, NULL, '2022-10-31 11:39:36');
INSERT INTO `sys_oper_log` VALUES (579, '用户管理', 5, 'com.zeus.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"},\"userType\":\"11\"}', NULL, 0, NULL, '2022-10-31 11:40:04');
INSERT INTO `sys_oper_log` VALUES (580, '角色管理', 2, 'com.zeus.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-27 18:01:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2061,2055,2056,2057,2058,2059,2060,2062,2063,2067,2074,2068,2069,2070,2071,2072,2073,2075,2076,2078,2080,2087,2054,1012,1013,1014,1015,1016,1017,1018,1019,1030,1031,1032,1033,1034,500,1039,1040,1041,501,1042,1043,1044,1045,1025,1026,1027,1028,1029,107,1035,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,112,113,114,115,116,1055,1056,1057,1058,1059,1060],\"params\":{},\"remark\":\"企业用户能够管理公司，审核求职者提交的简历\",\"roleId\":100,\"roleKey\":\"auth_company\",\"roleName\":\"已认证企业用户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 13:29:49');
INSERT INTO `sys_oper_log` VALUES (581, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"deliveryId\":12,\"deliveryStatus\":\"2\",\"params\":{},\"updateTime\":\"2022-10-31 13:44:29.534\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 13:44:29');
INSERT INTO `sys_oper_log` VALUES (582, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'admin', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"deliveryId\":12,\"deliveryStatus\":\"1\",\"params\":{},\"updateTime\":\"2022-10-31 13:44:32.137\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 13:44:32');
INSERT INTO `sys_oper_log` VALUES (583, '简历投递信息', 3, 'com.zeus.web.controller.recruit.RctDeliveryController.remove()', 'DELETE', 1, 'jdg369', NULL, '/recruit/delivery/15', '127.0.0.1', '内网IP', '{deliveryIds=15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 15:04:47');
INSERT INTO `sys_oper_log` VALUES (584, '用户头像', 2, 'com.zeus.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'jdg369', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2022/10/31/blob_20221031150618A001.jpeg\",\"code\":200}', 0, NULL, '2022-10-31 15:06:18');
INSERT INTO `sys_oper_log` VALUES (585, '简历信息', 2, 'com.zeus.web.controller.recruit.RctResumeController.edit()', 'PUT', 1, 'jdg369', NULL, '/recruit/resume', '127.0.0.1', '内网IP', '{\"params\":{},\"resumeFile\":\"\",\"resumeId\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 15:07:51');
INSERT INTO `sys_oper_log` VALUES (586, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":100,\"license\":\"/profile/upload/2022/10/15/营业执照_20221015173633A001.jpeg\",\"logo\":\"/profile/upload/2022/10/31/网易Logo_20221031151252A002.jpg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-31 15:12:53.825\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 15:12:53');
INSERT INTO `sys_oper_log` VALUES (587, '简历投递信息', 2, 'com.zeus.web.controller.recruit.RctDeliveryController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/delivery', '127.0.0.1', '内网IP', '{\"deliveryId\":19,\"deliveryStatus\":\"1\",\"params\":{},\"updateTime\":\"2022-10-31 15:14:50.8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 15:14:50');
INSERT INTO `sys_oper_log` VALUES (588, '企业信息', 2, 'com.zeus.web.controller.recruit.RctCompanyController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/company', '127.0.0.1', '内网IP', '{\"companyId\":100,\"license\":\"/profile/upload/2022/10/15/营业执照_20221015173633A001.jpeg\",\"logo\":\"/profile/upload/2022/10/31/网易Logo_20221031153004A004.jpg\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-31 15:30:05.912\",\"userId\":114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 15:30:05');
INSERT INTO `sys_oper_log` VALUES (589, '简历投递信息', 3, 'com.zeus.web.controller.recruit.RctDeliveryController.remove()', 'DELETE', 1, 'jdg369', NULL, '/recruit/delivery/11', '127.0.0.1', '内网IP', '{deliveryIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 16:13:32');
INSERT INTO `sys_oper_log` VALUES (590, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"positionName\":\"React工程师\",\"updateTime\":\"2022-10-19 14:43:41\"},\"categoryId\":11,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-19 14:43:41\"},\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"deadline\":\"2022-11-23 00:00:00\",\"maxSalary\":18000,\"minSalary\":13000,\"numbers\":20,\"params\":{},\"phone\":\"13135246325\",\"positionName\":\"React工程师\",\"recruitId\":4,\"requirement\":\"<p>1.计算机或相关专业，大专以上学历，3年以上前端开发工作经验；</p><p>2.能对系统前端的性能、架构进行深入优化，提高系统性能、可靠性及可扩展性；</p><p>3.熟悉UI设计开发，熟悉canvas 或svg 动画开发经验优先；</p><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">4.有实际的React2年以上经验优先；对React生态熟悉者优先，熟悉redux、hooks 者优先。\\n</pre><p>5.具有良好的代码风格、接口设计与程序架构，对前端工程化有深入实践者优先；</p><p>6.较强的学习能力，良好的沟通能力，具备良好的知识沉淀习惯，有技术博客撰写，github开源项目者优先。</p><p>7.可以尽快到岗优先。</p>\",\"startTime\":\"2022-10-25 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 16:53:21.454\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 16:53:21');
INSERT INTO `sys_oper_log` VALUES (591, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"positionName\":\"React工程师\",\"updateTime\":\"2022-10-31 16:53:21\"},\"categoryId\":11,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-31 16:53:21\"},\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"deadline\":\"2022-11-23 00:00:00\",\"maxSalary\":18000,\"minSalary\":13000,\"numbers\":20,\"params\":{},\"phone\":\"13135246325\",\"positionName\":\"React工程师\",\"recruitId\":4,\"requirement\":\"<p>1.计算机或相关专业，大专以上学历，3年以上前端开发工作经验；</p><p>2.能对系统前端的性能、架构进行深入优化，提高系统性能、可靠性及可扩展性；</p><p>3.熟悉UI设计开发，熟悉canvas 或svg 动画开发经验优先；</p><p><br></p><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">4.有实际的React2年以上经验优先；对React生态熟悉者优先，熟悉redux、hooks 者优先。\\n</pre><p>5.具有良好的代码风格、接口设计与程序架构，对前端工程化有深入实践者优先；</p><p>6.较强的学习能力，良好的沟通能力，具备良好的知识沉淀习惯，有技术博客撰写，github开源项目者优先。</p><p>7.可以尽快到岗优先。</p>\",\"startTime\":\"2022-10-25 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 16:55:54.419\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 16:55:54');
INSERT INTO `sys_oper_log` VALUES (592, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"positionName\":\"React工程师\",\"updateTime\":\"2022-10-31 16:55:54\"},\"categoryId\":11,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-31 16:55:54\"},\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"deadline\":\"2022-11-23 00:00:00\",\"maxSalary\":18000,\"minSalary\":13000,\"numbers\":20,\"params\":{},\"phone\":\"13135246325\",\"positionName\":\"React工程师\",\"recruitId\":4,\"requirement\":\"<p>1.计算机或相关专业，大专以上学历，3年以上前端开发工作经验；</p><p>2.能对系统前端的性能、架构进行深入优化，提高系统性能、可靠性及可扩展性；</p><p>3.熟悉UI设计开发，熟悉canvas 或svg 动画开发经验优先；</p><p><br></p><p><br></p><p>4.有实际的React2年以上经验优先；对React生态熟悉者优先，熟悉redux、hooks 者优先。</p><p>5.具有良好的代码风格、接口设计与程序架构，对前端工程化有深入实践者优先；</p><p>6.较强的学习能力，良好的沟通能力，具备良好的知识沉淀习惯，有技术博客撰写，github开源项目者优先。</p><p>7.可以尽快到岗优先。</p>\",\"startTime\":\"2022-10-25 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 17:01:21.47\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 17:01:21');
INSERT INTO `sys_oper_log` VALUES (593, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"positionName\":\"React工程师\",\"updateTime\":\"2022-10-31 17:01:21\"},\"categoryId\":11,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-31 17:01:21\"},\"companyId\":100,\"createTime\":\"2022-10-17 15:26:02\",\"deadline\":\"2022-11-23 00:00:00\",\"maxSalary\":18000,\"minSalary\":13000,\"numbers\":20,\"params\":{},\"phone\":\"13135246325\",\"positionName\":\"React工程师\",\"recruitId\":4,\"requirement\":\"<p>1.计算机或相关专业，大专以上学历，3年以上前端开发工作经验；</p><p>2.能对系统前端的性能、架构进行深入优化，提高系统性能、可靠性及可扩展性；</p><p>3.熟悉UI设计开发，熟悉canvas 或svg 动画开发经验优先；</p><p>4.有实际的React2年以上经验优先；对React生态熟悉者优先，熟悉redux、hooks 者优先。</p><p>5.具有良好的代码风格、接口设计与程序架构，对前端工程化有深入实践者优先；</p><p>6.较强的学习能力，良好的沟通能力，具备良好的知识沉淀习惯，有技术博客撰写，github开源项目者优先。</p><p>7.可以尽快到岗优先。</p>\",\"startTime\":\"2022-10-25 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 17:01:27.822\",\"workCity\":\"北京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 17:01:27');
INSERT INTO `sys_oper_log` VALUES (594, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-16 17:19:03\",\"params\":{},\"positionName\":\"C++工程师\",\"updateTime\":\"2022-10-26 11:22:46\"},\"categoryId\":9,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-16 17:19:03\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-26 11:22:46\"},\"companyId\":100,\"createTime\":\"2022-10-16 17:19:03\",\"deadline\":\"2022-10-19 00:00:00\",\"maxSalary\":19000,\"minSalary\":10000,\"numbers\":20,\"params\":{},\"phone\":\"16670002910\",\"positionName\":\"C++工程师\",\"recruitId\":2,\"requirement\":\"<p>1、可以熟练使用c/c++ 开发语言，精通windows下多线程多进程开发；</p><p><br></p><p>2、根据项目计划，在保质保量的前提下，按时完成开发任务；</p><p><br></p><p>3、负责相关产品的功能模块设计，负责相关产品的功能模块设计；</p><p><br></p><p>4、解决产品开发中发现的问题；</p><p><br></p><p>5、负责产品文档的撰写；</p><p><br></p><p>6、负责编写产品的核心代码；</p><p><br></p><p>7、负责检查、维护数据库中的数据。</p>\",\"startTime\":\"2022-10-03 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 17:01:31.458\",\"workCity\":\"深圳\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 17:01:31');
INSERT INTO `sys_oper_log` VALUES (595, '招聘岗位', 2, 'com.zeus.web.controller.recruit.RctPositionController.edit()', 'PUT', 1, 'zeus', NULL, '/recruit/position', '127.0.0.1', '内网IP', '{\"category\":{\"createTime\":\"2022-10-16 11:47:48\",\"params\":{},\"positionName\":\"Java工程师\",\"updateTime\":\"2022-10-19 14:43:47\"},\"categoryId\":8,\"company\":{\"companyId\":100,\"createTime\":\"2022-10-16 11:47:48\",\"params\":{},\"status\":\"1\",\"updateTime\":\"2022-10-19 14:43:47\"},\"companyId\":100,\"createTime\":\"2022-10-16 11:47:48\",\"deadline\":\"2022-10-21 00:00:00\",\"maxSalary\":10000,\"minSalary\":7000,\"numbers\":10,\"params\":{},\"phone\":\"13135246325\",\"positionName\":\"Java工程师\",\"recruitId\":1,\"requirement\":\"<p>三年以上JAVA研发经验，掌握JVM、数据库、常用缓存介质，良好的数据敏感度及逻辑思维能力，出色的数据分析及解决问题能力；</p>\",\"startTime\":\"2022-10-05 00:00:00\",\"status\":\"1\",\"updateTime\":\"2022-10-31 17:01:35.693\",\"workCity\":\"南京\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-31 17:01:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (2, 'dev', '开发人员', 2, '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-09-28 09:10:23', '');
INSERT INTO `sys_post` VALUES (3, 'ops', '运维人员', 3, '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-09-28 09:09:02', '');
INSERT INTO `sys_post` VALUES (4, 'beta', '测试人员', 4, '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-09-28 09:10:00', '');
INSERT INTO `sys_post` VALUES (10, 'hr', '人力资源', 0, '0', 'admin', '2022-10-14 19:20:29', 'admin', '2022-10-14 19:20:38', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-08-25 15:32:19', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2022-08-25 15:32:19', 'admin', '2022-10-22 17:28:04', '普通角色');
INSERT INTO `sys_role` VALUES (100, '已认证企业用户', 'auth_company', 3, '1', 0, 0, '0', '0', 'admin', '2022-08-27 18:01:59', 'admin', '2022-10-31 13:29:49', '企业用户能够管理公司，审核求职者提交的简历');
INSERT INTO `sys_role` VALUES (101, '求职者', 'applicant', 4, '1', 0, 0, '0', '0', 'admin', '2022-08-27 18:03:46', 'admin', '2022-10-24 14:37:10', '向公司发送简历');
INSERT INTO `sys_role` VALUES (102, '未认证企业用户', 'no_auth_company', 5, '1', 0, 0, '0', '0', 'admin', '2022-08-27 18:04:33', 'admin', '2022-10-27 19:25:41', '需要管理员认证通过后,才能进行审核操作');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2058);
INSERT INTO `sys_role_menu` VALUES (2, 2059);
INSERT INTO `sys_role_menu` VALUES (2, 2060);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2064);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2066);
INSERT INTO `sys_role_menu` VALUES (2, 2067);
INSERT INTO `sys_role_menu` VALUES (2, 2068);
INSERT INTO `sys_role_menu` VALUES (2, 2069);
INSERT INTO `sys_role_menu` VALUES (2, 2070);
INSERT INTO `sys_role_menu` VALUES (2, 2071);
INSERT INTO `sys_role_menu` VALUES (2, 2072);
INSERT INTO `sys_role_menu` VALUES (2, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (100, 2061);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2067);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2069);
INSERT INTO `sys_role_menu` VALUES (100, 2070);
INSERT INTO `sys_role_menu` VALUES (100, 2071);
INSERT INTO `sys_role_menu` VALUES (100, 2072);
INSERT INTO `sys_role_menu` VALUES (100, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 2074);
INSERT INTO `sys_role_menu` VALUES (100, 2075);
INSERT INTO `sys_role_menu` VALUES (100, 2076);
INSERT INTO `sys_role_menu` VALUES (100, 2078);
INSERT INTO `sys_role_menu` VALUES (100, 2080);
INSERT INTO `sys_role_menu` VALUES (100, 2087);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 3);
INSERT INTO `sys_role_menu` VALUES (101, 2053);
INSERT INTO `sys_role_menu` VALUES (101, 2056);
INSERT INTO `sys_role_menu` VALUES (101, 2061);
INSERT INTO `sys_role_menu` VALUES (101, 2062);
INSERT INTO `sys_role_menu` VALUES (101, 2063);
INSERT INTO `sys_role_menu` VALUES (101, 2064);
INSERT INTO `sys_role_menu` VALUES (101, 2065);
INSERT INTO `sys_role_menu` VALUES (101, 2066);
INSERT INTO `sys_role_menu` VALUES (101, 2067);
INSERT INTO `sys_role_menu` VALUES (101, 2068);
INSERT INTO `sys_role_menu` VALUES (101, 2069);
INSERT INTO `sys_role_menu` VALUES (101, 2074);
INSERT INTO `sys_role_menu` VALUES (101, 2075);
INSERT INTO `sys_role_menu` VALUES (101, 2076);
INSERT INTO `sys_role_menu` VALUES (101, 2077);
INSERT INTO `sys_role_menu` VALUES (101, 2078);
INSERT INTO `sys_role_menu` VALUES (101, 2079);
INSERT INTO `sys_role_menu` VALUES (101, 2081);
INSERT INTO `sys_role_menu` VALUES (101, 2082);
INSERT INTO `sys_role_menu` VALUES (101, 2083);
INSERT INTO `sys_role_menu` VALUES (101, 2084);
INSERT INTO `sys_role_menu` VALUES (101, 2085);
INSERT INTO `sys_role_menu` VALUES (101, 2086);
INSERT INTO `sys_role_menu` VALUES (102, 102);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 1012);
INSERT INTO `sys_role_menu` VALUES (102, 2054);
INSERT INTO `sys_role_menu` VALUES (102, 2055);
INSERT INTO `sys_role_menu` VALUES (102, 2056);
INSERT INTO `sys_role_menu` VALUES (102, 2057);
INSERT INTO `sys_role_menu` VALUES (102, 2058);
INSERT INTO `sys_role_menu` VALUES (102, 2059);
INSERT INTO `sys_role_menu` VALUES (102, 2060);
INSERT INTO `sys_role_menu` VALUES (102, 2061);
INSERT INTO `sys_role_menu` VALUES (102, 2062);
INSERT INTO `sys_role_menu` VALUES (102, 2063);
INSERT INTO `sys_role_menu` VALUES (102, 2067);
INSERT INTO `sys_role_menu` VALUES (102, 2068);
INSERT INTO `sys_role_menu` VALUES (102, 2069);
INSERT INTO `sys_role_menu` VALUES (102, 2073);
INSERT INTO `sys_role_menu` VALUES (102, 2074);
INSERT INTO `sys_role_menu` VALUES (102, 2075);
INSERT INTO `sys_role_menu` VALUES (102, 2076);
INSERT INTO `sys_role_menu` VALUES (102, 2080);
INSERT INTO `sys_role_menu` VALUES (102, 2087);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 10求职用户 11企业用户 12管理员）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '卡布达', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2022/10/14/blob_20221014163508A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-10-31 16:48:02', 'admin', '2022-10-13 17:44:23', '', '2022-10-31 16:48:02', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '小智', '10', 'ry@qq.com', '15666666666', '1', '/profile/avatar/2022/10/14/blob_20221014163508A001.jpeg', '$2a$10$57Wzi.UawiDXdO12VtSRJ.kYeFCcZ5J5wURs0H/xgrKmxRG.0aIO.', '0', '0', '127.0.0.1', '2022-10-20 14:29:11', 'admin', '2022-10-13 17:44:23', 'admin', '2022-10-30 21:53:13', '测试员');
INSERT INTO `sys_user` VALUES (102, NULL, 'mikasa', '三笠', '11', 'mikasa@qq.com', '13135246325', '1', '', '$2a$10$V9Giu9kBx0YjyN8rXGtN2.dzIdz/LhZafNCAP05WIUFdp/HmgM2gK', '0', '0', '127.0.0.1', '2022-10-27 19:36:13', 'admin', '2022-10-14 14:01:10', 'admin', '2022-10-27 19:36:13', 'hr');
INSERT INTO `sys_user` VALUES (103, NULL, 'luffy', '路飞', '12', 'luffy@163.com', '18273836855', '0', '', '$2a$10$YBXkx.deievQ1/OuEbYfT.cTUQZRmt7Dmq7g5Ta4ldzj8AnxArTDm', '0', '0', '', NULL, 'admin', '2022-10-14 16:56:41', 'admin', '2022-10-14 16:56:59', '测试人员');
INSERT INTO `sys_user` VALUES (104, NULL, 'nanami', '七海', '12', 'nanami@qq.com', '16670002818', '1', '', '$2a$10$xM62v8iHrDrPBHhcb8fJ/uPaBqwW/w61AU1floQcxzPBsJL4vqBkW', '0', '0', '', NULL, 'admin', '2022-10-14 17:16:12', '', NULL, '运维人员');
INSERT INTO `sys_user` VALUES (108, NULL, 'yukino', '雪乃', '12', 'yukino@163.com', '16670002810', '1', '', '$2a$10$XQMHzv1eKkckmn6Ku.nmBur6XBBvx75TsZ.2qXF7J.3IYCs0JZ01a', '0', '0', '127.0.0.1', '2022-10-14 20:17:40', 'admin', '2022-10-14 19:12:38', 'admin', '2022-10-14 20:17:39', '开发人员');
INSERT INTO `sys_user` VALUES (113, NULL, 'faker', '李相赫', '10', 'faker@qq.com', '16670002819', '0', '/profile/avatar/2022/10/19/blob_20221019203402A015.jpeg', '$2a$10$6vmpSQXzvOmIvhk7UT8PPeX6HEgYdhUYwUFMOEF930wZJ662nB27S', '0', '0', '127.0.0.1', '2022-10-31 16:54:07', 'admin', '2022-10-14 19:41:41', 'admin', '2022-10-31 16:54:07', NULL);
INSERT INTO `sys_user` VALUES (114, NULL, 'zeus', '宙斯', '11', 'zeus@163.com', '13335246325', '0', '/profile/avatar/2022/10/16/blob_20221016141715A001.jpeg', '$2a$10$zLR5P1LPAN9dwGWlcpfCMOYksutFtPfFTjQfABddfqTU2S7PaUUGC', '0', '0', '127.0.0.1', '2022-10-31 18:42:27', 'admin', '2022-10-14 19:57:31', 'admin', '2022-10-31 18:42:26', 'hr');
INSERT INTO `sys_user` VALUES (117, NULL, 'jdg369', '白家浩', '10', 'jdg369@163.com', '18273332818', '0', '/profile/avatar/2022/10/31/blob_20221031150618A001.jpeg', '$2a$10$2Oa/PBkMhDKqbNQinu0k3OYvQRHO16cmR6dbfVtAqJ9VD7mxFRDgG', '0', '0', '127.0.0.1', '2022-10-31 16:13:13', 'admin', '2022-10-20 14:46:47', '', '2022-10-31 16:13:13', NULL);
INSERT INTO `sys_user` VALUES (119, NULL, 'FireFox', '火狐狸', '10', 'firefox@qq.com', '16673332811', '0', '', '$2a$10$W5LNRXtZY3s8q3RXD/JvhuvxjJgUEESWoHsUjbS0gDI8rPxlk0/aK', '0', '0', '127.0.0.1', '2022-10-21 21:48:50', '', '2022-10-21 21:46:08', 'admin', '2022-10-30 21:52:35', NULL);
INSERT INTO `sys_user` VALUES (120, NULL, 'Chorme', '谷歌', '10', 'chorme@qq.com', '19972222818', '0', '', '$2a$10$lvxQJ71DwhaGP5Va3lw8QuosWm1JWfnrnMl2dwnLCKreiXQKe.g4i', '0', '0', '', NULL, '', '2022-10-21 22:41:28', 'admin', '2022-10-30 21:52:01', NULL);
INSERT INTO `sys_user` VALUES (128, NULL, 'theShy', '姜承録', '10', 'theshy@qq.com', '18973817682', '0', '', '$2a$10$2KnHIO9y3bJPSIeY/Rtr4ebKWZgPTRb.LBGkfXEqHKnblRHTjiD06', '0', '0', '127.0.0.1', '2022-10-21 23:16:39', '', '2022-10-21 23:16:15', 'admin', '2022-10-30 21:52:12', NULL);
INSERT INTO `sys_user` VALUES (131, NULL, 'khan', '金河东', '11', 'aem133994679@163.com', '17820337963', '0', '', '$2a$10$zt4ap0P7COOnszQMXD9To.NdikSXfEBoe/XP8kcjTKzwdqd8zd1dG', '0', '0', '127.0.0.1', '2022-10-31 09:08:51', '', '2022-10-22 17:18:18', 'admin', '2022-10-31 10:02:49', 'hr');
INSERT INTO `sys_user` VALUES (132, NULL, 'kanavi', '徐进赫', '10', 'kanavi@qq.com', '13135246377', '0', '', '$2a$10$Nhzjwhs0XLVyX8EKaMVDI.zqBDzVB8sFG0FBe1N0nIrD0AwIUzCBW', '0', '0', '127.0.0.1', '2022-10-26 16:03:56', '', '2022-10-26 14:22:18', 'admin', '2022-10-30 21:52:25', NULL);
INSERT INTO `sys_user` VALUES (133, NULL, 'ning', '高振宁', '11', 'ning@163.com', '16738244462', '0', '', '$2a$10$VQRYt6Vk6Kc05mE/k.Xiv.6.x0nmbaSpbb8xbdNoiMfcwymmfOm7G', '0', '0', '127.0.0.1', '2022-10-31 09:30:31', 'admin', '2022-10-26 16:17:11', 'admin', '2022-10-31 09:30:31', 'hr');
INSERT INTO `sys_user` VALUES (134, NULL, 'rookie', '宋义进', '11', 'foreveraimer123@qq.com', '17860002013', '0', '', '$2a$10$p62bUTI5klnUzKVvJjQTGO/axtWIBPEq8yYysiq8L26X8swu07UD2', '0', '0', '127.0.0.1', '2022-10-31 10:03:13', '', '2022-10-30 21:40:53', 'admin', '2022-10-31 10:03:12', 'hr');
INSERT INTO `sys_user` VALUES (135, NULL, 'jackeyLove', '喻文波', '11', 'yukkino@foxmail.com', '17628106325', '0', '', '$2a$10$H6CjQ3ge19Q4BAAc6QW7bO.aDfZBYwpf8CAp3ICEUT.0Zu0WCgtZ2', '0', '0', '127.0.0.1', '2022-10-30 22:15:49', '', '2022-10-30 22:09:51', 'admin', '2022-10-31 10:02:55', 'ceo');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (102, 10);
INSERT INTO `sys_user_post` VALUES (103, 2);
INSERT INTO `sys_user_post` VALUES (104, 2);
INSERT INTO `sys_user_post` VALUES (105, 4);
INSERT INTO `sys_user_post` VALUES (106, 2);
INSERT INTO `sys_user_post` VALUES (107, 2);
INSERT INTO `sys_user_post` VALUES (108, 2);
INSERT INTO `sys_user_post` VALUES (109, 2);
INSERT INTO `sys_user_post` VALUES (114, 10);
INSERT INTO `sys_user_post` VALUES (131, 10);
INSERT INTO `sys_user_post` VALUES (133, 10);
INSERT INTO `sys_user_post` VALUES (134, 10);
INSERT INTO `sys_user_post` VALUES (135, 10);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);
INSERT INTO `sys_user_role` VALUES (109, 101);
INSERT INTO `sys_user_role` VALUES (113, 101);
INSERT INTO `sys_user_role` VALUES (114, 100);
INSERT INTO `sys_user_role` VALUES (117, 101);
INSERT INTO `sys_user_role` VALUES (119, 101);
INSERT INTO `sys_user_role` VALUES (120, 101);
INSERT INTO `sys_user_role` VALUES (128, 101);
INSERT INTO `sys_user_role` VALUES (129, 101);
INSERT INTO `sys_user_role` VALUES (131, 100);
INSERT INTO `sys_user_role` VALUES (132, 101);
INSERT INTO `sys_user_role` VALUES (133, 100);
INSERT INTO `sys_user_role` VALUES (134, 100);
INSERT INTO `sys_user_role` VALUES (135, 100);

SET FOREIGN_KEY_CHECKS = 1;
