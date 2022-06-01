package models

type College struct {
	Id uint32 `form:"学院编号" db:"CGid"`
	Name string `form:"学院名称" db:"CGname"`
}

//type PostStore struct {
//	Store_date           string  `form:"入库日期" db:"store_date"`
//	License_plate_number string  `form:"车牌号" db:"license_plate_number"`
//	Stocks               uint32  `form:"件数" db:"stocks"`
//	Store_ton            float64 `form:"吨数" db:"store_ton"`
//}
