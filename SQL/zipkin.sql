

create database zipkin;
use zipkin;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations`
(
    `trace_id_high`         bigint       NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
    `trace_id`              bigint       NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
    `span_id`               bigint       NOT NULL COMMENT 'coincides with zipkin_spans.id',
    `a_key`                 varchar(255) NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
    `a_value`               blob COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
    `a_type`                int          NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
    `a_timestamp`           bigint                DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
    `endpoint_ipv4`         int                   DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
    `endpoint_ipv6`         binary(16)            DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
    `endpoint_port`         smallint              DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
    `endpoint_service_name` varchar(255)          DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
    UNIQUE KEY `trace_id_high` (`trace_id_high`, `trace_id`, `span_id`, `a_key`, `a_timestamp`) COMMENT 'Ignore insert on duplicate',
    KEY `trace_id_high_2` (`trace_id_high`, `trace_id`, `span_id`) COMMENT 'for joining with zipkin_spans',
    KEY `trace_id_high_3` (`trace_id_high`, `trace_id`) COMMENT 'for getTraces/ByIds',
    KEY `endpoint_service_name` (`endpoint_service_name`) COMMENT 'for getTraces and getServiceNames',
    KEY `a_type` (`a_type`) COMMENT 'for getTraces',
    KEY `a_key` (`a_key`) COMMENT 'for getTraces'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPRESSED;

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies`
(
    `day`        date         NOT NULL,
    `parent`     varchar(255) NOT NULL,
    `child`      varchar(255) NOT NULL,
    `call_count` bigint DEFAULT NULL,
    UNIQUE KEY `day` (`day`, `parent`, `child`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPRESSED;

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans`
(
    `trace_id_high` bigint       NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
    `trace_id`      bigint       NOT NULL,
    `id`            bigint       NOT NULL,
    `name`          varchar(255) NOT NULL,
    `parent_id`     bigint                DEFAULT NULL,
    `debug`         bit(1)                DEFAULT NULL,
    `start_ts`      bigint                DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
    `duration`      bigint                DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
    UNIQUE KEY `trace_id_high` (`trace_id_high`, `trace_id`, `id`) COMMENT 'ignore insert on duplicate',
    KEY `trace_id_high_2` (`trace_id_high`, `trace_id`, `id`) COMMENT 'for joining with zipkin_annotations',
    KEY `trace_id_high_3` (`trace_id_high`, `trace_id`) COMMENT 'for getTracesByIds',
    KEY `name` (`name`) COMMENT 'for getTraces and getSpanNames',
    KEY `start_ts` (`start_ts`) COMMENT 'for getTraces ordering and range'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPRESSED;

SET FOREIGN_KEY_CHECKS = 1;
