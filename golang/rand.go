package main

import (
	"fmt"
	"math/rand"
	"time"
)

func vacantRooms() int {
	rand.Seed(time.Now().UTC().UnixNano())
	return rand.Intn(100)
}

func main() {
	hotelName := "The Gopher Hotel"
	fmt.Println("Hotel " + hotelName)

	rand.Seed(time.Now().UTC().UnixNano())

	var roomsAvailable int
	var rooms, roomsOccupied int = 100, rand.Intn(100)
	roomsAvailable = rooms - roomsOccupied
	fmt.Println(roomsAvailable, "rooms available")

	vacant := vacantRooms()
	fmt.Println("Vacant rooms:", vacant)

}
