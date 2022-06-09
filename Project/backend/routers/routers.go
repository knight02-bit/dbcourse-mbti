package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine, authm gin.HandlerFunc) {
	server.GET("/question", authm, handlers.Get_Questions)
	server.GET("/character", authm, handlers.Get_Characters)

	server.GET("/student-res/:Sid", authm, handlers.Get_StudentRes)
	server.GET("/class-res/:Dname/:Cid", authm, handlers.Get_ClassRes)


	server.GET("/info-cg/:CGname",authm, handlers.Get_StudentByCollege)
	server.GET("/info-dep/:Dname",authm, handlers.Get_StudentByDname)
	server.GET("/info-depclass/:Dname/:Cid",authm, handlers.Get_StudentByDepclass)
	server.GET("/info-id/:Sid",authm, handlers.Get_StudentBySid)
	server.GET("/info-name/:Sname",authm, handlers.Get_StudentBySname)


	server.DELETE("/student/:Sid",authm, handlers.Delete_Student)
	server.DELETE("/question/:Qid",authm, handlers.Delete_Question)
	//server.GET("/delete-bycollege/:CGname",authm, handlers.)
	//server.GET("/delete-bycollege/:CGname",authm, handlers.)


	//server.GET("/college", authm, handlers.Get_College)
	//
	//server.POST("/student-add", authm, handlers.Add_student)
	//server.POST("/question-add", authm, handlers.Add_question)
	//
	//server.POST("/student-result", authm, handlers.Add_question)
}
