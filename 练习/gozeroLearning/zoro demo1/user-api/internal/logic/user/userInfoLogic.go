package user

import (
	"context"
	"errors"
	"fmt"
	"zero-demo1/user-api/internal/svc"
	"zero-demo1/user-api/internal/types"
	"zero-demo1/user-api/model"

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
	fmt.Println("#1#",req.UserId)
	user, err := l.svcCtx.UserModel.FindOne(l.ctx, req.UserId)
	if err != nil && err != model.ErrNotFound {
		return nil, errors.New("查询失败wuwu~")
	}
	if user == nil {
		return nil, errors.New("用户不存在")
	}

	return &types.UserInfoResp{
		UserId: user.Id,
		Nickname: user.Nickname,
	}, nil

	return
}
