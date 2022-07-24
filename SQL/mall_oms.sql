DROP database IF EXISTS mall_oms;
create database mall_oms;
use  mall_oms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`
(
    `id`                      bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `member_id`               bigint                                              DEFAULT NULL COMMENT 'member_id',
    `order_sn`                char(64) CHARACTER SET utf8mb4 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
    `coupon_id`               bigint                                              DEFAULT NULL COMMENT '使用的优惠券',
    `create_time`             datetime                                            DEFAULT NULL COMMENT 'create_time',
    `member_username`         varchar(200)                                        DEFAULT NULL COMMENT '用户名',
    `total_amount`            decimal(18, 4)                                      DEFAULT NULL COMMENT '订单总额',
    `pay_amount`              decimal(18, 4)                                      DEFAULT NULL COMMENT '应付总额',
    `freight_amount`          decimal(18, 4)                                      DEFAULT NULL COMMENT '运费金额',
    `promotion_amount`        decimal(18, 4)                                      DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
    `integration_amount`      decimal(18, 4)                                      DEFAULT NULL COMMENT '积分抵扣金额',
    `coupon_amount`           decimal(18, 4)                                      DEFAULT NULL COMMENT '优惠券抵扣金额',
    `discount_amount`         decimal(18, 4)                                      DEFAULT NULL COMMENT '后台调整订单使用的折扣金额',
    `pay_type`                tinyint                                             DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
    `source_type`             tinyint                                             DEFAULT NULL COMMENT '订单来源[0->PC订单；1->app订单]',
    `status`                  tinyint                                             DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
    `delivery_company`        varchar(64)                                         DEFAULT NULL COMMENT '物流公司(配送方式)',
    `delivery_sn`             varchar(64)                                         DEFAULT NULL COMMENT '物流单号',
    `auto_confirm_day`        int                                                 DEFAULT NULL COMMENT '自动确认时间（天）',
    `integration`             int                                                 DEFAULT NULL COMMENT '可以获得的积分',
    `growth`                  int                                                 DEFAULT NULL COMMENT '可以获得的成长值',
    `bill_type`               tinyint                                             DEFAULT NULL COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
    `bill_header`             varchar(255)                                        DEFAULT NULL COMMENT '发票抬头',
    `bill_content`            varchar(255)                                        DEFAULT NULL COMMENT '发票内容',
    `bill_receiver_phone`     varchar(32)                                         DEFAULT NULL COMMENT '收票人电话',
    `bill_receiver_email`     varchar(64)                                         DEFAULT NULL COMMENT '收票人邮箱',
    `receiver_name`           varchar(100)                                        DEFAULT NULL COMMENT '收货人姓名',
    `receiver_phone`          varchar(32)                                         DEFAULT NULL COMMENT '收货人电话',
    `receiver_post_code`      varchar(32)                                         DEFAULT NULL COMMENT '收货人邮编',
    `receiver_province`       varchar(32)                                         DEFAULT NULL COMMENT '省份/直辖市',
    `receiver_city`           varchar(32)                                         DEFAULT NULL COMMENT '城市',
    `receiver_region`         varchar(32)                                         DEFAULT NULL COMMENT '区',
    `receiver_detail_address` varchar(200)                                        DEFAULT NULL COMMENT '详细地址',
    `note`                    varchar(500)                                        DEFAULT NULL COMMENT '订单备注',
    `confirm_status`          tinyint                                             DEFAULT NULL COMMENT '确认收货状态[0->未确认；1->已确认]',
    `delete_status`           tinyint                                             DEFAULT NULL COMMENT '删除状态【0->未删除；1->已删除】',
    `use_integration`         int                                                 DEFAULT NULL COMMENT '下单时使用的积分',
    `payment_time`            datetime                                            DEFAULT NULL COMMENT '支付时间',
    `delivery_time`           datetime                                            DEFAULT NULL COMMENT '发货时间',
    `receive_time`            datetime                                            DEFAULT NULL COMMENT '确认收货时间',
    `comment_time`            datetime                                            DEFAULT NULL COMMENT '评价时间',
    `modify_time`             datetime                                            DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `order_sn` (`order_sn`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 75
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
BEGIN;
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (35, 8, '202203160918081781503903407499796482', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 09:18:08');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (36, 8, '202203160923067341503904659734519810', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 09:23:07');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (37, 8, '202203161501568331503989930350067713', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:01:57');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (38, 8, '202203161502481551503990145605943297', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:02:48');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (39, 8, '202203161504316311503990579619880961', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:04:32');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (40, 8, '202203161507559031503991436394553346', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:07:56');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (41, 8, '202203161511032651503992222256197634', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:11:03');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (42, 8, '202203161512251111503992565534814210', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:12:25');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (43, 8, '202203161516110381503993513141334017', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:16:11');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (44, 8, '202203161551109281504002320718237697', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:51:11');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (45, 8, '202203161552120821504002577212510209', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 15:52:12');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (46, 8, '202203162050254011504077627240366081', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 20:50:26');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (47, 8, '202203162052133201504078079885565953', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 20:52:13');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (48, 8, '202203162115556201504084045444055041', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 21:15:56');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (49, 8, '202203162118291001504084689185828865', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 21:18:29');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (50, 8, '202203162123224041504085919391965186', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 1, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 21:23:23');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (51, 8, '202203162205100301504096437133598721', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 22:05:10');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (52, 8, '202203162205425011504096573326843906', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 22:05:43');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (53, 8, '202203162211298261504098030117683201', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 22:11:30');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (54, 8, '202203162214249911504098764812959745', NULL, NULL, NULL, 65999.0000, 66002.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 1, NULL, NULL, NULL, 65999, 65999, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123',
        '1', '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-16 22:14:25');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (55, 8, '202203181936511851504783888403656706', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (56, 8, '202203182022373641504794148426113025', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (57, 8, '202203182020401381504794915035832322', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (58, 8, '202203182022519571504795467937460226', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (59, 8, '202203182023293411504795624720543746', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (60, 8, '202203182103589291504805815151210497', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (61, 8, '202203182105400981504806239484751873', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (62, 8, '202203182157096201504819197891739649', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (63, 8, '202203182157574421504819398459162626', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (64, 8, '202203182233309381504828346989969410', NULL, NULL, NULL, NULL, 888.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (65, 8, '202203190014498391504853843757142018', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (66, 8, '202203190015399211504854053807886338', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (67, 8, '202203190018208141504854728642039810', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (68, 8, '202203190021340691504855539212259330', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (69, 8, '1234', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (70, 8, '202203190028157431504857223950929921', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (71, 8, '202203190030493671504857868300881921', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (72, 8, '202203190033187651504858494921510914', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (73, 8, '202203192235040821505191125534031874', NULL, NULL, NULL, 10.0000, 13.0000, 3.0000, 0.0000, 0.0000,
        0.0000, NULL, NULL, NULL, 4, NULL, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, NULL, 'TestName1', '123', '1',
        '河南省', '郑州市', '清华大学郑州分校', '清华大学郑州分校', NULL, 14, 0, NULL, NULL, NULL, NULL, NULL, '2022-03-19 22:35:06');
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`,
                         `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`,
                         `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`,
                         `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`,
                         `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`,
                         `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`,
                         `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`,
                         `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`)
