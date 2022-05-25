// client
//一个TCP客户端进行TCP通信的流程如下：
//
//1.建立与服务端的链接
//2.进行数据收发
//3.关闭链接
package main

import (
	"bufio"
	"fmt"
	"net"
	"os"
	"strings"
)

func main()  {
	conn, err := net.Dial("tcp", "127.0.0.1:20000")
	if err != nil {
		fmt.Println("err : ", err)
		return
	}

	defer conn.Close() //关闭连接
	inputReader := bufio.NewReader(os.Stdin)
	for {
		input, _ := inputReader.ReadString('\n') //读取输入
		inputInfo := strings.Trim(input, "\r\n")
		if strings.ToUpper(inputInfo) == "Q" {
			return
		}

		_, err := conn.Write([]byte(inputInfo))
		if err != nil {
			return
		}
		buf := [512]byte{}
		n, err := conn.Read(buf[:])

		if err != nil {
			fmt.Println("recv failed, err:", err)
			return
		}
		fmt.Println("server端 : ", string(buf[:n]))
	}
}

