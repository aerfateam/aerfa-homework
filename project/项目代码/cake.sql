/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : cake

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2019-01-04 08:11:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cake`
-- ----------------------------
DROP TABLE IF EXISTS `cake`;
CREATE TABLE `cake` (
  `id` int(11) NOT NULL,
  `c_name` varchar(50) DEFAULT NULL,
  `introduce` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `bigpicture` varchar(50) DEFAULT NULL,
  `smallpicture1` varchar(50) DEFAULT NULL,
  `smallpicture2` varchar(50) DEFAULT NULL,
  `smallpicture3` varchar(50) DEFAULT NULL,
  `starlevel` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cake
-- ----------------------------
INSERT INTO `cake` VALUES ('3', 'g3', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g3.png', 'images/g3.png', 'images/g3.png', 'images/g3.png', '5', '3', null, 'Friend');
INSERT INTO `cake` VALUES ('4', 'g4', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g4.png', 'images/g4.png', 'images/g4.png', 'images/s3.png', '5', '3', null, 'Friend');
INSERT INTO `cake` VALUES ('5', 'g5', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g5.png', 'images/g5.png', 'images/g5.png', 'images/g5.png', '5', '4', null, 'Lover');
INSERT INTO `cake` VALUES ('6', 'g6', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g6.png', 'images/g6.png', 'images/g6.png', 'images/g6.png', '5', '4', null, 'Sister');
INSERT INTO `cake` VALUES ('7', 'g7', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g7.png', 'images/g7.png', 'images/g7.png', 'images/g7.png', '5', '5', null, 'Chocolate');
INSERT INTO `cake` VALUES ('8', 'g8', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g8.png', 'images/g8.png', 'images/g8.png', 'images/g8.png', '5', '2', null, 'HeartShaped');
INSERT INTO `cake` VALUES ('9', 'g9', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g9.png', 'images/g9.png', 'images/g9.png', 'images/g9.png', '5', '3', null, 'Kids');
INSERT INTO `cake` VALUES ('10', 'g10', 'Cake cutting is one of the most wonderful ways of ', '95', '100', 'images/g10.png', 'images/g10.png', 'images/g10.png', 'images/g10.png', '5', '6', null, 'HeartShaped');
INSERT INTO `cake` VALUES ('11', 'm1', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m1.png', 'images/m1.png', 'images/m1.png', 'images/m1.png', '5', '7', null, 'Friend');
INSERT INTO `cake` VALUES ('12', 'm2', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m2.png', 'images/m2.png', 'images/m2.png', 'images/m2.png', '5', '2', null, 'chocolate');
INSERT INTO `cake` VALUES ('13', 'm3', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m3.png', 'images/m3.png', 'images/m3.png', 'images/m3.png', '5', '5', null, 'Lover');
INSERT INTO `cake` VALUES ('14', 'm4', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m4.png', 'images/m4.png', 'images/m4.png', 'images/m4.png', '5', '3', null, 'chocolate');
INSERT INTO `cake` VALUES ('15', 'm5', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m5.png', 'images/m5.png', 'images/m5.png', 'images/m5.png', '5', '4', null, 'Parents');
INSERT INTO `cake` VALUES ('16', 'm6', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m6.png', 'images/m6.png', 'images/m6.png', 'images/m6.png', '5', '7', null, 'RoundShape');
INSERT INTO `cake` VALUES ('17', 'm7', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m7.png', 'images/m7.png', 'images/m7.png', 'images/m7.png', '5', '6', null, 'Brother');
INSERT INTO `cake` VALUES ('18', 'm8', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m8.png', 'images/m8.png', 'images/m8.png', 'images/m8.png', '5', '5', null, 'chocolate');
INSERT INTO `cake` VALUES ('19', 'm9', 'Cake cutting is one of the most wonderful ways of ', '200', '100', 'images/m9.png', 'images/s1.png', 'images/s2.png', 'images/s3.png', '5', '3', null, 'HeartShaped');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cake` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdetails`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(50) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES ('1', '1', '3', '3');
INSERT INTO `orderdetails` VALUES ('2', '2', '3', '4');
INSERT INTO `orderdetails` VALUES ('3', '3', '11', '2');
INSERT INTO `orderdetails` VALUES ('4', '4', '5', '8');
INSERT INTO `orderdetails` VALUES ('5', '5', '4', '5');
INSERT INTO `orderdetails` VALUES ('6', '6', '7', '9');
INSERT INTO `orderdetails` VALUES ('7', '7', '8', '3');
INSERT INTO `orderdetails` VALUES ('8', '8', '9', '6');
INSERT INTO `orderdetails` VALUES ('9', '9', '10', '4');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordernumber` varchar(50) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`ordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('2', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('3', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('4', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('5', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('6', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('7', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('8', null, null, null, null, '1');
INSERT INTO `orders` VALUES ('9', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` bigint(11) NOT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `p_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Birthday', null);
INSERT INTO `type` VALUES ('2', 'Wedding', null);
INSERT INTO `type` VALUES ('3', 'Special Offers', null);
INSERT INTO `type` VALUES ('4', 'Store', null);
INSERT INTO `type` VALUES ('5', 'BY RELATION', '1');
INSERT INTO `type` VALUES ('6', 'BY FLAVOUR', '1');
INSERT INTO `type` VALUES ('7', 'BY THEME', '1');
INSERT INTO `type` VALUES ('8', 'WEIGHT', '1');
INSERT INTO `type` VALUES ('9', 'Friend', '5');
INSERT INTO `type` VALUES ('10', 'Lover', '5');
INSERT INTO `type` VALUES ('11', 'Sister', '5');
INSERT INTO `type` VALUES ('12', 'Brother', '5');
INSERT INTO `type` VALUES ('13', 'Kids', '5');
INSERT INTO `type` VALUES ('14', 'Parents', '5');
INSERT INTO `type` VALUES ('15', 'Chocolate', '6');
INSERT INTO `type` VALUES ('16', 'Mixed Fruit', '6');
INSERT INTO `type` VALUES ('17', 'Butterscotch', '6');
INSERT INTO `type` VALUES ('18', 'Strawberry', '6');
INSERT INTO `type` VALUES ('19', 'Vanilla', '6');
INSERT INTO `type` VALUES ('20', 'Eggless Cakes', '6');
INSERT INTO `type` VALUES ('21', 'Heart shaped', '7');
INSERT INTO `type` VALUES ('22', 'Cartoon Cakes', '7');
INSERT INTO `type` VALUES ('23', '2-3 Tier Cakes', '7');
INSERT INTO `type` VALUES ('24', 'Square shape', '7');
INSERT INTO `type` VALUES ('25', 'Round shape', '7');
INSERT INTO `type` VALUES ('26', 'Photo cakes', '7');
INSERT INTO `type` VALUES ('27', '1KG', '8');
INSERT INTO `type` VALUES ('28', '1.5KG', '8');
INSERT INTO `type` VALUES ('29', '2KG', '8');
INSERT INTO `type` VALUES ('30', '3KG', '8');
INSERT INTO `type` VALUES ('31', '4KG', '8');
INSERT INTO `type` VALUES ('32', 'Large', '8');
INSERT INTO `type` VALUES ('34', 'BY RELATION', '3');
INSERT INTO `type` VALUES ('35', 'BY RELATION', '4');
INSERT INTO `type` VALUES ('36', 'BY FLAVOUR', '2');
INSERT INTO `type` VALUES ('37', 'BY FLAVOUR', '3');
INSERT INTO `type` VALUES ('38', 'BY FLAVOUR', '4');
INSERT INTO `type` VALUES ('39', 'BY THEME', '2');
INSERT INTO `type` VALUES ('40', 'BY THEME', '3');
INSERT INTO `type` VALUES ('41', 'BY THEME', '4');
INSERT INTO `type` VALUES ('42', 'WEIGHT', '2');
INSERT INTO `type` VALUES ('43', 'WEIGHT', '3');
INSERT INTO `type` VALUES ('44', 'WEIGHT', '4');
INSERT INTO `type` VALUES ('45', 'BY RELATION', '2');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('12', 'zhang1', '123', '2018-10-17 09:52:07');
INSERT INTO `users` VALUES ('1232343', 'asdd', '1234', '2018-11-12 11:37:40');
INSERT INTO `users` VALUES ('12343', 'zhang', '123', '2018-10-17 07:58:40');
INSERT INTO `users` VALUES ('123431', 'zhang123', '12345', '2018-10-17 19:19:12');
INSERT INTO `users` VALUES ('1234311', 'zhang11', '123', '2018-10-17 09:49:08');
INSERT INTO `users` VALUES ('12343q', 'zhang112', '123456', '2018-10-17 10:03:50');
INSERT INTO `users` VALUES ('128346', 'zhangsan', '12345', '2018-10-17 19:30:42');
INSERT INTO `users` VALUES ('1aaa', 'zhang111', '123', '2018-11-14 08:54:52');
INSERT INTO `users` VALUES ('2434060709', '方玉珍', '123456', '2018-11-15 13:57:32');
INSERT INTO `users` VALUES ('aaa', '123', '123', '2018-11-13 19:42:07');
INSERT INTO `users` VALUES ('rrr', '1234', '222', '2018-11-14 10:03:40');
INSERT INTO `users` VALUES ('rrr12', '12345', '123', '2018-11-14 10:07:16');
