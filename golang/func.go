package main

import (
  "fmt"
  "time"
)

func myFunc() {
  fmt.Println("Hello World")
  time.Sleep(1 * time.Second)
}

func main() {
  fmt.Printf("Type: %T\n", myFunc)
}
