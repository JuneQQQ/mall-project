DROP database IF EXISTS mall_ums;
create database mall_ums;
use  mall_ums;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`    bigint     DEFAULT NULL COMMENT 'member_id',
    `create_time`  datetime   DEFAULT NULL COMMENT 'create_time',
    `change_count` int        DEFAULT NULL COMMENT '改变的值（正负计数）',
    `note`         varchar(0) DEFAULT NULL COMMENT '备注',
    `source_type`  tinyint    DEFAULT NULL COMMENT '积分来源[0-购物，1-管理员修改]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='成长值变化历史记录';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`    bigint       DEFAULT NULL COMMENT 'member_id',
    `create_time`  datetime     DEFAULT NULL COMMENT 'create_time',
    `change_count` int          DEFAULT NULL COMMENT '变化的值',
    `note`         varchar(255) DEFAULT NULL COMMENT '备注',
    `source_tyoe`  tinyint      DEFAULT NULL COMMENT '来源[0->购物；1->管理员修改;2->活动]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='积分变化历史记录';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `level_id`    bigint       DEFAULT NULL COMMENT '会员等级id',
    `username`    char(64)     DEFAULT NULL COMMENT '用户名',
    `password`    varchar(64)  DEFAULT NULL COMMENT '密码',
    `nickname`    varchar(64)  DEFAULT NULL COMMENT '昵称',
    `mobile`      varchar(20)  DEFAULT NULL COMMENT '手机号码',
    `email`       varchar(64)  DEFAULT NULL COMMENT '邮箱',
    `header`      varchar(500) DEFAULT NULL COMMENT '头像',
    `gender`      tinyint      DEFAULT NULL COMMENT '性别',
    `birth`       date         DEFAULT NULL COMMENT '生日',
    `city`        varchar(500) DEFAULT NULL COMMENT '所在城市',
    `job`         varchar(255) DEFAULT NULL COMMENT '职业',
    `sign`        varchar(255) DEFAULT NULL COMMENT '个性签名',
    `source_type` tinyint      DEFAULT NULL COMMENT '用户来源',
    `integration` int          DEFAULT NULL COMMENT '积分',
    `growth`      int          DEFAULT NULL COMMENT '成长值',
    `status`      tinyint      DEFAULT NULL COMMENT '启用状态',
    `create_time` datetime     DEFAULT NULL COMMENT '注册时间',
    `wx_open_id`  varchar(255) DEFAULT NULL COMMENT '微信标识ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
BEGIN;
INSERT INTO `ums_member` (`id`, `level_id`, `username`, `password`, `nickname`, `mobile`, `email`, `header`, `gender`,
                          `birth`, `city`, `job`, `sign`, `source_type`, `integration`, `growth`, `status`,
                          `create_time`, `wx_open_id`)
