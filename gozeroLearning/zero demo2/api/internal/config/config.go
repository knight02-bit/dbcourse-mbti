package config

import "github.com/zeromicro/go-zero/rest"

type Config struct {
	rest.RestConf

	//yaml映射数据库
	DB struct{
		DataSource string
	}
}
