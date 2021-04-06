// go mod init cli-2
// go mod tidy
// go run main.go
// go run main.go -h

package main

import (
	"fmt"
	"log"
	"os"
	"strings"

	"github.com/urfave/cli"
)

var pizza = []string{"Enjoy your pizza with some delicious"}

func info() {
	app.Name = "Simple pizza CLI"
	app.Usage = "An example CLI for ordering pizza's"
	app.Author = "Jeroenouw" 
	app.Version = "1.0.0"
  }

var app = cli.NewApp()
func main() {
  err := app.Run(os.Args)
  if err != nil {
    log.Fatal(err)
  }
}

func commands() {
	app.Commands = []cli.Command{
	  {
		Name:    "peppers",
		Aliases: []string{"p"},
		Usage:   "Add peppers to your pizza",
		Action: func(c *cli.Context) { 
		  pe := "peppers"
		  peppers := append(pizza, pe)
		  m := strings.Join(peppers, " ")
		  fmt.Println(m)
		},
	  },
	  {
		Name:    "pineapple",
		Aliases: []string{"pa"},
		Usage:   "Add pineapple to your pizza",
		Action: func(c *cli.Context) { 
		  pa := "pineapple"
		  pineapple := append(pizza, pa)
		  m := strings.Join(pineapple, " ")
		  fmt.Println(m)
		},
	  },
	  {
		Name:    "cheese",
		Aliases: []string{"c"},
		Usage:   "Add cheese to your pizza",
		Action: func(c *cli.Context) { 
		  ch := "cheese"
		  cheese := append(pizza, ch)
		  m := strings.Join(cheese, " ")
		  fmt.Println(m)
		},
	  },
	}
  }
