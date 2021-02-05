// go run array.go
package main

import (
	"fmt"
)

func main() {
	var arr [3]int
	arr[0] = 6
	arr[1] = 1
	arr[2] = 2
	fmt.Println(arr)
	fmt.Println(arr[1])

	foo := [3]int{1, 2, 3}
	fmt.Println(foo)

	slice := []int{1,2,3}
	fmt.Println(slice)

	slice = append(slice, 123, 456)
	fmt.Println(slice)

	s2 := slice[1:]
	s3 := slice[:2]
	s4 := slice[1:2]
	fmt.Println(s2, s3, s4)


}