VALUES (74, 8, '202203192310317831505200049767219201', NULL, NULL, NULL, NULL, 999.0000, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`
(
    `id`                 bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`           bigint                                              DEFAULT NULL COMMENT 'order_id',
    `order_sn`           char(64) CHARACTER SET utf8mb4 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'order_sn',
    `spu_id`             bigint                                              DEFAULT NULL COMMENT 'spu_id',
    `spu_name`           varchar(255)                                        DEFAULT NULL COMMENT 'spu_name',
    `spu_pic`            varchar(500)                                        DEFAULT NULL COMMENT 'spu_pic',
    `spu_brand`          varchar(200)                                        DEFAULT NULL COMMENT '品牌',
    `category_id`        bigint                                              DEFAULT NULL COMMENT '商品分类id',
    `sku_id`             bigint                                              DEFAULT NULL COMMENT '商品sku编号',
    `sku_name`           varchar(255)                                        DEFAULT NULL COMMENT '商品sku名字',
    `sku_pic`            varchar(500)                                        DEFAULT NULL COMMENT '商品sku图片',
    `sku_price`          decimal(18, 4)                                      DEFAULT NULL COMMENT '商品sku价格',
    `sku_quantity`       int                                                 DEFAULT NULL COMMENT '商品购买的数量',
    `sku_attrs_vals`     varchar(500)                                        DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
    `promotion_amount`   decimal(18, 4)                                      DEFAULT NULL COMMENT '商品促销分解金额',
    `coupon_amount`      decimal(18, 4)                                      DEFAULT NULL COMMENT '优惠券优惠分解金额',
    `integration_amount` decimal(18, 4)                                      DEFAULT NULL COMMENT '积分优惠分解金额',
    `real_amount`        decimal(18, 4)                                      DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
    `gift_integration`   int                                                 DEFAULT NULL COMMENT '赠送积分',
    `gift_growth`        int                                                 DEFAULT NULL COMMENT '赠送成长值',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 75
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单项信息';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (35, NULL, '202203160918081781503903407499796482', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (36, NULL, '202203160923067341503904659734519810', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (37, NULL, '202203161501568331503989930350067713', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (38, NULL, '202203161502481551503990145605943297', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (39, NULL, '202203161504316311503990579619880961', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (40, NULL, '202203161507559031503991436394553346', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (41, NULL, '202203161511032651503992222256197634', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (42, NULL, '202203161512251111503992565534814210', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (43, NULL, '202203161516110381503993513141334017', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (44, NULL, '202203161551109281504002320718237697', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (45, NULL, '202203161552120821504002577212510209', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (46, NULL, '202203162050254011504077627240366081', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (47, NULL, '202203162052133201504078079885565953', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (48, NULL, '202203162115556201504084045444055041', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (49, NULL, '202203162118291001504084689185828865', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (50, NULL, '202203162123224041504085919391965186', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (51, NULL, '202203162205100301504096437133598721', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (52, NULL, '202203162205425011504096573326843906', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (53, NULL, '202203162211298261504098030117683201', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (54, NULL, '202203162214249911504098764812959745', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 30, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 白色 4G 128G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 65999.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 65999.0000, 65999, 65999);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (55, NULL, '202203181936511851504783888403656706', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (56, NULL, '202203182022373641504794148426113025', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (57, NULL, '202203182020401381504794915035832322', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (58, NULL, '202203182022519571504795467937460226', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (59, NULL, '202203182023293411504795624720543746', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (60, NULL, '202203182103589291504805815151210497', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (61, NULL, '202203182105400981504806239484751873', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (62, NULL, '202203182157096201504819197891739649', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (63, NULL, '202203182157574421504819398459162626', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (64, NULL, '202203182233309381504828346989969410', NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 888.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (65, NULL, '202203190014498391504853843757142018', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (66, NULL, '202203190015399211504854053807886338', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (67, NULL, '202203190018208141504854728642039810', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (68, NULL, '202203190021340691504855539212259330', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (69, NULL, '202203190026331891504856793812471809', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (70, NULL, '202203190028157431504857223950929921', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (71, NULL, '202203190030493671504857868300881921', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (72, NULL, '202203190033187651504858494921510914', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (73, NULL, '202203192235040821505191125534031874', 4, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB', NULL,
        '3', 225, 35, 'Apple iPhone 13 (A2634) 支持移动联通电信5G 双卡双待手机 粉色 128GB 深空灰 4G 64G',
        'http://markdown-pic-june.oss-cn-beijing.aliyuncs.com/uPic/image-20220301105630280.png', 10.0000, 1,
        '颜色:attr_value;内存:attr_value;存储容量:attr_value', 0.0000, 0.0000, 0.0000, 10.0000, 10, 10);
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`,
                              `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`,
                              `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`,
                              `gift_integration`, `gift_growth`)
VALUES (74, NULL, '202203192310317831505200049767219201', NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, 1, NULL,
        NULL, NULL, NULL, 999.0000, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`     bigint       DEFAULT NULL COMMENT '订单id',
    `operate_man`  varchar(100) DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
    `create_time`  datetime     DEFAULT NULL COMMENT '操作时间',
    `order_status` tinyint      DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
    `note`         varchar(500) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`
(
    `id`              bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`        bigint                                              DEFAULT NULL COMMENT 'order_id',
    `sku_id`          bigint                                              DEFAULT NULL COMMENT '退货商品id',
    `order_sn`        char(64) CHARACTER SET utf8mb4 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
    `create_time`     datetime                                            DEFAULT NULL COMMENT '申请时间',
    `member_username` varchar(64)                                         DEFAULT NULL COMMENT '会员用户名',
    `return_amount`   decimal(18, 4)                                      DEFAULT NULL COMMENT '退款金额',
    `return_name`     varchar(100)                                        DEFAULT NULL COMMENT '退货人姓名',
    `return_phone`    varchar(20)                                         DEFAULT NULL COMMENT '退货人电话',
    `status`          tinyint(1)                                          DEFAULT NULL COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
    `handle_time`     datetime                                            DEFAULT NULL COMMENT '处理时间',
    `sku_img`         varchar(500)                                        DEFAULT NULL COMMENT '商品图片',
    `sku_name`        varchar(200)                                        DEFAULT NULL COMMENT '商品名称',
    `sku_brand`       varchar(200)                                        DEFAULT NULL COMMENT '商品品牌',
    `sku_attrs_vals`  varchar(500)                                        DEFAULT NULL COMMENT '商品销售属性(JSON)',
    `sku_count`       int                                                 DEFAULT NULL COMMENT '退货数量',
    `sku_price`       decimal(18, 4)                                      DEFAULT NULL COMMENT '商品单价',
    `sku_real_price`  decimal(18, 4)                                      DEFAULT NULL COMMENT '商品实际支付单价',
    `reason`          varchar(200)                                        DEFAULT NULL COMMENT '原因',
    `description述`    varchar(500)                                        DEFAULT NULL COMMENT '描述',
    `desc_pics`       varchar(2000)                                       DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
    `handle_note`     varchar(500)                                        DEFAULT NULL COMMENT '处理备注',
    `handle_man`      varchar(200)                                        DEFAULT NULL COMMENT '处理人员',
    `receive_man`     varchar(100)                                        DEFAULT NULL COMMENT '收货人',
    `receive_time`    datetime                                            DEFAULT NULL COMMENT '收货时间',
    `receive_note`    varchar(500)                                        DEFAULT NULL COMMENT '收货备注',
    `receive_phone`   varchar(20)                                         DEFAULT NULL COMMENT '收货电话',
    `company_address` varchar(500)                                        DEFAULT NULL COMMENT '公司收货地址',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`
(
    `id`          bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`        varchar(200) DEFAULT NULL COMMENT '退货原因名',
    `sort`        int          DEFAULT NULL COMMENT '排序',
    `status`      tinyint(1)   DEFAULT NULL COMMENT '启用状态',
    `create_time` datetime     DEFAULT NULL COMMENT 'create_time',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='退货原因';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`
(
    `id`                    bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `flash_order_overtime`  int     DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
    `normal_order_overtime` int     DEFAULT NULL COMMENT '正常订单超时时间(分)',
    `confirm_overtime`      int     DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
    `finish_overtime`       int     DEFAULT NULL COMMENT '自动完成交易时间，不能申请退货（天）',
    `comment_overtime`      int     DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
    `member_level`          tinyint DEFAULT NULL COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='订单配置信息';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for oms_payment_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_payment_info`;
