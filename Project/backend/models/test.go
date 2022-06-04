package models

type Question struct {
	Qid uint32 `form:"questionId" db:"Qid"`
	Qtext string `form:"question" db:"Qtext"`
	QAtext string `form:"aDescribe" db:"QAtext"`
	QBtext string `form:"aDescribe" db:"QBtext"`
	QTid uint32 `form:"kind" db:"QTid"`
}
