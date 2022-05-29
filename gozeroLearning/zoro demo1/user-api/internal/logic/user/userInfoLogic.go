package user

import (
	"context"
	"fmt"
	"zero-demo1/user-api/internal/svc"
	"zero-demo1/user-api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type UserInfoLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewUserInfoLogic(ctx context.Context, svcCtx *svc.ServiceContext) *UserInfoLogic {
	return &UserInfoLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *UserInfoLogic) UserInfo(req *types.UserInfoReq) (resp *types.UserInfoResp, err error) {
	//http://127.0.0.1:8849/userapi/v1/user/info
	// 先假定此时是从数据库中取出的数据
	dbMsg := map[int64]string{
		1: "张三丰",
		2: "孙悟空",
	}

	nickname := "unknown"
	if name, ok := dbMsg[req.UserId]; ok {
		nickname = name
		fmt.Println("00000000000000000")
	}

	return &types.UserInfoResp{
		UserId: req.UserId,
		Nickname: nickname,
	}, nil

	return
}
