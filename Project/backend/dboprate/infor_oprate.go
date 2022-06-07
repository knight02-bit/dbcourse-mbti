package dboprate

import (
	"backend/models"
	"fmt"

	"github.com/jmoiron/sqlx"
)

func Select_college(db *sqlx.DB, colleges *[]models.College) {
	db.Select(colleges, `select * from college`)
	fmt.Println("<<<<<<select_college<<<<<<<<<")
}
func Select_student(db *sqlx.DB, students *[]models.Student) {
	db.Select(students, `select * from "result" where Sid`)
	fmt.Println("<<<<<<<<<<<<<<<<<<<<<")
}

func Insert_student(db *sqlx.DB, student *models.Student) {
	sqli := `INSERT INTO "public"."student" 
    ("Sid", "Sname", "Cid", "Dname") 
	VALUES ($1, $2, $3, $4);`
	_, err := db.Exec(sqli, student.Sid, student.Sname, student.Cid, student.Dname)
	if err != nil {
		fmt.Printf("insert failed, err:%v\n", err)
		return
	}
	fmt.Printf("insert success\n")
	fmt.Println(student.Sid, student.Sname, student.Cid, student.Dname)
	fmt.Println(">>>>>>>>>>>>>>>>>>>>")
}
