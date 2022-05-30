package svc

import (
	_ "github.com/lib/pq"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"zero-demo2/api/internal/config"
	"zero-demo2/api/model"
)

type ServiceContext struct {
	Config config.Config
	UserModel model.UserModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config: c,
		UserModel: model.NewUserModel(sqlx.NewSqlConn("postgres", c.DB.DataSource)),
	}
}
