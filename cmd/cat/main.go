package main

import (
	"fmt"
	"log"
	"net/http"
)

func HelloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello cat API!")
}

func main() {
	http.HandleFunc("/", HelloHandler)
	port := "8080"
	log.Printf("APIサーバを :%s で起動します", port)
	http.ListenAndServe(":"+port, nil)
}
