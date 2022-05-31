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

 Date: 31/05/2022 23:39:26
*/


-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS "public"."question";
CREATE TABLE "public"."question" (
  "Qid" int4 NOT NULL,
  "Qtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QAtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QBtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QTid" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."question"."Qid" IS '自增';

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "question_pkey" PRIMARY KEY ("Qid");

-- ----------------------------
-- Foreign Keys structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "type_ques" FOREIGN KEY ("QTid") REFERENCES "public"."quesType" ("QTid") ON DELETE NO ACTION ON UPDATE NO ACTION;
