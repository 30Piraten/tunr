package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	port := 7676
	fmt.Printf("Lauschen bei: http://localhost:%d\n", port)
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("localhost:7676", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	message := "Herzlich willkommen und schon, Sie kennenzulernen"
	fmt.Fprintf(w, "Message: %v\n", message)
}
