// 用来处理负责管理系统的数据库CRUD需求
package handlers

import (
	"backend/dboprate"
	"backend/models"
	"backend/trans"
	"fmt"
	"net/http"

	"github.com/jmoiron/sqlx"

	"github.com/gin-gonic/gin"
)

func Login_Jump(ctx *gin.Context)  {
	body := trans.Make_Body(20000)
	body.Set_data("accessToken", "v3-admin-vite-token-key")
	body.Set_data("accessToken", "v3-admin-vite-token-key")
	ctx.JSON(http.StatusOK, body.To_json())
}

func Get_College(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var colleges []models.College
	dboprate.Select_college(db.(*sqlx.DB), &colleges)

	body := trans.Make_Body(20000)
	body.Set_data("colleges", colleges)

	fmt.Println("@@@@@", body)
	ctx.JSON(http.StatusOK, body.To_json())
}

func Get_Student(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var students []models.Student
	dboprate.Select_student(db.(*sqlx.DB), &students)

	ctx.JSON(http.StatusOK, students)
}

func Add_student(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var student models.Student
	ctx.ShouldBind(&student)
	dboprate.Insert_student(db.(*sqlx.DB), &student)

	//ctx.Status(http.StatusOK)
}
