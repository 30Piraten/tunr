package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Message struct {
	Title string `json:"title"`
	Body  string `json:"body"`
	ID    int    `json:"id"`
}

func main() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", handler)

	fmt.Printf("Lauschen bei: http://localhost:1234\n")
	log.Fatal(http.ListenAndServe(":1234", router))
}

func handler(w http.ResponseWriter, r *http.Request) {
	response := Message{
		Title: "Hallo!",
		Body:  "Herzlich willkommen und schon, Sie kennenzulernen",
		ID:    2546,
	}

	b, err := json.Marshal(response)
	if err != nil {
		log.Println(err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(b)
}
