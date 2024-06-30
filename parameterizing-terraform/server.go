package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type paramsServerResponse struct {
	Author      string `json:"author"`
	Description string `json:"message"`
	Occupation  string `json:"occupation"`
}

func main() {
	port := 2525

	http.HandleFunc("/", paramsServer)
	log.Printf("Serving params Go server at: %v\n", port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", port), nil))
}

func paramsServer(w http.ResponseWriter, r *http.Request) {

	res := paramsServerResponse{
		Author:      "Victor Raeva",
		Description: "Parameterizing Terraform",
		Occupation:  "Cloud Engineer",
	}

	w.Header().Set("Content-Type", "application/json")

	encoder := json.NewEncoder(w)
	encoder.Encode(&res)
}
