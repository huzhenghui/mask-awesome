//+build mage

package main

import (
	"io"
	"log"
	"os"
	"time"

	"github.com/magefile/mage/sh"
)

func Launcher() error {
	var err error
	err = sh.Run("go", "get", "github.com/rakyll/statik/fs")
	if err != nil {
		log.Fatal(err)
		return err
	}
	filename := "../FS/Hello.txt"
	_, err = os.Stat(filename)
	var f *os.File
	if os.IsNotExist(err) {
		f, err = os.Create(filename)
		if err != nil {
			log.Fatal(err)
			return err
		}
	} else {
		f, err = os.OpenFile(filename, os.O_WRONLY, 0444)
		if err != nil {
			log.Fatal(err)
			return err
		}
	}
	var n int
	n, err = io.WriteString(f, "Hello, World!"+time.Now().Format(time.RFC3339))

	if err != nil {
		log.Fatal(err)
	} else {
		log.Println(n)
	}
	f.Sync()
	f.Close()
	err = sh.Run(
		"statik",
		"-src", "../FS",
		"-dest", "../",
		"-f",
		"-m",
		"-include", "Hello.txt",
	)
	if err != nil {
		log.Fatal(err)
		return err
	}
	err = sh.Run("mage", "-d", "../read", "-v", "-keep", "read")
	return nil
}
