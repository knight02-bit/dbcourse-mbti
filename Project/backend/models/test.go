package models

type Question struct {
	Qid uint32 `form:"Qid" db:"Qid"`
	Qtext string `form:"Qtext" db:"Qtext"`
	QAtext string `form:"QAtext" db:"QAtext"`
	QBtext string `form:"QBtext" db:"QBtext"`
	QTid uint32 `form:"QTid" db:"QTid"`
	QAvalue string `form:"QAvalue" db:"QAvalue"`
	QBvalue string `form:"QBvalue" db:"QBvalue"`
}

type Character struct {
	Ctype string `form:"Ctype" db:"Ctype"`
	Ctext string `form:"Ctext" db:"Ctext"`
}

//单个学生的测试记录查询
type StudentForRes struct{
	Sid string `form:"Sid" db:"Sid"`
}

//以班级为单位的测试记录查询
type ClassForRes struct{
	Dname string `form:"Dname" db:"Dname"`
	Cid string `form:"Cid" db:"Cid"`
}

type ResultResp struct {
	Sid string `form:"Ctype" db:"Sid"`
	Sname string `form:"Sname" db:"Sname"`
	Rtime string `form:"Rtime" db:"Rtime"`
	Ctype string `form:"Ctype" db:"Ctype"`
}

