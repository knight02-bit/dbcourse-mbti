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


func Add_question(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var question models.Question
	ctx.ShouldBind(&question)
	dboprate.Insert_question(db.(*sqlx.DB), &question)

	//ctx.Status(http.StatusOK)
}

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
func Get_StudentRes(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var resultResps []models.ResultResp
	Sid := ctx.Params.ByName("Sid")
	fmt.Println(Sid, "%%%")
	dboprate.Select_studentRes(db.(*sqlx.DB), Sid, &resultResps)

	body := trans.Make_Body(20000)
	body.Set_data("resultResps", resultResps)

	ctx.JSON(http.StatusOK, body.To_json())
}

//按照班级找所有记录
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
