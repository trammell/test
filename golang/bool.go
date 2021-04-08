package main

import ("fmt"
"math/rand"
"time")

func main() {
    a := 21
    b := 42

    fmt.Println(a == b) // false
    fmt.Println(a == a) // true
    fmt.Println(a != b) // true
    fmt.Println(a > b)  // false
    fmt.Println(a < b)  // true
    fmt.Println(a <= b) // true
    fmt.Println(a <= a) // true
    fmt.Println(a >= a) // true

	rand.Seed(time.Now().UTC().UnixNano())
    var agePaul, ageJohn int = rand.Intn(110), rand.Intn(110)

    fmt.Println("John is", ageJohn, "years old")
    fmt.Println("Paul is", agePaul, "years old")
    fmt.Println("It is", ageJohn > agePaul, "that John is older than Paul")
    fmt.Println("It is", ageJohn == agePaul, "that John and Paul have the same age")

	switch ageJohn {  
	case 10:
	   fmt.Println("John is 10 years old")
	case 20:
	   fmt.Println("John is 20 years old")
	case 100:
	   fmt.Println("John is 100 years old")
	default:
	   fmt.Println("John is neither 10, 20, nor 100 years old")
	}

}
