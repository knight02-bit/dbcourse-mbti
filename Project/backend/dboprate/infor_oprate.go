package dboprate

import (
	"backend/models"
	"github.com/jmoiron/sqlx"
)

func Select_college(db *sqlx.DB, colleges *[]models.College)  {
	db.Select(colleges, `select * from college`)
}
