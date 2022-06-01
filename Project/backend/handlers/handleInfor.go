package handlers

import (
	"backend/models"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Get_College(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	//var colleges []models.GetCollege
	//
	//dboprate.Select_college(db.(*sqlx.DB), &colleges)
	//
	//ctx.JSON(http.StatusOK, colleges)
	fmt.Println(db)
	data := &models.College{
		Id:   "114514",
		Name: "计算机科学与工程",
	}
	ctx.ProtoBuf(http.StatusOK, data)
	//ctx.JSON(http.StatusOK, 444)
}
