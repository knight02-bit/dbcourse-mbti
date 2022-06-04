package dboprate

import (
	"backend/models"
	"fmt"
	"github.com/jmoiron/sqlx"
)

func Insert_question(db *sqlx.DB, question *models.Question)  {
	sqli := `INSERT INTO "public"."question" 
    ("Qid", "Qtext", "QAtext", "QBtext", "QTid") 
	VALUES ($1, $2, $3, $4, $5);`
	_, err := db.Exec(sqli, question.Qid,
		question.Qtext, question.QAtext,
		question.QBtext, question.QTid)
	if err != nil {
		fmt.Printf("insert question failed, err:%v\n", err)
		return
	}
	fmt.Printf("insert question success\n")
	fmt.Println(question.Qid,">>>>>>>>>>>>>>>>>>>>")
}

func Select_question(db *sqlx.DB, questions *[]models.Question) {
	db.Select(questions, `select * from question`)
	fmt.Println("<<<<<<<<questions<<<<<<<<<<<<<")
}



