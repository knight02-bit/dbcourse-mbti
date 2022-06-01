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

 Date: 31/05/2022 23:38:04
*/


-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS "public"."class";
CREATE TABLE "public"."class" (
  "CId" int4 NOT NULL,
  "Did" int4 NOT NULL,
  "CGid" int4 NOT NULL
)
;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "class_pkey" PRIMARY KEY ("CId");

-- ----------------------------
-- Foreign Keys structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "cg_class" FOREIGN KEY ("CGid") REFERENCES "public"."college" ("CGid") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."class" ADD CONSTRAINT "dep_class" FOREIGN KEY ("Did") REFERENCES "public"."department" ("Did") ON DELETE NO ACTION ON UPDATE NO ACTION;
