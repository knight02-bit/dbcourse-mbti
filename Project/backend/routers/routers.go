package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine, authm gin.HandlerFunc) {
	server.GET("/college", authm, handlers.Get_College)
	server.GET("/students", authm, handlers.Get_Student)
	server.POST("/student-add", authm, handlers.Add_student)
	server.POST("/question-add", authm, handlers.Add_question)
}
