package auth

import "github.com/golang-jwt/jwt/v4"

var secret = []byte("生前何必久睡死后自会长眠")

func Gen(username string) (string, error) {
	user_pl := genUserPd(username)                            // Payload 部分
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, user_pl) // 创建 JWT 对象

	return token.SignedString(secret)
}

func Parse(token_string string) (*UserPd, error) {
	token, err := jwt.ParseWithClaims(token_string, &UserPd{}, func(t *jwt.Token) (interface{}, error) {
		return secret, nil
	})

	if user_pl, ok := token.Claims.(*UserPd); ok && token.Valid {
		return user_pl, nil
	} else {
		return nil, err
	}
}