VALUES (1, 1, 'leifengyang', '$2a$10$GT0TjB5YK5Vx77Y.2N7hkuYZtYAjZjMlE6NWGE2Aar/7pk/Rmhf8S', 'June', '17513324841',
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` (`id`, `level_id`, `username`, `password`, `nickname`, `mobile`, `email`, `header`, `gender`,
                          `birth`, `city`, `job`, `sign`, `source_type`, `integration`, `growth`, `status`,
                          `create_time`, `wx_open_id`)
VALUES (8, NULL, NULL, NULL, 'Я', NULL, NULL,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/TicibT5ryib6O88ulBlCwibbKu5ias0ibZUQ7x8t8WROkVnQ8LmXJP67bpicR5lc08KF1QFiaJHVsHFqO2g5icEialAUSFNw/132',
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'o3_SC58hHhu3HdGuPLxEyNBl9k5o');
COMMIT;

-- ----------------------------
-- Table structure for ums_member_collect_spu
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_collect_spu`;
CREATE TABLE `ums_member_collect_spu`
(
    `id`          bigint NOT NULL COMMENT 'id',
    `member_id`   bigint       DEFAULT NULL COMMENT '会员id',
    `spu_id`      bigint       DEFAULT NULL COMMENT 'spu_id',
    `spu_name`    varchar(500) DEFAULT NULL COMMENT 'spu_name',
    `spu_img`     varchar(500) DEFAULT NULL COMMENT 'spu_img',
    `create_time` datetime     DEFAULT NULL COMMENT 'create_time',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员收藏的商品';

-- ----------------------------
-- Records of ums_member_collect_spu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_collect_subject
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_collect_subject`;
CREATE TABLE `ums_member_collect_subject`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `subject_id`   bigint       DEFAULT NULL COMMENT 'subject_id',
    `subject_name` varchar(255) DEFAULT NULL COMMENT 'subject_name',
    `subject_img`  varchar(500) DEFAULT NULL COMMENT 'subject_img',
    `subject_urll` varchar(500) DEFAULT NULL COMMENT '活动url',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员收藏的专题活动';

-- ----------------------------
-- Records of ums_member_collect_subject
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`
(
    `id`                      bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`                    varchar(100)   DEFAULT NULL COMMENT '等级名称',
    `growth_point`            int            DEFAULT NULL COMMENT '等级需要的成长值',
    `default_status`          tinyint        DEFAULT NULL COMMENT '是否为默认等级[0->不是；1->是]',
    `free_freight_point`      decimal(18, 4) DEFAULT NULL COMMENT '免运费标准',
    `comment_growth_point`    int            DEFAULT NULL COMMENT '每次评价获取的成长值',
    `priviledge_free_freight` tinyint        DEFAULT NULL COMMENT '是否有免邮特权',
    `priviledge_member_price` tinyint        DEFAULT NULL COMMENT '是否有会员价格特权',
    `priviledge_birthday`     tinyint        DEFAULT NULL COMMENT '是否有生日特权',
    `note`                    varchar(255)   DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员等级';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`,
                                `comment_growth_point`, `priviledge_free_freight`, `priviledge_member_price`,
                                `priviledge_birthday`, `note`)
VALUES (1, 'test01', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`   bigint      DEFAULT NULL COMMENT 'member_id',
    `create_time` datetime    DEFAULT NULL COMMENT '创建时间',
    `ip`          varchar(64) DEFAULT NULL COMMENT 'ip',
    `city`        varchar(64) DEFAULT NULL COMMENT 'city',
    `login_type`  tinyint(1)  DEFAULT NULL COMMENT '登录类型[1-web，2-app]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员登录记录';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`
(
    `id`             bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`      bigint       DEFAULT NULL COMMENT 'member_id',
    `name`           varchar(255) DEFAULT NULL COMMENT '收货人姓名',
    `phone`          varchar(64)  DEFAULT NULL COMMENT '电话',
    `post_code`      varchar(64)  DEFAULT NULL COMMENT '邮政编码',
    `province`       varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
    `city`           varchar(100) DEFAULT NULL COMMENT '城市',
    `region`         varchar(100) DEFAULT NULL COMMENT '区',
    `detail_address` varchar(255) DEFAULT NULL COMMENT '详细地址(街道)',
    `areacode`       varchar(15)  DEFAULT NULL COMMENT '省市区代码',
    `default_status` tinyint(1)   DEFAULT NULL COMMENT '是否默认',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员收货地址';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone`, `post_code`, `province`, `city`, `region`,
                                          `detail_address`, `areacode`, `default_status`)
VALUES (1, 8, 'TestName1', '123', '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', '462300', 1);
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone`, `post_code`, `province`, `city`, `region`,
                                          `detail_address`, `areacode`, `default_status`)
VALUES (2, 8, 'TestName2', '456', '1', '北京市', '北京市', '北京大学', '北京大学', '462300', 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`
(
    `id`                    bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`             bigint         DEFAULT NULL COMMENT '会员id',
    `consume_amount`        decimal(18, 4) DEFAULT NULL COMMENT '累计消费金额',
    `coupon_amount`         decimal(18, 4) DEFAULT NULL COMMENT '累计优惠金额',
    `order_count`           int            DEFAULT NULL COMMENT '订单数量',
    `coupon_count`          int            DEFAULT NULL COMMENT '优惠券数量',
    `comment_count`         int            DEFAULT NULL COMMENT '评价数',
    `return_order_count`    int            DEFAULT NULL COMMENT '退货数量',
    `login_count`           int            DEFAULT NULL COMMENT '登录次数',
    `attend_count`          int            DEFAULT NULL COMMENT '关注数量',
    `fans_count`            int            DEFAULT NULL COMMENT '粉丝数量',
    `collect_product_count` int            DEFAULT NULL COMMENT '收藏的商品数量',
    `collect_subject_count` int            DEFAULT NULL COMMENT '收藏的专题活动数量',
    `collect_comment_count` int            DEFAULT NULL COMMENT '收藏的评论数量',
    `invite_friend_count`   int            DEFAULT NULL COMMENT '邀请的朋友数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='会员统计信息';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------
BEGIN;
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
