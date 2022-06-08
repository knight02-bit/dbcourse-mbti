package dboprate

import (
	"backend/models"
	"fmt"
	"github.com/jmoiron/sqlx"
)

func Select_studentByCGname(db *sqlx.DB, CGname string, studentInfoes *[]models.StudentInfo) {
	db.Select(studentInfoes,
		`SELECT "Sid", "Sname", "CGname", student."Dname","Cid"
				FROM student, department
				where student."Dname" = department."Dname" and 
				      department."CGname" = $1`, CGname)

	fmt.Println("<<<<<<<<<<studentInfoes by CGname<<<<<<<")
}

func Select_studentByDname(db *sqlx.DB, Dname string, studentInfoes *[]models.StudentInfo) {
	db.Select(studentInfoes,
		`SELECT "Sid", "Sname", "CGname", student."Dname","Cid"
				FROM student, department
				where student."Dname" = department."Dname" and 
				      department."Dname" = $1`, Dname)

	fmt.Println("<<<<<<<<<<studentInfoes by Dname<<<<<<<")
}

func Select_studentBySid(db *sqlx.DB, Sid string, studentInfoes *[]models.StudentInfo) {
	db.Select(studentInfoes,
		`SELECT "Sid", "Sname", "CGname", student."Dname","Cid"
				FROM student, department
				where student."Dname" = department."Dname" and 
				      student."Sid" = $1`, Sid)

	fmt.Println("<<<<<<<<<<studentInfoes by Sid<<<<<<<")
}

func Select_studentBySname(db *sqlx.DB, Sname string, studentInfoes *[]models.StudentInfo) {
	db.Select(studentInfoes,
		`SELECT "Sid", "Sname", "CGname", student."Dname","Cid"
				FROM student, department
				where student."Dname" = department."Dname" and 
				      student."Sname" = $1`, Sname)

	fmt.Println("<<<<<<<<<<studentInfoes by Sname<<<<<<<")
}


//func Select_college(db *sqlx.DB, colleges *[]models.College) {
//	db.Select(colleges, `select * from college`)
//	fmt.Println("<<<<<<select_college<<<<<<<<<")
//
//}
//
//func Insert_student(db *sqlx.DB, student *models.Student) {
//	sqli := `INSERT INTO "public"."student"
//    ("Sid", "Sname", "Cid", "Dname")
//	VALUES ($1, $2, $3, $4);`
//
//	_, err := db.Exec(sqli, student.Sid, student.Sname, student.Cid, student.Dname)
//	if err != nil {
//		fmt.Printf("insert failed, err:%v\n", err)
//		return
//	}
//	fmt.Printf("insert success\n")
//	fmt.Println(student.Sid, student.Sname, student.Cid, student.Dname)
//	fmt.Println(">>>>>>>>>>>>>>>>>>>>")
//}


