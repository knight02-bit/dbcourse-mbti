// 用来处理负责管理系统的数据库CRUD需求
package handlers

import (
	"backend/dboprate"
	"backend/models"
	"backend/trans"
	"fmt"
	"github.com/jmoiron/sqlx"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Login_Jump(ctx *gin.Context)  {
	body := trans.Make_Body(20000)
	body.Set_data("accessToken", "v3-admin-vite-token-key")
	ctx.JSON(http.StatusOK, body.To_json())
}

//按照学院查询学生
func Get_StudentByCollege(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var studentInfoes []models.StudentInfo
	CGname := ctx.Params.ByName("CGname")

	fmt.Println(CGname, "%%%")
	dboprate.Select_studentByCGname(db.(*sqlx.DB), CGname, &studentInfoes)

	body := trans.Make_Body(20000)
	body.Set_data("studentInfoes", studentInfoes)
	ctx.JSON(http.StatusOK, body.To_json())
}

//按照系别查询学生
func Get_StudentByDname(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var studentInfoes []models.StudentInfo

	Dname := ctx.Params.ByName("Dname")
	fmt.Println(Dname, "%%%")
	dboprate.Select_studentByDname(db.(*sqlx.DB), Dname, &studentInfoes)

	body := trans.Make_Body(20000)
	body.Set_data("studentInfoes", studentInfoes)
	ctx.JSON(http.StatusOK, body.To_json())
}
//按照系别+班级号查询学生
func Get_StudentByDepclass(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var studentInfoes []models.StudentInfo

	Dname := ctx.Params.ByName("Dname")
	Cid := ctx.Params.ByName("Cid")
	fmt.Println(Dname, Cid, "%%%")
	dboprate.Select_studentByDepclass(db.(*sqlx.DB), Dname, Cid, &studentInfoes)

	body := trans.Make_Body(20000)
	body.Set_data("studentInfoes", studentInfoes)
	ctx.JSON(http.StatusOK, body.To_json())
}

//按照学号查询学生
func Get_StudentBySid(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var studentInfoes []models.StudentInfo

	Sid := ctx.Params.ByName("Sid")
	fmt.Println(Sid, "%%%")
	dboprate.Select_studentBySid(db.(*sqlx.DB), Sid, &studentInfoes)

	body := trans.Make_Body(20000)
	body.Set_data("studentInfoes", studentInfoes)
	ctx.JSON(http.StatusOK, body.To_json())
}

//按照名字查询学生
func Get_StudentBySname(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var studentInfoes []models.StudentInfo

	Sname := ctx.Params.ByName("Sname")
	fmt.Println(Sname, "%%%")
	dboprate.Select_studentBySname(db.(*sqlx.DB), Sname, &studentInfoes)

	body := trans.Make_Body(20000)
	body.Set_data("studentInfoes", studentInfoes)
	ctx.JSON(http.StatusOK, body.To_json())
}

func Add_Student(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var student models.StudentInfo
	ctx.ShouldBind(&student)

	isSuccess := dboprate.Insert_student(db.(*sqlx.DB), &student)

	body := trans.Make_Body(20000)
	body.Set_data("isSuccess", isSuccess)
	ctx.JSON(http.StatusOK, body.To_json())
}

//删除学生
func Delete_Student(ctx *gin.Context) {
	db, _ := ctx.Get("db")

	var student models.StudentInfo
	ctx.ShouldBind(&student)

	fmt.Println(student, "%%%")
	dboprate.Delete_student(db.(*sqlx.DB), student.Sid)

	ctx.JSON(http.StatusOK, gin.H{
		"code": 0,
	})
}
