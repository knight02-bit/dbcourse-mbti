package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine) {
	server.GET("/college", handlers.Get_College)
	server.GET("/students", handlers.Get_Student)
	server.POST("/student-add", handlers.Add_student)
	server.POST("/question-add", handlers.Add_question)
	//server.GET("/department", handlers.Get_store)
	//server.PUT("/student", handlers.Put_store)
}
