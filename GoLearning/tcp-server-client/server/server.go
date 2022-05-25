// server
//TCP服务端程序的处理流程：
//
//    1.监听端口
//    2.接收客户端请求建立链接
//    3.创建goroutine处理链接。
package main

import (
	"bufio"
	"fmt"
	"net"
)

func process(conn net.Conn){
	defer conn.Close() // 连接关闭
	for {
		reader := bufio.NewReader(conn)
		var buf [128]byte
		n, err := reader.Read(buf[:]) //读取数据
		if err != nil {
			fmt.Println("fail read, err : ", err)
			break
		}

		resStr := string(buf[:n])
		fmt.Println("client端 : ", resStr)
		conn.Write([]byte(resStr)) // 发送数据
	}
}

func main() {
	listen, err := net.Listen("tcp", "127.0.0.1:20000")
	if err != nil {
		fmt.Println("listen failed, err:", err)
		return
	}

	for {
		conn, err := listen.Accept() //建立连接
		if err != nil {
			fmt.Println("accept failed, err:", err)
			continue
		}
		go process(conn) // 启动一个 `goroutine` 处理连接
	}
}