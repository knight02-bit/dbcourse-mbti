package handlers

import (
	"backend/auth"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Login(ctx *gin.Context) {
	var user auth.User
	var body auth.Body

	ctx.BindJSON(&user)

	if user.IsRight() {
		token_string, _ := auth.Gen(user.Name)
		body = auth.Make_Body(0)
		body.Set_data("accessToken", token_string)
	} else {
		body = auth.Make_Body(1145)
	}

	ctx.JSON(http.StatusOK, body.To_json())
}

func Info(ctx *gin.Context) {
	username, _ := ctx.Get("username")

	body := auth.Make_Body(20000)

	user_info := auth.UserInfo{
		Name:  username.(string),
		Roles: []string{"admin"},
	}

	body.Set_data("user", user_info)

	ctx.JSON(http.StatusOK, body.To_json())
}
