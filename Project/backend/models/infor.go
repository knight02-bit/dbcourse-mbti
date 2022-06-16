package models


type StudentInfo struct {
	Sid string `form:"Sid" db:"Sid"`
	Sname string `form:"Sname" db:"Sname"`
	CGname string `form:"CGname" db:"CGname"`
	Dname string `form:"Dname" db:"Dname"`
	Cid string `form:"Cid" db:"Cid"`
}


