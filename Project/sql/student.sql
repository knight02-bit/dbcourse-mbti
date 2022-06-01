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

 Date: 31/05/2022 23:38:21
*/


-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "public"."student";
CREATE TABLE "public"."student" (
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Sname" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "Cid" int4 NOT NULL,
  "Did" int4 NOT NULL
)
;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "student_pkey" PRIMARY KEY ("Sid");

-- ----------------------------
-- Foreign Keys structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "class_stu" FOREIGN KEY ("Cid") REFERENCES "public"."class" ("CId") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."student" ADD CONSTRAINT "dep_stu" FOREIGN KEY ("Did") REFERENCES "public"."department" ("Did") ON DELETE NO ACTION ON UPDATE NO ACTION;
