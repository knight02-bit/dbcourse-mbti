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
