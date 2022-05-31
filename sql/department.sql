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

 Date: 31/05/2022 23:24:06
*/


-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "public"."department";
CREATE TABLE "public"."department" (
  "Did" int4 NOT NULL,
  "Dname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "CGid" int4 NOT NULL
)
;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("Did");

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "cg_dep" FOREIGN KEY ("CGid") REFERENCES "public"."college" ("CGid") ON DELETE NO ACTION ON UPDATE NO ACTION;
