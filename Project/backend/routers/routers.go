package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine, authm gin.HandlerFunc) {
	server.GET("/question", authm, handlers.Get_Questions)
	server.GET("/character", authm, handlers.Get_Characters)

	server.GET("/student/:Sid", authm, handlers.Get_StudentRes)

	server.GET("/college", authm, handlers.Get_College)

	server.POST("/student-add", authm, handlers.Add_student)
	server.POST("/question-add", authm, handlers.Add_question)

	server.POST("/student-result", authm, handlers.Add_question)
}
