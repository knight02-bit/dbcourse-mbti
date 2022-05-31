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

 Date: 31/05/2022 23:39:37
*/


-- ----------------------------
-- Table structure for selectKV
-- ----------------------------
DROP TABLE IF EXISTS "public"."selectKV";
CREATE TABLE "public"."selectKV" (
  "key" int8 NOT NULL,
  "value" varchar(4) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of selectKV
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table selectKV
-- ----------------------------
ALTER TABLE "public"."selectKV" ADD CONSTRAINT "selectKV_pkey" PRIMARY KEY ("key");
