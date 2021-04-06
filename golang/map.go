// go run array.go
package main

import (
	"fmt"
)

func main() {

	m := map[string]int{"a":33, "foo":42}

	fmt.Println(m)
	fmt.Println(m["foo"])

	m["foo"] = 123
	fmt.Println(m["foo"])

	delete(m, "foo")
	fmt.Println(m)

	delete(m, "a")
	fmt.Println(m)

}
