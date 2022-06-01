// 用来处理负责测试系统的数据库CRUD需求
package handlers

import (
	"backend/dboprate"
	"backend/models"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
)


func Add_question(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var question models.Question
	ctx.ShouldBind(&question)
	dboprate.Insert_question(db.(*sqlx.DB), &question)

	//ctx.Status(http.StatusOK)
}
