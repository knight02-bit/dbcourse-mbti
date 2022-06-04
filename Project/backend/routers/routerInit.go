package routers
//
//import (
//	"backend/handlers"
//	"github.com/gin-gonic/gin"
//)
//
//func router_init(server *gin.Engine, authm gin.HandlerFunc) {
//	users_grp := server.Group("/users")
//	{
//		users_grp.POST("/login", handlers.Login)
//		users_grp.POST("/info", authm, handlers.Info)
//	}
//}
//
//func General(server *gin.Engine) {
//	authm := middleware.Authenticate()
//
//	// 入库信息的路由
//	store(server, authm)
//
//	// 特权路由
//	privileged(server, authm)
//}
