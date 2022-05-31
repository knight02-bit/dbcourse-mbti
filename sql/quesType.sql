/*
 Navicat Premium Data Transfer

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 140003
 Source Host           : localhost:5432
 Source Catalog        : MBTIDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140003
 File Encoding         : 65001

 Date: 31/05/2022 23:39:18
*/


-- ----------------------------
-- Table structure for quesType
-- ----------------------------
DROP TABLE IF EXISTS "public"."quesType";
CREATE TABLE "public"."quesType" (
  "QTid" int4 NOT NULL,
  "QTtext" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."quesType"."QTid" IS '自增';

-- ----------------------------
-- Records of quesType
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table quesType
-- ----------------------------
ALTER TABLE "public"."quesType" ADD CONSTRAINT "quesType_pkey" PRIMARY KEY ("QTid");
