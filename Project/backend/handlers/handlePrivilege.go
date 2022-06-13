package handlers

import (
	"backend/auth"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	"net/http"
)

func Login(ctx *gin.Context) {
	db, _ := ctx.Get("db")
	var user auth.User
	var body auth.Body

	//ctx.BindJSON(&user)
	ctx.ShouldBind(&user)
	if user.IsRight(db.(*sqlx.DB)) {
		token_string, _ := auth.Gen(user.Username)
		body = auth.Make_Body(0)
		body.Set_data("accessToken", token_string)
	} else {
		body = auth.Make_Body(1145)
	}

	ctx.JSON(http.StatusOK, body.To_json())
}

func Info(ctx *gin.Context) {
	username, _ := ctx.Get("username")
	password, _ := ctx.Get("password")
	body := auth.Make_Body(20000)

	db, _ := ctx.Get("db")
	var user []auth.User
	user_info := auth.UserInfo{
		Name:  username.(string),
		Roles: []string{"admin"},
	}

	db.(*sqlx.DB).Select(&user,
		`select * from "public"."a_user"
				where "username" = $1 and
				      "password" = $2`, username, password)
	if len(user) == 0 {
		user_info = auth.UserInfo{
			Name:  username.(string),
			Roles: []string{"student"},
		}
	}
	fmt.Println(user_info)

	body.Set_data("user", user_info)
	ctx.JSON(http.StatusOK, body.To_json())
}

