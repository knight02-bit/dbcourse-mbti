// 用来处理负责管理系统的数据库CRUD需求
package handlers

import (
	"backend/dboprate"
	"backend/models"
	"github.com/jmoiron/sqlx"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Get_College(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var colleges []models.College
	dboprate.Select_college(db.(*sqlx.DB), &colleges)

	ctx.JSON(http.StatusOK, colleges)
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
