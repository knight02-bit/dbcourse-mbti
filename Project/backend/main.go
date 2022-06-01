package main

import (
	"backend/middleware"
	"backend/routers"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
)

func main()  {
	db, err := sqlx.Connect("postgres", "user=postgres dbname=MBTIDB sslmode=disable")
	if err != nil {
		fmt.Println("fail connetct, err: ",err.Error())
	}

	server := gin.Default()
	server.Use(middleware.InitContext(db))

	routers.Info_router(server)

	server.Run()
}
