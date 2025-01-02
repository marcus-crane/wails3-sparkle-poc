package main

import (
	"github.com/abemedia/go-sparkle"
)

type GreetService struct{}

func (g *GreetService) Greet() {
	sparkle.CheckForUpdates()
}
