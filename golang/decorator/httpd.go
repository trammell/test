package main

import (
	"fmt"
	"log"
	"net/http"
)

// isAuthorized takes one argument: a function with two arguments (response writer "w" and request "r")

//func isAuthorized(endpoint func(http.ResponseWriter, *http.Request)) http.Handler {
func isAuthorized(endpoint func(http.ResponseWriter, *http.Request)) func(http.ResponseWriter, *http.Request) {

	// return a function
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

		fmt.Println("Checking to see if Authorized header set...")

		if val, ok := r.Header["Authorized"]; ok {
			fmt.Println(val)
			if val[0] == "true" {
				fmt.Println("Header is set! We can serve content!")
				// all is well, so we call the underlying endpoint handler
				endpoint(w, r)
			}
		} else {
			fmt.Println("Not Authorized!!")
			fmt.Fprintf(w, "Not Authorized!!")
		}
	})
}

// vanilla homepage handler:
// - logs the hit
// - prints the HTTP response to the writer w
func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: homePage")
	fmt.Fprintf(w, "Welcome to the HomePage!")
}

// define our endpoints and handlers
func handleRequests() {
	http.HandleFunc("/", homePage)                   // vanilla handler
	http.HandleFunc("/auth", isAuthorized(homePage)) // register our new smart handler
	log.Fatal(http.ListenAndServe(":8081", nil))
}

func main() {
	handleRequests()
}
