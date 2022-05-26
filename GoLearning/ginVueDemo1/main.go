package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	//"golang.org/x/net/context/ctxhttp"
	"log"
	"math/rand"
	"net/http"
	"time"
)

type User struct {
	gorm.Model
	Name string `gorm:"type:varchar(20);not null"`
	Telephone string `gorm:"type:varchar(20);not null;unique"`
	Password string `gorm:"size:255;not null"`
}

func main()  {
	db := InitDB()
	//defer db.DB.Close()

	r := gin.Default()
	r.POST("/api/register", func(ctx *gin.Context) {
		//获取参数
		name := ctx.PostForm("name")
		telephone := ctx.PostForm("telephone")
		password := ctx.PostForm("password")

		//数据验证
		if len(telephone) != 11 {
			ctx.JSON(http.StatusUnprocessableEntity, gin.H{"code":422, "msg":"手机号必须为11位"})
			return
		}

		if len(password) < 6 {
			ctx.JSON(http.StatusUnprocessableEntity, gin.H{"code":422, "msg":"密码不得少于6位"})
			return
		}

		if len(name) == 0 {
			name = RandomString(10)
		}

		//判断手机号是否存在
		if isTeleExit(db, telephone) {
			ctx.JSON(http.StatusUnprocessableEntity, gin.H{"code":422, "msg":"该手机号已存在"})
			return
		}

		// 创建用户
		newUser := User{
			Name: name,
			Telephone: telephone,
			Password: password,
		}
		db.Create(&newUser)

		log.Println(name, telephone, password)
		ctx.JSON(200, gin.H{
			"msg": "注册成功",
		})
	})
	panic(r.Run()) // listen and serve on 0.0.0.0:8080
}

func isTeleExit(db *gorm.DB, tele string) bool{
	var user User
	db.Where("telephone = ?", tele).First(&user)
	if user.ID != 0 {
		return true
	}

	return false
}

func RandomString(n int) string {
	var letters = []byte("fsdghhgfhjhsdhfghfghfhfddfetr")
	result := make([]byte, n)

	rand.Seed((time.Now().Unix()))
	for i := range result {
		result[i] = letters[rand.Intn(len(letters))]
	}

	return string(result)
}

func InitDB() *gorm.DB{
	// 开启连接池
	//driverName := "postgres"
	//host := "localhost"
	//port := "5432"
	//database := "ginessential"
	//username := "postgres"
	//password := "manager"
	//charset := "utf8"
	//args := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=true",
	//	username,
	//	password,
	//	host,
	//	port,
	//	database,
	//	charset)
	dsn := "host=localhost " +
		"user=postgres password=manager " +
		"dbname=ginessential port=5432 " +
		"sslmode=disable TimeZone=Asia/Shanghai"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println("fail to connect, err : "+ err.Error())
	}

	db.AutoMigrate(&User{})
	return db
}
