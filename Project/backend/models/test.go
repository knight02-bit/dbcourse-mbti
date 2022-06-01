package models

type Question struct {
	Qid uint32 `form:"学号" db:"Qid"`
	Qtext string `form:"名字" db:"Qtext"`
	QAtext string `form:"班级号" db:"QAtext"`
	QBtext string `form:"系别" db:"QBtext"`
	QTid uint32 `form:"系别" db:"QTid"`
}
