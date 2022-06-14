package main

import (
	// "net/http"

	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	// 创建路由
	r := gin.Default()
	// 绑定路由规则，执行的函数
	r.GET("/aha", func(c *gin.Context) {
		c.String(http.StatusOK, "hello World!")
	})

	r.Run(":8099")
}
