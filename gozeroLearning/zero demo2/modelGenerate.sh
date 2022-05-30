#!/usr/bin/env bash

# 生成的表名
tableName=$2

# 表生成的genmodel目录
modeldir=./genModel

# 数据库配置
host=127.0.0.1
port=5432
dbname=$1
username=postgres
passwd=manager

# 识别mysql ddl进行model层代码生成
# echo "开始创建库：$dbname 的表：$2"
# goctl model mysql datasource -url="${username}:${passwd}@tcp(${host}:${port})/${dbname}" -table="${tables}"  -dir="${modeldir}" -cache=true --style=goZero

echo "开始创建库：$dbname 的表：$2"
goctl model pg datasource -url="postgres://${username}:${passwd}@${host}:${port}/${dbname}?sslmode=disable" -table="${tableName}" -dir="${modeldir}"
