package models

type Question struct {
	Qid uint32 `form:"题号" db:"Qid"`
	Qtext string `form:"描述" db:"Qtext"`
	QAtext string `form:"A选项" db:"QAtext"`
	QBtext string `form:"B选项" db:"QBtext"`
	QTid uint32 `form:"类型" db:"QTid"`
}
