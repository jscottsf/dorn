package main

import (
	"flag"
	"fmt"
	"github.com/keep94/sunrise"
	"os"
	"time"
)

func main() {
	lat := flag.Float64("lat", 0, "latitude: postive for north and negative for south")
	lon := flag.Float64("lon", 0, "longitude: positive for east and negative for west")
	mm := flag.Int("mm", 0, "offset minutes to add to the current time")
	flag.Parse()

	t := time.Now().Add(time.Minute * time.Duration(*mm))
	phase, start, end := sunrise.DayOrNight(*lat, *lon, t)

	fmt.Printf("Time %v\n", t)
	fmt.Printf("Location %v\n", t.Location())

	dayNight := "Day"
	if phase == sunrise.Night {
		dayNight = "Night"
	}
	fmt.Printf("Phase %v (%s)\n", phase, dayNight)

	fmt.Printf("Start %v\n", start)
	fmt.Printf("End %v\n", end)

	if phase == sunrise.Night {
		os.Exit(1)
	}
}
