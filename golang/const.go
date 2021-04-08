package main

import "fmt"

func main() {
    const occupancyLimit = 12

    var occupancyLimit1 uint8
    var occupancyLimit2 int64
    var occupancyLimit3 float32

    // assign our untyped const to an uint8 variable
    occupancyLimit1 = occupancyLimit
    // assign our untyped const to an int64 variable
    occupancyLimit2 = occupancyLimit
    // assign our untyped const to an float32 variable
    occupancyLimit3 = occupancyLimit

    fmt.Println(occupancyLimit1, occupancyLimit2, occupancyLimit3)

	   // default type is bool
	   const isOpen = true

	   // default type is rune (alias for int32)
	   const MyRune = 'r'

	   // default type is int
	   const occupancyLimit4 = 12

	   // default type is float64
	   const vatRate = 29.87

	   // default type is complex128
	   const complexNumber = 1 + 2i
	   
	   // default type is string
	   const hotelName = "Gopher Hotel"

	      // maximum value of an int is 9223372036854775807
    // 9223372036854775808 (max + 1 ) overflows int
    const profit = 9223372036854775808
    // the program compiles
}
