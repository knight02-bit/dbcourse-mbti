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

 Date: 31/05/2022 23:19:11
*/


-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS "public"."character";
CREATE TABLE "public"."character" (
  "Ctype" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Ctext" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."character"."Ctype" IS '长度限制为4';
COMMENT ON COLUMN "public"."character"."Ctext" IS '性格描述';

-- ----------------------------
-- Records of character
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table character
-- ----------------------------
ALTER TABLE "public"."character" ADD CONSTRAINT "character_pkey" PRIMARY KEY ("Ctype", "Ctext");
