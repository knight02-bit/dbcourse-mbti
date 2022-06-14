package main

import . "fmt"

// 将函数定义为类型
type FormatFunc func(s string, x, y int) string

func main() {
	Println("5 > 7 :", isBig(5, 7))
	//Println(test(1, 5, "total"))
	//匿名函数
	s1 := test2(func() int { return 30 })
	//传参
	s2 := test2(get50)
	Println(s1, " ", s2)

	ts := []Test{{"a"}, {"b"}, {"c"}}
	for _, t := range ts {
		t2 := t
		defer t2.Close()
	}

}

func isBig(a, b int) bool {
	return a > b
}

//多返回值
func test1(x, y int, s string) (int, string) {
	// 类型相同的相邻参数，参数类型可合并。 多返回值必须用括号。
	n := x + y
	return n, Sprintf(s, n)

}

//函数做为一等公民，可以做为参数传递
func test2(fnName func() int) int {
	return fnName() + 3
}
func get50() int {
	return 50
}

type Test struct {
	name string
}

func (t *Test) Close() {
	Println(t.name, " closed")
}
func Close(t Test) {
	t.Close()
}
