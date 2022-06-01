package models

type College struct {
	CGname string `form:"学院名称" db:"CGname"`
}

type Student struct {
	Sid string `form:"学号" db:"Sid"`
	Sname string `form:"名字" db:"Sname"`
	Cid uint32 `form:"班级号" db:"Cid"`
	Dname string `form:"系别" db:"Dname"`
}
