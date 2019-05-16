#!/usr/bin/env bash

version=2.1
githash=`git log --pretty=format:'%h' -n 1`

#heredoc would work too but I prefer this because I'm weird.
echo "package main" > ./version.go
echo "" >> ./version.go
echo "//DO NOT EDIT" >> ./version.go
echo "//Build script overwrites this file." >> ./version.go
echo "//DO NOT EDIT" >> ./version.go
echo "" >> ./version.go
echo "func getFactoCordVersion() (string, string) {" >> ./version.go
echo "    return \"${version}\", \"${githash}\"" >> ./version.go
echo "}" >> ./version.go
echo "" >> ./version.go

go build -o ./build/FactoCord main.go version.go
