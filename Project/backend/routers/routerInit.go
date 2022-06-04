package routers

import (
	"backend/handlers"
	"backend/middleware"
	"github.com/gin-gonic/gin"
)

func Router_init(server *gin.Engine) {
	authm := middleware.Authenticate()

	Info_router(server, authm)

	// 特权路由
	Privilege_init(server, authm)
}

func Privilege_init(server *gin.Engine, authm gin.HandlerFunc) {
	users_grp := server.Group("/users")
	{
		users_grp.POST("/login", handlers.Login)
		users_grp.POST("/info", authm, handlers.Info)
	}
}
