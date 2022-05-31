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

 Date: 31/05/2022 23:39:04
*/


-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS "public"."result";
CREATE TABLE "public"."result" (
  "Rid" int8 NOT NULL,
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Rtime" date NOT NULL
)
;
COMMENT ON COLUMN "public"."result"."Rid" IS '自增';

-- ----------------------------
-- Records of result
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "result_pkey" PRIMARY KEY ("Rid");

-- ----------------------------
-- Foreign Keys structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "stu_res" FOREIGN KEY ("Sid") REFERENCES "public"."student" ("Sid") ON DELETE NO ACTION ON UPDATE NO ACTION;
