//+build mage

package main

import (
	"fmt"
	"io/ioutil"
	"log"

	_ "../statik"
	"github.com/rakyll/statik/fs"
)

func Read() error {
	statikFS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}
	r, err := statikFS.Open("/Hello.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer r.Close()
	contents, err := ioutil.ReadAll(r)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(contents))
	return nil
}
