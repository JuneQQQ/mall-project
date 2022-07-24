DROP database IF EXISTS mall_wms;
create database mall_wms;
use  mall_wms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
INSERT INTO `undo_log` (`id`, `branch_id`, `xid`, `context`, `rollback_info`, `log_status`, `log_created`,
                        `log_modified`, `ext`)
VALUES (5, 246927950555910144, '192.168.195.169:8091:246927948404232192', 'serializer=jackson', 0x7B7D, 1,
        '2022-03-15 01:23:31', '2022-03-15 01:23:31', NULL);
INSERT INTO `undo_log` (`id`, `branch_id`, `xid`, `context`, `rollback_info`, `log_status`, `log_created`,
                        `log_modified`, `ext`)
VALUES (8, 246928300402806784, '192.168.195.169:8091:246928299677192192', 'serializer=jackson', 0x7B7D, 1,
        '2022-03-15 01:24:55', '2022-03-15 01:24:55', NULL);
INSERT INTO `undo_log` (`id`, `branch_id`, `xid`, `context`, `rollback_info`, `log_status`, `log_created`,
                        `log_modified`, `ext`)
VALUES (11, 246928412239728640, '192.168.195.169:8091:246928411753189376', 'serializer=jackson', 0x7B7D, 1,
        '2022-03-15 01:25:21', '2022-03-15 01:25:21', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wms_purchase
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase`;
CREATE TABLE `wms_purchase`
(
    `id`            bigint NOT NULL AUTO_INCREMENT,
    `assignee_id`   bigint         DEFAULT NULL,
    `assignee_name` varchar(255)   DEFAULT NULL,
    `phone`         char(13)       DEFAULT NULL,
    `priority`      int            DEFAULT NULL,
    `status`        int            DEFAULT NULL,
    `ware_id`       bigint         DEFAULT NULL,
    `amount`        decimal(18, 4) DEFAULT NULL,
    `create_time`   datetime       DEFAULT NULL,
    `update_time`   datetime       DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8mb4 COMMENT ='采购信息';

-- ----------------------------
-- Records of wms_purchase
-- ----------------------------
BEGIN;
INSERT INTO `wms_purchase` (`id`, `assignee_id`, `assignee_name`, `phone`, `priority`, `status`, `ware_id`, `amount`,
                            `create_time`, `update_time`)
VALUES (19, 3, '张三', '12345678912', 1, 3, NULL, NULL, '2022-02-17 12:42:38', '2022-02-17 12:49:57');
COMMIT;

-- ----------------------------
-- Table structure for wms_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_purchase_detail`;
CREATE TABLE `wms_purchase_detail`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `purchase_id` bigint         DEFAULT NULL COMMENT '采购单id',
    `sku_id`      bigint         DEFAULT NULL COMMENT '采购商品id',
    `sku_num`     int            DEFAULT NULL COMMENT '采购数量',
    `sku_price`   decimal(18, 4) DEFAULT NULL COMMENT '采购金额',
    `ware_id`     bigint         DEFAULT NULL COMMENT '仓库id',
    `status`      int            DEFAULT NULL COMMENT '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of wms_purchase_detail
-- ----------------------------
BEGIN;
INSERT INTO `wms_purchase_detail` (`id`, `purchase_id`, `sku_id`, `sku_num`, `sku_price`, `ware_id`, `status`)
VALUES (12, 19, 1, 100, NULL, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_info`;
CREATE TABLE `wms_ware_info`
(
    `id`       bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`     varchar(255) DEFAULT NULL COMMENT '仓库名',
    `address`  varchar(255) DEFAULT NULL COMMENT '仓库地址',
    `areacode` varchar(20)  DEFAULT NULL COMMENT '区域编码',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4 COMMENT ='仓库信息';

-- ----------------------------
-- Records of wms_ware_info
-- ----------------------------
BEGIN;
INSERT INTO `wms_ware_info` (`id`, `name`, `address`, `areacode`)
VALUES (1, '1号仓库', '北京xx', '124');
INSERT INTO `wms_ware_info` (`id`, `name`, `address`, `areacode`)
VALUES (2, '2号仓库', '南京', '213');
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_order_task
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task`;
CREATE TABLE `wms_ware_order_task`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`         bigint       DEFAULT NULL COMMENT 'order_id',
    `order_sn`         varchar(255) DEFAULT NULL COMMENT 'order_sn',
    `consignee`        varchar(100) DEFAULT NULL COMMENT '收货人',
    `consignee_tel`    char(15)     DEFAULT NULL COMMENT '收货人电话',
    `delivery_address` varchar(500) DEFAULT NULL COMMENT '配送地址',
    `order_comment`    varchar(200) DEFAULT NULL COMMENT '订单备注',
    `payment_way`      tinyint(1)   DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
    `task_status`      tinyint      DEFAULT NULL COMMENT '任务状态',
    `order_body`       varchar(255) DEFAULT NULL COMMENT '订单描述',
    `tracking_no`      char(30)     DEFAULT NULL COMMENT '物流单号',
    `create_time`      datetime     DEFAULT NULL COMMENT 'create_time',
    `ware_id`          bigint       DEFAULT NULL COMMENT '仓库id',
    `task_comment`     varchar(500) DEFAULT NULL COMMENT '工作单备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8mb4 COMMENT ='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task
-- ----------------------------
BEGIN;
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (12, NULL, '202203160822349611503889426974408706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (13, NULL, '202203160846448011503895508035727362', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (14, NULL, '202203160918081781503903407499796482', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (15, NULL, '202203160923067341503904659734519810', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (16, NULL, '202203161501568331503989930350067713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (17, NULL, '202203161502481551503990145605943297', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (18, NULL, '202203161504316311503990579619880961', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (19, NULL, '202203161507559031503991436394553346', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (20, NULL, '202203161511032651503992222256197634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (21, NULL, '202203161512251111503992565534814210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (22, NULL, '202203161516110381503993513141334017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (23, NULL, '202203161551109281504002320718237697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (24, NULL, '202203161552120821504002577212510209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (25, NULL, '202203162050254011504077627240366081', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (26, NULL, '202203162052133201504078079885565953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (27, NULL, '202203162115556201504084045444055041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (28, NULL, '202203162118291001504084689185828865', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (29, NULL, '202203162123224041504085919391965186', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (30, NULL, '202203162205100301504096437133598721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (31, NULL, '202203162205425011504096573326843906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (32, NULL, '202203162211298261504098030117683201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (33, NULL, '202203162214249911504098764812959745', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`,
                                   `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`,
                                   `create_time`, `ware_id`, `task_comment`)
VALUES (34, NULL, '202203192235040821505191125534031874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL);
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_order_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_order_task_detail`;
CREATE TABLE `wms_ware_order_task_detail`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sku_id`      bigint       DEFAULT NULL COMMENT 'sku_id',
    `sku_name`    varchar(255) DEFAULT NULL COMMENT 'sku_name',
    `sku_num`     int          DEFAULT NULL COMMENT '购买个数',
    `task_id`     bigint       DEFAULT NULL COMMENT '工作单id',
    `ware_id`     bigint       DEFAULT NULL COMMENT '仓库id',
    `lock_status` int          DEFAULT NULL COMMENT '1锁定 2解锁 3扣减',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8mb4 COMMENT ='库存工作单';

-- ----------------------------
-- Records of wms_ware_order_task_detail
-- ----------------------------
BEGIN;
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (15, 30, '', 1, 14, 1, 1);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (16, 30, '', 1, 15, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (17, 30, '', 1, 16, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (18, 30, '', 1, 17, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (19, 30, '', 1, 18, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (20, 30, '', 1, 19, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (21, 30, '', 1, 20, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (22, 30, '', 1, 21, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (23, 30, '', 1, 22, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (24, 30, '', 1, 23, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (25, 30, '', 1, 24, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (26, 30, '', 1, 25, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (27, 30, '', 1, 26, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (28, 30, '', 1, 27, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (29, 30, '', 1, 28, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (30, 30, '', 1, 29, 1, 1);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (31, 30, '', 1, 30, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (32, 30, '', 1, 31, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (33, 30, '', 1, 32, 1, 2);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (34, 30, '', 1, 33, 1, 1);
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`)
VALUES (35, 35, '', 1, 34, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for wms_ware_sku
-- ----------------------------
DROP TABLE IF EXISTS `wms_ware_sku`;
CREATE TABLE `wms_ware_sku`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sku_id`       bigint       DEFAULT NULL COMMENT 'sku_id',
    `ware_id`      bigint       DEFAULT NULL COMMENT '仓库id',
    `stock`        int          DEFAULT NULL COMMENT '库存数',
    `sku_name`     varchar(200) DEFAULT NULL COMMENT 'sku_name',
    `stock_locked` int          DEFAULT '0' COMMENT '锁定库存',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4 COMMENT ='商品库存';

-- ----------------------------
-- Records of wms_ware_sku
-- ----------------------------
BEGIN;
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (3, 1, 1, 200, '华为P30  白色 12G 64G', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (4, 29, 1, 200, 'Apple1', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (5, 30, 1, 200, 'Apple2', 4);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (6, 31, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (7, 32, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (8, 33, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (9, 34, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (10, 35, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (11, 36, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (12, 37, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (13, 38, 1, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (14, 30, 2, 200, 'Apple2', 0);
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`)
VALUES (15, 44, 2, 200, 'Apple2', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