CREATE TABLE `oms_payment_info`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_sn`         char(64) CHARACTER SET utf8mb4 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号（对外业务号）',
    `order_id`         bigint                                              DEFAULT NULL COMMENT '订单id',
    `alipay_trade_no`  varchar(50)                                         DEFAULT NULL COMMENT '支付宝交易流水号',
    `total_amount`     decimal(18, 4)                                      DEFAULT NULL COMMENT '支付总金额',
    `subject`          varchar(200)                                        DEFAULT NULL COMMENT '交易内容',
    `payment_status`   varchar(20)                                         DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime                                            DEFAULT NULL COMMENT '创建时间',
    `confirm_time`     datetime                                            DEFAULT NULL COMMENT '确认时间',
    `callback_content` varchar(4000)                                       DEFAULT NULL COMMENT '回调内容',
    `callback_time`    datetime                                            DEFAULT NULL COMMENT '回调时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `order_sn` (`order_sn`),
    UNIQUE KEY `alipay_trade_no` (`alipay_trade_no`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4 COMMENT ='支付信息表';

-- ----------------------------
-- Records of oms_payment_info
-- ----------------------------
BEGIN;
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (1, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (4, '202203162123224041504085919391965186', NULL, '2022031622001482700502313193', NULL, NULL, 'TRADE_SUCCESS',
        NULL, NULL, NULL, '2022-03-16 21:23:40');
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (5, '202203162214249911504098764812959745', NULL, '2022031622001482700502313722', NULL, NULL, 'TRADE_SUCCESS',
        NULL, NULL, NULL, '2022-03-16 22:14:42');
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`,
                                `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`)
VALUES (6, '1234', NULL, '2022031922001482700502314815', NULL, NULL, 'TRADE_SUCCESS', NULL, NULL, NULL,
        '2022-03-19 00:45:24');
COMMIT;

-- ----------------------------
-- Table structure for oms_refund_info
-- ----------------------------
DROP TABLE IF EXISTS `oms_refund_info`;
CREATE TABLE `oms_refund_info`
(
    `id`              bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_return_id` bigint         DEFAULT NULL COMMENT '退款的订单',
    `refund`          decimal(18, 4) DEFAULT NULL COMMENT '退款金额',
    `refund_sn`       varchar(64)    DEFAULT NULL COMMENT '退款交易流水号',
    `refund_status`   tinyint(1)     DEFAULT NULL COMMENT '退款状态',
    `refund_channel`  tinyint        DEFAULT NULL COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
    `refund_content`  varchar(5000)  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='退款信息';

-- ----------------------------
-- Records of oms_refund_info
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
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
