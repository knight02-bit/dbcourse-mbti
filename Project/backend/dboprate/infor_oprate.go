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

func Select_studentByDepclass(db *sqlx.DB, Dname string, Cid string, studentInfoes *[]models.StudentInfo) {
	db.Select(studentInfoes,
		`SELECT "Sid", "Sname", "CGname", student."Dname","Cid"
				FROM student, department
				where student."Dname" = department."Dname" and 
				      student."Dname" = $1 and student."Cid" = $2`, Dname, Cid)

	fmt.Println("<<<<<<<<<<studentInfoes by Depclass<<<<<<<")
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
