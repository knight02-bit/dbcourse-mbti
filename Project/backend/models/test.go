package models

type Question struct {
	Qid uint32 `form:"Qid" db:"Qid"`
	Qtext string `form:"Qtext" db:"Qtext"`
	QAtext string `form:"QAtext" db:"QAtext"`
	QBtext string `form:"QBtext" db:"QBtext"`
	QTid uint32 `form:"QTid" db:"QTid"`
}

type Character struct {
	Ctype string `form:"Ctype" db:"Ctype"`
	Ctext string `form:"Ctext" db:"Ctext"`
}
