package utils

import "io"

// R is a reference to the running boolean in main.
var R *bool
// Stopped is a reference to the Stopped variable in admin
var Stopped *bool

// P references the var Pipe in main
var P *io.WriteCloser

