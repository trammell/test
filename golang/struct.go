// go run struct.go
package main

import (
	"fmt"
)

func main() {

	type user struct {
		ID        int
		FirstName string
		LastName  string
	}

	var u user
	u.ID = 101
	u.FirstName = "Foo"
	u.LastName = "Bar"
	fmt.Println(u)
	fmt.Println(u.FirstName)

	u2 := user{ID: 2, FirstName: "Barney", LastName: "Rubble"}
	fmt.Println(u2)

	u3 := user{
		ID:        3,
		FirstName: "Fred",
		LastName:  "Flintstone",
	}
	fmt.Println(u3)

	m := map[string]int{"a": 33, "foo": 42}

	fmt.Println(m)
	fmt.Println(m["foo"])

	m["foo"] = 123
	fmt.Println(m["foo"])

	delete(m, "foo")
	fmt.Println(m)

	delete(m, "a")
	fmt.Println(m)

}
