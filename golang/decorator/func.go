/* https://tutorialedge.net/golang/go-decorator-function-pattern-tutorial/ */

package main

import (
	"fmt"
	"time"
)

func coolFunc(a func()) {
	fmt.Printf("Starting function execution: %s\n", time.Now())
	a()
	fmt.Printf("End of function execution: %s\n", time.Now())
}

func myFunc() {
	fmt.Println("Hello World")
	time.Sleep(1 * time.Second)
}

func main() {
	fmt.Printf("Type: %T\n", myFunc)
	coolFunc(myFunc)
}
