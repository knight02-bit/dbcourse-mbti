package routers

import (
	"backend/handlers"
	"github.com/gin-gonic/gin"
)

func Info_router(server *gin.Engine, authm gin.HandlerFunc) {
	server.GET("/question", authm, handlers.Get_Questions)
	server.GET("/character", authm, handlers.Get_Characters)

	server.GET("/student-res/:Sid", authm, handlers.Get_SidRes)
	server.GET("/class-res/:Dname/:Cid", authm, handlers.Get_ClassRes)


	server.GET("/info-cg/:CGname",authm, handlers.Get_StudentByCollege)
	server.GET("/info-dep/:Dname",authm, handlers.Get_StudentByDname)
	server.GET("/info-depclass/:Dname/:Cid",authm, handlers.Get_StudentByDepclass)
	server.GET("/info-id/:Sid",authm, handlers.Get_StudentBySid)
	server.GET("/info-name/:Sname",authm, handlers.Get_StudentBySname)

	server.GET("/res-cg/:CGname",authm, handlers.Get_CGnameRes)
	server.GET("/res-dep/:Dname",authm, handlers.Get_DnameRes)
	server.GET("/res-depclass/:Dname/:Cid",authm, handlers.Get_ClassRes)
	server.GET("/res-id/:Sid",authm,  handlers.Get_SidRes)
	server.GET("/res-name/:Sname",authm, handlers.Get_SnameRes)

	server.POST("/student-add", authm, handlers.Add_Student)
	server.POST("/result-add", authm, handlers.Add_Result)
	server.POST("/question-add", authm, handlers.Add_Question)

	server.DELETE("/del-student",authm, handlers.Delete_Student)
	server.DELETE("/del-result",authm, handlers.Delete_Result)
	server.DELETE("/del-question",authm, handlers.Delete_Question)

}
