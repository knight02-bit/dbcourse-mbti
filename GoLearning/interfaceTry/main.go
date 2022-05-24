//type dog struct {
//name string
//}
//
//// 实现Sayer接口
//func (d dog) say() {
//	fmt.Printf("%s会叫汪汪汪\n", d.name)
//}
//
//// 实现Mover接口
//func (d dog) move() {
//	fmt.Printf("%s会动\n", d.name)
//}
//
//// WashingMachine 洗衣机
//type WashingMachine interface {
//	wash()
//	dry()
//}
//
//// 甩干器
//type dryer struct{}
//
//// 实现WashingMachine接口的dry()方法
//func (d dryer) dry() {
//	fmt.Println("甩一甩")
//}
//
//// 海尔洗衣机
//type haier struct {
//	dryer //嵌入甩干器
//}
//
//// 实现WashingMachine接口的wash()方法
//func (h haier) wash() {
//	fmt.Println("洗刷刷")
//}
//
//func main() {
//	var x Sayer
//	var y Mover
//
//	var a = dog{name: "旺财"}
//	x = a
//	y = a
//	x.say()
//	y.move()
//}

package main

import (
	"bufio"
	"flag"
	"fmt"
	"io"
	"os"
)

// cat命令实现
func cat(r *bufio.Reader) {
	for {
		buf, err := r.ReadBytes('\n') //注意是字符
		if err == io.EOF {
			break
		}
		fmt.Fprintf(os.Stdout, "%s", buf)
	}
}

func main() {
	flag.Parse() // 解析命令行参数
	if flag.NArg() == 0 {
		// 如果没有参数默认从标准输入读取内容
		cat(bufio.NewReader(os.Stdin))
	}
	// 依次读取每个指定文件的内容并打印到终端
	for i := 0; i < flag.NArg(); i++ {
		f, err := os.Open(flag.Arg(i))
		if err != nil {
			fmt.Fprintf(os.Stdout, "reading from %s failed, err:%v\n", flag.Arg(i), err)
			continue
		}
		cat(bufio.NewReader(f))
	}
}
