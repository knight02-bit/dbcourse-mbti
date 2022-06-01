package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine) {
	server.GET("/college", handlers.Get_College)
	//server.GET("/department", handlers.Get_store)
	//server.PUT("/student", handlers.Put_store)
}
