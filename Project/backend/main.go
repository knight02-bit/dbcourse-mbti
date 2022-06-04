package main

import (
	"backend/middleware"
	"backend/routers"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"log"
)

func main()  {
	dsn := "host=127.0.0.1 port=5432 user=postgres password=manager dbname=MBTIDB sslmode=disable"
	db, err := sqlx.Connect("postgres", dsn)
	if err != nil {
		//fmt.Println("fail connetct, err: ",err.Error())
		log.Fatalln(err)
	}

	server := gin.Default()
	server.Use(middleware.InitContext(db))
	//fmt.Println("% % %", db)
	routers.Router_init(server)

	server.Run()
}
