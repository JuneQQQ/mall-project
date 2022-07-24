DROP database IF EXISTS mall_pms;
create database mall_pms;
use  mall_pms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pms_attr
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr`;
CREATE TABLE `pms_attr`
(
    `attr_id`      bigint NOT NULL AUTO_INCREMENT COMMENT '属性id',
    `attr_name`    char(30)     DEFAULT NULL COMMENT '属性名',
    `search_type`  tinyint      DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
    `value_type`   tinyint      DEFAULT NULL COMMENT '值类型',
    `icon`         varchar(255) DEFAULT NULL COMMENT '属性图标',
    `value_select` char(255)    DEFAULT NULL COMMENT '可选值列表[用逗号分隔]',
    `attr_type`    tinyint      DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性，2-既是销售属性又是基本属性]',
    `enable`       bigint       DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
    `catalog_id`   bigint       DEFAULT NULL COMMENT '所属分类',
    `show_desc`    tinyint      DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
    PRIMARY KEY (`attr_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4  COMMENT ='商品属性';

-- ----------------------------
-- Records of pms_attr
-- ----------------------------
BEGIN;
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (5, '上市年份', 1, 0, 'zz', '2018;2019;2020;2021', 1, 1, 225, 0);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (6, 'CPU型号', 1, 0, '1', '晓龙888;麒麟980', 1, 1, 225, 0);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (8, '入网型号', 1, 0, 'z', 'SM-S9010', 1, 1, 225, 0);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (9, '颜色', 1, 1, 'z', '深空灰;白色;粉色', 0, 1, 225, 0);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (10, '内存', 1, 0, '1', '4G;8G;12G', 0, 1, 225, 0);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (11, '上市月份', 1, 0, '上市月份', '1月;3月;5月;7月;9月;11月', 1, 1, 225, 1);
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`,
                        `enable`, `catalog_id`, `show_desc`)
VALUES (12, '存储容量', 1, 1, '存储容量', '64G;128G;256G;512G;1T', 0, 1, 225, 0);
COMMIT;

-- ----------------------------
-- Table structure for pms_attr_attrgroup_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;
CREATE TABLE `pms_attr_attrgroup_relation`
(
    `id`            bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `attr_id`       bigint DEFAULT NULL COMMENT 'ÊôÐÔid',
    `attr_group_id` bigint DEFAULT NULL COMMENT 'ÊôÐÔ·Ö×éid',
    `attr_sort`     int    DEFAULT NULL COMMENT 'ÊôÐÔ×éÄÚÅÅÐò',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='ÊôÐÔ&ÊôÐÔ·Ö×é¹ØÁª';

-- ----------------------------
-- Records of pms_attr_attrgroup_relation
-- ----------------------------
BEGIN;
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`)
VALUES (3, 4, 1, NULL);
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`)
VALUES (4, 5, 1, NULL);
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`)
VALUES (5, 6, 1, NULL);
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`)
VALUES (10, 8, 1, NULL);
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`)
VALUES (11, 11, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_attr_group
-- ----------------------------
DROP TABLE IF EXISTS `pms_attr_group`;
CREATE TABLE `pms_attr_group`
(
    `attr_group_id`   bigint NOT NULL AUTO_INCREMENT COMMENT '分组id',
    `attr_group_name` char(20)     DEFAULT NULL COMMENT '组名',
    `sort`            int          DEFAULT NULL COMMENT '排序',
    `descript`        varchar(255) DEFAULT NULL COMMENT '描述',
    `icon`            varchar(255) DEFAULT NULL COMMENT '组图标',
    `catalog_id`      bigint       DEFAULT NULL COMMENT '所属分类id',
    PRIMARY KEY (`attr_group_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4  COMMENT ='属性分组';

-- ----------------------------
-- Records of pms_attr_group
-- ----------------------------
BEGIN;
INSERT INTO `pms_attr_group` (`attr_group_id`, `attr_group_name`, `sort`, `descript`, `icon`, `catalog_id`)
VALUES (1, '主体', 0, '111', '11', 225);
INSERT INTO `pms_attr_group` (`attr_group_id`, `attr_group_name`, `sort`, `descript`, `icon`, `catalog_id`)
VALUES (2, '周杰伦', 0, '1', '1', 169);
INSERT INTO `pms_attr_group` (`attr_group_id`, `attr_group_name`, `sort`, `descript`, `icon`, `catalog_id`)
VALUES (4, '主体', 0, '1', '1', 226);
INSERT INTO `pms_attr_group` (`attr_group_id`, `attr_group_name`, `sort`, `descript`, `icon`, `catalog_id`)
VALUES (5, '基本信息', 0, '手机分类的基本信息', 'z', 225);
COMMIT;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`
(
    `brand_id`     bigint NOT NULL AUTO_INCREMENT COMMENT '品牌id',
    `name`         char(50)      DEFAULT NULL COMMENT '品牌名',
    `logo`         varchar(2000) DEFAULT NULL COMMENT '品牌logo地址',
    `descript`     longtext COMMENT '介绍',
    `show_status`  tinyint       DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
    `first_letter` char(1)       DEFAULT NULL COMMENT '检索首字母',
    `sort`         int           DEFAULT NULL COMMENT '排序',
    PRIMARY KEY (`brand_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4  COMMENT ='品牌';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
BEGIN;
INSERT INTO `pms_brand` (`brand_id`, `name`, `logo`, `descript`, `show_status`, `first_letter`, `sort`)
VALUES (1, 'Huawei',
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16/523fb1f4-690b-4269-85d6-81d33dbcc4d3_OIP-C (1).jpeg',
        'Huawei', 1, 'h', 0);
INSERT INTO `pms_brand` (`brand_id`, `name`, `logo`, `descript`, `show_status`, `first_letter`, `sort`)
VALUES (2, 'Xiaomi',
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16/f48d13a5-3b0e-4880-8c38-569dfd1b2bba_OIP-C.jpeg',
        'Xiaomi', 1, 'x', 0);
INSERT INTO `pms_brand` (`brand_id`, `name`, `logo`, `descript`, `show_status`, `first_letter`, `sort`)
VALUES (3, 'Apple',
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16/6352e71a-7dd4-4887-8613-985e246f6b50_R-C.png',
        'Apple', 1, 'a', 0);
INSERT INTO `pms_brand` (`brand_id`, `name`, `logo`, `descript`, `show_status`, `first_letter`, `sort`)
VALUES (4, 'OPPO',
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-28/82eb025c-dad3-49e1-8bd1-f8c6f5886c3b_OIP-C (2).jpeg',
        'OPPO', 1, 'O', 0);
COMMIT;

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category`
(
    `cat_id`        bigint NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `name`          char(50)  DEFAULT NULL COMMENT '分类名称',
    `parent_cid`    bigint    DEFAULT NULL COMMENT '父分类id',
    `cat_level`     int       DEFAULT NULL COMMENT '层级',
    `show_status`   tinyint   DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
    `sort`          int       DEFAULT NULL COMMENT '排序',
    `icon`          char(255) DEFAULT NULL COMMENT '图标地址',
    `product_unit`  char(50)  DEFAULT NULL COMMENT '计量单位',
    `product_count` int       DEFAULT NULL COMMENT '商品数量',
    PRIMARY KEY (`cat_id`),
    KEY `parent_cid` (`parent_cid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1433
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='商品三级分类';

-- ----------------------------
-- Records of pms_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1, '图书、音像、电子书刊1', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (2, '手机', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (3, '家用电器', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (4, '数码', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (5, '家居家装', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (6, '电脑办公', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (7, '厨具', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (8, '个护化妆', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (9, '服饰内衣', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (10, '钟表', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (11, '鞋靴', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (12, '母婴', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (13, '礼品箱包', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (14, '食品饮料、保健食品', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (15, '珠宝', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (16, '汽车用品', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (17, '运动健康', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (18, '玩具乐器', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (19, '彩票、旅行、充值、票务', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (20, '生鲜', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (21, '整车', 0, 1, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (22, '电子书刊', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (23, '音像', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (24, '英文原版', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (25, '文艺', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (26, '少儿', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (27, '人文社科', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (28, '经管励志', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (29, '生活', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (30, '科技', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (31, '教育', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (32, '港台图书', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (33, '其他', 1, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (34, '手机通讯', 2, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (35, '运营商', 2, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (36, '手机配件', 2, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (37, '大 家 电', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (38, '厨卫大电', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (39, '厨房小电', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (40, '生活电器', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (41, '个护健康', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (42, '五金家装', 3, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (43, '摄影摄像', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (44, '数码配件', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (45, '智能设备', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (46, '影音娱乐', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (47, '电子教育', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (48, '虚拟商品', 4, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (49, '家纺', 5, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (50, '灯具', 5, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (51, '生活日用', 5, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (52, '家装软饰', 5, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (53, '宠物生活', 5, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (54, '电脑整机', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (55, '电脑配件', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (56, '外设产品', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (57, '游戏设备', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (58, '网络产品', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (59, '办公设备', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (60, '文具/耗材', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (61, '服务产品', 6, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (62, '烹饪锅具', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (63, '刀剪菜板', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (64, '厨房配件', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (65, '水具酒具', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (66, '餐具', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (67, '酒店用品', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (68, '茶具/咖啡具', 7, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (69, '清洁用品', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (70, '面部护肤', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (71, '身体护理', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (72, '口腔护理', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (73, '女性护理', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (74, '洗发护发', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (75, '香水彩妆', 8, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (76, '女装', 9, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (77, '男装', 9, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (78, '内衣', 9, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (79, '洗衣服务', 9, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (80, '服饰配件', 9, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (81, '钟表', 10, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (82, '流行男鞋', 11, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (83, '时尚女鞋', 11, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (84, '奶粉', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (85, '营养辅食', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (86, '尿裤湿巾', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (87, '喂养用品', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (88, '洗护用品', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (89, '童车童床', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (90, '寝居服饰', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (91, '妈妈专区', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (92, '童装童鞋', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (93, '安全座椅', 12, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (94, '潮流女包', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (95, '精品男包', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (96, '功能箱包', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (97, '礼品', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (98, '奢侈品', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (99, '婚庆', 13, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (100, '进口食品', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (101, '地方特产', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (102, '休闲食品', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (103, '粮油调味', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (104, '饮料冲调', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (105, '食品礼券', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (106, '茗茶', 14, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (107, '时尚饰品', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (108, '黄金', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (109, 'K金饰品', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (110, '金银投资', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (111, '银饰', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (112, '钻石', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (113, '翡翠玉石', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (114, '水晶玛瑙', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (115, '彩宝', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (116, '铂金', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (117, '木手串/把件', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (118, '珍珠', 15, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (119, '维修保养', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (120, '车载电器', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (121, '美容清洗', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (122, '汽车装饰', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (123, '安全自驾', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (124, '汽车服务', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (125, '赛事改装', 16, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (126, '运动鞋包', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (127, '运动服饰', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (128, '骑行运动', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (129, '垂钓用品', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (130, '游泳用品', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (131, '户外鞋服', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (132, '户外装备', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (133, '健身训练', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (134, '体育用品', 17, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (135, '适用年龄', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (136, '遥控/电动', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (137, '毛绒布艺', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (138, '娃娃玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (139, '模型玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (140, '健身玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (141, '动漫玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (142, '益智玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (143, '积木拼插', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (144, 'DIY玩具', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (145, '创意减压', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (146, '乐器', 18, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (147, '彩票', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (148, '机票', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (149, '酒店', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (150, '旅行', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (151, '充值', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (152, '游戏', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (153, '票务', 19, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (154, '产地直供', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (155, '水果', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (156, '猪牛羊肉', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (157, '海鲜水产', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (158, '禽肉蛋品', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (159, '冷冻食品', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (160, '熟食腊味', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (161, '饮品甜品', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (162, '蔬菜', 20, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (163, '全新整车', 21, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (164, '二手车', 21, 2, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (165, '电子书', 22, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (166, '网络原创', 22, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (167, '数字杂志', 22, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (168, '多媒体图书', 22, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (169, '音乐', 23, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (170, '影视', 23, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (171, '教育音像', 23, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (172, '少儿', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (173, '商务投资', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (174, '英语学习与考试', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (175, '文学', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (176, '传记', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (177, '励志', 24, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (178, '小说', 25, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (179, '文学', 25, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (180, '青春文学', 25, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (181, '传记', 25, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (182, '艺术', 25, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (183, '少儿', 26, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (184, '0-2岁', 26, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (185, '3-6岁', 26, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (186, '7-10岁', 26, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (187, '11-14岁', 26, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (188, '历史', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (189, '哲学', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (190, '国学', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (191, '政治/军事', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (192, '法律', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (193, '人文社科', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (194, '心理学', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (195, '文化', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (196, '社会科学', 27, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (197, '经济', 28, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (198, '金融与投资', 28, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (199, '管理', 28, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (200, '励志与成功', 28, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (201, '生活', 29, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (202, '健身与保健', 29, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (203, '家庭与育儿', 29, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (204, '旅游', 29, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (205, '烹饪美食', 29, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (206, '工业技术', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (207, '科普读物', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (208, '建筑', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (209, '医学', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (210, '科学与自然', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (211, '计算机与互联网', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (212, '电子通信', 30, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (213, '中小学教辅', 31, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (214, '教育与考试', 31, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (215, '外语学习', 31, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (216, '大中专教材', 31, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (217, '字典词典', 31, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (218, '艺术/设计/收藏', 32, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (219, '经济管理', 32, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (220, '文化/学术', 32, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (221, '少儿', 32, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (222, '工具书', 33, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (223, '杂志/期刊', 33, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (224, '套装书', 33, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (225, '手机', 34, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (226, '对讲机', 34, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (227, '合约机', 35, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (228, '选号中心', 35, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (229, '装宽带', 35, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (230, '办套餐', 35, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (231, '移动电源', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (232, '电池/移动电源', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (233, '蓝牙耳机', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (234, '充电器/数据线', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (235, '苹果周边', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (236, '手机耳机', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (237, '手机贴膜', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (238, '手机存储卡', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (239, '充电器', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (240, '数据线', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (241, '手机保护套', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (242, '车载配件', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (243, 'iPhone 配件', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (244, '手机电池', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (245, '创意配件', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (246, '便携/无线音响', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (247, '手机饰品', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (248, '拍照配件', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (249, '手机支架', 36, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (250, '平板电视', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (251, '空调', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (252, '冰箱', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (253, '洗衣机', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (254, '家庭影院', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (255, 'DVD/电视盒子', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (256, '迷你音响', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (257, '冷柜/冰吧', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (258, '家电配件', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (259, '功放', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (260, '回音壁/Soundbar', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (261, 'Hi-Fi专区', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (262, '电视盒子', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (263, '酒柜', 37, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (264, '燃气灶', 38, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (265, '油烟机', 38, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (266, '热水器', 38, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (267, '消毒柜', 38, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (268, '洗碗机', 38, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (269, '料理机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (270, '榨汁机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (271, '电饭煲', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (272, '电压力锅', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (273, '豆浆机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (274, '咖啡机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (275, '微波炉', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (276, '电烤箱', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (277, '电磁炉', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (278, '面包机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (279, '煮蛋器', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (280, '酸奶机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (281, '电炖锅', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (282, '电水壶/热水瓶', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (283, '电饼铛', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (284, '多用途锅', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (285, '电烧烤炉', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (286, '果蔬解毒机', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (287, '其它厨房电器', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (288, '养生壶/煎药壶', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (289, '电热饭盒', 39, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (290, '取暖电器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (291, '净化器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (292, '加湿器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (293, '扫地机器人', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (294, '吸尘器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (295, '挂烫机/熨斗', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (296, '插座', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (297, '电话机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (298, '清洁机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (299, '除湿机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (300, '干衣机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (301, '收录/音机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (302, '电风扇', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (303, '冷风扇', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (304, '其它生活电器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (305, '生活电器配件', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (306, '净水器', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (307, '饮水机', 40, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (308, '剃须刀', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (309, '剃/脱毛器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (310, '口腔护理', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (311, '电吹风', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (312, '美容器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (313, '理发器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (314, '卷/直发器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (315, '按摩椅', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (316, '按摩器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (317, '足浴盆', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (318, '血压计', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (319, '电子秤/厨房秤', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (320, '血糖仪', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (321, '体温计', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (322, '其它健康电器', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (323, '计步器/脂肪检测仪', 41, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (324, '电动工具', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (325, '手动工具', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (326, '仪器仪表', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (327, '浴霸/排气扇', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (328, '灯具', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (329, 'LED灯', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (330, '洁身器', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (331, '水槽', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (332, '龙头', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (333, '淋浴花洒', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (334, '厨卫五金', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (335, '家具五金', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (336, '门铃', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (337, '电气开关', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (338, '插座', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (339, '电工电料', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (340, '监控安防', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (341, '电线/线缆', 42, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (342, '数码相机', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (343, '单电/微单相机', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (344, '单反相机', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (345, '摄像机', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (346, '拍立得', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (347, '运动相机', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (348, '镜头', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (349, '户外器材', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (350, '影棚器材', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (351, '冲印服务', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (352, '数码相框', 43, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (353, '存储卡', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (354, '读卡器', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (355, '滤镜', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (356, '闪光灯/手柄', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (357, '相机包', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (358, '三脚架/云台', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (359, '相机清洁/贴膜', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (360, '机身附件', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (361, '镜头附件', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (362, '电池/充电器', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (363, '移动电源', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (364, '数码支架', 44, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (365, '智能手环', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (366, '智能手表', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (367, '智能眼镜', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (368, '运动跟踪器', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (369, '健康监测', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (370, '智能配饰', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (371, '智能家居', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (372, '体感车', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (373, '其他配件', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (374, '智能机器人', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (375, '无人机', 45, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (376, 'MP3/MP4', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (377, '智能设备', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (378, '耳机/耳麦', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (379, '便携/无线音箱', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (380, '音箱/音响', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (381, '高清播放器', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (382, '收音机', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (383, 'MP3/MP4配件', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (384, '麦克风', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (385, '专业音频', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (386, '苹果配件', 46, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (387, '学生平板', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (388, '点读机/笔', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (389, '早教益智', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (390, '录音笔', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (391, '电纸书', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (392, '电子词典', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (393, '复读机', 47, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (394, '延保服务', 48, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (395, '杀毒软件', 48, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (396, '积分商品', 48, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (397, '桌布/罩件', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (398, '地毯地垫', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (399, '沙发垫套/椅垫', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (400, '床品套件', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (401, '被子', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (402, '枕芯', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (403, '床单被罩', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (404, '毯子', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (405, '床垫/床褥', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (406, '蚊帐', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (407, '抱枕靠垫', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (408, '毛巾浴巾', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (409, '电热毯', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (410, '窗帘/窗纱', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (411, '布艺软饰', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (412, '凉席', 49, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (413, '台灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (414, '节能灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (415, '装饰灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (416, '落地灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (417, '应急灯/手电', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (418, 'LED灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (419, '吸顶灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (420, '五金电器', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (421, '筒灯射灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (422, '吊灯', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (423, '氛围照明', 50, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (424, '保暖防护', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (425, '收纳用品', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (426, '雨伞雨具', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (427, '浴室用品', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (428, '缝纫/针织用品', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (429, '洗晒/熨烫', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (430, '净化除味', 51, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (431, '相框/照片墙', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (432, '装饰字画', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (433, '节庆饰品', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (434, '手工/十字绣', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (435, '装饰摆件', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (436, '帘艺隔断', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (437, '墙贴/装饰贴', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (438, '钟饰', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (439, '花瓶花艺', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (440, '香薰蜡烛', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (441, '创意家居', 52, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (442, '宠物主粮', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (443, '宠物零食', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (444, '医疗保健', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (445, '家居日用', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (446, '宠物玩具', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (447, '出行装备', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (448, '洗护美容', 53, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (449, '笔记本', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (450, '超极本', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (451, '游戏本', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (452, '平板电脑', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (453, '平板电脑配件', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (454, '台式机', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (455, '服务器/工作站', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (456, '笔记本配件', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (457, '一体机', 54, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (458, 'CPU', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (459, '主板', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (460, '显卡', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (461, '硬盘', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (462, 'SSD固态硬盘', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (463, '内存', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (464, '机箱', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (465, '电源', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (466, '显示器', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (467, '刻录机/光驱', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (468, '散热器', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (469, '声卡/扩展卡', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (470, '装机配件', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (471, '组装电脑', 55, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (472, '移动硬盘', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (473, 'U盘', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (474, '鼠标', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (475, '键盘', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (476, '鼠标垫', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (477, '摄像头', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (478, '手写板', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (479, '硬盘盒', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (480, '插座', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (481, '线缆', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (482, 'UPS电源', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (483, '电脑工具', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (484, '游戏设备', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (485, '电玩', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (486, '电脑清洁', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (487, '网络仪表仪器', 56, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (488, '游戏机', 57, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (489, '游戏耳机', 57, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (490, '手柄/方向盘', 57, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (491, '游戏软件', 57, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (492, '游戏周边', 57, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (493, '路由器', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (494, '网卡', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (495, '交换机', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (496, '网络存储', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (497, '4G/3G上网', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (498, '网络盒子', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (499, '网络配件', 58, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (500, '投影机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (501, '投影配件', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (502, '多功能一体机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (503, '打印机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (504, '传真设备', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (505, '验钞/点钞机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (506, '扫描设备', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (507, '复合机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (508, '碎纸机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (509, '考勤机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (510, '收款/POS机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (511, '会议音频视频', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (512, '保险柜', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (513, '装订/封装机', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (514, '安防监控', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (515, '办公家具', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (516, '白板', 59, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (517, '硒鼓/墨粉', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (518, '墨盒', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (519, '色带', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (520, '纸类', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (521, '办公文具', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (522, '学生文具', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (523, '财会用品', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (524, '文件管理', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (525, '本册/便签', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (526, '计算器', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (527, '笔类', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (528, '画具画材', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (529, '刻录碟片/附件', 60, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (530, '上门安装', 61, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (531, '延保服务', 61, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (532, '维修保养', 61, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (533, '电脑软件', 61, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (534, '京东服务', 61, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (535, '炒锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (536, '煎锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (537, '压力锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (538, '蒸锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (539, '汤锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (540, '奶锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (541, '锅具套装', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (542, '煲类', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (543, '水壶', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (544, '火锅', 62, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (545, '菜刀', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (546, '剪刀', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (547, '刀具套装', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (548, '砧板', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (549, '瓜果刀/刨', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (550, '多功能刀', 63, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (551, '保鲜盒', 64, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (552, '烘焙/烧烤', 64, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (553, '饭盒/提锅', 64, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (554, '储物/置物架', 64, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (555, '厨房DIY/小工具', 64, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (556, '塑料杯', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (557, '运动水壶', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (558, '玻璃杯', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (559, '陶瓷/马克杯', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (560, '保温杯', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (561, '保温壶', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (562, '酒杯/酒具', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (563, '杯具套装', 65, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (564, '餐具套装', 66, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (565, '碗/碟/盘', 66, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (566, '筷勺/刀叉', 66, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (567, '一次性用品', 66, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (568, '果盘/果篮', 66, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (569, '自助餐炉', 67, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (570, '酒店餐具', 67, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (571, '酒店水具', 67, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (572, '整套茶具', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (573, '茶杯', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (574, '茶壶', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (575, '茶盘茶托', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (576, '茶叶罐', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (577, '茶具配件', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (578, '茶宠摆件', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (579, '咖啡具', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (580, '其他', 68, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (581, '纸品湿巾', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (582, '衣物清洁', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (583, '清洁工具', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (584, '驱虫用品', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (585, '家庭清洁', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (586, '皮具护理', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (587, '一次性用品', 69, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (588, '洁面', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (589, '乳液面霜', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (590, '面膜', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (591, '剃须', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (592, '套装', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (593, '精华', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (594, '眼霜', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (595, '卸妆', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (596, '防晒', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (597, '防晒隔离', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (598, 'T区护理', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (599, '眼部护理', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (600, '精华露', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (601, '爽肤水', 70, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (602, '沐浴', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (603, '润肤', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (604, '颈部', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (605, '手足', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (606, '纤体塑形', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (607, '美胸', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (608, '套装', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (609, '精油', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (610, '洗发护发', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (611, '染发/造型', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (612, '香薰精油', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (613, '磨砂/浴盐', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (614, '手工/香皂', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (615, '洗发', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (616, '护发', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (617, '染发', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (618, '磨砂膏', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (619, '香皂', 71, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (620, '牙膏/牙粉', 72, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (621, '牙刷/牙线', 72, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (622, '漱口水', 72, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (623, '套装', 72, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (624, '卫生巾', 73, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (625, '卫生护垫', 73, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (626, '私密护理', 73, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (627, '脱毛膏', 73, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (628, '其他', 73, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (629, '洗发', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (630, '护发', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (631, '染发', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (632, '造型', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (633, '假发', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (634, '套装', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (635, '美发工具', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (636, '脸部护理', 74, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (637, '香水', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (638, '底妆', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (639, '腮红', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (640, '眼影', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (641, '唇部', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (642, '美甲', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (643, '眼线', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (644, '美妆工具', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (645, '套装', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (646, '防晒隔离', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (647, '卸妆', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (648, '眉笔', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (649, '睫毛膏', 75, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (650, 'T恤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (651, '衬衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (652, '针织衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (653, '雪纺衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (654, '卫衣', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (655, '马甲', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (656, '连衣裙', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (657, '半身裙', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (658, '牛仔裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (659, '休闲裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (660, '打底裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (661, '正装裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (662, '小西装', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (663, '短外套', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (664, '风衣', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (665, '毛呢大衣', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (666, '真皮皮衣', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (667, '棉服', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (668, '羽绒服', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (669, '大码女装', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (670, '中老年女装', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (671, '婚纱', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (672, '打底衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (673, '旗袍/唐装', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (674, '加绒裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (675, '吊带/背心', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (676, '羊绒衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (677, '短裤', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (678, '皮草', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (679, '礼服', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (680, '仿皮皮衣', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (681, '羊毛衫', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (682, '设计师/潮牌', 76, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (683, '衬衫', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (684, 'T恤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (685, 'POLO衫', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (686, '针织衫', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (687, '羊绒衫', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (688, '卫衣', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (689, '马甲/背心', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (690, '夹克', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (691, '风衣', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (692, '毛呢大衣', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (693, '仿皮皮衣', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (694, '西服', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (695, '棉服', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (696, '羽绒服', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (697, '牛仔裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (698, '休闲裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (699, '西裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (700, '西服套装', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (701, '大码男装', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (702, '中老年男装', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (703, '唐装/中山装', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (704, '工装', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (705, '真皮皮衣', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (706, '加绒裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (707, '卫裤/运动裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (708, '短裤', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (709, '设计师/潮牌', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (710, '羊毛衫', 77, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (711, '文胸', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (712, '女式内裤', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (713, '男式内裤', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (714, '睡衣/家居服', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (715, '塑身美体', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (716, '泳衣', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (717, '吊带/背心', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (718, '抹胸', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (719, '连裤袜/丝袜', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (720, '美腿袜', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (721, '商务男袜', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (722, '保暖内衣', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (723, '情侣睡衣', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (724, '文胸套装', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (725, '少女文胸', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (726, '休闲棉袜', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (727, '大码内衣', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (728, '内衣配件', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (729, '打底裤袜', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (730, '打底衫', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (731, '秋衣秋裤', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (732, '情趣内衣', 78, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (733, '服装洗护', 79, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (734, '太阳镜', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (735, '光学镜架/镜片', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (736, '围巾/手套/帽子套装', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (737, '袖扣', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (738, '棒球帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (739, '毛线帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (740, '遮阳帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (741, '老花镜', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (742, '装饰眼镜', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (743, '防辐射眼镜', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (744, '游泳镜', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (745, '女士丝巾/围巾/披肩', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (746, '男士丝巾/围巾', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (747, '鸭舌帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (748, '贝雷帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (749, '礼帽', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (750, '真皮手套', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (751, '毛线手套', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (752, '防晒手套', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (753, '男士腰带/礼盒', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (754, '女士腰带/礼盒', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (755, '钥匙扣', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (756, '遮阳伞/雨伞', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (757, '口罩', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (758, '耳罩/耳包', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (759, '假领', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (760, '毛线/布面料', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (761, '领带/领结/领带夹', 80, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (762, '男表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (763, '瑞表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (764, '女表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (765, '国表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (766, '日韩表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (767, '欧美表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (768, '德表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (769, '儿童手表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (770, '智能手表', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (771, '闹钟', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (772, '座钟挂钟', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (773, '钟表配件', 81, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (774, '商务休闲鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (775, '正装鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (776, '休闲鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (777, '凉鞋/沙滩鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (778, '男靴', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (779, '功能鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (780, '拖鞋/人字拖', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (781, '雨鞋/雨靴', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (782, '传统布鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (783, '鞋配件', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (784, '帆布鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (785, '增高鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (786, '工装鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (787, '定制鞋', 82, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (788, '高跟鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (789, '单鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (790, '休闲鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (791, '凉鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (792, '女靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (793, '雪地靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (794, '拖鞋/人字拖', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (795, '踝靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (796, '筒靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (797, '帆布鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (798, '雨鞋/雨靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (799, '妈妈鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (800, '鞋配件', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (801, '特色鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (802, '鱼嘴鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (803, '布鞋/绣花鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (804, '马丁靴', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (805, '坡跟鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (806, '松糕鞋', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (807, '内增高', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (808, '防水台', 83, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (809, '婴幼奶粉', 84, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (810, '孕妈奶粉', 84, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (811, '益生菌/初乳', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (812, '米粉/菜粉', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (813, '果泥/果汁', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (814, 'DHA', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (815, '宝宝零食', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (816, '钙铁锌/维生素', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (817, '清火/开胃', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (818, '面条/粥', 85, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (819, '婴儿尿裤', 86, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (820, '拉拉裤', 86, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (821, '婴儿湿巾', 86, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (822, '成人尿裤', 86, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (823, '奶瓶奶嘴', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (824, '吸奶器', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (825, '暖奶消毒', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (826, '儿童餐具', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (827, '水壶/水杯', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (828, '牙胶安抚', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (829, '围兜/防溅衣', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (830, '辅食料理机', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (831, '食物存储', 87, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (832, '宝宝护肤', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (833, '洗发沐浴', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (834, '奶瓶清洗', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (835, '驱蚊防晒', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (836, '理发器', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (837, '洗澡用具', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (838, '婴儿口腔清洁', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (839, '洗衣液/皂', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (840, '日常护理', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (841, '座便器', 88, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (842, '婴儿推车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (843, '餐椅摇椅', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (844, '婴儿床', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (845, '学步车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (846, '三轮车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (847, '自行车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (848, '电动车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (849, '扭扭车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (850, '滑板车', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (851, '婴儿床垫', 89, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (852, '婴儿外出服', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (853, '婴儿内衣', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (854, '婴儿礼盒', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (855, '婴儿鞋帽袜', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (856, '安全防护', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (857, '家居床品', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (858, '睡袋/抱被', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (859, '爬行垫', 90, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (860, '妈咪包/背婴带', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (861, '产后塑身', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (862, '文胸/内裤', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (863, '防辐射服', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (864, '孕妈装', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (865, '孕期营养', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (866, '孕妇护肤', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (867, '待产护理', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (868, '月子装', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (869, '防溢乳垫', 91, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (870, '套装', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (871, '上衣', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (872, '裤子', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (873, '裙子', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (874, '内衣/家居服', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (875, '羽绒服/棉服', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (876, '亲子装', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (877, '儿童配饰', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (878, '礼服/演出服', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (879, '运动鞋', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (880, '皮鞋/帆布鞋', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (881, '靴子', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (882, '凉鞋', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (883, '功能鞋', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (884, '户外/运动服', 92, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (885, '提篮式', 93, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (886, '安全座椅', 93, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (887, '增高垫', 93, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (888, '钱包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (889, '手拿包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (890, '单肩包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (891, '双肩包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (892, '手提包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (893, '斜挎包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (894, '钥匙包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (895, '卡包/零钱包', 94, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (896, '男士钱包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (897, '男士手包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (898, '卡包名片夹', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (899, '商务公文包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (900, '双肩包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (901, '单肩/斜挎包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (902, '钥匙包', 95, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (903, '电脑包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (904, '拉杆箱', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (905, '旅行包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (906, '旅行配件', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (907, '休闲运动包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (908, '拉杆包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (909, '登山包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (910, '妈咪包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (911, '书包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (912, '相机包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (913, '腰包/胸包', 96, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (914, '火机烟具', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (915, '礼品文具', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (916, '军刀军具', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (917, '收藏品', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (918, '工艺礼品', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (919, '创意礼品', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (920, '礼盒礼券', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (921, '鲜花绿植', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (922, '婚庆节庆', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (923, '京东卡', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (924, '美妆礼品', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (925, '礼品定制', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (926, '京东福卡', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (927, '古董文玩', 97, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (928, '箱包', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (929, '钱包', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (930, '服饰', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (931, '腰带', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (932, '太阳镜/眼镜框', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (933, '配件', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (934, '鞋靴', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (935, '饰品', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (936, '名品腕表', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (937, '高档化妆品', 98, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (938, '婚嫁首饰', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (939, '婚纱摄影', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (940, '婚纱礼服', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (941, '婚庆服务', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (942, '婚庆礼品/用品', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (943, '婚宴', 99, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (944, '饼干蛋糕', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (945, '糖果/巧克力', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (946, '休闲零食', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (947, '冲调饮品', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (948, '粮油调味', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (949, '牛奶', 100, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (950, '其他特产', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (951, '新疆', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (952, '北京', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (953, '山西', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (954, '内蒙古', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (955, '福建', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (956, '湖南', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (957, '四川', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (958, '云南', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (959, '东北', 101, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (960, '休闲零食', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (961, '坚果炒货', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (962, '肉干肉脯', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (963, '蜜饯果干', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (964, '糖果/巧克力', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (965, '饼干蛋糕', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (966, '无糖食品', 102, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (967, '米面杂粮', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (968, '食用油', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (969, '调味品', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (970, '南北干货', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (971, '方便食品', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (972, '有机食品', 103, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (973, '饮用水', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (974, '饮料', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (975, '牛奶乳品', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (976, '咖啡/奶茶', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (977, '冲饮谷物', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (978, '蜂蜜/柚子茶', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (979, '成人奶粉', 104, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (980, '月饼', 105, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (981, '大闸蟹', 105, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (982, '粽子', 105, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (983, '卡券', 105, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (984, '铁观音', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (985, '普洱', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (986, '龙井', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (987, '绿茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (988, '红茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (989, '乌龙茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (990, '花草茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (991, '花果茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (992, '养生茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (993, '黑茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (994, '白茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (995, '其它茶', 106, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (996, '项链', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (997, '手链/脚链', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (998, '戒指', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (999, '耳饰', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1000, '毛衣链', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1001, '发饰/发卡', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1002, '胸针', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1003, '饰品配件', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1004, '婚庆饰品', 107, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1005, '黄金吊坠', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1006, '黄金项链', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1007, '黄金转运珠', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1008, '黄金手镯/手链/脚链', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1009, '黄金耳饰', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1010, '黄金戒指', 108, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1011, 'K金吊坠', 109, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1012, 'K金项链', 109, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1013, 'K金手镯/手链/脚链', 109, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1014, 'K金戒指', 109, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1015, 'K金耳饰', 109, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1016, '投资金', 110, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1017, '投资银', 110, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1018, '投资收藏', 110, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1019, '银吊坠/项链', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1020, '银手镯/手链/脚链', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1021, '银戒指', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1022, '银耳饰', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1023, '足银手镯', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1024, '宝宝银饰', 111, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1025, '裸钻', 112, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1026, '钻戒', 112, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1027, '钻石项链/吊坠', 112, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1028, '钻石耳饰', 112, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1029, '钻石手镯/手链', 112, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1030, '项链/吊坠', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1031, '手镯/手串', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1032, '戒指', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1033, '耳饰', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1034, '挂件/摆件/把件', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1035, '玉石孤品', 113, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1036, '项链/吊坠', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1037, '耳饰', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1038, '手镯/手链/脚链', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1039, '戒指', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1040, '头饰/胸针', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1041, '摆件/挂件', 114, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1042, '琥珀/蜜蜡', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1043, '碧玺', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1044, '红宝石/蓝宝石', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1045, '坦桑石', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1046, '珊瑚', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1047, '祖母绿', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1048, '葡萄石', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1049, '其他天然宝石', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1050, '项链/吊坠', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1051, '耳饰', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1052, '手镯/手链', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1053, '戒指', 115, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1054, '铂金项链/吊坠', 116, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1055, '铂金手镯/手链/脚链', 116, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1056, '铂金戒指', 116, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1057, '铂金耳饰', 116, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1058, '小叶紫檀', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1059, '黄花梨', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1060, '沉香木', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1061, '金丝楠', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1062, '菩提', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1063, '其他', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1064, '橄榄核/核桃', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1065, '檀香', 117, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1066, '珍珠项链', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1067, '珍珠吊坠', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1068, '珍珠耳饰', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1069, '珍珠手链', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1070, '珍珠戒指', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1071, '珍珠胸针', 118, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1072, '机油', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1073, '正时皮带', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1074, '添加剂', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1075, '汽车喇叭', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1076, '防冻液', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1077, '汽车玻璃', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1078, '滤清器', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1079, '火花塞', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1080, '减震器', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1081, '柴机油/辅助油', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1082, '雨刷', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1083, '车灯', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1084, '后视镜', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1085, '轮胎', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1086, '轮毂', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1087, '刹车片/盘', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1088, '维修配件', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1089, '蓄电池', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1090, '底盘装甲/护板', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1091, '贴膜', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1092, '汽修工具', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1093, '改装配件', 119, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1094, '导航仪', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1095, '安全预警仪', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1096, '行车记录仪', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1097, '倒车雷达', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1098, '蓝牙设备', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1099, '车载影音', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1100, '净化器', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1101, '电源', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1102, '智能驾驶', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1103, '车载电台', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1104, '车载电器配件', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1105, '吸尘器', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1106, '智能车机', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1107, '冰箱', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1108, '汽车音响', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1109, '车载生活电器', 120, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1110, '车蜡', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1111, '补漆笔', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1112, '玻璃水', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1113, '清洁剂', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1114, '洗车工具', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1115, '镀晶镀膜', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1116, '打蜡机', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1117, '洗车配件', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1118, '洗车机', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1119, '洗车水枪', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1120, '毛巾掸子', 121, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1121, '脚垫', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1122, '座垫', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1123, '座套', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1124, '后备箱垫', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1125, '头枕腰靠', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1126, '方向盘套', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1127, '香水', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1128, '空气净化', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1129, '挂件摆件', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1130, '功能小件', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1131, '车身装饰件', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1132, '车衣', 122, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1133, '安全座椅', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1134, '胎压监测', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1135, '防盗设备', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1136, '应急救援', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1137, '保温箱', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1138, '地锁', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1139, '摩托车', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1140, '充气泵', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1141, '储物箱', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1142, '自驾野营', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1143, '摩托车装备', 123, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1144, '清洗美容', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1145, '功能升级', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1146, '保养维修', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1147, '油卡充值', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1148, '车险', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1149, '加油卡', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1150, 'ETC', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1151, '驾驶培训', 124, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1152, '赛事服装', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1153, '赛事用品', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1154, '制动系统', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1155, '悬挂系统', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1156, '进气系统', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1157, '排气系统', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1158, '电子管理', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1159, '车身强化', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1160, '赛事座椅', 125, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1161, '跑步鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1162, '休闲鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1163, '篮球鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1164, '板鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1165, '帆布鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1166, '足球鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1167, '乒羽网鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1168, '专项运动鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1169, '训练鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1170, '拖鞋', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1171, '运动包', 126, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1172, '羽绒服', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1173, '棉服', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1174, '运动裤', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1175, '夹克/风衣', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1176, '卫衣/套头衫', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1177, 'T恤', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1178, '套装', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1179, '乒羽网服', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1180, '健身服', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1181, '运动背心', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1182, '毛衫/线衫', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1183, '运动配饰', 127, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1184, '折叠车', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1185, '山地车/公路车', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1186, '电动车', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1187, '其他整车', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1188, '骑行服', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1189, '骑行装备', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1190, '平衡车', 128, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1191, '鱼竿鱼线', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1192, '浮漂鱼饵', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1193, '钓鱼桌椅', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1194, '钓鱼配件', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1195, '钓箱鱼包', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1196, '其它', 129, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1197, '泳镜', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1198, '泳帽', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1199, '游泳包防水包', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1200, '女士泳衣', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1201, '男士泳衣', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1202, '比基尼', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1203, '其它', 130, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1204, '冲锋衣裤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1205, '速干衣裤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1206, '滑雪服', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1207, '羽绒服/棉服', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1208, '休闲衣裤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1209, '抓绒衣裤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1210, '软壳衣裤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1211, 'T恤', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1212, '户外风衣', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1213, '功能内衣', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1214, '军迷服饰', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1215, '登山鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1216, '雪地靴', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1217, '徒步鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1218, '越野跑鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1219, '休闲鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1220, '工装鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1221, '溯溪鞋', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1222, '沙滩/凉拖', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1223, '户外袜', 131, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1224, '帐篷/垫子', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1225, '睡袋/吊床', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1226, '登山攀岩', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1227, '户外配饰', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1228, '背包', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1229, '户外照明', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1230, '户外仪表', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1231, '户外工具', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1232, '望远镜', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1233, '旅游用品', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1234, '便携桌椅床', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1235, '野餐烧烤', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1236, '军迷用品', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1237, '救援装备', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1238, '滑雪装备', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1239, '极限户外', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1240, '冲浪潜水', 132, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1241, '综合训练器', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1242, '其他大型器械', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1243, '哑铃', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1244, '仰卧板/收腹机', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1245, '其他中小型器材', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1246, '瑜伽舞蹈', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1247, '甩脂机', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1248, '踏步机', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1249, '武术搏击', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1250, '健身车/动感单车', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1251, '跑步机', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1252, '运动护具', 133, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1253, '羽毛球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1254, '乒乓球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1255, '篮球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1256, '足球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1257, '网球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1258, '排球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1259, '高尔夫', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1260, '台球', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1261, '棋牌麻将', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1262, '轮滑滑板', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1263, '其他', 134, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1264, '0-6个月', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1265, '6-12个月', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1266, '1-3岁', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1267, '3-6岁', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1268, '6-14岁', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1269, '14岁以上', 135, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1270, '遥控车', 136, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1271, '遥控飞机', 136, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1272, '遥控船', 136, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1273, '机器人', 136, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1274, '轨道/助力', 136, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1275, '毛绒/布艺', 137, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1276, '靠垫/抱枕', 137, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1277, '芭比娃娃', 138, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1278, '卡通娃娃', 138, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1279, '智能娃娃', 138, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1280, '仿真模型', 139, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1281, '拼插模型', 139, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1282, '收藏爱好', 139, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1283, '炫舞毯', 140, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1284, '爬行垫/毯', 140, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1285, '户外玩具', 140, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1286, '戏水玩具', 140, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1287, '电影周边', 141, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1288, '卡通周边', 141, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1289, '网游周边', 141, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1290, '摇铃/床铃', 142, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1291, '健身架', 142, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1292, '早教启智', 142, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1293, '拖拉玩具', 142, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1294, '积木', 143, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1295, '拼图', 143, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1296, '磁力棒', 143, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1297, '立体拼插', 143, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1298, '手工彩泥', 144, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1299, '绘画工具', 144, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1300, '情景玩具', 144, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1301, '减压玩具', 145, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1302, '创意玩具', 145, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1303, '钢琴', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1304, '电子琴/电钢琴', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1305, '吉他/尤克里里', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1306, '打击乐器', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1307, '西洋管弦', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1308, '民族管弦乐器', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1309, '乐器配件', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1310, '电脑音乐', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1311, '工艺礼品乐器', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1312, '口琴/口风琴/竖笛', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1313, '手风琴', 146, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1314, '双色球', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1315, '大乐透', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1316, '福彩3D', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1317, '排列三', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1318, '排列五', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1319, '七星彩', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1320, '七乐彩', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1321, '竞彩足球', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1322, '竞彩篮球', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1323, '新时时彩', 147, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1324, '国内机票', 148, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1325, '国内酒店', 149, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1326, '酒店团购', 149, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1327, '度假', 150, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1328, '景点', 150, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1329, '租车', 150, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1330, '火车票', 150, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1331, '旅游团购', 150, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1332, '手机充值', 151, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1333, '游戏点卡', 152, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1334, 'QQ充值', 152, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1335, '电影票', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1336, '演唱会', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1337, '话剧歌剧', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1338, '音乐会', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1339, '体育赛事', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1340, '舞蹈芭蕾', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1341, '戏曲综艺', 153, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1342, '东北', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1343, '华北', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1344, '西北', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1345, '华中', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1346, '华东', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1347, '华南', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1348, '西南', 154, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1349, '苹果', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1350, '橙子', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1351, '奇异果/猕猴桃', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1352, '车厘子/樱桃', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1353, '芒果', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1354, '蓝莓', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1355, '火龙果', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1356, '葡萄/提子', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1357, '柚子', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1358, '香蕉', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1359, '牛油果', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1360, '梨', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1361, '菠萝/凤梨', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1362, '桔/橘', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1363, '柠檬', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1364, '草莓', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1365, '桃/李/杏', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1366, '更多水果', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1367, '水果礼盒/券', 155, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1368, '牛肉', 156, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1369, '羊肉', 156, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1370, '猪肉', 156, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1371, '内脏类', 156, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1372, '鱼类', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1373, '虾类', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1374, '蟹类', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1375, '贝类', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1376, '海参', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1377, '海产干货', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1378, '其他水产', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1379, '海产礼盒', 157, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1380, '鸡肉', 158, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1381, '鸭肉', 158, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1382, '蛋类', 158, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1383, '其他禽类', 158, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1384, '水饺/馄饨', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1385, '汤圆/元宵', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1386, '面点', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1387, '火锅丸串', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1388, '速冻半成品', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1389, '奶酪黄油', 159, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1390, '熟食', 160, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1391, '腊肠/腊肉', 160, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1392, '火腿', 160, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1393, '糕点', 160, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1394, '礼品卡券', 160, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1395, '冷藏果蔬汁', 161, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1396, '冰激凌', 161, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1397, '其他', 161, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1398, '叶菜类', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1399, '茄果瓜类', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1400, '根茎类', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1401, '鲜菌菇', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1402, '葱姜蒜椒', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1403, '半加工蔬菜', 162, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1404, '微型车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1405, '小型车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1406, '紧凑型车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1407, '中型车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1408, '中大型车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1409, '豪华车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1410, 'MPV', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1411, 'SUV', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1412, '跑车', 163, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1413, '微型车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1414, '小型车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1415, '紧凑型车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1416, '中型车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1417, '中大型车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1418, '豪华车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1419, 'MPV（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1420, 'SUV（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1421, '跑车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1422, '皮卡（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1423, '面包车（二手）', 164, 3, 1, 0, NULL, NULL, 0);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1431, 'dsa323', 1, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`,
                            `product_count`)
VALUES (1432, 'fdsffdsadddd大萨达', 1431, 3, 1, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_category_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_brand_relation`;
CREATE TABLE `pms_category_brand_relation`
(
    `id`           bigint NOT NULL AUTO_INCREMENT,
    `brand_id`     bigint                                           DEFAULT NULL COMMENT 'Æ·ÅÆid',
    `catalog_id`   bigint                                           DEFAULT NULL COMMENT '·ÖÀàid',
    `brand_name`   varchar(255) CHARACTER SET utf8mb4  COLLATE utf8_bin DEFAULT NULL,
    `catalog_name` varchar(255) CHARACTER SET utf8mb4  COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Æ·ÅÆ·ÖÀà¹ØÁª';

-- ----------------------------
-- Records of pms_category_brand_relation
-- ----------------------------
BEGIN;
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catalog_id`, `brand_name`, `catalog_name`)
VALUES (1, 1, 165, 'Huawei', '电子书');
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catalog_id`, `brand_name`, `catalog_name`)
VALUES (2, 2, 225, 'Xiaomi', '手机');
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catalog_id`, `brand_name`, `catalog_name`)
VALUES (3, 3, 225, 'Apple', '手机');
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catalog_id`, `brand_name`, `catalog_name`)
VALUES (4, 1, 225, 'Huawei', '手机');
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catalog_id`, `brand_name`, `catalog_name`)
VALUES (5, 4, 225, 'OPPO', '手机');
COMMIT;

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`
(
    `id`         bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `comment_id` bigint DEFAULT NULL COMMENT '评论id',
    `reply_id`   bigint DEFAULT NULL COMMENT '回复id',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4  COMMENT ='商品评价回复关系';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attr_value`;
CREATE TABLE `pms_product_attr_value`
(
    `id`         bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `spu_id`     bigint       DEFAULT NULL COMMENT '商品id',
    `attr_id`    bigint       DEFAULT NULL COMMENT '属性id',
    `attr_name`  varchar(200) DEFAULT NULL COMMENT '属性名',
    `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值',
    `attr_sort`  int          DEFAULT NULL COMMENT '顺序',
    `quick_show` tinyint      DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8mb4  COMMENT ='spu属性值';

-- ----------------------------
-- Records of pms_product_attr_value
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (5, 2, 5, '上市年份', '2018', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (6, 2, 6, 'CPU型号', '麒麟980', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (7, 2, 8, '入网型号', 'SM-S9010', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (8, 2, 11, '上市月份', '11月', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (9, 1, 5, '上市年份', '2019', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (10, 1, 6, 'CPU型号', '晓龙888', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (11, 1, 8, '入网型号', 'SM-S9010', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (12, 1, 11, '上市月份', '5月', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (13, 3, 5, '上市年份', '2021', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (14, 3, 6, 'CPU型号', '麒麟980', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (15, 3, 8, '入网型号', 'SM-S9010', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (16, 3, 11, '上市月份', '1月', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (17, 4, 5, '上市年份', '2021', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (18, 4, 6, 'CPU型号', '麒麟980', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (19, 4, 8, '入网型号', 'SM-S9010', NULL, 0);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (20, 4, 11, '上市月份', '7月', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (21, 5, 5, '上市年份', '2019', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (22, 5, 6, 'CPU型号', '晓龙888', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (23, 5, 8, '入网型号', 'SM-S9010', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (24, 5, 11, '上市月份', '3月', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (25, 6, 5, '上市年份', '2019', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (26, 6, 6, 'CPU型号', '晓龙888', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (27, 6, 8, '入网型号', 'SM-S9010', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (28, 6, 11, '上市月份', '3月', NULL, 1);
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`)
VALUES (29, 7, 8, '入网型号', 'SM-S9010', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_images`;
CREATE TABLE `pms_sku_images`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sku_id`      bigint       DEFAULT NULL COMMENT 'sku_id',
    `img_url`     varchar(255) DEFAULT NULL COMMENT '图片地址',
    `img_sort`    int          DEFAULT NULL COMMENT '排序',
    `default_img` int          DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4  COMMENT ='sku图片';

-- ----------------------------
-- Records of pms_sku_images
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (1, 9,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//1160e662-552b-4de8-80b2-5765f30985b3_63e862164165f483.jpg',
        NULL, 1);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (2, 9,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//527b043c-95a9-410d-868b-ea68d5fd074a_e3284f319e256a5d.jpg',
        NULL, 0);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (3, 21,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//ebf238f0-bd5b-4892-8118-ca18456e6fa4_R-C.png',
        NULL, 1);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (4, 22,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//ebf238f0-bd5b-4892-8118-ca18456e6fa4_R-C.png',
        NULL, 1);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (5, 23,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//ebf238f0-bd5b-4892-8118-ca18456e6fa4_R-C.png',
        NULL, 1);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (6, 30, 'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220211130000529.png', NULL, NULL);
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`)
VALUES (7, 30,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//ebf238f0-bd5b-4892-8118-ca18456e6fa4_R-C.png',
        NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_info`;
CREATE TABLE `pms_sku_info`
(
    `sku_id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'skuId',
    `spu_id`          bigint         DEFAULT NULL COMMENT 'spuId',
    `sku_name`        varchar(255)   DEFAULT NULL COMMENT 'sku名称',
    `sku_desc`        varchar(2000)  DEFAULT NULL COMMENT 'sku介绍描述',
    `catalog_id`      bigint         DEFAULT NULL COMMENT '所属分类id',
    `brand_id`        bigint         DEFAULT NULL COMMENT '品牌id',
    `sku_default_img` varchar(255)   DEFAULT NULL COMMENT '默认图片',
    `sku_title`       varchar(255)   DEFAULT NULL COMMENT '标题',
    `sku_subtitle`    varchar(2000)  DEFAULT NULL COMMENT '副标题',
    `price`           decimal(18, 4) DEFAULT NULL COMMENT '价格',
    `sale_count`      bigint         DEFAULT NULL COMMENT '销量',
    PRIMARY KEY (`sku_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 71
  DEFAULT CHARSET = utf8mb4  COMMENT ='sku信息';

-- ----------------------------
-- Records of pms_sku_info
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (29, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (30, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 65999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (31, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 8G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 8G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 6.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (32, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 8G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 8G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 7.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (33, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 12G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 12G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 8.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (34, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 12G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 12G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 9.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (35, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 4G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 4G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 10.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (36, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 4G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 4G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (37, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 8G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 8G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (38, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 8G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 8G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (39, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 12G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 12G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (40, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 12G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 12G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (41, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 4G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 4G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (42, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 4G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 4G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (43, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 8G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 8G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (44, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 8G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 8G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (45, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 12G 64G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 12G 64G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (46, 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 12G 128G', NULL, 225, 3,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 粉色 12G 128G',
        'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 5999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (47, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 8G 128G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 8G 128G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (48, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 8G 64G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 8G 64G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (49, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 4G 128G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 4G 128G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (50, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 4G 64G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 深空灰 4G 64G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (51, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 8G 128G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 8G 128G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (52, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 8G 64G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 8G 64G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (53, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 4G 128G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 4G 128G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (54, 5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 4G 64G', NULL, 225, 4,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机 白色 4G 64G',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 2999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (55, 6, 'Vivo X555 深空灰 8G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Vivo X555 深空灰 8G 128G', 'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (56, 6, 'Vivo X555 深空灰 8G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 深空灰 8G 64G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (57, 6, 'Vivo X555 深空灰 4G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png',
        'Vivo X555 深空灰 4G 128G', 'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (58, 6, 'Vivo X555 深空灰 4G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 深空灰 4G 64G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (59, 6, 'Vivo X555 白色 8G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 白色 8G 128G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (60, 6, 'Vivo X555 白色 8G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 白色 8G 64G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (61, 6, 'Vivo X555 白色 4G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 白色 4G 128G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (62, 6, 'Vivo X555 白色 4G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Vivo X555 白色 4G 64G',
        'Vivo', 1000.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (63, 7, 'Test1 深空灰 4G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 深空灰 4G 64G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (64, 7, 'Test1 深空灰 4G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 深空灰 4G 128G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (65, 7, 'Test1 深空灰 8G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 深空灰 8G 64G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (66, 7, 'Test1 深空灰 8G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 深空灰 8G 128G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (67, 7, 'Test1 白色 4G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 白色 4G 64G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (68, 7, 'Test1 白色 4G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 白色 4G 128G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (69, 7, 'Test1 白色 8G 64G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 白色 8G 64G',
        'Test1', 999.0000, 0);
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`,
                            `sku_title`, `sku_subtitle`, `price`, `sale_count`)
VALUES (70, 7, 'Test1 白色 8G 128G', NULL, 225, 2,
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 'Test1 白色 8G 128G',
        'Test1', 999.0000, 0);
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;
CREATE TABLE `pms_sku_sale_attr_value`
(
    `id`         bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sku_id`     bigint       DEFAULT NULL COMMENT 'sku_id',
    `attr_id`    bigint       DEFAULT NULL COMMENT 'attr_id',
    `attr_name`  varchar(200) DEFAULT NULL COMMENT '销售属性名',
    `attr_value` varchar(200) DEFAULT NULL COMMENT '销售属性值',
    `attr_sort`  int          DEFAULT NULL COMMENT '顺序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 211
  DEFAULT CHARSET = utf8mb4  COMMENT ='sku销售属性&值';

-- ----------------------------
-- Records of pms_sku_sale_attr_value
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (1, 1, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (2, 1, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (3, 1, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (4, 2, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (5, 2, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (6, 2, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (7, 3, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (8, 3, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (9, 3, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (10, 4, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (11, 4, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (12, 4, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (13, 5, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (14, 5, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (15, 5, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (16, 6, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (17, 6, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (18, 6, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (19, 7, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (20, 7, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (21, 7, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (22, 8, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (23, 8, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (24, 8, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (25, 9, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (26, 9, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (27, 9, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (28, 10, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (29, 10, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (30, 10, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (31, 11, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (32, 11, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (33, 11, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (34, 12, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (35, 12, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (36, 12, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (37, 13, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (38, 13, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (39, 13, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (40, 14, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (41, 14, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (42, 14, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (43, 15, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (44, 15, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (45, 15, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (46, 16, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (47, 16, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (48, 16, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (49, 17, 9, '颜色', '午夜色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (50, 17, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (51, 17, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (52, 18, 9, '颜色', '午夜色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (53, 18, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (54, 18, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (55, 19, 9, '颜色', '午夜色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (56, 19, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (57, 19, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (58, 20, 9, '颜色', '午夜色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (59, 20, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (60, 20, 12, '存储容量', '256G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (61, 21, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (62, 21, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (63, 21, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (64, 22, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (65, 22, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (66, 22, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (67, 23, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (68, 23, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (69, 23, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (70, 24, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (71, 24, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (72, 24, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (73, 25, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (74, 25, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (75, 25, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (76, 26, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (77, 26, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (78, 26, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (79, 27, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (80, 27, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (81, 27, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (82, 28, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (83, 28, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (84, 28, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (85, 29, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (86, 29, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (87, 29, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (88, 30, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (89, 30, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (90, 30, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (91, 31, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (92, 31, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (93, 31, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (94, 32, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (95, 32, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (96, 32, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (97, 33, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (98, 33, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (99, 33, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (100, 34, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (101, 34, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (102, 34, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (103, 35, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (104, 35, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (105, 35, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (106, 36, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (107, 36, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (108, 36, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (109, 37, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (110, 37, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (111, 37, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (112, 38, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (113, 38, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (114, 38, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (115, 39, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (116, 39, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (117, 39, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (118, 40, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (119, 40, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (120, 40, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (121, 41, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (122, 41, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (123, 41, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (124, 42, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (125, 42, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (126, 42, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (127, 43, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (128, 43, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (129, 43, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (130, 44, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (131, 44, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (132, 44, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (133, 45, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (134, 45, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (135, 45, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (136, 46, 9, '颜色', '粉色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (137, 46, 10, '内存', '12G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (138, 46, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (139, 47, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (140, 47, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (141, 47, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (142, 48, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (143, 48, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (144, 48, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (145, 49, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (146, 49, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (147, 49, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (148, 50, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (149, 50, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (150, 50, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (151, 51, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (152, 51, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (153, 51, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (154, 52, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (155, 52, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (156, 52, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (157, 53, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (158, 53, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (159, 53, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (160, 54, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (161, 54, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (162, 54, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (163, 55, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (164, 55, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (165, 55, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (166, 56, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (167, 56, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (168, 56, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (169, 57, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (170, 57, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (171, 57, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (172, 58, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (173, 58, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (174, 58, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (175, 59, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (176, 59, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (177, 59, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (178, 60, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (179, 60, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (180, 60, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (181, 61, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (182, 61, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (183, 61, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (184, 62, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (185, 62, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (186, 62, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (187, 63, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (188, 63, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (189, 63, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (190, 64, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (191, 64, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (192, 64, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (193, 65, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (194, 65, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (195, 65, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (196, 66, 9, '颜色', '深空灰', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (197, 66, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (198, 66, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (199, 67, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (200, 67, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (201, 67, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (202, 68, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (203, 68, 10, '内存', '4G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (204, 68, 12, '存储容量', '128G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (205, 69, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (206, 69, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (207, 69, 12, '存储容量', '64G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (208, 70, 9, '颜色', '白色', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (209, 70, 10, '内存', '8G', NULL);
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`)
VALUES (210, 70, 12, '存储容量', '128G', NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_spu_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_comment`;
CREATE TABLE `pms_spu_comment`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sku_id`           bigint        DEFAULT NULL COMMENT 'sku_id',
    `spu_id`           bigint        DEFAULT NULL COMMENT 'spu_id',
    `spu_name`         varchar(255)  DEFAULT NULL COMMENT '商品名字',
    `member_nick_name` varchar(255)  DEFAULT NULL COMMENT '会员昵称',
    `star`             tinyint(1)    DEFAULT NULL COMMENT '星级',
    `member_ip`        varchar(64)   DEFAULT NULL COMMENT '会员ip',
    `create_time`      datetime      DEFAULT NULL COMMENT '创建时间',
    `show_status`      tinyint(1)    DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
    `spu_attributes`   varchar(255)  DEFAULT NULL COMMENT '购买时属性组合',
    `likes_count`      int           DEFAULT NULL COMMENT '点赞数',
    `reply_count`      int           DEFAULT NULL COMMENT '回复数',
    `resources`        varchar(1000) DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
    `content`          text COMMENT '内容',
    `member_icon`      varchar(255)  DEFAULT NULL COMMENT '用户头像',
    `comment_type`     tinyint       DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4  COMMENT ='商品评价';

-- ----------------------------
-- Records of pms_spu_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pms_spu_images
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_images`;
CREATE TABLE `pms_spu_images`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `spu_id`      bigint       DEFAULT NULL COMMENT 'spu_id',
    `img_name`    varchar(200) DEFAULT NULL COMMENT '图片名',
    `img_url`     varchar(255) DEFAULT NULL COMMENT '图片地址',
    `img_sort`    int          DEFAULT NULL COMMENT '顺序',
    `default_img` tinyint      DEFAULT NULL COMMENT '是否默认图',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4  COMMENT ='spu图片';

-- ----------------------------
-- Records of pms_spu_images
-- ----------------------------
BEGIN;
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (1, 1, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//1f608f63-50e9-4b78-8a18-a4aa7aa6df5a_f6982a3217eb2fa3.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (2, 1, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//9e0282fa-d930-4571-8567-9e1fe76f3523_0d40c24b264aa511.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (3, 1, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//3bb5aa70-fbc8-462e-8720-59b371fc1545_fe215589ed6500f4.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (4, 1, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//403ef662-1124-4825-8efd-32c1ab9bbc70_f6982a3217eb2fa3.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (5, 2, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//1160e662-552b-4de8-80b2-5765f30985b3_63e862164165f483.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (6, 2, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//527b043c-95a9-410d-868b-ea68d5fd074a_e3284f319e256a5d.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (7, 2, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//2e821b84-d56c-419c-802f-bdb282b06c1d_6a1b2703a9ed8737.jpg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (8, 3, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//ebf238f0-bd5b-4892-8118-ca18456e6fa4_R-C.png',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (9, 4, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//29f3b8db-b991-47ad-854b-738e27c1e941_R-C.png',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (10, 5, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-28//6ef2e152-4248-4218-8705-95bd3578deb4_OIP-C (2).jpeg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (11, 6, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-28//5aadacbd-f363-4db2-8ae5-98de199858aa_OIP-C (2).jpeg',
        NULL, NULL);
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`)
VALUES (12, 7, NULL,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-03-01//8635ec11-ddb7-4500-8bf6-6c4349228201_OIP-C.jpeg',
        NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_spu_info
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info`;
CREATE TABLE `pms_spu_info`
(
    `id`              bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
    `spu_name`        varchar(200)   DEFAULT NULL COMMENT '商品名称',
    `spu_description` varchar(1000)  DEFAULT NULL COMMENT '商品描述',
    `catalog_id`      bigint         DEFAULT NULL COMMENT '所属分类id',
    `brand_id`        bigint         DEFAULT NULL COMMENT '品牌id',
    `weight`          decimal(18, 4) DEFAULT NULL,
    `publish_status`  tinyint        DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
    `create_time`     datetime       DEFAULT NULL,
    `update_time`     datetime       DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4  COMMENT ='spu信息';

-- ----------------------------
-- Records of pms_spu_info
-- ----------------------------
BEGIN;
INSERT INTO `pms_spu_info` (`id`, `spu_name`, `spu_description`, `catalog_id`, `brand_id`, `weight`, `publish_status`,
                            `create_time`, `update_time`)
VALUES (4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB',
        225, 3, 0.1000, 1, '2022-02-27 14:59:29', '2022-02-27 14:59:29');
INSERT INTO `pms_spu_info` (`id`, `spu_name`, `spu_description`, `catalog_id`, `brand_id`, `weight`, `publish_status`,
                            `create_time`, `update_time`)
VALUES (5, 'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机',
        'OPPO Find X5 Pro 12+256GB 白瓷 全新骁龙8 自研影像芯片 哈苏影像 5000万双主摄 120Hz 80W超级闪充 5G手机', 225, 4, 0.1000, 1,
        '2022-02-28 17:03:28', '2022-02-28 17:03:28');
INSERT INTO `pms_spu_info` (`id`, `spu_name`, `spu_description`, `catalog_id`, `brand_id`, `weight`, `publish_status`,
                            `create_time`, `update_time`)
VALUES (6, 'Vivo X555', 'Vivo X555', 225, 2, 0.0000, 1, '2022-02-28 17:08:00', '2022-02-28 17:08:00');
INSERT INTO `pms_spu_info` (`id`, `spu_name`, `spu_description`, `catalog_id`, `brand_id`, `weight`, `publish_status`,
                            `create_time`, `update_time`)
VALUES (7, 'Test1', 'Test1', 225, 2, 0.0000, 1, '2022-03-01 08:46:30', '2022-03-01 08:46:30');
COMMIT;

-- ----------------------------
-- Table structure for pms_spu_info_desc
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu_info_desc`;
CREATE TABLE `pms_spu_info_desc`
(
    `spu_id`  bigint NOT NULL COMMENT '商品id',
    `decript` longtext COMMENT '商品介绍',
    PRIMARY KEY (`spu_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4  COMMENT ='spu信息介绍';

-- ----------------------------
-- Records of pms_spu_info_desc
-- ----------------------------
BEGIN;
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (1,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//fd086a06-e0b8-4ca8-8b97-68f78824f77b_OIP-C (1).jpeg,https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//a78f7618-3f05-4e90-8372-57570b039db6_23d9fbb256ea5d4a.jpg,https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//a0b94021-9872-4a4d-8628-53ed0eb70bcd_d08df10ef411470b.jpg,https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//a32889d0-2bf9-4af3-857d-a9f50cdedce3_73ab4d2e818d2211.jpg');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (2,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-16//4973b84e-8e9f-4804-82ab-24e32d6333e3_f6982a3217eb2fa3.jpg');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (3,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//1a7de0e2-2a8d-4813-87ee-7851e28e7066_R-C.png');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (4,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-27//2046be37-4478-4cab-84a3-f0a6ac8ad812_R-C.png');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (5,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-28//cd38d2c7-39a1-4d08-8c1c-9748095b57f2_OIP-C (2).jpeg');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (6,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-02-28//f3193786-24a1-4dae-8292-b7b16e107479_OIP-C (2).jpeg');
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`)
VALUES (7,
        'https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-03-01//5a340d0e-52e4-407a-8615-9435494df030_acef79330053336512cf9c48b29df9bd69ad3a78.jpg@942w_3443h_progressive.webp,https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-03-01//b5824e0f-4fe2-49e1-8132-cdcc29762050_image (1).png,https://mall-project-february.oss-cn-hangzhou.aliyuncs.com/2022-03-01//51c52948-bb9d-40d5-8ec4-e31b95c95774_OIP-C (2).jpeg');
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT,
    `branch_id`     bigint       NOT NULL,
    `xid`           varchar(100) NOT NULL,
    `context`       varchar(128) NOT NULL,
    `rollback_info` longblob     NOT NULL,
    `log_status`    int          NOT NULL,
    `log_created`   datetime     NOT NULL,
    `log_modified`  datetime     NOT NULL,
    `ext`           varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ux_undo_log` (`xid`, `branch_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
