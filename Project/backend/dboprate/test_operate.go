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

func Select_questions(db *sqlx.DB, questions *[]models.Question) {
	db.Select(questions, `select * from question order by "Qid" asc `)
	fmt.Println("<<<<<<<<Select_questions<<<<<<<<<<<<<")
}

func Select_characters(db *sqlx.DB, characters *[]models.Character) {
	db.Select(characters, `select * from "character"`)
	fmt.Println("<<<<<<<<Select_characters<<<<<<<<<<<<<")
}

func Select_SidRes(db *sqlx.DB, Sid string, resultResps *[]models.ResultResp) {
	db.Select(resultResps,
		`select result."Sid",student."Sname",result."Rtime",result."Ctype" 
				from result,student 
				where result."Sid" = $1 and result."Sid" = student."Sid"`, Sid)
	fmt.Println("<<<<<<<<<<Select_SidRes<<<<<<<<<<<")
}

func Select_SnameRes(db *sqlx.DB, Sname string, resultResps *[]models.ResultResp) {
	db.Select(resultResps,
		`select result."Sid",student."Sname",result."Rtime",result."Ctype" 
				from result,student 
				where student."Sname" = $1 and result."Sid" = student."Sid"`, Sname)
	fmt.Println("<<<<<<<<<<Select_SnameRes<<<<<<<<<<<")
}

func Select_classRes(db *sqlx.DB, Dname string, Cid string, resultResps *[]models.ResultResp) {
	db.Select(resultResps,
		`select result."Sid","Sname","Rtime","Ctype" from result,student 
		where result."Sid" = student."Sid" and "Dname" = $1
		and "Cid" = $2`, Dname, Cid)

	fmt.Println("<<<<<<<<<<Select_classRes<<<<<<<<<<<")
}

func Select_DnameRes(db *sqlx.DB, Dname string, resultResps *[]models.ResultResp) {
	db.Select(resultResps,
		`select result."Sid",student."Sname",result."Rtime",result."Ctype" 
				from result,student 
				where student."Dname" = $1 and result."Sid" = student."Sid"`, Dname)
	fmt.Println("<<<<<<<<<<Select_DnameRes<<<<<<<<<<<")
}

func Select_CGnameRes(db *sqlx.DB, CGname string, resultResps *[]models.ResultResp) {
	db.Select(resultResps,
		`select result."Sid",student."Sname",result."Rtime",result."Ctype" 
from result,student,department
where student."Dname" = department."Dname" 
and result."Sid" = student."Sid"
and department."CGname" = $1`, CGname)
	fmt.Println("<<<<<<<<<<Select_CGnameRes<<<<<<<<<<<")
}

func Delete_student(db *sqlx.DB, Sid string) {
	db.Exec(`delete from student where "Sid" = $1`, Sid)

	fmt.Println("<<<<<<<<<<Delete_student<<<<<<<<<<<")
}

func Delete_result(db *sqlx.DB, Sid string, Rtime string) {
	db.Exec(`delete from result where "Sid" = $1 and "Rtime" = $2`, Sid, Rtime)

	fmt.Println("<<<<<<<<<<Delete_result<<<<<<<<<<<")
}


