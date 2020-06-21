/*
Navicat MySQL Data Transfer

Source Server         : 47.107.227.121
Source Server Version : 50562
Source Host           : 47.107.227.121:3306
Source Database       : ssm_storedb

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-06-21 09:37:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `ID` varchar(32) NOT NULL,
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `REAL_NAME` varchar(20) DEFAULT NULL,
  `LINK_PHONE` varchar(20) DEFAULT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `SEX` varchar(2) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `ID_CARD` varchar(20) DEFAULT NULL,
  `ROLE_LEVEL` varchar(10) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES ('40289a813f90e233013f90e2342b0001', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '管理员', '13888888888', '2019-10-30 01:01:51', '男', '18', '四川省成都市', '510111111111111111', '系统管理员', '启用', null);
INSERT INTO `tb_account` VALUES ('9c4b062c0a634d219f1b20afe02be976', '123', 'E10ADC3949BA59ABBE56E057F20F883E', '123', '123', '2020-05-02 10:20:09', '男', '123', '123', '123', '系统管理员', '启用', null);

-- ----------------------------
-- Table structure for tb_atstore
-- ----------------------------
DROP TABLE IF EXISTS `tb_atstore`;
CREATE TABLE `tb_atstore` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `RELATION_ID` varchar(32) DEFAULT NULL,
  `GOODS_ID` varchar(32) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `GOODS_NAME` varchar(50) DEFAULT NULL,
  `UINT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_atstore
-- ----------------------------
INSERT INTO `tb_atstore` VALUES ('1fa42b905f03407c8956e0ea34722c95', 'ec78a9fb2ce642c7a743a6e0bbc07408', '402881be4c4ec158014c4ec813720002', '5', null, '肉松饼', '个');
INSERT INTO `tb_atstore` VALUES ('402822816e26ec68016e27020b490002', '13b3e94614754724ab96c890b3ca719f', '402881be4c4ec158014c4ec769c90001', '12', null, '可口可乐', '瓶');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(32) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `SPECIFICATION` varchar(20) DEFAULT NULL,
  `PRODUCTION_DATE` date DEFAULT NULL,
  `SHELF_LIFE` varchar(20) DEFAULT NULL,
  `UNIT` varchar(20) DEFAULT NULL,
  `PRICE` varchar(20) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('402881be4c4ec158014c4ec769c90001', '可口可乐', 'cola', '饮料', '500ML', '2015-03-25', '12', '瓶', '3', '好喝的东西');
INSERT INTO `tb_goods` VALUES ('402881be4c4ec158014c4ec813720002', '肉松饼', 'rsb', '饼子', '40克', '2015-03-19', '12', '个', '2', '董弱鸡代言');

-- ----------------------------
-- Table structure for tb_instore
-- ----------------------------
DROP TABLE IF EXISTS `tb_instore`;
CREATE TABLE `tb_instore` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `GOODS_ID` varchar(32) DEFAULT NULL,
  `PROVIDER_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `IN_DATE` datetime DEFAULT NULL,
  `PRICE` varchar(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `GOODS_NAME` varchar(50) DEFAULT NULL,
  `PROVIDER_NAME` varchar(50) DEFAULT NULL,
  `USERNAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_instore
-- ----------------------------
INSERT INTO `tb_instore` VALUES ('402822816e26ec68016e270209f70001', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ecab77e0005', 'currentLoginUserId', '2019-11-01 20:47:55', '2', '10', '入库可乐', '可口可乐[瓶]', '可口可乐-成都', '管理员');
INSERT INTO `tb_instore` VALUES ('9ca8565fd63d43b2807791fbe0df86fd', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ecab77e0005', 'currentLoginUserId', '2020-05-01 01:07:03', '5', '5', 'rqer5', '可口可乐[瓶]', '可口可乐-成都', '管理员');
INSERT INTO `tb_instore` VALUES ('dd90441b836b46caba969c1db2d7dd3f', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ecab77e0005', 'currentLoginUserId', '2020-05-01 01:37:34', '5', '5', 'das', '可口可乐[瓶]', '可口可乐-成都', '管理员');
INSERT INTO `tb_instore` VALUES ('ec78a9fb2ce642c7a743a6e0bbc07408', '402881be4c4ec158014c4ec813720002', '402881be4c4ec158014c4ec92a1f0003', 'currentLoginUserId', '2020-05-01 01:14:50', '6', '5', '46465', '肉松饼[个]', '董弱鸡', '管理员');

-- ----------------------------
-- Table structure for tb_outstore
-- ----------------------------
DROP TABLE IF EXISTS `tb_outstore`;
CREATE TABLE `tb_outstore` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `GOODS_ID` varchar(32) DEFAULT NULL,
  `CONSUMER_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `OUT_DATE` datetime DEFAULT NULL,
  `PRICE` varchar(20) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `GOODS_NAME` varchar(50) DEFAULT NULL,
  `CONSUMER_NAME` varchar(50) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_outstore
-- ----------------------------
INSERT INTO `tb_outstore` VALUES ('13b3e94614754724ab96c890b3ca719f', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ec9dc8f0004', 'currentLoginUserId', '2020-05-01 01:37:54', '5', '1', 'e', '可口可乐[瓶]', '红旗连锁', '管理员');
INSERT INTO `tb_outstore` VALUES ('1a8278b81351403c85d18e127b947ebe', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ec9dc8f0004', 'currentLoginUserId', '2020-05-01 01:37:03', '5', '1', 'fd', '可口可乐[瓶]', '红旗连锁', '管理员');
INSERT INTO `tb_outstore` VALUES ('402822816e26ec68016e27028a6a0003', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ec9dc8f0004', 'currentLoginUserId', '2019-11-01 20:48:28', '2', '1', '出库可乐', '可口可乐[瓶]', '红旗连锁', '管理员');
INSERT INTO `tb_outstore` VALUES ('f72a62cf8f164c5d850a12b112c2c41a', '402881be4c4ec158014c4ec769c90001', '402881be4c4ec158014c4ec9dc8f0004', 'currentLoginUserId', '2020-05-01 01:34:18', '5', '1', 'fd', '可口可乐[瓶]', '红旗连锁', '管理员');

-- ----------------------------
-- Table structure for tb_partner
-- ----------------------------
DROP TABLE IF EXISTS `tb_partner`;
CREATE TABLE `tb_partner` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `PROPERTY` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `LINK_MAN` varchar(20) DEFAULT NULL,
  `LINK_PHONE` varchar(20) DEFAULT NULL,
  `TELPHONE` varchar(20) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_partner
-- ----------------------------
INSERT INTO `tb_partner` VALUES ('402881be4c4ec158014c4ec92a1f0003', '董弱鸡', 'provider', '个体', '召唤师峡谷', '董弱鸡', '13888888888', '028-88888888', '吃了弱鸡的小吃立马超神');
INSERT INTO `tb_partner` VALUES ('402881be4c4ec158014c4ec9dc8f0004', '红旗连锁', 'consumer', '超市', '成都市总府路', '盖伦', '13788888888', '028-77777777', '阿斯顿发送到发送到');
INSERT INTO `tb_partner` VALUES ('402881be4c4ec158014c4ecab77e0005', '可口可乐-成都', 'provider', '公司', '成都市新都区可口可乐园区', '王大花5', '13666667777', '028-99887766', '撒打发士大夫5');
INSERT INTO `tb_partner` VALUES ('402881be4c4ec158014c4ecbd4770006', '舞东风', 'consumer', '超市', '富土康三号流水车间质检部2', '张全蛋', '13333334444', '028-22223333', 'Nokla45');
