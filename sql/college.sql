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

 Date: 31/05/2022 23:23:19
*/


-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS "public"."college";
CREATE TABLE "public"."college" (
  "CGid" int4 NOT NULL DEFAULT nextval('"college_CGID_seq"'::regclass),
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of college
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table college
-- ----------------------------
ALTER TABLE "public"."college" ADD CONSTRAINT "college_pkey" PRIMARY KEY ("CGid");
