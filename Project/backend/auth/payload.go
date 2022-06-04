package auth

import (
	"github.com/golang-jwt/jwt/v4"
	"time"
)

// JWT/Payload
type UserPd struct {
	jwt.StandardClaims
	Name     string `json:"username"`
}

func genUserPd(name string) UserPd {
	return UserPd {
		jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Hour * 72).Unix(),
			Issuer: "service",
		},
		name,
	}
}
