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

 Date: 01/06/2022 18:01:34
*/


-- ----------------------------
-- Sequence structure for question_Qid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."question_Qid_seq";
CREATE SEQUENCE "public"."question_Qid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

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
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS "public"."class";
CREATE TABLE "public"."class" (
  "CId" int4 NOT NULL,
  "Dname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO "public"."class" VALUES (201, '软件工程', '计算机科学与工程学院');
INSERT INTO "public"."class" VALUES (202, '网络工程', '计算机科学与工程学院');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS "public"."college";
CREATE TABLE "public"."college" (
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO "public"."college" VALUES ('计算机科学与工程学院');
INSERT INTO "public"."college" VALUES ('外国语学院');
INSERT INTO "public"."college" VALUES ('机电工程学院');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "public"."department";
CREATE TABLE "public"."department" (
  "Dname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO "public"."department" VALUES ('软件工程', '计算机科学与工程学院');
INSERT INTO "public"."department" VALUES ('网络工程', '计算机科学与工程学院');
INSERT INTO "public"."department" VALUES ('计算机科学与技术', '计算机科学与工程学院');

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
INSERT INTO "public"."quesType" VALUES (1, '哪一个答案最能贴切的描绘你一般的感受或行为？');
INSERT INTO "public"."quesType" VALUES (2, '在下列每一对词语中，哪一个词语更合你心意？请仔细想想这些词语的意义，而不要理会他们的字形或读音。');
INSERT INTO "public"."quesType" VALUES (3, '哪一个答案最能贴切地描绘你一般的感受或行为');
INSERT INTO "public"."quesType" VALUES (4, '在下列每一对词语中，哪一个词语更合你心意？');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS "public"."question";
CREATE TABLE "public"."question" (
  "Qid" int4 NOT NULL DEFAULT nextval('"question_Qid_seq"'::regclass),
  "Qtext" text COLLATE "pg_catalog"."default",
  "QAtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QBtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QTid" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."question"."Qid" IS '自增';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO "public"."question" VALUES (1, '当你要外出一整天，你会', '计划你要做什么和在什么时候做', '说去就去', 1);
INSERT INTO "public"."question" VALUES (2, '你认为自己是一个', '较为随兴所至的人', '较为有条理的人', 1);
INSERT INTO "public"."question" VALUES (27, NULL, '注重隐私', '坦率开放', 2);
INSERT INTO "public"."question" VALUES (28, NULL, '预先安排的', '无计划的', 2);

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS "public"."result";
CREATE TABLE "public"."result" (
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Rtime" date NOT NULL,
  "Ctype" varchar(10) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of result
-- ----------------------------

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
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "public"."student";
CREATE TABLE "public"."student" (
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Sname" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "Cid" int4 NOT NULL,
  "Dname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."question_Qid_seq"
OWNED BY "public"."question"."Qid";
SELECT setval('"public"."question_Qid_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table character
-- ----------------------------
ALTER TABLE "public"."character" ADD CONSTRAINT "character_pkey" PRIMARY KEY ("Ctype");

-- ----------------------------
-- Primary Key structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "class_pkey" PRIMARY KEY ("CId", "Dname");

-- ----------------------------
-- Primary Key structure for table college
-- ----------------------------
ALTER TABLE "public"."college" ADD CONSTRAINT "college_pkey" PRIMARY KEY ("CGname");

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("Dname");

-- ----------------------------
-- Primary Key structure for table quesType
-- ----------------------------
ALTER TABLE "public"."quesType" ADD CONSTRAINT "quesType_pkey" PRIMARY KEY ("QTid");

-- ----------------------------
-- Primary Key structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "question_pkey" PRIMARY KEY ("Qid");

-- ----------------------------
-- Primary Key structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "result_pkey" PRIMARY KEY ("Sid", "Rtime");

-- ----------------------------
-- Primary Key structure for table selectKV
-- ----------------------------
ALTER TABLE "public"."selectKV" ADD CONSTRAINT "selectKV_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "student_pkey" PRIMARY KEY ("Sid");

-- ----------------------------
-- Foreign Keys structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "col-class" FOREIGN KEY ("CGname") REFERENCES "public"."college" ("CGname") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."class" ADD CONSTRAINT "dep-class" FOREIGN KEY ("Dname") REFERENCES "public"."department" ("Dname") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "col-dep" FOREIGN KEY ("CGname") REFERENCES "public"."college" ("CGname") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "type_ques" FOREIGN KEY ("QTid") REFERENCES "public"."quesType" ("QTid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "cha_res" FOREIGN KEY ("Ctype") REFERENCES "public"."character" ("Ctype") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."result" ADD CONSTRAINT "stu_res" FOREIGN KEY ("Sid") REFERENCES "public"."student" ("Sid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "dep-stu" FOREIGN KEY ("Dname") REFERENCES "public"."department" ("Dname") ON DELETE NO ACTION ON UPDATE NO ACTION;
