package dboprate

import (
	"backend/models"
	"github.com/jmoiron/sqlx"
)

func Select_college(db *sqlx.DB, colleges *[]models.GetCollege)  {
	db.Select(colleges, `select * from college`)
}
