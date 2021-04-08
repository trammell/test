package main

import "fmt"

func main() {

	raw := `spring rain:
	browsing under an umbrella
	at the picture-book store`
	fmt.Println(raw)

	interpreted := "i love spring"
	fmt.Println(interpreted)

	var aRune rune = 'Z'
	fmt.Printf("Unicode Code point of '%c': %U\n", aRune, aRune)
}
