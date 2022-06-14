// 用来处理负责测试系统的数据库CRUD需求
package handlers

import (
	"backend/dboprate"
	"backend/models"
	"backend/trans"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	"net/http"
)

func Get_Questions(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var questions []models.Question
	dboprate.Select_questions(db.(*sqlx.DB), &questions)

	body := trans.Make_Body(20000)
	body.Set_data("questions", questions)

	//fmt.Println("@@@@@", body)
	ctx.JSON(http.StatusOK, body.To_json())
}

func Get_Characters(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var characters []models.Character
	dboprate.Select_characters(db.(*sqlx.DB), &characters)

	body := trans.Make_Body(20000)
	body.Set_data("characters", characters)

	//fmt.Println("@@@@@", body)
	ctx.JSON(http.StatusOK, body.To_json())
}

//按照学号找个人的所有记录
func Get_SidRes(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var resultResps []models.ResultResp
	Sid := ctx.Params.ByName("Sid")
	fmt.Println(Sid, "%%%")
	dboprate.Select_SidRes(db.(*sqlx.DB), Sid, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("resultResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

//按照名字找个人的所有记录
func Get_SnameRes(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var resultResps []models.ResultResp
	Sname := ctx.Params.ByName("Sname")
	fmt.Println(Sname, "%%%")
	dboprate.Select_SnameRes(db.(*sqlx.DB), Sname, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("resultResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

//按照班级找所有学生的记录
func Get_ClassRes(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var resultResps []models.ResultResp

	Dname := ctx.Params.ByName("Dname")
	Cid := ctx.Params.ByName("Cid")
	fmt.Println(Dname, Cid, "%%%")
	dboprate.Select_classRes(db.(*sqlx.DB), Dname, Cid, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("classResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

//按照系别找出所有学生的记录
func Get_DnameRes(ctx *gin.Context){
	db, _ := ctx.Get("db")
	var resultResps []models.ResultResp

	Dname := ctx.Params.ByName("Dname")
	fmt.Println(Dname, "%%%")
	dboprate.Select_DnameRes(db.(*sqlx.DB), Dname, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("resultResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

//按照学院找出所有学生的记录  =====
func Get_CGnameRes(ctx *gin.Context){
	db, _ := ctx.Get("db")
	var resultResps []models.ResultResp

	CGname := ctx.Params.ByName("CGname")
	fmt.Println(CGname, "%%%")
	dboprate.Select_CGnameRes(db.(*sqlx.DB), CGname, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("resultResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

func Add_Result(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var result models.ResultResp
	ctx.ShouldBind(&result)

	isSuccess := dboprate.Insert_result(db.(*sqlx.DB), &result)

	body := trans.Make_Body(20000)
	body.Set_data("isSuccess", isSuccess)
	ctx.JSON(http.StatusOK, body.To_json())
}

func Add_Question(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var question models.Question
	ctx.ShouldBind(&question)

	isSuccess := dboprate.Insert_question(db.(*sqlx.DB), &question)

	body := trans.Make_Body(20000)
	body.Set_data("isSuccess", isSuccess)
	ctx.JSON(http.StatusOK, body.To_json())
}

//删除记录
func Delete_Result(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var result models.ResultResp
	ctx.ShouldBind(&result)

	dboprate.Delete_result(db.(*sqlx.DB), result.Sid, result.Rtime)

	ctx.JSON(http.StatusOK, gin.H{
		"code": 0,
	})
}

//删除题目
func Delete_Question(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var question models.Question
	ctx.ShouldBind(&question)

	fmt.Println(question, "%%%")
	dboprate.Delete_question(db.(*sqlx.DB), question.Qid)

	ctx.JSON(http.StatusOK, gin.H{
		"code": 0,
	})
}
