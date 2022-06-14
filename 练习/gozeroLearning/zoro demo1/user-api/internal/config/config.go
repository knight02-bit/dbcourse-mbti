package config

import "github.com/zeromicro/go-zero/rest"

type Config struct {
	rest.RestConf

	DB struct{
		DataSource string
	}
	//yaml映射
	// Database struct {
	// 	Type string
	// 	User string
	// 	Password string
	// 	Host string
	// 	Port int
	// 	Name string
	// }

}
