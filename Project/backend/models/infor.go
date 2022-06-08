package models

type College struct {
	CGname string `form:"学院名称" db:"CGname"`
}

type Student struct {
	Sid string `form:"Sid" db:"Sid"`
	Sname string `form:"Sname" db:"Sname"`
	Cid string `form:"Cid" db:"Cid"`
	Dname string `form:"Dname" db:"Dname"`
}


