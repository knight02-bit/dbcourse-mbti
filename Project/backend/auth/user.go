package auth

import (
	"fmt"
	"github.com/jmoiron/sqlx"
)

type User struct {
	Username string `json:"username" db:"username"`
	Password string `json:"password" db:"password"`
}

type UserInfo struct {
	Name string `json:"username"`
	Roles []string `json:"roles"`
}

func (self *User) IsRight(db *sqlx.DB) bool {
	//从管理员表中查询
	var user0 []User
	db.Select(&user0,
		`select * from "public"."a_user"
				where "username" = $1 and
				      "password" = $2`, self.Username, self.Password)
	if len(user0) != 0{
		fmt.Println(" >>>>admin login<<<<")
		return true
	}
	//从普通用户表中查询
	var user1 []User
	db.Select(&user1,
		`select * from "public"."t_user"
				where "username" = $1 and
				      "password" = $2`, self.Username, self.Password)
	if len(user1) != 0 {
		fmt.Println(" >>>>user login<<<<")
		return true
	}

	return false
}
